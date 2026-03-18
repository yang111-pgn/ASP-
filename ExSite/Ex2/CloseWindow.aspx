<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CloseWindow.aspx.cs" Inherits="Ex2_CloseWindow" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btnClose" runat="server" OnClientClick="javascript:window.close();return false;" Text="关闭" />
            <a herf="/" onclick="javascript:window.close();return false;">关闭</a>
            <label>本页面由信息231杨烨天2023452195130制作</label>
        </div>
    </form>
</body>
</html>
