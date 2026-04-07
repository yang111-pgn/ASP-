using System;

public partial class ApplicationPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["test"] = "ok";

        if (Application["VisitNumber"] == null)
        {
            Application.Lock();
            Application["VisitNumber"] = 0;
            Application.UnLock();
        }

        lblMsg.Text = Application["VisitNumber"].ToString();
    }
}