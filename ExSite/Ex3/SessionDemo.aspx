<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        在线人数：<asp:Label ID="lblOnline" runat="server" Text="0" />
        <br /><br />
        <asp:Button ID="Button1" runat="server" Text="创建Session" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="销毁Session" OnClick="Button2_Click" />
    </form>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        lblOnline.Text = Application["OnlineCount"].ToString();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["test"] = "test";
        Response.Redirect("SessionDemo.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("SessionDemo.aspx");
    }
</script>
</body>
</html>