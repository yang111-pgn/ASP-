<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:CheckBoxList ID="chklsPet" runat="server">
                <asp:ListItem>盲鱼</asp:ListItem>
                <asp:ListItem>波斯猫</asp:ListItem>
                <asp:ListItem>斑马</asp:ListItem>
                <asp:ListItem>千里马</asp:ListItem>
                <asp:ListItem>绵羊</asp:ListItem>
            </asp:CheckBoxList>
            <br />
            <asp:Button ID="btnBuy" runat="server" Text="放入购物车" OnClick="btnBuy_Click" />
            <asp:Button ID="btnView" runat="server" Text="查看购物车" OnClick="btnView_Click" />
        </div>
    </form>
</body>
</html>