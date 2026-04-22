<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InsertProduct.aspx.cs" Inherits="InsertProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>添加商品</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h3>添加商品</h3>
            商品名称：<asp:TextBox ID="txtName" runat="server" Width="200px" /><br /><br />
            价格：<asp:TextBox ID="txtListPrice" runat="server" /> 元<br /><br />
            成本：<asp:TextBox ID="txtUnitCost" runat="server" /> 元<br /><br />
            库存：<asp:TextBox ID="txtQty" runat="server" /><br /><br />
            分类ID：<asp:TextBox ID="txtCategoryId" runat="server" /> 
            <asp:Button ID="btnCheckCategory" runat="server" Text="检查分类是否存在" OnClick="BtnCheckCategory_Click" /><br /><br />
            供应商ID：<asp:TextBox ID="txtSuppId" runat="server" /><br /><br />
            描述：<asp:TextBox ID="txtDescn" runat="server" TextMode="MultiLine" Width="300px" Height="60px" /><br /><br />
            图片路径：<asp:TextBox ID="txtImage" runat="server" Width="300px" /><br /><br />
            <asp:Button ID="btnInsert" runat="server" Text="添加" OnClick="BtnInsert_Click" />
            <asp:Button ID="btnReturn" runat="server" Text="返回" OnClick="BtnReturn_Click" />
            <br /><br />
            <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
        </div>
    </form>
</body>
</html>