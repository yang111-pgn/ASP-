<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LinqXmlInsert.aspx.cs" Inherits="LinqXmlInsert" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>插入XML元素</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>分类Id：</td>
                    <td><asp:TextBox ID="txtCategoryId" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>分类名：</td>
                    <td><asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>描述：</td>
                    <td><asp:TextBox ID="txtDescn" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnInsert" runat="server" Text="插入" OnClick="BtnInsert_Click" />
                        <asp:Button ID="btnReturn" runat="server" Text="返回" OnClick="BtnReturn_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>