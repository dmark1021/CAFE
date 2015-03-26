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

public partial class Chair_FacSchedules : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["TermId"] = DropDownList1.SelectedValue;
        GridView1.DataBind();
        UpdatePanelGridAllSch.Update();
    }
    public string GetURL(object facid, object termid)
    {
        return String.Format("../Forms/Schedule.aspx?s=other&id={0}&tid={1}", facid, termid);

    }
    public string GetURL1(object email)
    {
        return String.Format("SendEmail.aspx?email={0}",email);

    }
    protected void DropDownList1_DataBound(object sender, EventArgs e)
    {
        if (!IsPostBack)
        DropDownList1.SelectedValue = Session["TermId"].ToString();
    }
}
