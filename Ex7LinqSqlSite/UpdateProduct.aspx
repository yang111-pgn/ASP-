<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateProduct.aspx.cs" Inherits="UpdateProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>修改商品</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h3>修改商品</h3>
            商品ID：<asp:TextBox ID="txtProductId" runat="server" ReadOnly="true" /><br /><br />
            商品名称：<asp:TextBox ID="txtName" runat="server" Width="200px" /><br /><br />
            价格：<asp:TextBox ID="txtListPrice" runat="server" /> 元<br /><br />
            成本：<asp:TextBox ID="txtUnitCost" runat="server" /> 元<br /><br />
            库存：<asp:TextBox ID="txtQty" runat="server" /><br /><br />
            分类ID：<asp:TextBox ID="txtCategoryId" runat="server" /><br /><br />
            供应商ID：<asp:TextBox ID="txtSuppId" runat="server" /><br /><br />
            描述：<asp:TextBox ID="txtDescn" runat="server" TextMode="MultiLine" Width="300px" Height="60px" /><br /><br />
            图片路径：<asp:TextBox ID="txtImage" runat="server" Width="300px" /><br /><br />
            <asp:Button ID="btnUpdate" runat="server" Text="保存修改" OnClick="BtnUpdate_Click" />
            <asp:Button ID="btnReturn" runat="server" Text="返回" OnClick="BtnReturn_Click" />
            <br /><br />
            <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
        </div>
    </form>
</body>
</html>