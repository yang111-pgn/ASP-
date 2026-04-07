<%@ Application Language="C#" %>
<script RunAt="server">
    void Application_Start(object sender, EventArgs e)
    {
        Application["OnlineCount"] = 0;
    }

    void Session_Start(object sender, EventArgs e)
    {
        Application.Lock();
        Application["OnlineCount"] = (int)Application["OnlineCount"] + 1;
        Application.UnLock();
    }

    void Session_End(object sender, EventArgs e)
    {
        Application.Lock();
        Application["OnlineCount"] = (int)Application["OnlineCount"] - 1;
        Application.UnLock();
    }
</script>