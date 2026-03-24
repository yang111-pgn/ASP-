<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListBox.aspx.cs" Inherits="Chap4_ListBox" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ListBox控件示例</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ListBox ID="lstLeft" runat="server" SelectionMode="Multiple" Height="100px" Width="100px">
                <asp:ListItem Value="hunan">湖南</asp:ListItem>
                <asp:ListItem Value="jiangxi">江西</asp:ListItem>
                <asp:ListItem Value="beijing">北京</asp:ListItem>
                <asp:ListItem Value="shanghai">上海</asp:ListItem>
            </asp:ListBox>
            <div style="display:inline-block; vertical-align:top; margin:0 15px;">
                <asp:Button ID="btnMoveRight" runat="server" OnClick="BtnMoveRight_Click" Text=">" /><br /><br />
                <asp:Button ID="btnMoveLeft" runat="server" OnClick="BtnMoveLeft_Click" Text="<" />
            </div>

            <asp:ListBox ID="lstRight" runat="server" SelectionMode="Multiple" Height="100px" Width="100px">
            </asp:ListBox>
        </div>
    </form>
</body>
</html>