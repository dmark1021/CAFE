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

public partial class MoroskyCollegeHome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Set the Session["collid"] to the correct college id value (101 for Morosky, 102 for Engineering & Business)
        Session["collid"] = 101;
    }
}
