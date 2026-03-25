<%@ Page Language="C#" AutoEventWireup="true" CodeFile="zjxu.aspx.cs" Inherits="Ex2_zjxu" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>嘉兴大学官网 - Bootstrap导航栏</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        ul, li {
            list-style: none !important;
        }
        body {
            font-family: "Microsoft YaHei", sans-serif;
            margin: 0;
            padding: 0;
        }
        /* 顶部红色栏 */
        .top-bar {
            background-color: #820000;
            height: 38px;
            line-height: 38px;
        }
        .top-bar a {
            color: rgba(255,255,255,0.9);
            font-size: 13px;
            margin: 0 8px;
        }
        .top-bar a:hover {
            color: #fdb933;
            text-decoration: none;
        }
        /* 导航栏容器 */
        .nav-wrapper {
            position: relative;
            background: #fff;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            height: 65px;
        }
        /* 居中Logo */
        .logo-center {
            position: absolute;
            left: 50%;
            top: 0;
            transform: translateX(-50%);
            background: #820000;
            padding: 10px 20px 15px;
            z-index: 1100;
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
            border-bottom-left-radius: 4px;
            border-bottom-right-radius: 4px;
        }
        .logo-center img {
            height: 55px;
            display: block;
        }
        /* PC端菜单 */
        .pc-menu-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1240px;
            margin: 0 auto;
            height: 100%;
        }
        .nav-side {
            display: flex;
            width: 44%;
            height: 100%;
        }
        .side-left {
            justify-content: flex-end;
            padding-right: 60px;
        }
        .side-right {
            justify-content: flex-start;
            padding-left: 60px;
        }
        .menu-item {
            position: relative;
            width: 100px;
            text-align: center;
        }
        .menu-link {
            display: block;
            line-height: 65px;
            color: #000 !important;
            font-size: 16px;
            font-weight: 600;
            white-space: nowrap;
            text-decoration: none !important;
        }
        .menu-item:hover .menu-link {
            background: #fdb933;
            color: #fff !important;
        }
        /* 下拉菜单 (红底半透明) */
        .jx-dropdown {
            position: absolute;
            top: 65px;
            left: 0;
            width: 100%;
            background: rgba(130, 0, 0, 0.95);
            display: none;
            z-index: 1000;
        }
        .menu-item:hover .jx-dropdown {
            display: block;
        }
        .jx-dropdown li a {
            display: block;
            padding: 12px 0;
            color: #fff;
            font-size: 14px;
            border-bottom: 1px solid rgba(255,255,255,0.1);
            text-decoration: none !important;
        }
        .jx-dropdown li a:hover {
            color: #fdb933;
            background: rgba(0,0,0,0.1);
        }
        /* 移动端隐藏PC菜单 */
        @media (max-width: 991.98px) {
            .top-bar, .pc-menu-container, .logo-center {
                display: none;
            }
            .mobile-header {
                background: #820000;
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 10px 15px;
                color: #fff;
            }
            .mobile-logo img {
                height: 40px;
            }
            .hamburger-btn {
                font-size: 28px;
                cursor: pointer;
                padding: 0 10px;
                border: 1px solid rgba(255,255,255,0.3);
                border-radius: 4px;
            }
            .navbar-collapse {
                background: #fff;
                border-top: 1px solid #eee;
            }
            .mobile-nav-item {
                border-bottom: 1px solid #eee;
            }
            .mobile-nav-link {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 15px 20px;
                color: #333;
                font-size: 16px;
                text-decoration: none !important;
            }
            .mobile-nav-link span {
                color: #ccc;
                font-family: "宋体";
            }
        }
        /* Banner */
        .hero {
            height: 450px;
            background: linear-gradient(rgba(140,0,0,0.75), rgba(140,0,0,0.75)), url('https://www.zjxu.edu.cn/images/bg_main.jpg') center/cover;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fff;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!-- 顶部红色栏 -->
            <div class="top-bar d-none d-lg-block">
                <div class="container d-flex justify-content-between">
                    <div>
                        <a href="#">学生</a><a href="#">教职工</a><a href="#">校友</a><a href="#">访客</a><a href="#">小嘉同学</a>
                    </div>
                    <div>
                        <a href="#">书记信箱</a><a href="#">校长信箱</a><a href="#">信息公开</a><a href="#">网站地图</a><a href="#">English Version</a>
                    </div>
                </div>
            </div>

            <!-- 移动端头部 -->
            <div class="mobile-header d-lg-none">
                <a href="#" class="mobile-logo"><img src="https://www.zjxu.edu.cn/images/logo.png" alt="Logo"></a>
                <div class="hamburger-btn" data-toggle="collapse" data-target="#mainMenu">☰</div>
            </div>

            <!-- 导航栏主体 -->
            <nav class="nav-wrapper">
                <div class="container-fluid position-relative p-0">
                    <!-- 居中Logo (仅PC端) -->
                    <div class="logo-center d-none d-lg-block">
                        <img src="https://www.zjxu.edu.cn/images/logo.png" alt="嘉兴大学">
                    </div>

                    <!-- PC端菜单 -->
                    <div class="pc-menu-container d-none d-lg-flex">
                        <ul class="nav-side side-left">
                            <li class="menu-item"><a href="#" class="menu-link">网站首页</a></li>
                            <li class="menu-item">
                                <a href="#" class="menu-link">校情总览</a>
                                <ul class="jx-dropdown">
                                    <li><a href="#">学校概况</a></li>
                                    <li><a href="#">现任领导</a></li>
                                    <li><a href="#">校园风貌</a></li>
                                    <li><a href="#">历史沿革</a></li>
                                    <li><a href="#">学校章程</a></li>
                                </ul>
                            </li>
                            <li class="menu-item">
                                <a href="#" class="menu-link">学校机构</a>
                                <ul class="jx-dropdown">
                                    <li><a href="#">党政机构</a></li>
                                    <li><a href="#">教学单位</a></li>
                                    <li><a href="#">科研机构</a></li>
                                    <li><a href="#">直属单位</a></li>
                                </ul>
                            </li>
                            <li class="menu-item">
                                <a href="#" class="menu-link">师资队伍</a>
                                <ul class="jx-dropdown">
                                    <li><a href="#">师资概况</a></li>
                                    <li><a href="#">高层次人才</a></li>
                                    <li><a href="#">师资招聘</a></li>
                                </ul>
                            </li>
                        </ul>
                        <ul class="nav-side side-right">
                            <li class="menu-item">
                                <a href="#" class="menu-link">人才培养</a>
                                <ul class="jx-dropdown">
                                    <li><a href="#">本科生教育</a></li>
                                    <li><a href="#">研究生教育</a></li>
                                    <li><a href="#">继续教育</a></li>
                                    <li><a href="#">国际教育</a></li>
                                </ul>
                            </li>
                            <li class="menu-item">
                                <a href="#" class="menu-link">科学研究</a>
                                <ul class="jx-dropdown">
                                    <li><a href="#">科研机构</a></li>
                                    <li><a href="#">科研成果</a></li>
                                    <li><a href="#">学术交流</a></li>
                                </ul>
                            </li>
                            <li class="menu-item">
                                <a href="#" class="menu-link">合作交流</a>
                                <ul class="jx-dropdown">
                                    <li><a href="#">国际交流</a></li>
                                    <li><a href="#">校企合作</a></li>
                                    <li><a href="#">地方服务</a></li>
                                </ul>
                            </li>
                            <li class="menu-item">
                                <a href="#" class="menu-link">招生就业</a>
                                <ul class="jx-dropdown">
                                    <li><a href="#">本科招生</a></li>
                                    <li><a href="#">研究生招生</a></li>
                                    <li><a href="#">就业信息</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>

                    <!-- 移动端菜单 -->
                    <div class="collapse navbar-collapse d-lg-none" id="mainMenu">
                        <ul class="mobile-nav-list">
                            <li class="mobile-nav-item"><a href="#" class="mobile-nav-link">网站首页</a></li>
                            <li class="mobile-nav-item"><a href="#" class="mobile-nav-link">校情总览 <span>&gt;</span></a></li>
                            <li class="mobile-nav-item"><a href="#" class="mobile-nav-link">学校机构 <span>&gt;</span></a></li>
                            <li class="mobile-nav-item"><a href="#" class="mobile-nav-link">师资队伍 <span>&gt;</span></a></li>
                            <li class="mobile-nav-item"><a href="#" class="mobile-nav-link">人才培养 <span>&gt;</span></a></li>
                            <li class="mobile-nav-item"><a href="#" class="mobile-nav-link">科学研究 <span>&gt;</span></a></li>
                            <li class="mobile-nav-item"><a href="#" class="mobile-nav-link">合作交流 <span>&gt;</span></a></li>
                            <li class="mobile-nav-item"><a href="#" class="mobile-nav-link">招生就业 <span>&gt;</span></a></li>
                            <li class="mobile-nav-item"><a href="#" class="mobile-nav-link" style="background:#f4f4f4;">English Version</a></li>
                        </ul>
                    </div>
                </div>
            </nav>

            <!-- Banner -->
            <div class="hero">
                <div class="container">
                    <h1 style="font-size: clamp(24px, 5vw, 48px); font-weight: bold;">深入学习贯彻党的二十届四中全会精神</h1>
                    <p class="mt-4" style="font-size: clamp(16px, 3vw, 24px);">加快建设有特色、善创新的综合性高水平大学</p>
                </div>
            </div>

            <!-- 制作信息 -->
            <div class="text-center my-4 text-muted">
                本页面由信息231杨烨天2023452195130制作
            </div>
        </div>
    </form>

    <!-- JS -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>