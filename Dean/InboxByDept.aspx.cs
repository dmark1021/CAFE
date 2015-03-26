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

public partial class Dean_InboxByDept : System.Web.UI.Page
{
    DepartmentBll objD = new DepartmentBll();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["deptid"] != "")
        {
            Session["deptid"] = Request.QueryString["deptid"];            
            LabelDeptName.Text = objD.GetDeptNameByDeptID(Convert.ToInt32(Session["deptid"]));
        }
            
    }

    public string GetURL(object facid, object termid)
    {
        return String.Format("../Forms/Schedule.aspx?s=other&id={0}&tid={1}", facid, termid);

    }

    protected void DropDownList1_DataBound(object sender, EventArgs e)
    {
        if (!IsPostBack)
            DropDownList1.SelectedValue = Session["TermId"].ToString();
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["TermId"] = DropDownList1.SelectedValue;     
        GridView1.DataBind();
        UpdatePanelGridAllSch.Update();
    }

    public string GetURLFaculty(object facid, object termid)
    {
        return String.Format("../Forms/Schedule.aspx?s=other&id={0}&tid={1}", facid, termid);

    }
    public string GetURLEmail(object email)
    {
        return String.Format("~/Chair/SendEmail.aspx?email={0}", email);

    }
}
