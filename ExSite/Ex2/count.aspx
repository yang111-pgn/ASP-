<%@ Page Language="C#" AutoEventWireup="true" CodeFile="count.aspx.cs" Inherits="Ex2_count" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>JS计数器</title>
    <script type="text/javascript">
        var count = 0;
        var timer = null;

        function startCount() {
            if (timer) {
                clearInterval(timer);
            }
            timer = setInterval(function () {
                count++;
                document.getElementById("txtCount").value = count;
            }, 1000);
        }

        function stopCount() {
            if (timer) {
                clearInterval(timer);
                timer = null;
            }
        }

        // 页面加载完成后绑定禁止右键事件
        window.onload = function () {
            document.oncontextmenu = function () {
                return false;
            };
        };
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin: 20px;">
            <asp:Button ID="btnStart" runat="server" Text="开始计数" OnClientClick="startCount(); return false;" />
            <asp:TextBox ID="txtCount" runat="server" Value="0" Width="200px"></asp:TextBox>
            <asp:Button ID="btnStop" runat="server" Text="停止计数" OnClientClick="stopCount(); return false;" />
            <br />
            <label>本页面由信息231杨烨天2023452195130制作</label>
        </div>
    </form>
</body>
</html>