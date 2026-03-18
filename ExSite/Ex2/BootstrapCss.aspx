<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BootstrapCss.aspx.cs" Inherits="Ex2_BootstrapCss" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>利用 Bootstrap.css 和自定义.css 文件进行页面布局</title>
    <link href="../Content/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="../Styles/Style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <form id="form1" runat="server">
        <header class="header">
            <ul class="nav nav-pills">
                <li class="navDark">
                    <asp:LinkButton ID="lnkbtnDefault" ForeColor="White" runat="server">首页</asp:LinkButton>
                </li>
                <li class="navDark">
                    <asp:LinkButton ID="lnkbtnRegister" ForeColor="White" runat="server">注册</asp:LinkButton>
                </li>
                <li class="navDark">
                    <asp:LinkButton ID="lnkbtnLogin" ForeColor="White" runat="server">登录</asp:LinkButton>
                </li>
                <li class="navDark">
                    <asp:LinkButton ID="lnkbtnCart" ForeColor="White" runat="server">购物车</asp:LinkButton>
                </li>
                <li class="navDark">
                    <asp:LinkButton ID="lnkbtnSiteMap" ForeColor="White" runat="server">网站地图</asp:LinkButton>
                </li>
            </ul>
            <div class="status">
                登录状态
            </div>
            <asp:Image ID="imgLogo" runat="server" ImageUrl="~/Images/logo.gif"/>
        </header>
        <nav class="sitemap">
            您的位置：本页面由信息231杨烨天2023452195130制作
        </nav>
    </form>
</body>
</html>