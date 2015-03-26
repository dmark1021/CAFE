using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CEBDefault : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        Label1.Text = "";
        Session["collid"] = 102;
        Response.Redirect("Forms/EngAndBusCollegeHome.aspx");
    }
}
