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

public partial class DefaultLinks : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    //This method is no longer used when the individual college home pages were added.  June 2009 TAN
    public string GetURL(object collegeid)
    {
        return String.Format("LoginSelection.aspx?collid={0}", collegeid);
    }

    //New Method so that the correct college home page is displayed.  June 2009 TAN
    public string GetCollegeHome(object collegeid)
    {
        int cId = Convert.ToInt32(collegeid);

       

        if (cId == 101)    //Morosky College
        {
            return String.Format("~/Forms/MoroskyCollegeHome.aspx");
        }
        else if (cId == 102)   //Engineering & Business College
        {
            return String.Format("~/Forms/EngAndBusCollegeHome.aspx");
        }
        else
        {
            return String.Format("Error.aspx?ecode=3");  //Error. What is 3? I made it up?
        } 
      }
}
