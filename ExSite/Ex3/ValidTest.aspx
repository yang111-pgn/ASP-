<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ValidTest.aspx.cs" Inherits="Ex3_ValidTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>验证方式实验</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            请输入姓名：
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            
            <!-- 非空验证控件（支持客户端+服务器端验证） -->
            <asp:RequiredFieldValidator 
                ID="rfvName" 
                runat="server" 
                ControlToValidate="txtName"
                Text="【客户端：不能为空】" 
                ForeColor="Red"
                Display="Dynamic"
                EnableClientScript="true">
            </asp:RequiredFieldValidator>
            
            <br /><br />
            <asp:Button ID="btnSubmit" runat="server" Text="提交验证" OnClick="btnSubmit_Click" />
            
            <br /><br />
            <%-- 服务器端验证结果显示 --%>
            <asp:Label ID="lblResult" runat="server" Text="" ForeColor="Blue" Font-Bold="true"></asp:Label>
        </div>
    </form>
</body>
</html>