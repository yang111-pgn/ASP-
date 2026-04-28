<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProShow.aspx.cs" Inherits="ProShow" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>商品展示</title>
    <style>
        a { text-decoration: none }
        table { width: 100% }
        td { border: 1px solid #808080; padding: 0; }
        td[colspan] table tbody tr td { border-width: 0; }
        td[rowspan] { text-align: center; vertical-align: middle; width: 40%; }
        td img { width: 60px; height: 60px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            分类名：
            <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="True"
                DataTextField="Name" DataValueField="CategoryId"
                OnSelectedIndexChanged="DdlCategory_SelectedIndexChanged">
            </asp:DropDownList>

            <asp:GridView ID="gvProduct" runat="server" AllowPaging="True"
                AutoGenerateColumns="False" PageSize="1" Width="100%"
                OnPageIndexChanging="GvProduct_PageIndexChanging">
                <PagerSettings FirstPageText="首页" LastPageText="尾页"
                    Mode="NextPrevious" NextPageText="下一页" Position="TopAndBottom"
                    PreviousPageText="上一页" />
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <!--  rowspan 由 7 改为 6，对应下方6行信息  -->
                                    <td rowspan="6">
                                        <asp:Image ID="imgProduct" runat="server"
                                            ImageUrl='<%# Bind("Image") %>' />
                                    </td>
                                    <td>商品名称：</td>
                                    <td>
                                        <asp:Label ID="lblName" runat="server"
                                            Text='<%# Bind("Name") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>商品价格：</td>
                                    <td>
                                        <asp:Label ID="lblListPrice" runat="server"
                                            Text='<%# Bind("ListPrice") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>商品描述：</td>
                                    <td>
                                        <asp:Label ID="lblDescn" runat="server"
                                            Text='<%# Bind("Descn") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>库存：</td>
                                    <td>
                                        <asp:Label ID="lblQty" runat="server"
                                            Text='<%# Bind("Qty") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>商品编号：</td>
                                    <td>
                                        <asp:Label ID="lblProductId" runat="server"
                                            Text='<%# Bind("ProductId") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>商品分类号：</td>
                                    <td>
                                        <asp:Label ID="lblCategoryId" runat="server"
                                            Text='<%# Bind("CategoryId") %>'></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:HyperLinkField DataNavigateUrlFields="ProductId"
                        DataNavigateUrlFormatString="~/ShopCart.aspx?ProductId={0}"
                        HeaderText="放入购物车" Text="购买" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
    <p>
        制作人：信息231yyt 2023452195130</p>
</body>
</html>