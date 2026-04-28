<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Insert.aspx.cs" Inherits="Insert" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>商品添加</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>商品分类：</td>
                    <td>
                        <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="True" DataTextField="Name" DataValueField="CategoryId">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>商品名称：</td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>商品价格：</td>
                    <td>
                        <asp:TextBox ID="txtListPrice" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>商品库存：</td>
                    <td>
                        <asp:TextBox ID="txtQty" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>供应商：</td>
                    <td>
                        <asp:DropDownList ID="ddlSupplier" runat="server" AutoPostBack="True" DataTextField="Name" DataValueField="SuppId">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>商品描述：</td>
                    <td>
                        <asp:TextBox ID="txtDescn" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnInsert" runat="server" Text="插入" OnClick="btnInsert_Click" />
                        <asp:Button ID="btnReturn" runat="server" Text="返回" OnClick="btnReturn_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <p>
        制作人：信息231yyt 2023452195130</p>
</body>
</html>