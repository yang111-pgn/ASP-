<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageProductXml.aspx.cs" Inherits="ManageProductXml" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>管理商品 XML 文档</title>
    <style>
        .box { margin-bottom: 15px; border: 1px solid #ccc; padding: 10px; width: 500px; }
        .box label { display: inline-block; width: 80px; }
        .box input { width: 150px; margin-right: 10px; }
        .btn { margin-top: 10px; }
        hr { margin: 20px 0; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>基于 LINQ to XML 管理商品数据</h2>

            <!-- 删除功能 -->
            <div class="box">
                <h3>删除商品</h3>
                <label>商品ID：</label>
                <asp:TextBox ID="txtDeleteId" runat="server" />
                <asp:Button ID="btnDelete" runat="server" Text="删除" OnClick="BtnDelete_Click" />
                <br /><br />
                <asp:Label ID="lblDeleteMsg" runat="server" ForeColor="Red"></asp:Label>
            </div>

            <!-- 修改功能 -->
            <div class="box">
                <h3>修改商品价格</h3>
                <label>商品ID：</label>
                <asp:TextBox ID="txtUpdateId" runat="server" />
                <br />
                <label>新价格：</label>
                <asp:TextBox ID="txtNewPrice" runat="server" />
                <br />
                <asp:Button ID="btnUpdate" runat="server" Text="修改" OnClick="BtnUpdate_Click" />
                <br /><br />
                <asp:Label ID="lblUpdateMsg" runat="server" ForeColor="Red"></asp:Label>
            </div>

            <hr />

            <!-- 显示当前 XML 内容 -->
            <h3>当前 XML 文件内容</h3>
            <asp:GridView ID="gvProductXml" runat="server" AutoGenerateColumns="False" Width="80%" CellPadding="4">
                <Columns>
                    <asp:BoundField DataField="ProductId" HeaderText="商品ID" />
                    <asp:BoundField DataField="Name" HeaderText="商品名称" />
                    <asp:BoundField DataField="Price" HeaderText="价格(元)" DataFormatString="{0:F2}" />
                    <asp:BoundField DataField="CategoryId" HeaderText="分类ID" />
                </Columns>
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#EFF3FB" />
            </asp:GridView>
            <br />
            <asp:Button ID="btnRefresh" runat="server" Text="刷新显示" OnClick="BtnRefresh_Click" />
            <asp:Button ID="btnReturn" runat="server" Text="返回主菜单" OnClick="BtnReturn_Click" />
        </div>
    </form>
</body>
</html>