<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TableLayout.aspx.cs" Inherits="Ex2_TableLayout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>table布局</title>
    <style>
        a {
            text-decoration: none;
        }
    </style>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            height: 28px;
        }
    </style>
</head>
<body style="background-color: #616378; font-size: 12px; margin: 0px; text-align: center">
    <form id="form1" runat="server">
        <table class="auto-style1" style="background-color: #fff; height: 86px; padding: 4px 2px 2px 10px; text-align: left; width: 778px; margin: 0 auto">
            <tr>
                <td rowspan="2">
                    <asp:Image ID="imgLogo" runat="server" ImageUrl="~/Images/logo.gif" />
                </td>
                <td style="background-color: #8c8ea3; text-align: center; width: 69.4px">
                    <asp:LinkButton ID="lnkbtnDefault" runat="server" ForeColor="White">首页</asp:LinkButton>
                </td>
                <td style="background-color: #8c8ea3; text-align: center; width: 69.4px">
                    <asp:LinkButton ID="lnkbtnRegister" runat="server" ForeColor="White">注册</asp:LinkButton>
                </td>
                <td style="background-color: #8c8ea3; text-align: center; width: 69.4px">
                    <asp:LinkButton ID="lnkbtnLogin" runat="server" ForeColor="White">登录</asp:LinkButton>
                </td>
                <td style="background-color: #8c8ea3; text-align: center; width: 69.4px">
                    <asp:LinkButton ID="lnkbtnCart" runat="server" ForeColor="White">购物车</asp:LinkButton>
                </td>
                <td style="background-color: #8c8ea3; text-align: center; width: 69.4px">
                    <asp:LinkButton ID="lnkbtnSiteMap" runat="server" ForeColor="White">网站地图</asp:LinkButton>
                </td>
            </tr>
            <tr style="background-color: #666688; color: #fff">
                <td class="auto-style2" colspan="5">登录状态</td>
            </tr>
            <tr style="background-color: #ccccd4; margin: 0 auto; padding-left: 6px; text-align: left; width: 778px">
                <td colspan="6">您的位置 本页面由信息231杨烨天2023452195130制作</td>
            </tr>
        </table>
        <div>
        </div>
    </form>
</body>
</html>
