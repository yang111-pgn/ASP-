<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GroupValidation.aspx.cs" Inherits="Ex5_GroupValidation" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>分组验证注册</title>
    <style>
        table { border-collapse: collapse; width: 600px; margin: 20px auto; }
        td { padding: 8px; border: 1px solid #ccc; }
        td:first-child { text-align: right; width: 120px; }
        .txtBox { width: 300px; }
        .btn { padding: 5px 15px; margin: 5px; }
        .redErr { color: red; font-size: 12px; }
        .greenSucc { color: green; font-size: 12px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        
        <table>
            <!-- 用户名区域：独立分组 -->
            <tr>
                <td>用户名：</td>
                <td>
                    <asp:TextBox ID="txtName" runat="server" CssClass="txtBox"></asp:TextBox>
                    <asp:CustomValidator ID="cvName" runat="server"
                        ControlToValidate="txtName"
                        ErrorMessage="用户名已被占用！"
                        OnServerValidate="cvName_ServerValidate"
                        Display="Dynamic"
                        CssClass="redErr"
                        ValidationGroup="groupName">*</asp:CustomValidator>
                    <asp:Button ID="btnValidateName" runat="server" 
                        Text="检查用户名是否可用" 
                        OnClick="btnValidateName_Click" 
                        CssClass="btn"
                        ValidationGroup="groupName" />
                    <asp:Label ID="lblName" runat="server" CssClass="greenSucc"></asp:Label>
                </td>
            </tr>

            <!-- 密码区域 -->
            <tr>
                <td>密码：</td>
                <td>
                    <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" CssClass="txtBox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPwd" runat="server"
                        ControlToValidate="txtPwd" ErrorMessage="请输入密码！"
                        Display="Dynamic" CssClass="redErr"
                        ValidationGroup="groupSubmit">*</asp:RequiredFieldValidator>
                </td>
            </tr>

            <!-- 确认密码区域 -->
            <tr>
                <td>确认密码：</td>
                <td>
                    <asp:TextBox ID="txtPwdAgain" runat="server" TextMode="Password" CssClass="txtBox"></asp:TextBox>
                    <asp:CompareValidator ID="cvPwd" runat="server"
                        ControlToCompare="txtPwd" ControlToValidate="txtPwdAgain"
                        ErrorMessage="密码与确认密码不一致！"
                        Display="Dynamic" CssClass="redErr"
                        ValidationGroup="groupSubmit"></asp:CompareValidator>
                </td>
            </tr>

            <!-- 身份证区域 -->
            <tr>
                <td>身份证：</td>
                <td>
                    <asp:TextBox ID="txtIdCard" runat="server" CssClass="txtBox"></asp:TextBox>
                    <asp:CustomValidator ID="cvIdCard" runat="server"
                        ControlToValidate="txtIdCard"
                        ErrorMessage="身份证号错误！"
                        OnServerValidate="cvIdCard_ServerValidate"
                        Display="Dynamic" CssClass="redErr"
                        ValidationGroup="groupSubmit"></asp:CustomValidator>
                </td>
            </tr>

            <!-- 提交按钮区域 -->
            <tr>
                <td colspan="2" style="text-align: center;">
                    <asp:Button ID="btnSubmit" runat="server" 
                        Text="确定注册" 
                        OnClick="btnSubmit_Click" 
                        CssClass="btn"
                        ValidationGroup="groupSubmit" />
                </td>
            </tr>
        </table>

        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
            ValidationGroup="groupSubmit"
            ShowMessageBox="False" 
            ShowSummary="True" 
            ForeColor="Red"
            style="display:block; text-align:center; margin-top:10px;"/>
            
        <asp:Label ID="lblMsg" runat="server" 
            style="display:block; text-align:center; margin-top:20px; font-size:16px; color:blue;"
            Text=""></asp:Label>
    </form>
    <p>
        由信息231 2023452195130杨烨天制作</p>
</body>
</html>
