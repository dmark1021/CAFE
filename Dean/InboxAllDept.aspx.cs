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

public partial class Chair_Inbox : System.Web.UI.Page
{
    DepartmentBll objD = new DepartmentBll();
    protected void Page_Load(object sender, EventArgs e)
    {
        //Commented out because the InboxAllDept.aspx page was reformatted.  June 2009 TAN
        //GridViewDepartment.HeaderRow.TableSection = TableRowSection.TableHeader;
    }
    public string GetURL(object deptid)
    {
        return String.Format("~/Dean/InboxByDept.aspx?deptid={0}", deptid);
    }
    public string GetLinkText(object deptname, object deptid)
    {
        int count = objD.GetNoofInboxForDeanByDept(Convert.ToInt32(deptid));
        return String.Format("{0}({1})", deptname, count);

    }

    protected void DropDownList1_DataBound(object sender, EventArgs e)
    {
        if (!IsPostBack)
            DropDownListTerm.SelectedValue = Session["TermId"].ToString();
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["TermId"] = DropDownListTerm.SelectedValue;
        GridViewDepartment.DataBind();
       
    }
}
