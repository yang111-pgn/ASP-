<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewCart.aspx.cs" Inherits="ViewCart" ResponseEncoding="UTF-8" Culture="zh-CN" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>购物车</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
            <br />
            <asp:CheckBoxList ID="chklsPet" runat="server"></asp:CheckBoxList>
            <br />
            <asp:Button ID="btnClear" runat="server" Text="清空购物车" Visible="false" />
            <asp:Button ID="btnContinue" runat="server" Text="继续购物" OnClick="btnContinue_Click" />
        </div>
    </form>
</body>
</html>