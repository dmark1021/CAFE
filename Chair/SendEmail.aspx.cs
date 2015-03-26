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
using System.Net.Mail;

public partial class Chair_SendEmail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Form.Attributes.Add("onSubmit", "CopyText(); return true;");
        TextBoxTo.Text = Request.QueryString["email"];
    }
    protected void ButtonSend_Command(object sender, CommandEventArgs e)
    {

        MailMessage mm = new MailMessage();
        mm.From = new MailAddress("Udayarc@gmail.com");
        mm.To.Add(new MailAddress(TextBoxTo.Text));
        mm.Subject = TextBoxSubject.Text;
        mm.Body = Rte.Text;
        mm.IsBodyHtml = true;
        SmtpClient sc = new SmtpClient();
        sc.Send(mm);
        if (Session["type"].ToString() == "chair")
            Response.Redirect("FacSchedules.aspx");
        if (Session["type"].ToString() == "dean")
            Response.Redirect("~/Dean/InboxAllDept.aspx");
    }

    protected void ButtonDiscard_Command(object sender, CommandEventArgs e)
    {
        if (Session["type"].ToString()=="chair")
        Response.Redirect("FacSchedules.aspx");
        if (Session["type"].ToString() == "dean")
            Response.Redirect("~/Dean/InboxAllDept.aspx");

    }
}
