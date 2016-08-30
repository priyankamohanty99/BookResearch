using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserFeedback : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Submit_Command(object sender, CommandEventArgs e)
    {
        string returnMessage = "Message sent successfully!";

        try
        {
            using (var smtp = new SmtpClient())
            {
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.Credentials = new NetworkCredential("mjh.csu.dev@gmail.com", "ptchqrszkcpeeodn");

                var msg = new MailMessage(txtEmail.Text, "mjhenry82@gmail.com");
                msg.Subject = "Patron Feedback";
                msg.Body = string.Format("Feedback from: {0}\nMessage: {1}", txtEmail.Text, txtMessage.Text);
                smtp.Send(msg);
            }
        }
        catch (Exception ex)
        {
            returnMessage = "Error sending message. Please try again later.";
            lblFeedback.ForeColor = Color.Red;
        }

        lblEmailCaption.Visible = false;
        lblMessageCaption.Visible = false;
        txtEmail.Visible = false;
        txtMessage.Visible = false;
        Submit.Visible = false;
        lblFeedback.Text = returnMessage;
    }
}