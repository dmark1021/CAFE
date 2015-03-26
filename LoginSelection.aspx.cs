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

public partial class Trial_LoginSelection : System.Web.UI.Page
{
    CollegeBll objC = new CollegeBll();
    FacultyBll objF = new FacultyBll();
    protected void Page_Load(object sender, EventArgs e)
    {
        int collegeid = Convert.ToInt16(Request.QueryString["collid"]);
        Session["collid"] = collegeid;
        LabelCollname.Text = "Welcome to " + objC.GetColNamebyId(collegeid);
        
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)   //Faculty
    {
        if ((DropDownList2.SelectedValue) != "0")
        {
            string url = String.Format("~/LoginRedirect.aspx?facid={0}&type=f", DropDownList2.SelectedValue);
            Response.Redirect(url);
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)   //Department
    {
        if((DropDownList1.SelectedValue)!="0")
        {
            DropDownList2.DataBind();
        DataTable dt = objF.GetChairBydept(Convert.ToInt32(DropDownList1.SelectedValue));
        if (dt.Rows.Count > 0)
        {
            HyperLinkchair.Text = dt.Rows[0]["NetworkID"].ToString();
            string url = String.Format("~/LoginRedirect.aspx?facid={0}&type=c", dt.Rows[0]["FacultyId"].ToString());
            HyperLinkchair.NavigateUrl = url;

        }
        }
    }
}
