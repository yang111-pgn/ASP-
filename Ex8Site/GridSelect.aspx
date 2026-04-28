<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridSelect.aspx.cs" Inherits="GridSelect" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>GridView 带复选框及全选功能</title>
    <style>
        table { border-collapse: collapse; width: 100%; }
        td, th { border: 1px solid #808080; padding: 5px; text-align: center; }
        .pager { margin-top: 10px; text-align: center; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="gvProduct" runat="server" 
                AutoGenerateColumns="False" 
                DataKeyNames="ProductId" 
                AllowPaging="True" 
                PageSize="5" 
                OnPageIndexChanging="gvProduct_PageIndexChanging"
                OnRowDataBound="gvProduct_RowDataBound"
                OnDataBound="gvProduct_DataBound">
                <Columns>
                    <asp:TemplateField HeaderText="选择">
                        <HeaderTemplate>
                            <asp:CheckBox ID="chkAll" runat="server" Text="全选" AutoPostBack="True" OnCheckedChanged="chkAll_CheckedChanged" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkItem" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="ProductId" HeaderText="商品编号" />
                    <asp:BoundField DataField="CategoryId" HeaderText="分类号" />
                    <asp:BoundField DataField="Name" HeaderText="商品名称" />
                    <asp:BoundField DataField="ListPrice" HeaderText="价格" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="Qty" HeaderText="库存" />
                </Columns>
                <PagerSettings Mode="NextPreviousFirstLast" FirstPageText="首页" LastPageText="尾页" 
                    NextPageText="下一页" PreviousPageText="上一页" Position="TopAndBottom" />
            </asp:GridView>
        </div>
        <p>制作人：信息231yyt 2023452195130</p>
    </form>
</body>
</html>