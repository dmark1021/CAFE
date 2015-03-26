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

public partial class LoginValidation : System.Web.UI.Page
{
    DepartmentBll objD = new DepartmentBll();
    FacultyBll objF = new FacultyBll();
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "";
        
        string networkid = ""; 
        string usertype = "";
        string userLogin;

        userLogin = User.Identity.Name; //include domain
        //userLogin = "lakeerie\\lun001";
        if (userLogin == null)
        {
            //call error page with invalid login
            Response.Redirect("~/Error.aspx?ecode = 0");
        }
        else
        {
            
            string[] userloginInfo = userLogin.Split('\\');

            if (userLogin.IndexOf('\\') > 0)
            {
                networkid = userloginInfo[1];
            }
            else //check if login containing @gannon.edu
            {
                if (userLogin.IndexOf("@gannon.edu") > 0)
                {
                    userloginInfo = userLogin.Split('@');
                }
                networkid = userloginInfo[0];
            }
            DataTable dt = objF.GetFacIdByNetworkId(networkid);


            if (dt.Rows.Count<1)
            {
                //call error page with invalid access
                Response.Redirect(String.Format("~/Error.aspx?login={0}&ecode=1",userLogin));
            }
            else
            {
                string facid = Convert.ToString(dt.Rows[0]["facultyid"]);
                usertype = Convert.ToString(dt.Rows[0]["type"]);
                Session["NetworkId"] = Convert.ToString(dt.Rows[0]["NetworkID"]);
                Session["Lastname"] = Convert.ToString(dt.Rows[0]["lastname"]);
                Session["Firstname"] = Convert.ToString(dt.Rows[0]["firstname"]);
                switch (usertype) 
                {
                    case "0":
                    //dean office
                        url = "~/LoginRedirect.aspx?type=d";
                        break;
                    case "1":                
                    //chair 
                        url = String.Format("~/LoginRedirect.aspx?facid={0}&type=c", facid);
                        break;
                        
                    default:
                    //other type - faculty
                        url = String.Format("~/LoginRedirect.aspx?facid={0}&type=f", facid);
                        break;
                } //swtich


                Response.Redirect(url);

            }

        }      
       
    }
}
