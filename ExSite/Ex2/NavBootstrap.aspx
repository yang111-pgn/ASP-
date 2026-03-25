<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Bootstrap响应式导航栏</title>
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.6.0.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-md navbar-light fixed-top" style="background-color: #C0C0C0">
            <div class="container-fluid">
                <!-- 网站 Logo -->
                <a class="navbar-brand" href="#">MyPetShop</a>
                <!-- 移动端折叠按钮 -->
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-menu" aria-controls="navbar-menu" aria-expanded="true" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <!-- 导航链接 -->
                <div class="navbar-collapse collapse show" id="navbar-menu">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item"><a class="nav-link" href="#">首页</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">注册</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">登录</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">购物车</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">网站地图</a></li>
                    </ul>
                </div>
                <label>本页面由信息231杨烨天2023452195130制作</label>
            </div>
        </nav>
    </header>
</body>
</html>