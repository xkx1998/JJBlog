<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("App_Path", request.getContextPath());
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JJ专辑</title>
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

    <script type="text/javascript">
        $(document).ready(function () {

            getAll();

            function getAll() {
                $.ajax({
                    url: "${App_Path}/discography/findAll",
                    dataType:"json"
                    , type: "GET"
                    , success: function (result) {
                        console.log(result);
                        //1.解析并显示专辑数据
                        build_discography_info(result);

                    }
                });
            }

            //构建文章信息
            function build_discography_info(result) {
                $("#discography_ul").empty();
                var discographyList = result.extend.list;
                $.each(discographyList, function (i, item) {
                    var img = $("<img/>").attr("src","${App_Path}/"+item.discographyPhoto).attr("height","250px").attr("width","250px");
                    var div1 = $("<div></div>").addClass("imgbox").append(img);
                    var span1 = $("<span></span>").append(item.discographyName);
                    var div2 = $("<div></div>").addClass("titlebox").append(span1);
                    var span2 = $("<span></span>").append(item.discographyDate);
                    var div3 = $("<div></div>").addClass("datebox").append(span2);

                    var a = $("<a></a>").attr("href", "https://www.jjlin.com/discography/discographydetail.html?id=20171125").attr("id",item.discographyId);
                    a.append(div1).append(div2).append(div3);
                    var li = $("<li></li>").addClass("col-md-3 col-sm-4 col-xs-6").attr("id",item.discographyId).append(a);
                    li.appendTo($("#discography_ul"));
                });
            }
        });
    </script>
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

<section class="content page-discography">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12 nopadding titlebox text-center">
                <div class="linebox">
                    <div class="line"></div>
                </div>
                <div class="titletext">
                    <span>專輯Discography</span>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12 nopadding discographybox">
                <ul class="col-md-12 col-sm-12 col-xs-12 nopadding discographylist" id="discography_ul">
                    <li class="col-md-3 col-sm-4 col-xs-6" data-id="20171125">
                        <a href="https://www.jjlin.com/discography/discographydetail.html?id=20171125">
                            <div class="imgbox">
                                <img src="${App_Path}/static/img/cover023.jpg" alt="" style="width: 250px;height: 250px">
                            </div>
                            <div class="titlebox">
                                <span>偉大的渺小</span>
                            </div>
                            <div class="datebox">
                                <span>2017-11</span>
                            </div>
                        </a>
                    </li>
                    <%--<li class="col-md-3 col-sm-4 col-xs-6" data-id="20170824">
                        <a href="https://www.jjlin.com/discography/discographydetail.html?id=20170824">
                            <div class="imgbox">
                                <img src="${App_Path}/static/img/cover022.jpg" alt="" style="width: 250px;height: 250px">
                            </div>
                            <div class="titlebox">
                                <span>Own the Day (feat. MOE)</span>
                            </div>
                            <div class="datebox">
                                <span>2017-08</span>
                            </div>
                        </a>
                    </li>
                    <li class="col-md-3 col-sm-4 col-xs-6" data-id="20160915">
                        <a href="https://www.jjlin.com/discography/discographydetail.html?id=20160915">
                            <div class="imgbox">
                                <img src="${App_Path}/static/img/cover021.jpg" alt="" style="width: 250px;height: 250px">
                            </div>
                            <div class="titlebox">
                                <span>2infinity And Beyond</span>
                            </div>
                            <div class="datebox">
                                <span>2016-09</span>
                            </div>
                        </a>
                    </li>
                    <li class="col-md-3 col-sm-4 col-xs-6" data-id="20160621">
                        <a href="https://www.jjlin.com/discography/discographydetail.html?id=20160621">
                            <div class="imgbox">
                                <img src="${App_Path}/static/img/cover020.jpg" alt="" style="width: 250px;height: 250px">
                            </div>
                            <div class="titlebox">
                                <span>超越無限(Infinity And Beyond)</span>
                            </div>
                            <div class="datebox">
                                <span>2016-06</span>
                            </div>
                        </a>
                    </li>
                    <li class="col-md-3 col-sm-4 col-xs-6" data-id="20151231">
                        <a href="https://www.jjlin.com/discography/discographydetail.html?id=20151231">
                            <div class="imgbox">
                                <img src="${App_Path}/static/img/cover019.jpg" alt="" style="width: 250px;height: 250px">
                            </div>
                            <div class="titlebox">
                                <span>實驗專輯《和自己對話 From M.E. To Myself》</span>
                            </div>
                            <div class="datebox">
                                <span>2015-12</span>
                            </div>
                        </a>
                    </li>
                    <li class="col-md-3 col-sm-4 col-xs-6" data-id="20151015">
                        <a href="https://www.jjlin.com/discography/discographydetail.html?id=20151015">
                            <div class="imgbox">
                                <img src="${App_Path}/static/img/cover018.jpg" alt="" style="width: 250px;height: 250px">
                            </div>
                            <div class="titlebox">
                                <span>全面開戰 (遊戲「部落衝突」電視廣告歌曲)</span>
                            </div>
                            <div class="datebox">
                                <span>2015-10</span>
                            </div>
                        </a>
                    </li>
                    <li class="col-md-3 col-sm-4 col-xs-6" data-id="20151022">
                        <a href="https://www.jjlin.com/discography/discographydetail.html?id=20151022">
                            <div class="imgbox">
                                <img src="${App_Path}/static/img/cover017.jpg" alt="" style="width: 250px;height: 250px">
                            </div>
                            <div class="titlebox">
                                <span>只要有你的地方(電影《消失的愛人》主題曲</span>
                            </div>
                            <div class="datebox">
                                <span>2015-10</span>
                            </div>
                        </a>
                    </li>
                    <li class="col-md-3 col-sm-4 col-xs-6" data-id="20150724">
                        <a href="https://www.jjlin.com/discography/discographydetail.html?id=20150724">
                            <div class="imgbox">
                                <img src="${App_Path}/static/img/cover016.jpg" alt="" style="width: 250px;height: 250px">
                            </div>
                            <div class="titlebox">
                                <span>我為你祈禱I Pray For You</span>
                            </div>
                            <div class="datebox">
                                <span>2015-07</span>
                            </div>
                        </a>
                    </li>
                    <li class="col-md-3 col-sm-4 col-xs-6" data-id="20150723">
                        <a href="https://www.jjlin.com/discography/discographydetail.html?id=20150723">
                            <div class="imgbox">
                                <img src="${App_Path}/static/img/cover015.jpg" alt="" style="width: 250px;height: 250px">
                            </div>
                            <div class="titlebox">
                                <span>你，有沒有過 Roll On</span>
                            </div>
                            <div class="datebox">
                                <span>2015-07</span>
                            </div>
                        </a>
                    </li>
                    <li class="col-md-3 col-sm-4 col-xs-6" data-id="20141201">
                        <a href="https://www.jjlin.com/discography/discographydetail.html?id=20141201">
                            <div class="imgbox">
                                <img src="${App_Path}/static/img/cover014.jpg" alt="" style="width: 250px;height: 250px">
                            </div>
                            <div class="titlebox">
                                <span>新地球GENESIS</span>
                            </div>
                            <div class="datebox">
                                <span>2014-12</span>
                            </div>
                        </a>
                    </li>
                    <li class="col-md-3 col-sm-4 col-xs-6" data-id="20140701">
                        <a href="https://www.jjlin.com/discography/discographydetail.html?id=20140701">
                            <div class="imgbox">
                                <img src="${App_Path}/static/img/cover013.jpg" alt="" style="width: 250px;height: 250px">
                            </div>
                            <div class="titlebox">
                                <span>iTunes Session - EP</span>
                            </div>
                            <div class="datebox">
                                <span>2014-07</span>
                            </div>
                        </a>
                    </li>
                    <li class="col-md-3 col-sm-4 col-xs-6" data-id="20130301">
                        <a href="https://www.jjlin.com/discography/discographydetail.html?id=20130301">
                            <div class="imgbox">
                                <img src="${App_Path}/static/img/cover001.jpg" alt="" style="width: 250px;height: 250px">
                            </div>
                            <div class="titlebox">
                                <span>因你而在 Stories Untold</span>
                            </div>
                            <div class="datebox">
                                <span>2013-03</span>
                            </div>
                        </a>
                    </li>
                    <li class="col-md-3 col-sm-4 col-xs-6" data-id="20111202">
                        <a href="https://www.jjlin.com/discography/discographydetail.html?id=20111202">
                            <div class="imgbox">
                                <img src="${App_Path}/static/img/cover002.jpg" alt="" style="width: 250px;height: 250px">
                            </div>
                            <div class="titlebox">
                                <span>學不會 Lost N Found</span>
                            </div>
                            <div class="datebox">
                                <span>2011-12</span>
                            </div>
                        </a>
                    </li>
                    <li class="col-md-3 col-sm-4 col-xs-6" data-id="20111103">
                        <a href="https://www.jjlin.com/discography/discographydetail.html?id=20111103">
                            <div class="imgbox">
                                <img src="${App_Path}/static/img/cover003.jpg" alt="" style="width: 250px;height: 250px">
                            </div>
                            <div class="titlebox">
                                <span>2011 JJ林俊傑 I AM 世界巡迴演唱會 小巨蛋</span>
                            </div>
                            <div class="datebox">
                                <span>2011-11</span>
                            </div>
                        </a>
                    </li>
                    <li class="col-md-3 col-sm-4 col-xs-6" data-id="20101204">
                        <a href="https://www.jjlin.com/discography/discographydetail.html?id=20101204">
                            <div class="imgbox">
                                <img src="${App_Path}/static/img/cover004.jpg" alt="" style="width: 250px;height: 250px">
                            </div>
                            <div class="titlebox">
                                <span>她說</span>
                            </div>
                            <div class="datebox">
                                <span>2010-12</span>
                            </div>
                        </a>
                    </li>
                    <li class="col-md-3 col-sm-4 col-xs-6" data-id="20091206">
                        <a href="https://www.jjlin.com/discography/discographydetail.html?id=20091206">
                            <div class="imgbox">
                                <img src="${App_Path}/static/img/cover006.jpg" alt="" style="width: 250px;height: 250px">
                            </div>
                            <div class="titlebox">
                                <span>100天</span>
                            </div>
                            <div class="datebox">
                                <span>2009-12</span>
                            </div>
                        </a>
                    </li>
                    <li class="col-md-3 col-sm-4 col-xs-6" data-id="20081007">
                        <a href="https://www.jjlin.com/discography/discographydetail.html?id=20081007">
                            <div class="imgbox">
                                <img src="${App_Path}/static/img/cover007.jpg" alt="" style="width: 250px;height: 250px">
                            </div>
                            <div class="titlebox">
                                <span>JJ陸</span>
                            </div>
                            <div class="datebox">
                                <span>2008-10</span>
                            </div>
                        </a>
                    </li>
                    <li class="col-md-3 col-sm-4 col-xs-6" data-id="20070608">
                        <a href="https://www.jjlin.com/discography/discographydetail.html?id=20070608">
                            <div class="imgbox">
                                <img src="${App_Path}/static/img/cover008.jpg" alt="" style="width: 250px;height: 250px">
                            </div>
                            <div class="titlebox">
                                <span>西界</span>
                            </div>
                            <div class="datebox">
                                <span>2007-06</span>
                            </div>
                        </a>
                    </li>
                    <li class="col-md-3 col-sm-4 col-xs-6" data-id="20060209">
                        <a href="https://www.jjlin.com/discography/discographydetail.html?id=20060209">
                            <div class="imgbox">
                                <img src="${App_Path}/static/img/cover009.jpg" alt="" style="width: 250px;height: 250px">
                            </div>
                            <div class="titlebox">
                                <span>曹操</span>
                            </div>
                            <div class="datebox">
                                <span>2006-02</span>
                            </div>
                        </a>
                    </li>
                    <li class="col-md-3 col-sm-4 col-xs-6" data-id="20050410">
                        <a href="https://www.jjlin.com/discography/discographydetail.html?id=20050410">
                            <div class="imgbox">
                                <img src="${App_Path}/static/img/cover010.jpg" alt="" style="width: 250px;height: 250px">
                            </div>
                            <div class="titlebox">
                                <span>編號89757</span>
                            </div>
                            <div class="datebox">
                                <span>2005-04</span>
                            </div>
                        </a>
                    </li>
                    <li class="col-md-3 col-sm-4 col-xs-6" data-id="20040611">
                        <a href="https://www.jjlin.com/discography/discographydetail.html?id=20040611">
                            <div class="imgbox">
                                <img src="${App_Path}/static/img/cover011.jpg" alt="" style="width: 250px;height: 250px">
                            </div>
                            <div class="titlebox">
                                <span>第二天堂</span>
                            </div>
                            <div class="datebox">
                                <span>2004-06</span>
                            </div>
                        </a>
                    </li>
                    <li class="col-md-3 col-sm-4 col-xs-6" data-id="20030412">
                        <a href="https://www.jjlin.com/discography/discographydetail.html?id=20030412">
                            <div class="imgbox">
                                <img src="${App_Path}/static/img/cover012.jpg" alt="" style="width: 250px;height: 250px">
                            </div>
                            <div class="titlebox">
                                <span>樂行者</span>
                            </div>
                            <div class="datebox">
                                <span>2003-04</span>
                            </div>
                        </a>
                    </li>--%>
                </ul>
            </div>
        </div>
    </div>

</section>
<footer>
    <p><span>Copyright © 傑聯邦國際有限公司, All Rights Reserved, 本站由「<a href="http://www.jfetek.com/" target="_blank" style="padding:0;">傑飛特科技</a>」負責製作、管理與維護<a href="http://www.jfetek.com/" target="_blank" style="padding:0;">powered by JFETEK</a></span><span><a href="javascript:void(0)">隱私權說明</a><span> | </span><a href="javascript:void(0)">聯絡我們</a></span></p>
</footer>
</body>
</html>
