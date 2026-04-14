<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Chat.aspx.cs" Inherits="Chat" EnableViewState="false" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
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
        <div id="divMsg" style="border:1px solid #ccc; width:500px; height:300px; overflow:auto;"></div>
        <br />
        <asp:Label ID="lblName" runat="server"></asp:Label>
        <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Width="400px"></asp:TextBox>
        <br />
        <asp:Button ID="btnSend" runat="server" Text="发送" OnClick="btnSend_Click" />
    </form>
</body>
</html>