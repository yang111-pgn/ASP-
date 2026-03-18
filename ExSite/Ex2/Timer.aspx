<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Timer.aspx.cs" Inherits="Ex2_Timer" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="../Scripts/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        //function refresh() {
        //    $("#date").text((new Date()).toString());
        //    setTimeout("refresh()", 1000);
        //}
        function refresh() {
            var now = new Date();
            var timestr = now.toTimeString().split(' ')[0];
            $("#date").text(timestr);
            setTimeout("refresh()", 1000);
        }
    </script>
</head>
<body onload="refresh()">
    <form id="form1" runat="server">
        <div>
            <div id="date"></div>
        </div>
    </form>
    <label>本页面由信息231杨烨天2023452195130制作</label>
</body>
</html>