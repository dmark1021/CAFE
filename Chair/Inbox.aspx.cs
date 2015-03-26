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
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public string GetURL(object facid, object termid)
    {
        return String.Format("../Forms/Schedule.aspx?s=other&id={0}&tid={1}", facid, termid);

    }
    protected void DropDownListTerm_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["TermId"] = DropDownListTerm.SelectedValue;
        UpdatePanelInbox.Update();
    }
    protected void DropDownListTerm_DataBound(object sender, EventArgs e)
    {
        if (!IsPostBack)
            DropDownListTerm.SelectedValue = Session["TermId"].ToString();
    }
}
