using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MCHSDefault : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["collid"] = 101;
        Response.Redirect("Forms/MoroskyCollegeHome.aspx");
    }
}
