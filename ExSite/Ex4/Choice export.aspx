<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Choice export.aspx.cs" Inherits="Ex4_Choice_export" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>单项选择题测试</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:PlaceHolder ID="plhChoice" runat="server"></asp:PlaceHolder>
        <br />
        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="提交" />
        <br /><br />
        <asp:Label ID="lblDisplay" runat="server" Text=""></asp:Label>
    </form>
</body>
