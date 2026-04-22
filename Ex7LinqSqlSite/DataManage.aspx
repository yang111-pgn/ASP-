<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DataManage.aspx.cs" Inherits="DataManage" %>

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
            <asp:TextBox ID="txtCategoryId" runat="server"></asp:TextBox>
            <br /><br />
            <asp:Button ID="btnQueryAll" runat="server" Text="显示全部" OnClick="BtnQueryAll_Click" />
            <asp:Button ID="btnFuzzy" runat="server" Text="模糊查找" OnClick="BtnFuzzy_Click" />
            <asp:Button ID="btnInsert" runat="server" Text="插入" OnClick="BtnInsert_Click" />
            <asp:Button ID="btnUpdate" runat="server" Text="修改" OnClick="BtnUpdate_Click" />
            <asp:Button ID="btnDelete" runat="server" Text="删除" OnClick="BtnDelete_Click" />
            <asp:Button ID="btnProductQuery" runat="server" Text="商品查询" OnClick="BtnProductQuery_Click" />
            <asp:Button ID="btnProductManage" runat="server" Text="商品管理" OnClick="BtnProductManage_Click" />
            <asp:Button ID="btnProductToXml" runat="server" Text="商品导出XML" OnClick="BtnProductToXml_Click" />
            <asp:Button ID="btnManageProductXml" runat="server" Text="管理商品XML" OnClick="BtnManageProductXml_Click" />
            <br /><br />
            <asp:GridView ID="gvCategory" runat="server"></asp:GridView>
        </div>
    </form>
</body>
</html>