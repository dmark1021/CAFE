using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class LoginRedirect : System.Web.UI.Page
{
    TermBll objTerm = new TermBll();
    
    DateTime dateTime = DateTime.Now;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        GetCurrentTermId();
        string s = Request.QueryString["type"];
        //trial version
        if (Request.QueryString["type"] == "d")
            Session["type"] = "dean";
        if (Request.QueryString["type"] == "f")
            Session["type"] = "faculty";
        if (Request.QueryString["type"] == "c")
            Session["type"] = "chair";//ended

         
        if ((Convert.ToString(Session["type"])) == "dean")
        {
            Session["CC"] = true;
            Session["FC"] = true;
            Session["DC"] = false;
            Session["Facname"] = "Dean";
            Response.Redirect("Dean/InboxAllDept.aspx");
        }
        else
        {
            GetUserDetails();
            Response.Redirect("Forms/Schedule.aspx?s=mine");
        }

    }
    public void GetCurrentTermId()
    {
        //TermBll objTerm = new TermBll();
        
      //  int termid = (int)objTerm.SelectNoOfCurrentSemester(2);

        DataTable dt5 = objTerm.SelectCurrentSemester();    //
        int termid = int.Parse(dt5.Rows[0]["TermID"].ToString());


       // int termid = 10; //FA 2010
        DateTime startdate;
        DateTime enddate;

        string currentyear = Convert.ToString(dateTime.Year);
        int currentmonth = dateTime.Month;
        int day = dateTime.Day;
        string semester = "";
        string year = "";

        DataTable dt = objTerm.GetTermByYear(currentyear);


        foreach (DataRow dr in dt.Rows)
        {
            startdate = Convert.ToDateTime(dr["StartDate"]);
            enddate = Convert.ToDateTime(dr["EndDate"]);

            if (dateTime >= startdate && dateTime <= enddate)
            {
                termid = Convert.ToInt32(dr["TermId"]);
                semester = Convert.ToString(dr["Semester"]);
                year = Convert.ToString(dr["Year"]);
                break;
            }
        }
        if (termid == 0)
        {
            int noofdays = 1000;

            foreach (DataRow dr in dt.Rows)
            {
                startdate = Convert.ToDateTime(dr["StartDate"]);
                enddate = Convert.ToDateTime(dr["EndDate"]);
                object o = startdate - dateTime;
                if (noofdays > Convert.ToInt32(startdate - dateTime))
                {
                    noofdays = Convert.ToInt32(startdate - dateTime);
                    termid = Convert.ToInt32(dr["TermId"]);
                    semester = Convert.ToString(dr["Semester"]);
                    year = Convert.ToString(dr["Year"]);
                }
                if (noofdays > Convert.ToInt32(enddate - dateTime))
                {
                    noofdays = Convert.ToInt32(enddate - dateTime);
                    termid = Convert.ToInt32(dr["TermId"]);
                    semester = Convert.ToString(dr["Semester"]);
                    year = Convert.ToString(dr["Year"]);
                }


            }

        }

        Session["CTermId"] =  termid;
        Session["TermId"] =  termid;

    }

    public void GetUserDetails()
    {
        FacultyBll objFac = new FacultyBll();
       // MembershipUser currentUser = Membership.GetUser();
        DataTable dt = objFac.GetUserDetails(Convert.ToInt32(Request.QueryString["facid"]));
        Session["CFacId"] = dt.Rows[0]["FacultyID"];
        Session["FacId"] = dt.Rows[0]["FacultyID"];
        Session["DeptID"] = dt.Rows[0]["DeptID"];
        //Get Faculty's Rank Name
        DataTable dt1 = objFac.GetFacultyRankName(Convert.ToInt32(Request.QueryString["facid"]));
        
        string type = Session["type"].ToString();
        string nameWithRank = Convert.ToString(dt.Rows[0]["Name"]) + " - " + Convert.ToString(dt1.Rows[0]["Rankname"]);

        Session["Facname"] = nameWithRank;

        if (type.ToLower() == "chair")
        {
            //RZL added 01/2009, chair is logged in, but he is treated as a faculty here. The 
            //chair function should be in Chair\FacSchedules.aspx
            Session["CC"] = true;
            Session["FC"] = false; 
            Session["DC"] = true;
        }
        if (type.ToLower() == "faculty")
        {
            Session["CC"] = true;
            Session["FC"] = false;
            Session["DC"] = true;
        }


    }

}
