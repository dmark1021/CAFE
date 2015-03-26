using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Net.Mail;

/// <summary>
/// Summary description for MailingClass
/// </summary>
public class MailingClass
{
	public void sendEmail(string subject,string body,string to) 
	{
        MailMessage mm = new MailMessage();
        SmtpClient sc = new SmtpClient();
        mm.From = new MailAddress("CAFE@gannon.edu");
        mm.To.Add(to);
        //mm.CC.Add("lun001@gannon.edu");
        mm.Subject = subject;
        mm.Body = body;
        mm.IsBodyHtml = true;
        try
        {
            sc.Send(mm);
        }
        catch (Exception e)
        {
            throw e;
        }
	}

    public void message(string facname,string chair,string fc,string cc,string dc,string chairemailid,string facemailid,string type)
    {
        string message = "";
        string subject = "";
        if (type == "sc")
        {
            message = "<html><head><body><table><tr><td>Dear " + chair + ",</td></tr>";
            message += "<tr><td>This is an auto-generated e:Mail message from CAFE.</td></tr>";
            message += "<tr><td>" + facname + " has submitted schedule for your review.</td></tr>";
            message += "<tr><td>&nbsp;</td></tr>";
            message += "<tr><td>Faculty Comments: " + fc + "</td></tr><br>";
            message += "<tr><td>&nbsp;</td></tr>";
            message += "<tr><td>Chair Comments: " + cc + "</td></tr>";
            message += "<tr><td>&nbsp;</td></tr>";
            message += "<tr><td>Dean Comments: " + dc + "</td></tr></table></body></html>";
            subject = facname + " has submitted schedule to you";
            sendEmail(subject, message, chairemailid);

            message = "";

            message += "<html><head><body><table><tr><td>Dear " + facname + ",</td></tr>";
            message += "<tr><td>This is an auto-generated e:Mail message from CAFE.</td></tr>";
            message += "<tr><td>You have submitted your schedule to department chair for approval.</td></tr>";
            message += "<tr><td>&nbsp;</td></tr>";
            message += "<tr><td>Faculty Comments: " + fc + "</td></tr>";
            message += "<tr><td>&nbsp;</td></tr>";
            message += "<tr><td>Chair Comments: " + cc + "</td></tr>";
            message += "<tr><td>&nbsp;</td></tr>";
            message += "<tr><td>Dean Comments: " + dc + "</td></tr></table></body></html>";
            subject = "You have submitted the schedule to department chair";
            sendEmail(subject, message, facemailid);
        }
        if (type == "ac")
        {
            message = "<html><head><body><table><tr><td>Dear " + facname + ",</td></tr>";
            message += "<tr><td>This is an auto-generated e:Mail message from CAFE.</td></tr>";
            message += "<tr><td>Your schedule has been approved by department chair and has been sent to the Dean's Office for approval.</td></tr>";
            message += "<tr><td>&nbsp;</td></tr>";
            message += "<tr><td>Faculty Comments: " + fc + "</td></tr>";
            message += "<tr><td>&nbsp;</td></tr>";
            message += "<tr><td>Chair Comments: " + cc + "</td></tr>";
            message += "<tr><td>&nbsp;</td></tr>";
            message += "<tr><td>Dean Comments: " + dc + "</td></tr></table></body></html>";
            subject = "Your schedule has been approved by chair";
            sendEmail(subject, message, facemailid);
            message = "";
            message = "<html><head><body><table><tr><td>Dear " + chair + ",</td></tr>";
            message += "<tr><td>This is an auto-generated e:Mail message from CAFE.</td></tr>";
            message += "<tr><td>You have approved "+facname+"'s schedule.</td></tr></body></html>";
            
            subject = "You have approved " + facname+"'s";
            sendEmail(subject, message, chairemailid);

        }
        if (type == "rc")
        {
            message = "<html><head><body><table><tr><td>Dear " + facname + ",</td></tr>";
            message += "<tr><td>This is an auto-generated e:Mail message from CAFE.</td></tr>";
            message += "<tr><td>Your schedule has been rejected by your department chair and it has been sent back to you.</td></tr>";
            message += "<tr><td>&nbsp;</td></tr>";
            message += "<tr><td>Faculty Comments: " + fc + "</td></tr>";
            message += "<tr><td>&nbsp;</td></tr>";
            message += "<tr><td>Chair Comments: " + cc + "</td></tr>";
            message += "<tr><td>&nbsp;</td></tr>";
            message += "<tr><td>Dean Comments: " + dc + "</td></tr></table></body></html>";
            subject = "Your schedule has been rejected by chair";
            sendEmail(subject, message, facemailid);
            message = "";
            message = "<html><head><body><table><tr><td>Dear " + chair + ",</td></tr>";
            message += "<tr><td>This is an auto-generated e:Mail message from CAFE.</td></tr>";
            message += "<tr><td>You have rejected " + facname + "'s schedule.</td></tr></body></html>";

            subject = "You have rejected " + facname+"'s schedule";
            sendEmail(subject, message, chairemailid);
        }
        if (type == "ad")
        {
            message = "<html><head><body><table><tr><td>Dear " + facname + ",</td></tr>";
            message += "<tr><td>This is an auto-generated e:Mail message from CAFE.</td></tr>";
            message += "<tr><td>Your schedule has been approved by dean.</td></tr>";
            message += "<tr><td>&nbsp;</td></tr>";
            message += "<tr><td>Faculty Comments: " + fc + "</td></tr>";
            message += "<tr><td>&nbsp;</td></tr>";
            message += "<tr><td>Chair Comments: " + cc + "</td></tr>";
            message += "<tr><td>&nbsp;</td></tr>";
            message += "<tr><td>Dean Comments: " + dc + "</td></tr></table></body></html>";
            subject = "Your schedule has approved by Dean's office";
            sendEmail(subject, message, facemailid);
        }
        if (type == "rd")
        {
            message = "<html><head><body><table><tr><td>Dear " + facname + ",</td></tr>";
            message += "<tr><td>This is an auto-generated e:Mail message from CAFE.</td></tr>";
            message += "<tr><td>Your schedule has been rejected by dean and it has been sent back to you.</td></tr>";
            message += "<tr><td>&nbsp;</td></tr>";
            message += "<tr><td>Faculty Comments:  " + fc + "</td></tr>";
            message += "<tr><td>&nbsp;</td></tr>";
            message += "<tr><td>Chair Comments: " + cc + "</td></tr>";
            message += "<tr><td>&nbsp;</td></tr>";
            message += "<tr><td>Dean Comments: " + dc + "</td></tr></table></body></html>";
            subject = "Your schedule has rejected by Dean's office";
            sendEmail(subject, message, facemailid);
        }

     }
 
      
}
