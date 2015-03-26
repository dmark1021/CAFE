using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;


public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime dateTime = DateTime.Now;

        dateLabelColHome.Text = String.Format("{0:D}", dateTime);
            
        //Get the correct College for the menu's Dean's Home Link
        int collegeId = Convert.ToInt32(Session["collid"]);
        if (collegeId == 101)  //Morosky College
        {
            HyperLinkCollege.NavigateUrl = "../Forms/MoroskyCollegeHome.aspx";
        }
        else                   //collegeId == 102 so Engineering & Business College
        {
            HyperLinkCollege.NavigateUrl = "../Forms/EngAndBusCollegeHome.aspx";
        }
    }
}
