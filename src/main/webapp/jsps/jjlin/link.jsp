<%--
  Created by IntelliJ IDEA.
  User: XuKexiang
  Date: 2018/12/14
  Time: 0:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("App_Path", request.getContextPath());
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>链接</title>
    <script type="text/javascript" src="${App_Path}/static/js/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${App_Path}/static/css/common.css?v7.2"/>
    <link rel="stylesheet" type="text/css" href="${App_Path}/static/css/public.css?v1"/>
    <script type="text/javascript" src="${App_Path}/static/js/jq.js?v4.1"></script>
    <script type="text/javascript" src="${App_Path}/static/js/ss.js?v4.8"></script>
    <link href="${App_Path}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <script src="${App_Path}/static/bootstrap/js/bootstrap.js"></script>
    <!-- 配置文件 -->
    <script type="text/javascript" charset="utf-8" src="${App_Path}/ueditor/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" charset="utf-8" src="${App_Path}/ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="${App_Path}/ueditor/lang/zh-cn/zh-cn.js"></script>
    <link rel="stylesheet" href="${App_Path}/static/css2/bootstrap.min.css">
    <link rel="stylesheet" href="${App_Path}/static/css2/bootstrap-theme.min.css">
    <link rel="stylesheet" href="${App_Path}/static/css2/font-awesome.min.css">
    <link rel="stylesheet" href="${App_Path}/static/css2/jquery.bxslider.css">
    <link rel="stylesheet" href="${App_Path}/static/css2/simplePagination.css">
    <link rel="stylesheet" href="${App_Path}/static/css2/default.css">
    <link rel="stylesheet" href="${App_Path}/static/css2/alertify.css">
    <link rel="stylesheet" href="${App_Path}/static/css2/layout.css">
    <link rel="stylesheet" href="${App_Path}/static/css2/style.css">

</head>
<body>
<section class="menubox banner">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12 nopadding topbox">
                <div class="logobox">
                    <a href="https://www.jjlin.com/">
                        <img src="${App_Path}/static/img/logo.png">
                    </a>
                    <span>JJ Lin WEBSITE</span>
                </div>
                <div class="menurwd">
                    <button type="button">
                        <i class="fa fa-bars" aria-hidden="true"></i>
                    </button>
                </div>
                <div class="accountbox">
                    <ul class="navbar-rwd">
                        <li>        <a href="https://www.jjlin.com/news/news.html">NEWS 新聞</a>
                        </li><li>        <a href="https://www.jjlin.com/social/social.html">SOCIAL 社群</a>
                    </li><li>        <a href="${App_Path}/jsps/jjlin/all_discography.jsp">DISCOGRAPHY 專輯</a>
                    </li><li>        <a href="https://www.jjlin.com/video/video.html">VIDEO 影音</a>
                    </li><li>        <a href="https://www.jjlin.com/photos/photos.html">PHOTOS 相簿</a>
                    </li><li>        <a href="https://www.jjlin.com/vip/vip_diary.html">VIP 林距離</a>
                    </li><li>        <a href="https://www.jjlin.com/chatroom/chatroom.html">LIVE 與JJ對話</a>
                    </li><li>        <a href="https://www.jjlin.com/party/party.html">PARTY 活動</a>
                    </li><li>        <a href="https://www.jjlin.com/static/biography.html">BIO 關於JJ</a>
                    </li><li>        <a href="https://www.jjlin.com/calendar/calendar.html">CALENDAR 行事曆</a>
                    </li><li>        <a href="${App_Path}/jsps/jjlin/link.jsp">LINK 連結</a>
                    </li>    </ul>
                </div>
            </div>
            <div class="col-md-12 col-sm-12 col-xs-12 nopadding">
                <div class="navbar">
                    <ul>
                        <li>        <a href="${App_Path}/jsps/main/index.jsp">BACK TO BLOG</a>
                        </li><li>        <a href="https://www.jjlin.com/social/social.html">SOCIAL</a>
                    </li><li>        <a href="${App_Path}/jsps/jjlin/all_discography.jsp">专辑</a>
                    </li><li>        <a href="https://www.jjlin.com/video/video.html">VIDEO</a>
                    </li><li>        <a href="https://www.jjlin.com/photos/photos.html">PHOTOS</a>
                    </li><li>        <a href="https://www.jjlin.com/vip/vip_diary.html">VIP</a>
                    </li><li>        <a href="https://www.jjlin.com/chatroom/chatroom.html">LIVE</a>
                    </li><li>        <a href="https://www.jjlin.com/party/party.html">PARTY</a>
                    </li><li>        <a href="https://www.jjlin.com/calendar/calendar.html">CALENDAR</a>
                    </li><li>        <a href="${App_Path}/jsps/jjlin/bio.jsp">关于林俊杰</a>
                    </li><li>        <a href="${App_Path}/jsps/jjlin/link.jsp">链接</a>
                    </li>    </ul>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="content page-link">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12 nopadding titlebox text-center">
                <div class="linebox">
                    <div class="line"></div>
                </div>
                <div class="titletext">
                    <span>相关链接 Link</span>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12 nopadding contentbox">
                <div class="col-md-12 col-sm-12 col-xs-12 nopadding box" data-id="1">
                    <div class="col-md-5 col-sm-12 col-xs-12 nopaddingLeft left imgbox">
                        <img src="${App_Path}/static/img/pic.png">
                    </div>
                    <div class="col-md-7 col-sm-12 col-xs-12 right content">
                        <h4>JJLin</h4>
                        <ul>
                            <li>•　新浪微博 <a href="http://www.weibo.com/jjlin" target="_blank">www.weibo.com/jjlin</a></li>
                            <li>•　QQ微博 <a href="http://t.qq.com/jjlin" target="_blank">t.qq.com/jjlin</a></li>
                            <li>•　Facebook <a href="https://www.facebook.com/JJLin/?fref=ts" target="_blank">www.facebook.com/JJLin/?fref=ts</a></li>
                            <li>•　YouTube <a href="https://www.youtube.com/user/jjlin" target="_blank">www.youtube.com/user/jjlin</a></li>
                            <li>•　Youku優酷 <a href="http://i.youku.com/i/UMzY0NDg5ODQw" target="_blank">i.youku.com/jfjproductions</a></li>
                            <li>•　Twitter <a href="https://twitter.com/jj_lin" target="_blank">twitter.com/jj_lin</a></li>
                        </ul>
                        <h4>JFJ</h4>
                        <ul>
                            <li>•　JFJ PRODUCTIONS <a href="http://jfj-productions.com/" target="_blank">www.jfj-productions.com</a></li>
                            <li>•　新浪微博 <a href="http://www.weibo.com/u/2309864094" target="_blank">www.weibo.com/u/2309864094</a></li>
                            <li>•　Facebook <a href="https://www.facebook.com/jforj" target="_blank">www.facebook.com/jforj</a></li>
                            <li>•　Youku優酷 <a href="http://i.youku.com/jfjproductions" target="_blank">http://i.youku.com/jfjproductions</a></li>
                            <li>•　Twitter <a href="http://twitter.com/#!/JFJProductions" target="_blank">twitter.com/#!/JFJProductions</a></li>
                        </ul>
                        <h4>華納音樂</h4>
                        <ul>
                            <li>•　華納音樂 <a href="http://www.warnermusic.com.tw/" target="_blank">www.warnermusic.com.tw</a></li>
                            <li>•　Facebook <a href="http://www.facebook.com/WarnerMusicTaiwan" target="_blank">www.facebook.com/WarnerMusicTaiwan</a></li>
                        </ul>
                        <h4>SMG</h4>
                        <ul>
                            <li>•　SMG 官方網站 <a href="http://smglife.com/" target="_blank">smglife.com</a></li>
                            <li>•　SMUDGEstore 網路商店 <a href="http://www.smudgestore.com/" target="_blank">www.smudgestore.com</a></li>
                            <li>•　新浪微博 <a href="http://www.weibo.com/smglife" target="_blank">www.weibo.com/smglife</a></li>
                            <li>•　Facebook <a href="http://www.facebook.com/SMGLIFE" target="_blank">www.facebook.com/SMGLIFE</a></li>
                            <li>•　YouTube <a href="http://www.youtube.com/user/SMGTVOFFICIAL" target="_blank">www.youtube.com/user/SMGTVOFFICIAL</a></li>
                            <li>•　Vimeo <a href="http://www.vimeo.com/smgtv" target="_blank">www.vimeo.com/smgtv</a></li>
                            <li>•　Twitter <a href="http://twitter.com/#!/SMUDGESTORE" target="_blank">twitter.com/#!/SMUDGESTORE</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

</section>

</body>
</html>
