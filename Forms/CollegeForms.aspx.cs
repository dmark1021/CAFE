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

public partial class CollegeForms : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Get the correct College so that the correct college forms are displayed
        int collegeId = Convert.ToInt32(Session["collid"]);
        if (collegeId == 101)  //Morosky College
        {
            PerfApprForm.NavigateUrl = "../Documents/Faculty Performance Appraisal form -mchs08.doc";
            PerfApprForm.Text="MCHS Faculty Performance Appraisal Form rev. 2008";

            AdjuntPayForm.NavigateUrl = "../Documents/Adjunct Pay Request form for Chairs.doc";
            AdjuntPayForm.Text="Adjunct Pay Request Form";

            AccidentForm.NavigateUrl = "../Documents/MCHPS Accident Report Form.doc";
            ReleaseTimeForm.NavigateUrl = "../Documents/MCHPS Release Time form.doc";
            CommitteeReport.NavigateUrl = "../Documents/Committee Listing 2011 - 2012.doc";
        }
        else                   //collegeId == 102 so Engineering & Business College
        {
            PerfApprForm.NavigateUrl = "../Documents/fac performance form CEB.docm";
            PerfApprForm.Text="Faculty Performance Appraisal Form";
            AccidentForm.NavigateUrl = "../Documents/Accident Report Form.doc";
            ReleaseTimeForm.NavigateUrl = "../Documents/Release Time form.doc";            
            AdjuntPayForm.Visible = false;
            CommitteeReport.Visible = false;
        }
    }
}