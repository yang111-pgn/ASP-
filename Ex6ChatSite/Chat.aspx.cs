using System;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Chat : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblName.Text = "发言人： " + Session["user"];

        if (Request.Cookies["LoginCount"] != null)
        {
            string count = Request.Cookies["LoginCount"].Value;
            lblName.Text += " | Login times: " + count;
        }
        // ==============================================

        if (!IsPostBack)
        {
            Application["message"] = Session["user"] + " entered the chat room<br />" + Application["message"];
        }
    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        Application.Lock();
        Application["message"] = Session["user"] + " 说: " + txtMessage.Text + " (" + DateTime.Now.ToString() + ")<br />" + Application["message"];
        Application.UnLock();
        txtMessage.Text = "";
    }
}