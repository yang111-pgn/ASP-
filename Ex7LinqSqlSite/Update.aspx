<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Update.aspx.cs" Inherits="Update" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            分类Id：
            <asp:TextBox ID="txtCategoryId" runat="server" ReadOnly="true"></asp:TextBox>
            <br /><br />
            分类名：
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            <br /><br />
            描述：
            <asp:TextBox ID="txtDescn" runat="server"></asp:TextBox>
            <br /><br />
            <asp:Button ID="btnUpdate" runat="server" Text="修改" OnClick="BtnUpdate_Click" />
            <asp:Button ID="btnReturn" runat="server" Text="返回" OnClick="BtnReturn_Click" />
        </div>
    </form>
</body>
</html>