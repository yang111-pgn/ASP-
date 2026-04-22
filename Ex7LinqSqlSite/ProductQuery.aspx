<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProductQuery.aspx.cs" Inherits="ProductQuery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>商品查询 - 自定义条件</title>
    <style>
        .search-box { margin-bottom: 15px; }
        .search-box label { display: inline-block; width: 80px; }
        .search-box input { width: 150px; margin-right: 20px; }
        .result-info { margin: 10px 0; font-weight: bold; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h3>商品自定义查询</h3>
            <div class="search-box">
                <label>名称包含字符：</label>
                <asp:TextBox ID="txtContains" runat="server" placeholder="例如：c" />
                <span style="color: gray;">（不区分大小写）</span>
            </div>
            <div class="search-box">
                <label>价格区间（元）：</label>
                <asp:TextBox ID="txtMinPrice" runat="server" placeholder="最低价" Width="100px" />
                ～
                <asp:TextBox ID="txtMaxPrice" runat="server" placeholder="最高价" Width="100px" />
                <span style="color: gray;">（留空表示不限制）</span>
            </div>
            <div class="search-box">
                <asp:Button ID="btnSearch" runat="server" Text="搜索" OnClick="BtnSearch_Click" />
                <asp:Button ID="btnReturn" runat="server" Text="返回数据管理" OnClick="BtnReturn_Click" />
            </div>
            <hr />
            <asp:GridView ID="gvProduct" runat="server" AutoGenerateColumns="False" Width="80%" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ProductId" HeaderText="商品ID" />
                    <asp:BoundField DataField="Name" HeaderText="商品名称" />
                    <asp:BoundField DataField="Price" HeaderText="价格(元)" DataFormatString="{0:F2}" />
                    <asp:BoundField DataField="CategoryId" HeaderText="分类ID" />
                </Columns>
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#EFF3FB" />
            </asp:GridView>
            <asp:Label ID="lblMsg" runat="server" CssClass="result-info" ForeColor="Red"></asp:Label>
        </div>
    </form>
</body>
</html>