<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Test" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>测试窗体验证</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="txtInput" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator 
                ID="rfvInput" 
                runat="server" 
                ControlToValidate="txtInput" 
                ErrorMessage="请输入内容" 
                Display="Dynamic">
            </asp:RequiredFieldValidator>
            <br />
            <asp:Button ID="btnSubmit" runat="server" Text="提交" />
        </div>
    </form>
</body>
</html>