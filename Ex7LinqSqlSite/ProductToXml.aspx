<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProductToXml.aspx.cs" Inherits="ProductToXml" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Product表转XML</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblMsg" runat="server" ForeColor="Green"></asp:Label>
            <br /><br />
            <asp:Button ID="btnReturn" runat="server" Text="返回数据管理" OnClick="BtnReturn_Click" />
        </div>
    </form>
</body>
</html>