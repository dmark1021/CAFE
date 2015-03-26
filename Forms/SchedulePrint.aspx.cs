using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Forms_SchedulePrint : System.Web.UI.Page
{
    long officehourstotalduration;
    long offcampustotalduration;
    TermBll objTerm = new TermBll();
    String semester;
    String year;
    String text;
 

    protected void Page_Load(object sender, EventArgs e)
    {

        Repeater2.DataSource = Session["FacArray"];
        Repeater2.DataBind();
        
        //TAN Commented out so that the print pop-up window is not displayed
        //HttpContext.Current.Response.Write("<script>window.print();</script>"); 

        

    }
  
    public string GetOffCampusHoursTotalFormat()
    {
       
        string hr = (offcampustotalduration / 60).ToString();
        string min = (offcampustotalduration % 60).ToString();
        return hr + " Hr " + min + " min ";
       
    }
    public long GetTotalOffCampusHours(long total)
    {
       
        offcampustotalduration += total;
        return total;
    }

    protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
  
        int facid = Convert.ToInt32(e.Item.DataItem);
        officehourstotalduration = 0;
        offcampustotalduration = 0;
        DateTime dateTime = DateTime.Now;
        MainScheduleBll bllMS = new MainScheduleBll();
        FacultyBll objFac = new FacultyBll();

        String s = "";

        DataTable dtf = objFac.GetUserDetails(facid);

        //Get Faculty's Rank Name
        DataTable dtf1 = objFac.GetFacultyRankName(facid);
        ((Label)(e.Item.FindControl("dateLabel"))).Text = String.Format("{0:D}", dateTime);

        //((Label)(e.Item.FindControl("termLabel"))).Text = String.Format("Term: {0}", Session["TermName"]);

        DataTable dtt = objTerm.GetTermName(Convert.ToInt32(Session["TermID"]));        //0802
        semester = dtt.Rows[0]["Semester"].ToString();
        year = dtt.Rows[0]["year"].ToString();
        text = "Term: "+ semester + " " + year;
        ((Label)(e.Item.FindControl("termLabel"))).Text = text;

        ((Label)(e.Item.FindControl("lblName"))).Text = Convert.ToString(dtf.Rows[0]["Name"]) + " - " + Convert.ToString(dtf1.Rows[0]["Rankname"]); ;

        //get main schedule information
        // objOc.InsertOffCampus(Convert.ToInt32(Session["FacId"]),activity,org,Convert.ToInt32(Session["TermId"]));
        DataTable dt = bllMS.GetMainSchedByFac(Convert.ToInt32(Session["TermId"]),facid);
        if (dt.Rows.Count != 0)
        {
            if (dt.Rows[0]["FacultyComments"].ToString() != "")
                ((Label)(e.Item.FindControl("txtFacultyComment"))).Text = (dt.Rows[0]["FacultyComments"].ToString()).Replace("\r\n", "<br/>");
            else
                ((Label)(e.Item.FindControl("txtFacultyComment"))).Text = "No Comments";
            if (dt.Rows[0]["ChairComments"].ToString() != "")
                ((Label)(e.Item.FindControl("txtChairComment"))).Text = dt.Rows[0]["ChairComments"].ToString().Replace("\r\n", "<br/> ");
            else
                ((Label)(e.Item.FindControl("txtChairComment"))).Text = "No Comments";
            if (dt.Rows[0]["DeanComments"].ToString() != "")
                ((Label)(e.Item.FindControl("txtDeanComment"))).Text = dt.Rows[0]["DeanComments"].ToString().Replace("\r\n", "<br/> ");
            else
                ((Label)(e.Item.FindControl("txtDeanComment"))).Text = "No Comments";
            ((Label)(e.Item.FindControl("lblOLCredits"))).Text = dt.Rows[0]["OverloadCredits"].ToString();
            ((Label)(e.Item.FindControl("lblReleaseTime"))).Text = dt.Rows[0]["ReleaseTime"].ToString();
            ((Label)(e.Item.FindControl("lblCompensation"))).Text = dt.Rows[0]["Compensation"].ToString();



        }
        else
        {

            ((Label)(e.Item.FindControl(" txtFacultyComment"))).Text = "Not Found";
        }

        ObjectDataSource ods = (ObjectDataSource)e.Item.FindControl("oDSSchedule");
        ods.SelectParameters.Clear();
        ods.SelectParameters.Add("facultyid", facid.ToString());
        ods.SelectParameters.Add("termid", Session["TermId"].ToString());


        ods = (ObjectDataSource)e.Item.FindControl("oDSOfficeHour");
        ods.SelectParameters.Clear();
        ods.SelectParameters.Add("facultyid", facid.ToString());
        ods.SelectParameters.Add("termid", Session["TermId"].ToString());

        ods = (ObjectDataSource)e.Item.FindControl("DsOffCampus");
        ods.SelectParameters.Clear();
        ods.SelectParameters.Add("facultyid", facid.ToString());
        ods.SelectParameters.Add("termid", Session["TermId"].ToString());  

    }


   
}
