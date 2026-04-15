<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Chat.aspx.cs" Inherits="Chat" EnableViewState="false" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>聊天室</title>
    <script src="Scripts/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        function refresh() {
            $.ajax({
                url: "Ajax.aspx",
                cache: false,
                success: function (text) {
                    document.getElementById("divMsg").innerHTML = text;
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("网络连接有问题，请重试!");
                }
            });
            setTimeout("refresh()", 500);
        }
    </script>
</head>
<body onload="refresh()">
    <form id="form1" runat="server">
        <div style="width:800px; margin:auto;">
            <!-- 聊天消息显示区域 -->
            <div id="divMsg" style="border:1px solid #ccc; width:500px; height:300px; overflow:auto; float:left;"></div>
            <!-- 右侧信息面板 -->
            <div style="border:1px solid #ccc; width:250px; height:300px; overflow:auto; float:right; padding:5px;">
                <asp:Label ID="lblName" runat="server" Font-Bold="true"></asp:Label><br /><br />
                总访问人数：<asp:Label ID="lblTotalVisitors" runat="server"></asp:Label><br />
                当前在线人数：<asp:Label ID="lblOnlineCount" runat="server"></asp:Label><br />
                在线用户列表：<asp:Label ID="lblOnlineUsers" runat="server"></asp:Label>
            </div>
            <div style="clear:both;"></div>
            <br />
            <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Width="400px"></asp:TextBox>
            <br />
            <asp:Button ID="btnSend" runat="server" Text="发送" OnClick="btnSend_Click" />
        </div>
    </form>
</body>
</html>