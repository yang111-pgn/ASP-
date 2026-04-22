<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Test" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>删除XML中间节点实验</title>
    <style>
        body { font-family: Arial; margin: 20px; }
        .panel { border: 1px solid #ccc; padding: 15px; margin-bottom: 20px; }
        .result { background-color: #f0f0f0; padding: 10px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>实验：删除XML中间节点</h2>
            <div class="panel">
                <label>要删除的商品ID：</label>
                <asp:TextBox ID="txtProductId" runat="server"></asp:TextBox>
                <asp:Button ID="btnDelete" runat="server" Text="删除节点" OnClick="BtnDelete_Click" />
                <asp:Button ID="btnRefresh" runat="server" Text="刷新显示" OnClick="BtnRefresh_Click" />
            </div>
            <div class="panel">
                <h3>当前XML中的商品列表</h3>
                <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="True" Width="80%" />
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
            </div>
            <div class="result">
                <h3>实验记录</h3>
                <asp:Label ID="lblLog" runat="server" Text="等待操作..." />
            </div>
        </div>
    </form>
</body>
</html>