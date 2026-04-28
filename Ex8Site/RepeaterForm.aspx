<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RepeaterForm.aspx.cs" Inherits="RepeaterForm" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>利用Repeater控件实现数据管理</title>
    <style>
        .pager { text-align: center; margin-top: 20px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Repeater ID="rptProduct" runat="server">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td rowspan="5">
                                <asp:Image ID="imgProduct" runat="server" ImageUrl='<%# Eval("Image") %>' />
                            </td>
                            <td>商品名称：</td>
                            <td><%# Eval("Name") %></td>
                        </tr>
                        <tr>
                            <td>商品价格：</td>
                            <td><%# Eval("ListPrice") %></td>
                        </tr>
                        <tr>
                            <td>商品描述：</td>
                            <td><%# Eval("Descn") %></td>
                        </tr>
                        <tr>
                            <td>库存：</td>
                            <td><%# Eval("Qty") %></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:HyperLink ID="hlAdd" NavigateUrl="~/Insert.aspx" runat="server">新建</asp:HyperLink>
                                <asp:HyperLink ID="hlUpdate" runat="server" NavigateUrl='<%# "Update.aspx?ProductId=" + Eval("ProductId") %>'>编辑</asp:HyperLink>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:Repeater>

            <!-- AspNetPager分页控件 -->
            <div class="pager">
                <webdiyer:AspNetPager ID="AspNetPager1" runat="server" 
                    PageSize="5" 
                    AlwaysShow="True" 
                    ShowFirstLast="True" 
                    ShowPrevNext="True" 
                    ShowPageIndexBox="Always" 
                    PageIndexBoxType="DropDownList"
                    OnPageChanged="AspNetPager1_PageChanged" 
                    CssClass="pager">
                </webdiyer:AspNetPager>
            </div>
        </div>
    </form>
    <p>制作人：信息231yyt 2023452195130</p>
</body>
</html>