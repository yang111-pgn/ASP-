<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register_export.aspx.cs" Inherits="Ex5_Register_export" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>用户注册</title>
    <style>
        table { border-collapse: collapse; width: 700px; margin: 20px auto; }
        td { 
            padding: 8px; 
            border: 1px solid #ccc;
            vertical-align: middle;
        }
        /* 标签列右对齐 */
        td:first-child { 
            text-align: right; 
            width: 120px;
            font-size: 16px;
        }
        /* 输入+错误信息列 */
        td:last-child { 
            text-align: left;
        }
        input[type="text"], input[type="password"] {
            width: 300px;
            height: 22px;
            margin-right: 8px;
        }
        .err { 
            color: red; 
            font-size: 14px;
            line-height: 1.5;
        }
        .btn-submit {
            text-align: center;
            padding: 10px;
        }
        .btn-submit input {
            width: 80px;
            height: 30px;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

        <table border="1">
            <!-- 用户名 -->
            <tr>
                <td>用户名：</td>
                <td>
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvName" runat="server"
                        ControlToValidate="txtName" ErrorMessage="请输入用户名！"
                        SetFocusOnError="True" Display="Dynamic">*</asp:RequiredFieldValidator>
                </td>
            </tr>

            <!-- 密码 -->
            <tr>
                <td>密码：</td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                        ControlToValidate="txtPassword" ErrorMessage="请输入密码！"
                        SetFocusOnError="True" Display="Dynamic">*</asp:RequiredFieldValidator>
                </td>
            </tr>

            <!-- 确认密码 -->
            <tr>
                <td>确认密码：</td>
                <td>
                    <asp:TextBox ID="txtPasswordAgain" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:CompareValidator ID="cvPassword" runat="server"
                        ControlToCompare="txtPassword" ControlToValidate="txtPasswordAgain"
                        ErrorMessage="*密码与确认密码不一致！" 
                        Display="Dynamic" CssClass="err"></asp:CompareValidator>
                </td>
            </tr>

            <!-- 生日 -->
            <tr>
                <td>生日：</td>
                <td>
                    <asp:TextBox ID="txtBirthday" runat="server"></asp:TextBox>
                    <asp:RangeValidator ID="rvBirthday" runat="server"
                        ControlToValidate="txtBirthday" Type="Date"
                        MinimumValue="1900-1-1" MaximumValue="2020-1-1"
                        ErrorMessage="*日期应在 1900-1-1 到 2020-1-1 之间！"
                        Display="Dynamic" CssClass="err"></asp:RangeValidator>
                </td>
            </tr>

            <!-- 电话号码 -->
            <tr>
                <td>电话号码：</td>
                <td>
                    <asp:TextBox ID="txtTelephone" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revTelephone" runat="server"
                        ControlToValidate="txtTelephone"
                        ValidationExpression="^(\(\d{3,4}\)\s?\d{7,8}|\d{3,4}[-\s]?\d{7,8})$"
                        ErrorMessage="*电话号码格式不正确！"
                        Display="Dynamic" CssClass="err"></asp:RegularExpressionValidator>
                </td>
            </tr>

            <!-- 身份证 -->
            <tr>
                <td>身份证：</td>
                <td>
                    <asp:TextBox ID="txtIdentity" runat="server"></asp:TextBox>
                    <asp:CustomValidator ID="csvIdentity" runat="server"
                        ControlToValidate="txtIdentity" ErrorMessage="*身份证号错误！"
                        OnServerValidate="csvIdentity_ServerValidate"
                        Display="Dynamic" CssClass="err"></asp:CustomValidator>
                </td>
            </tr>

            <!-- 提交按钮 -->
            <tr>
                <td colspan="2" class="btn-submit">
                    <asp:Button ID="btnSubmit" runat="server" Text="确定" OnClick="btnSubmit_Click" />
                </td>
            </tr>
        </table>

        <asp:Label ID="lblMsg" runat="server" Text="" style="display:block; text-align:center; margin-top:10px;"></asp:Label>
    </form>
</body>
</html>
