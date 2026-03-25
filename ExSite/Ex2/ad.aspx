<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ad.aspx.cs" Inherits="Ex2_ad" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>广告点击消失</title>
    <style>
        #ad {
            width: 350px;
            height: 200px;
            background-color: #ffeeee;
            border: 2px solid #ff6666;
            text-align: center;
            line-height: 200px;
            font-size: 18px;
            cursor: pointer;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#ad").click(function () {
                $(this).hide();
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="ad">单击此区域关闭广告</div>
    </form>

    <label>本页面由信息231杨烨天2023452195130制作</label>
</body>
</html>