<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProductManage.aspx.cs" Inherits="ProductManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>商品管理</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h3>商品管理</h3>
            商品ID：<asp:TextBox ID="txtProductId" runat="server" Width="60px" />
            <asp:Button ID="btnQueryAll" runat="server" Text="显示全部" OnClick="BtnQueryAll_Click" />
            <asp:Button ID="btnInsert" runat="server" Text="添加" OnClick="BtnInsert_Click" />
            <asp:Button ID="btnUpdate" runat="server" Text="修改" OnClick="BtnUpdate_Click" />
            <asp:Button ID="btnDelete" runat="server" Text="删除" OnClick="BtnDelete_Click" />
            <br /><br />
            <asp:GridView ID="gvProduct" runat="server" AutoGenerateColumns="False" Width="90%" CellPadding="4" ForeColor="#333333">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ProductId" HeaderText="商品ID" />
                    <asp:BoundField DataField="Name" HeaderText="商品名称" />
                    <asp:BoundField DataField="ListPrice" HeaderText="价格" DataFormatString="{0:F2}" />
                    <asp:BoundField DataField="CategoryId" HeaderText="分类ID" />
                    <asp:BoundField DataField="UnitCost" HeaderText="成本" DataFormatString="{0:F2}" />
                    <asp:BoundField DataField="Qty" HeaderText="库存" />
                    <asp:BoundField DataField="SuppId" HeaderText="供应商ID" />
                </Columns>
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#EFF3FB" />
            </asp:GridView>
            <br />
            <asp:Button ID="btnReturn" runat="server" Text="返回主菜单" OnClick="BtnReturn_Click" />
        </div>
    </form>
</body>
</html>