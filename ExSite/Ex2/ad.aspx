<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ad.aspx.cs" Inherits="Ex2_ad" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>广告点击消失</title>
    <style>
        /* 广告样式 */
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
</head>
<body>
    <form id="form1" runat="server">
        <!-- 广告区域 -->
        <div id="ad" onclick="closeAd()">
            单击此区域关闭广告
        </div>
    </form>

    <script type="text/javascript">
        // 点击广告后隐藏
        function closeAd() {
            document.getElementById("ad").style.display = "none";
        }
    </script>
</body>
</html>