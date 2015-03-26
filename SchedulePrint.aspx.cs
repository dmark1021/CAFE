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
    protected void Page_Load(object sender, EventArgs e)
    {
      

        officehourstotalduration = 0;
        offcampustotalduration = 0;
        DateTime dateTime = DateTime.Now;
        MainScheduleBll bllMS = new MainScheduleBll();
        FacultyBll objFac = new FacultyBll();

        String s = "";

        DataTable dtf = objFac.GetUserDetails(Convert.ToInt32(Session["FacId"]));

        //Get Faculty's Rank Name
        DataTable dtf1 = objFac.GetFacultyRankName(Convert.ToInt32(Session["FacId"]));

        dateLabel.Text = String.Format("{0:D}", dateTime);
        lblName.Text = Convert.ToString(dtf.Rows[0]["Name"]) + " - " + Convert.ToString(dtf1.Rows[0]["Rankname"]); ;

        //get main schedule information
        // objOc.InsertOffCampus(Convert.ToInt32(Session["FacId"]),activity,org,Convert.ToInt32(Session["TermId"]));
        DataTable dt = bllMS.GetMainSchedByFac(Convert.ToInt32(Session["TermId"]), Convert.ToInt32(Session["FacId"]));
        if (dt.Rows.Count != 0)
        {

            txtFacultyComment.Text = (dt.Rows[0]["FacultyComments"].ToString()).Replace("\r\n", "<br/>");
            txtChairComment.Text = dt.Rows[0]["ChairComments"].ToString().Replace("\r\n", "<br/> ");
            txtDeanComment.Text = dt.Rows[0]["DeanComments"].ToString().Replace("\r\n", "<br/> ");
            lblOLCredits.Text = dt.Rows[0]["OverloadCredits"].ToString();
            lblReleaseTime.Text = dt.Rows[0]["ReleaseTime"].ToString();
            lblCompensation.Text = dt.Rows[0]["Compensation"].ToString();



        }
        else
        {
            txtFacultyComment.Text = "Not Found";
        }
       HttpContext.Current.Response.Write("<script>window.print();</script>");


        

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
}
