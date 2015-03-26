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

public partial class Error : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String errorCode;

        errorCode = Request.QueryString["ecode"];

        switch (errorCode)
        {
            case "1": // login is not found
                errMsg.Text = "User login: " + Request.QueryString["login"] + " does not have access to CAFE.";
                break;
            default:
                errMsg.Text = "Error code is " + errorCode.ToString();
                break;
        }
            
        

    }
}
