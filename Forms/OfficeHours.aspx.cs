using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Forms_OfficeHours : System.Web.UI.Page
{
    MailingClass objM = new MailingClass();
    FacultyBll objF = new FacultyBll();
    long officehourstotalduration;
    long offcampustotalduration;
    //
    OffCampusBll objOc = new OffCampusBll();
    MainScheduleBll objMs = new MainScheduleBll();
    OfficeHoursBLL objOH = new OfficeHoursBLL();
    ScheduleBll objS = new ScheduleBll();
    TeachSchimingsBll objT = new TeachSchimingsBll();
    DepartmentBll objD = new DepartmentBll();

    string pageQueryString = "";
    string popOffCampActivity = "";
    string popOffCampOrganization = "";
    decimal TotalTeachingCredits = 0;
    decimal TotalStudentCredits = 0;
    decimal TotalResearchTeachingCredits = 0;
    decimal TotalResearchStudentCredits = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        btnCopyOfficeHours.Attributes.Add("onclick", "javascript:return confirm('the office hours will be added to current semester');");
    }

    protected void DropDownList1_DataBound(object sender, EventArgs e)
    {
        if (!IsPostBack)
            DropDownList1.SelectedValue = Session["TermId"].ToString();
        try
        {
            DropDownList1.Items.Remove(DropDownList1.Items.FindByValue(Session["CTermID"].ToString()));
        }
        catch { }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["TermId"] = DropDownList1.SelectedValue;
       OfficeHoursGridView.DataBind();
        
    }
    protected void btnCopyOfficeHours_Click(object sender, EventArgs e)
    {
       /*
         if (objS.CopyOfficeHoursToCurrentSemister(Convert.ToInt32(Session["TermID"]), Convert.ToInt32(Session["CTermID"]), Convert.ToInt32(Session["FacId"])))
        {
            Session["TermID"] = Session["CTermID"];
            Response.Redirect("Schedule.aspx?s=mine");
        }

      */

     //   if (MessageBox.Show("the office hours will be added to current semester", "Confirm", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Information) == DialogResult.Yes)
       // {
            objOH.CopyOfficeHoursToCurrentSemester(Convert.ToInt32(Session["TermID"]), Convert.ToInt32(Session["CTermID"]), Convert.ToInt32(Session["FacId"]));
        Session["TermID"] = Session["CTermID"];
        Response.Redirect("Schedule.aspx?s=mine");
       // }

        



    }

    protected void Button1_Click(object sender, EventArgs e)
    {        
            Session["TermID"] = Session["CTermID"];
            Response.Redirect("Schedule.aspx?s=mine");     

    }
    public long GetTotalOfficeHours(long total)
    {
        officehourstotalduration += total;
        return total;
    }

    public long GetTotalOffCampusHours(long total)
    {
        offcampustotalduration += total;
        return total;
    }

    public string GetOfficeHoursTotalFormat()
    {
        string hr = (officehourstotalduration / 60).ToString();
        string min = (officehourstotalduration % 60).ToString();
        return hr + " Hr " + min + " min ";
    }

    public string GetOffCampusHoursTotalFormat()
    {
        string hr = (offcampustotalduration / 60).ToString();
        string min = (offcampustotalduration % 60).ToString();
        return hr + " Hr " + min + " min ";
    }


    public Boolean GetEditStatus()
    {
        bool st = false;

        if (Request.QueryString["s"] == "other")
            st = false;
        else
            st = objMs.isGetEditStatus(Convert.ToInt32(Session["FacId"]), Convert.ToInt32(Session["TermId"]));
        return st;
    }

    public Boolean GetSubmitButtonStatus()
    {

        return objMs.GetSubmitSt(Convert.ToInt32(Session["FacId"]), Convert.ToInt32(Session["TermId"]));

    }



}