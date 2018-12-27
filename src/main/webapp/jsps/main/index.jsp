<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    pageContext.setAttribute("App_Path", request.getContextPath());
%>
<html>
<head>
    <title>主页</title>
    <script type="text/javascript" src="${App_Path}/static/js/jquery-3.3.1.min.js"></script>
    <link href="${App_Path}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <script src="${App_Path}/static/bootstrap/js/bootstrap.js"></script>
    <link rel="stylesheet" type="text/css" href="${App_Path}/static/css/common.css?v7.2" />
    <link rel="stylesheet" type="text/css" href="${App_Path}/static/css/public.css?v1" />
    <script type="text/javascript" src="${App_Path}/static/js/jq.js?v4.1"></script>
    <script type="text/javascript" src="${App_Path}/static/js/ss.js?v4.8"></script>
    <style type="text/css">
        .p1{
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            getAllArticle(1);

            function getAllArticle(pn) {
                $.ajax({
                    url: "${App_Path}/article/getAllArticle",
                    data: "pn=" + pn
                    , type: "GET"
                    , success: function (result) {
                        console.log(result);
                        //1.解析并显示文章数据
                        build_article_info(result)
                    }
                });
            }

            //构建文章信息
            function build_article_info(result) {
                $("#article_div").empty();
                var articleList = result.extend.pageInfo.list;
                $.each(articleList, function (i, item) {
                    var articleTitle = item.articleTitle;
                    var articleContent = item.articleContent;

                    if(articleTitle.length > 20) {
                        articleTitle = articleTitle.substring(0,20)+"...";
                    }
                    if(articleContent.length > 100) {
                        articleContent = articleContent.substring(0,100)+"...";
                    }

                    var img = $("<img/>").addClass("pb-fl").attr("src","${App_Path}/"+item.userPhoto).attr("height","100px").attr("width","100px");

                    var a = $("<a></a>").attr("href","${App_Path}/article/getOneArticle?articleId="+item.articleId).addClass("pb-fl rt").append(articleTitle);
                    var dt = $("<dt></dt>").append(a);
                    var dd1 = $("<dd></dd>").addClass("author").append("作者："+item.username);
                    var dd2 = $("<dd></dd>").addClass("cnt").append(articleContent);
                    var span = $("<span></span>").addClass("auplayer")
                    var dd3 = $("<dd></dd>").addClass("ap").append($("<br>")).append("<hr>");

                    var dl = $("<dl></dl>").addClass("pb-fl").append(dt).append(dd1).append(dd2).append(dd3);
                    var li = $("<li></li>").append(img).append(dl);
                    var ul = $("<ul></ul>").append(li);
                    ul.appendTo($("#article_div"));

                });
            }
        });
    </script>
    <script type="text/javascript">
        function getBrowser()
        {
            var OsObject = "";
            if (navigator.userAgent.indexOf("MSIE") > 0) {
                var browser = navigator.appName;
                var b_version = navigator.appVersion;
                var version = b_version.split(";");
                var trim_Version = version[1].replace(/[ ]/g, "");
                if (browser == "Microsoft Internet Explorer" && trim_Version == "MSIE6.0")
                {
                    return("IE6");
                }
                else if (browser == "Microsoft Internet Explorer" && trim_Version == "MSIE7.0")
                {
                    return("IE7");
                }
                else if (browser == "Microsoft Internet Explorer" && trim_Version == "MSIE8.0")
                {
                    return("IE8");
                }
                else if (browser == "Microsoft Internet Explorer" && trim_Version == "MSIE9.0")
                {
                    return("IE9");
                }
                else if (browser == "Microsoft Internet Explorer" && trim_Version == "MSIE10.0")
                {
                    return("IE10");
                }
            }
            if (navigator.userAgent.indexOf("Firefox") > 0) {
                return "Firefox";
            }
            if (navigator.userAgent.indexOf("Chrome") > 0) {
                return "Chrome";
            }
            if (navigator.userAgent.indexOf("Opera") > 0) {
                return "Opera";
            }
            if (navigator.userAgent.indexOf("Safari") > 0) {
                return "Safari";
            }
            return 'Others';
        }
        (function() {
            vars = {};
            vars.browser = getBrowser();
            vars.hello_ketty = "heimao";
            vars.jsUrl = "http://www.sharesmile.cn/js/";
            vars.homeUrl = 'http://www.sharesmile.cn/';
            vars.siteName = '享笑网 - www.ShareSmile.cn - 享你所想,享你所笑';
            vars.publicUrl = "/public/";
            vars.showgirlUrl = "/user#showgirl";
            vars.userid = '10460';
            vars.username = '416148489@qq.com';
            vars.nickname = '阿斗';
            vars.gender = 0;
            vars.PHPSESSID = "krach1sltrpu5pa9ldu9jen4k2";
            vars.ajaxSubmiting = false;
            vars.sysImageUrl = '/public/system/';
            vars.qingImageUrl = '/public/qing/';
            vars.headImageUrl = '/public/userhead/';
            vars.postImageUrl = '/public/post/';
            vars.essayImageUrl = '/public/essay/';
            vars.jokesImageUrl = '/public/jokes/';
            vars.showgirlImageUrl = '/public/showgirl/';
            vars.photoImageUrl = '/public/photo/';
            vars.commStatUrl = '/Stat/stat';
            vars.cookieUMessage = 'HASMESSAGE' + vars.userid;
            vars.voteBlankColor = new Array('#5DBBEF', '#95E62A', '#CC1CD9', '#FFCD10', '#F79395');
            var d = new Date();
            vars.todayTimeString = 20160122;
        })();
    </script>
</head>
<body>
<%--<c:forEach items="${articles}" var="article">
    <li class="pb-mt20">
        <a href="news_detail.html?-10-72"><img src="${App_Path}/static/img/essay_10001_8dd1e515f2.jpg" class="pb-fl" alt="本期征文比赛文章,一种不成熟的爱" /></a>
        <a href="news_detail.html?-10-72" class="pb-fl rt">${article.articleTitle}</a>
        <p class="pb-iblock">${article.articleContent}</p>
    </li>
</c:forEach>--%>
<div class="pb-container">
    <div class="pb-container-main pb-after-clear">
        <!-- 公共头部 -->
        <div class="pb-main pb-navwrap pb-after-clear">
            <div class="pb-iblock pb-fl pb-logo">
                <a href="${App_Path}/jsps/main/index.jsp"><img src="${App_Path}/static/img/jj_logo.jpg" alt="JJ_Blog_Logo" /></a>
            </div>
            <div class="pb-iblock pb-fl pb-nav">
                <ul>
                    <li><a href="${App_Path}/jsps/main/index.jsp">首页</a></li>
                    <li><a href="${App_Path}/jsps/articles/add_Article.jsp" target="_blank">写博客</a></li>
                    <li><a href="${App_Path}/jsps/articles/look_Article.jsp">浏览文章</a></li>
                    <li><a href="pic.html">论坛</a></li>
                    <li><a href="${App_Path}/jsps/jjlin/all_discography.jsp">林俊杰专区</a></li>
                    <li><a href="${App_Path}/jsps/jjlin/bio.jsp">关于林俊杰</a></li>
                </ul>
            </div>
            <div class="pb-iblock pb-fr pb-oths">
                <a class="nmt" href="javascript:void(0);" onclick="Sys.commStat(2);
              commonLib.SetHome(this);">设为首页</a>
                <a class="nmt" href="index.html" rel="sidebar" onclick="Sys.commStat(1);
              commonLib.addFavorite();">收藏</a>
                <a class="nmt" href="suggest.html">投诉建议</a> &nbsp;
                <span class="nmt"> | </span>
                <div class="pb-ucenter pb-after-clear">
                    <div id="uMessageCenter">
                        <i class="pb-icons triangle"></i>
                        <a href="/user" id="uSetEntry-head"><img src="${App_Path}/static/img/default.gif" alt="阿斗" /></a>
                        <i class="pb-icons notice pb-hide"></i>
                    </div>
                    <br />
                    <ul>
                        <li><a href="/user" id="uSetEntry"><i class="pb-icons my"></i> 个人中心</a></li>
                        <li><a href="/site/logout"><i class="pb-icons logout"></i> 退出登录</a></li>
                    </ul>
                </div>
                <br />
                <form action="" onsubmit="W.tips('暂未开放搜索功能，敬请期待!');
              Sys.commStat(6);
              return false;">
                    <input class="pb-search-btn" type="submit" value="" />
                    <input class="pb-search" type="text" />
                </form>
            </div>
        </div>
        <!-- 公共头部 -->
        <!-- 当前页面内容 -->
        <link rel="stylesheet" type="text/css" href="${App_Path}/static/css/jquery.slideBox.css" />
        <link rel="stylesheet" type="text/css" href="${App_Path}/static/css/index.css?v2" />
        <div class="pb-main pb-mt10">
            <div id="bSlideBox" class="pb-main slideBox">
                <ul class="items">
                    <li><a target="_blank" onclick="Sys.commStat(46);" href="${App_Path}/static/img/jjlin1.jpg"><img src="${App_Path}/static/img/jjlin1.jpg" alt="黑夜问白天" /></a></li>
                    <li><a target="_blank" onclick="Sys.commStat(47);" href="${App_Path}/static/img/jjlin2.jpg"><img src="${App_Path}/static/img/jjlin2.jpg" alt="伟大的渺小" /></a></li>
                    <li><a target="_blank" onclick="Sys.commStat(48);" href="${App_Path}/static/img/jjlin3.jpg"><img src="${App_Path}/static/img/jjlin3.jpg" alt="伟大的渺小" /></a></li>
                </ul>
            </div>
        </div>
        <script>
            $(document).ready(function() {
                $('#bSlideBox').slideBox({
                    duration: 0.7,
                    //direction : 'top',
                    easing: 'linear',
                    delay: 3,
                    hideClickBar: true,
                    clickBarRadius: 10
                });

            });
        </script>
        <div style="clear:both;"></div>
        <div class="pb-main pb-mt20">
            <h3 class="idx-t1"> <a href="${App_Path}/jsps/articles/add_Article.jsp" class="pb-clr1">分享你的故事</a> </h3>
            <div class="idx-line1">
            </div>
            <div class="idx-jxed pb-mt20 pb-after-clear">
            <div class="idx-ycwz-1 pb-mt20 pb-after-clear">
                <h6 style=""><a href="${App_Path}/jsps/articles/look_Article.jsp" class="pb-clr1 pb-size-big">最新文章 | <span>她静悄悄的来过......</span></a></h6>
                <br>
                <div class="pb-iblock pb-fl d1">
                    <div class="pb-fl d1" id = "article_div">
                        <ul>
                            <li>
                                <img class="pb-fl" style="height: 100px;width: 100px" src="${App_Path}/static/img/qjjn.jpg" alt="把耳朵叫醒,爱他们的时候我们像条狗,扣子" />
                            </li>
                        </ul>
                    </div>
                    <center><a href="${App_Path}/jsps/articles/look_Article.jsp" class="btn btn-default btn-lg" id="more_article_btn">更多文章</a></center>
                </div>
                <!--右侧我要投稿公共部分-->
                <div class="pb-iblock pb-fr pb-after-clear pb-main-side">
                    <h6 class="pb-mt15 pb-clr1 pb-size-big">下期专题</h6>
                    <div class="pb-line2 pb-mt5">
                    </div>
                    <a class="tle pb-mt5" href="news_detail.html?/add">林俊杰15年的音乐之路</a>
                    <div class="pb-line2 pb-mt5">
                    </div>
                    <h6 class="pb-mt15"> <span class="pb-clr1 pb-size-normal">已投稿 <i class="tougao">2</i></span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="javascript:Sys.showRuleDiv();" class="pb-clr1 pb-size-small pb-underline">获奖规则</a> </h6>
                    <a class="but pb-clr1 pb-size-normal pb-mt15" href="news_detail.html?/add">有奖征文</a>
                </div>
                <!--右侧我要投稿公共部分-->
            </div>
            <%--<div class="idx-ycwz-1 pb-mt50 pb-after-clear">
                <div class="idx-last-board pb-fl">
                    <a href="news_detail.html?-9"><img src="${App_Path}/static/img/essay_10001_2c1098e1a2.jpg" class="pb-block" alt="上期征文比赛,上期有奖征文, 开学与青春或梦想" /></a>
                    <span class="pb-size-normal pb-block pb-mt15">上期专题</span>
                    <a class="pb-size-normal pb-mt5 pb-block" href="news_detail.html?-9">开学与青春或梦想</a>
                </div>
                <div class="pb-iblock pb-fl d1">
                    <h6><a href="news_detail.html?-9" class="pb-clr1 pb-size-big">作品排行榜 | <span>完整榜单</span></a></h6>
                    <div class="pb-line2 pb-mt5">
                    </div>
                    <ul class="pb-mt15 rank">
                        <li class="pb-iblock pb-mt8"> <span class="pb-fl pb-mt10 no">1</span> <a href="/user-10348">
                            <dl class="pb-fl">
                                <dt>
                                    <img src="${App_Path}/static/img/head_10348_57fbdd4d36.jpg" class="pb-block" alt="参加征文比赛作者,小红楼" />
                                </dt>
                                <dd>
                                    小红楼
                                </dd>
                            </dl> </a> <a href="news_detail.html?-9-58" class="pb-fl pb-block pb-size-normal title">开学，路过了我整个青春</a> <span class="pb-fr dollar">$30</span> </li>
                        <li class="pb-iblock pb-mt8"> <span class="pb-fl pb-mt10 no">2</span> <a href="/user-10393">
                            <dl class="pb-fl">
                                <dt>
                                    <img src="${App_Path}/static/img/default.gif" class="pb-block" alt="参加征文比赛作者,橙子" />
                                </dt>
                                <dd>
                                    橙子
                                </dd>
                            </dl> </a> <a href="news_detail.html?-9-62" class="pb-fl pb-block pb-size-normal title">那一年的散伙饭 是我们无</a> <span class="pb-fr dollar">$20</span> </li>
                        <li class="pb-iblock pb-mt8"> <span class="pb-fl pb-mt10 no">3</span> <a href="/user-10394">
                            <dl class="pb-fl">
                                <dt>
                                    <img src="${App_Path}/static/img/head_10394_2448d2c4b3.jpg" class="pb-block" alt="参加征文比赛作者,马琳娜55" />
                                </dt>
                                <dd>
                                    马琳娜55
                                </dd>
                            </dl> </a> <a href="news_detail.html?-9-63" class="pb-fl pb-block pb-size-normal title">寻常过往，转瞬成殇</a> <span class="pb-fr dollar">$10</span> </li>
                    </ul>
                </div>
                <div class="pb-main-side pb-iblock pb-after-clear pb-fr">
                    <h6 class="pb-clr1 pb-size-big">征文排行</h6>
                    <div class="pb-line2 pb-mt5">
                    </div>
                    <ul class="pb-mt10 previous-term pb-size-normal">
                        <li> <span>.</span> <a href="news_detail.html?-8-55">有一种毕业，叫先走一步</a>
                            <div class="pb-line2">
                            </div> </li>
                        <li> <span>.</span> <a href="news_detail.html?-4-27">用今生的修行 为你们的来生祈福</a>
                            <div class="pb-line2">
                            </div> </li>
                        <li> <span>.</span> <a href="news_detail.html?-3-16">我的初恋</a>
                            <div class="pb-line2">
                            </div> </li>
                        <li> <span>.</span> <a href="news_detail.html?-6-45">当你老了</a>
                            <div class="pb-line2">
                            </div> </li>
                        <li> <span>.</span> <a href="news_detail.html?-7-50">我就在这里旅行，给你讲沿途的风景</a>
                            <div class="pb-line2">
                            </div> </li>
                        <li> <span>.</span> <a href="news_detail.html?-6-43">有多少爱可以重来</a>
                            <div class="pb-line2">
                            </div> </li>
                        <li> <span>.</span> <a href="news_detail.html?-4-28">我的“天空之城”</a>
                            <div class="pb-line2">
                            </div> </li>
                    </ul>
                </div>
            </div>--%>
           <%-- <h3 class="idx-t2 pb-mt50 pb-clr1">往期征文</h3>
            <div class="pb-line2 pb-mt5">
            </div>
            <div class="idx-wqzt pb-mt15 pb-after-clear">
                <ul class="idx-wqzt pb-mt10">
                    <li>
                        <dl>
                            <dt>
                                <a href="news_detail.html?-8"><img alt="毕业季 校园时代 七月校园 离别气息" src="${App_Path}/static/img/essay_10001_b959107f8b.jpg" /></a>
                            </dt>
                            <dd>
                                <a href="news_detail.html?-8">游走在毕业的季节</a>
                            </dd>
                        </dl> </li>
                    <li>
                        <dl>
                            <dt>
                                <a href="news_detail.html?-7"><img alt="去旅行，装满爱，夏天旅行，夏天旅游" src="${App_Path}/static/img/essay_10001_ed83e14b8a.png" /></a>
                            </dt>
                            <dd>
                                <a href="news_detail.html?-7">装满爱，去旅行</a>
                            </dd>
                        </dl> </li>
                    <li>
                        <dl>
                            <dt>
                                <a href="news_detail.html?-6"><img alt="有奖征文，征文比赛，享笑网有奖征文比赛，第六期有奖征文，有奖征文之飘着淡淡粽香的父亲节，征文专题之飘着淡淡粽香的父亲节，端午节和父亲节感想，端午节感想，父亲节感想" src="${App_Path}/static/img/essay_10001_183a4e95ad.jpg" /></a>
                            </dt>
                            <dd>
                                <a href="news_detail.html?-6">飘着淡淡粽香的父亲节</a>
                            </dd>
                        </dl> </li>
                    <li>
                        <dl>
                            <dt>
                                <a href="news_detail.html?-5"><img alt="有奖征文，征文比赛，享笑网有奖征文比赛，第五期有奖征文，有奖征文之东方之星之痛，征文专题之东方之星之痛，东方之星沉船之痛，东方之星沉船" src="${App_Path}/static/img/essay_10001_8d58c19a60.jpg" /></a>
                            </dt>
                            <dd>
                                <a href="news_detail.html?-5">东方之星之痛</a>
                            </dd>
                        </dl> </li>
                    <li style="margin-right:0;">
                        <dl>
                            <dt>
                                <a href="news_detail.html?-4"><img alt="有奖征文，征文比赛，享笑网有奖征文比赛，第四期有奖征文，有奖征文之你和你的城，征文专题之你和你的城" src="${App_Path}/static/img/essay_10001_0ba5781188.jpg" /></a>
                            </dt>
                            <dd>
                                <a href="news_detail.html?-4">你和你的城</a>
                            </dd>
                        </dl> </li>
                </ul>
            </div>--%>
            <h3 class="idx-qtsj-t pb-mt50">
                <div class="inx-qtsj-line pb-fr"></div>
                <div class="inx-qtsj-line pb-fl"></div> <a href="pic.html"> <span class="chn">倾听林俊杰</span> <br /> <span class="eng">LISTEN TO THE WORLD</span> </a> </h3>
            <div class="idx-qtsj pb-mt20 pb-after-clear">
                <ul>
                    <li> <a href="pic_detail.html?1"> <img src="${App_Path}/static/img/cover019.jpg" class="pb-block" style="width:200px;" alt="和自己对话" /> </a>
                        <table class="pb-opac70">
                            <tbody>
                            <tr>
                                <td class="tle">和自己对话</td>
                            </tr>
                            </tbody>
                        </table> </li>
                    <li> <a href="pic_detail.html?3"> <img src="${App_Path}/static/img/cover023.jpg" class="pb-block" style="width:200px;" alt="伟大的渺小" /> </a>
                        <table class="pb-opac70">
                            <tbody>
                            <tr>
                                <td class="tle">伟大的渺小</td>
                            </tr>
                            </tbody>
                        </table> </li>
                    <li> <a href="pic_detail.html?4"> <img src="${App_Path}/static/img/cover007.jpg" class="pb-block" style="width:200px;" alt="JJ陆" /> </a>
                        <table class="pb-opac70">
                            <tbody>
                            <tr>
                                <td class="tle">JJ陆</td>
                            </tr>
                            </tbody>
                        </table> </li>
                    <li> <a href="pic_detail.html?6"> <img src="${App_Path}/static/img/cover006.jpg" class="pb-block" style="width:200px;" alt="第几个一百天" /> </a>
                        <table class="pb-opac70">
                            <tbody>
                            <tr>
                                <td class="tle">第几个一百天</td>
                            </tr>
                            </tbody>
                        </table>
                    </li>
                    <li style="margin-right:0;"> <a href="pic_detail.html?7"> <img src="${App_Path}/static/img/cover003.jpg" class="pb-block" style="width:200px;" alt="I AM" /> </a>
                        <table class="pb-opac70">
                            <tbody>
                            <tr>
                                <td class="tle">I AM</td>
                            </tr>
                            </tbody>
                        </table>
                    </li>
                    <li> <a href="pic_detail.html?10"> <img src="${App_Path}/static/img/cover001.jpg" class="pb-block" style="width:200px;" alt="因你而在" /> </a>
                        <table class="pb-opac70">
                            <tbody>
                            <tr>
                                <td class="tle">因你而在</td>
                            </tr>
                            </tbody>
                        </table>
                    </li>
                    <li> <a href="pic_detail.html?13"> <img src="${App_Path}/static/img/cover014.jpg" class="pb-block" style="width:200px;" alt="新地球" /> </a>
                        <table class="pb-opac70">
                            <tbody>
                            <tr>
                                <td class="tle">新地球</td>
                            </tr>
                            </tbody>
                        </table> </li>
                    <li> <a href="pic_detail.html?15"> <img src="${App_Path}/static/img/cover002.jpg" class="pb-block" style="width:200px;" alt="学不会" /> </a>
                        <table class="pb-opac70">
                            <tbody>
                            <tr>
                                <td class="tle">学不会</td>
                            </tr>
                            </tbody>
                        </table> </li>
                    <li> <a href="pic_detail.html?22"> <img src="${App_Path}/static/img/cover004.jpg" class="pb-block" style="width:200px;" alt="她说" /> </a>
                        <table class="pb-opac70">
                            <tbody>
                            <tr>
                                <td class="tle">她说</td>
                            </tr>
                            </tbody>
                        </table> </li>
                    <li style="margin-right:0;"> <a href="pic_detail.html?24"> <img src="${App_Path}/static/img/cover017.jpg" class="pb-block" style="width:200px;" alt="只要有你的地方" /> </a>
                        <table class="pb-opac70">
                            <tbody>
                            <tr>
                                <td class="tle">只要有你的地方</td>
                            </tr>
                            </tbody>
                        </table>
                    </li>
                    <button type="button" class="btn btn-default btn-lg btn-block">更多专辑</button>
                    <%--<li style="margin-right:0;"> <a href="pic_detail.html?24"> <img src="${App_Path}/static/img/cover018.jpg" class="pb-block" style="width:200px;" alt="全面开战" /> </a>
                        <table class="pb-opac70">
                            <tbody>
                            <tr>
                                <td class="tle">全面开战</td>
                            </tr>
                            </tbody>
                        </table>
                    </li>

                    <li style="margin-right:0;"> <a href="pic_detail.html?24"> <img src="${App_Path}/static/img/cover020.jpg" class="pb-block" style="width:200px;" alt="超越无限" /> </a>
                        <table class="pb-opac70">
                            <tbody>
                            <tr>
                                <td class="tle">超越无限</td>
                            </tr>
                            </tbody>
                        </table>
                    </li>

                    <li style="margin-right:0;"> <a href="pic_detail.html?24"> <img src="${App_Path}/static/img/cover021.jpg" class="pb-block" style="width:200px;" alt="2infinity and beyond" /> </a>
                        <table class="pb-opac70">
                            <tbody>
                            <tr>
                                <td class="tle">2infinity and beyond</td>
                            </tr>
                            </tbody>
                        </table>
                    </li>

                    <li style="margin-right:0;"> <a href="pic_detail.html?24"> <img src="${App_Path}/static/img/cover022.jpg" class="pb-block" style="width:200px;" alt="丹宁执着" /> </a>
                        <table class="pb-opac70">
                            <tbody>
                            <tr>
                                <td class="tle">丹宁执着</td>
                            </tr>
                            </tbody>
                        </table>
                    </li>

                    <li style="margin-right:0;"> <a href="pic_detail.html?24"> <img src="${App_Path}/static/img/cover016.jpg" class="pb-block" style="width:200px;" alt="I pray for you" /> </a>
                        <table class="pb-opac70">
                            <tbody>
                            <tr>
                                <td class="tle">I pray for youd</td>
                            </tr>
                            </tbody>
                        </table>
                    </li>

                    <li style="margin-right:0;"> <a href="pic_detail.html?24"> <img src="${App_Path}/static/img/cover015.jpg" class="pb-block" style="width:200px;" alt="你，有没有过" /> </a>
                        <table class="pb-opac70">
                            <tbody>
                            <tr>
                                <td class="tle">你，有没有过</td>
                            </tr>
                            </tbody>
                        </table>
                    </li>

                    <li style="margin-right:0;"> <a href="pic_detail.html?24"> <img src="${App_Path}/static/img/cover013.jpg" class="pb-block" style="width:200px;" alt="iTunes Session EP" /> </a>
                        <table class="pb-opac70">
                            <tbody>
                            <tr>
                                <td class="tle">iTunes Session EP</td>
                            </tr>
                            </tbody>
                        </table>
                    </li>
                    <li style="margin-right:0;"> <a href="pic_detail.html?24"> <img src="${App_Path}/static/img/cover012.jpg" class="pb-block" style="width:200px;" alt="乐行者" /> </a>
                        <table class="pb-opac70">
                            <tbody>
                            <tr>
                                <td class="tle">乐行者</td>
                            </tr>
                            </tbody>
                        </table>
                    </li>
                    <li style="margin-right:0;"> <a href="pic_detail.html?24"> <img src="${App_Path}/static/img/cover011.jpg" class="pb-block" style="width:200px;" alt="第二天堂" /> </a>
                        <table class="pb-opac70">
                            <tbody>
                            <tr>
                                <td class="tle">第二天堂</td>
                            </tr>
                            </tbody>
                        </table>
                    </li>

                    <li style="margin-right:0;"> <a href="pic_detail.html?24"> <img src="${App_Path}/static/img/cover010.jpg" class="pb-block" style="width:200px;" alt="编号89757" /> </a>
                        <table class="pb-opac70">
                            <tbody>
                            <tr>
                                <td class="tle">编号89757</td>
                            </tr>
                            </tbody>
                        </table>
                    </li>

                    <li style="margin-right:0;"> <a href="pic_detail.html?24"> <img src="${App_Path}/static/img/cover009.jpg" class="pb-block" style="width:200px;" alt="曹操" /> </a>
                        <table class="pb-opac70">
                            <tbody>
                            <tr>
                                <td class="tle">曹操</td>
                            </tr>
                            </tbody>
                        </table>
                    </li>

                    <li style="margin-right:0;"> <a href="pic_detail.html?24"> <img src="${App_Path}/static/img/cover008.jpg" class="pb-block" style="width:200px;" alt="西界" /> </a>
                        <table class="pb-opac70">
                            <tbody>
                            <tr>
                                <td class="tle">西界</td>
                            </tr>
                            </tbody>
                        </table>
                    </li>--%>
                </ul>
            </div>
            <%--<div style="clear:both;"></div>
            <h3 class="idx-t1 pb-mt50"> <a href="laugh.html" class="pb-clr1">每日一笑</a> </h3>
            <div class="idx-line1">
            </div>
            <div class="idx-mryx pb-mt20 pb-after-clear">
                <div class="d1 pb-fl">
                    <img src="${App_Path}/static/img/b_smile_left.jpg" class="pb-fl" alt="最新搞笑段子,每日一笑" />
                    <a href="laugh.html" class="tle pb-fl pb-clr1">搞笑段子&nbsp;&nbsp;|&nbsp;&nbsp; <span class="pb-clr2">更多</span></a>
                    <ul class="pb-mt15 pb-fl pb-size-normal">
                        <li> <span>.</span> <a href="/jokes-5-4758">家里的电要交电费</a> </li>
                        <li> <span>.</span> <a href="/jokes-5-4757">要把学校当成自己家</a> </li>
                        <li> <span>.</span> <a href="/jokes-5-4756">别耽误老娘我做生意</a> </li>
                        <li> <span>.</span> <a href="/jokes-5-4755">那是我妈</a> </li>
                        <li> <span>.</span> <a href="/jokes-5-4754">东邪西毒</a> </li>
                        <li> <span>.</span> <a href="/jokes-5-4753">马上过年了</a> </li>
                    </ul>
                </div>
                <div class="d1 pb-fl d1-2">
                    <img src="${App_Path}/static/img/b_smile_left1.jpg" class="pb-fl" alt="本周搞笑段子排行榜,笑话排,每日一笑" />
                    <a href="/jokes?priority=pop" class="tle pb-fl pb-clr1">笑话排行&nbsp;&nbsp;|&nbsp;&nbsp; <span class="pb-clr2">更多</span></a>
                    <ul class="pb-mt15 pb-fl pb-size-normal">
                        <li> <span>.</span> <a href="/jokes-5-4749">看朋友们晒从小到大的照片，</a> </li>
                        <li> <span>.</span> <a href="/jokes-5-4754">东邪西毒</a> </li>
                        <li> <span>.</span> <a href="/jokes-5-4750">昨天晚上</a> </li>
                        <li> <span>.</span> <a href="/jokes-5-4751">什么是尴尬</a> </li>
                        <li> <span>.</span> <a href="/jokes-5-4752">前几天我在火车站等车</a> </li>
                        <li> <span>.</span> <a href="/jokes-5-4753">马上过年了</a> </li>
                    </ul>
                </div>
                <div class="d2 pb-fr">
                    <img class="pb-block" src="${App_Path}/static/img/b_smile_right.jpg" alt="少儿不宜搞笑段子,超级内涵搞笑段子，校园搞笑段子,生活中的搞笑段子" />
                    <table class="pb-mt10">
                        <tbody>
                        <tr>
                            <td><a href="laugh.html">各种口味</a></td>
                            <td><a href="/jokes-2">少儿不宜</a></td>
                            <td><a href="/jokes-4">超级内涵</a></td>
                        </tr>
                        <tr>
                            <td><a href="/jokes-1">图片笑话</a></td>
                            <td><a href="/jokes-5">贴近生活</a></td>
                            <td><a href="/jokes-3">校园趣闻</a></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>--%>
           <%-- <div style="clear:both;"></div>
            <h3 class="idx-t1 pb-mt50"> <a href="http://www.lanrenzhijia.com/" class="pb-clr1">叫醒耳朵</a> </h3>
            <div class="idx-line1">
            </div>--%>
            <%--<div class="idx-jxed pb-mt20 pb-after-clear">
                <div class="pb-fl d1">
                    <ul>
                        <li> <img class="pb-fl" src="${App_Path}/static/img/b_jxed_l1.jpg" alt="把耳朵叫醒,爱他们的时候我们像条狗,扣子" />
                            <dl class="pb-fl">
                                <dt>
                                    <a href="pic_detail.html?show/241">爱他们的时候我们像条狗</a>
                                </dt>
                                <dd class="author">
                                    主播：扣子
                                </dd>
                                <dd class="cnt">
                                    所有的女朋友里，我最喜欢老夏。因为她和我像，高贵冷艳俗气，俗到骨子里。我们总是在夏天刚开始的那几天去富民路和巨鹿路路口的酒吧。那有一棵著名大 ...
                                </dd>
                                <dd class="ap">
                                    <span class="auplayer" id="auplayer_241" f="L3B1YmxpYy9wbGF5ZXIvMjAxNTA1L2F0ZHNod214dGcubXAz&gt;" a="扣子" t="爱他们的时候我们像条狗"></span>
                                </dd>
                            </dl> </li>
                        <li class="pb-mt40"> <img class="pb-fl" src="${App_Path}/static/img/b_jxed_l2.jpg" alt="把耳朵叫醒,爱你的第九年,这是你不必详知的事情,NJ楚璇" />
                            <dl class="pb-fl">
                                <dt>
                                    <a href="pic_detail.html?show/240">爱你的第九年,这是你不必详知的事情</a>
                                </dt>
                                <dd class="author">
                                    主播：NJ楚璇
                                </dd>
                                <dd class="cnt">
                                    爱你的第九年,这是你不必详知的事情人生是一场旅行，你路过我，我路过你，若有缘可结伴一生；无缘，只能各自修行，各自向前，然后在错过的时光年轮里 ...
                                </dd>
                                <dd class="ap">
                                    <span class="auplayer" id="auplayer_240" f="L3B1YmxpYy9wbGF5ZXIvMjAxNTA1L2FpbmlkZWRpaml1bmlhbi5tcDM=&gt;" a="NJ楚璇" t="爱你的第九年,这是你不必详知的事情"></span>
                                </dd>
                            </dl> </li>
                    </ul>
                </div>--%>
                <%--<div class="d2 pb-fr">
                    <dl>
                        <dt>
                            <a href="/weekly-1-2"> <img src="${App_Path}/static/img/post_10001_c1be1e419b.jpg" alt="征文比赛,有奖征文,第二期：回首这匆匆十年" /> </a>
                        </dt>
                        <dd class="term pb-size-big">
                            第二期
                        </dd>
                        <dd class="tle">
                            <a href="/weekly-1-2">第二期：回首这匆匆十年</a>
                        </dd>
                    </dl>
                </div>--%>
            </div>
            <script>
                $(document).ready(function() {
                    AudioPlayer.setup("${App_Path}/static/js/player.swf", {
                        width: 300,
                        initialvolume: 100
                    });
                    $(".auplayer").each(function() {
                        AudioPlayer.embed($(this).attr('id'), {
                            soundFile: $(this).attr('f'),
                            titles: $(this).attr('t'),
                            artists: $(this).attr('a'),
                            autostart: "no",
                            loop: "no"
                        });
                    });
                });
            </script>
        </div>
        <script type="text/javascript" src="${App_Path}/static/js/jquery.slideBox.js"></script>
        <script type="text/javascript" src="${App_Path}/static/js/ap.js"></script>
        <script>
            $(document).ready(function() {
                $(".idx-qtsj li").hover(function() {
                    $(this).find('table').stop().animate({'bottom': '-40px'}, 500);
                }, function() {
                    $(this).find('table').stop().animate({'bottom': '0px'}, 500);
                });
            });
        </script>
        <!-- 当前页面内容结束 -->
    </div>
    <!-- 公共尾部 -->
    <div style="clear:both;"></div>
    <div class="pb-footer">
        <div class="pb-footer-wp">
            <div class="pb-main pb-footer-cnt pb-size-small">
                <span class="pb-fl">&copy; 2012 - 2015 深圳市JJLIN有限公司版权所有 粤 icp 备 13011067 号</span>
                <ul class="pb-fr">
                    <li><a href="http://wpa.qq.com/msgrd?v=1&amp;uin=2338601847&amp;site=www.sharesmile.cn&amp;menu=yes">版权声明</a></li>
                    <li><a href="http://wpa.qq.com/msgrd?v=1&amp;uin=2338601847&amp;site=www.sharesmile.cn&amp;menu=yes">客服中心</a></li>
                    <li><a href="http://wpa.qq.com/msgrd?v=1&amp;uin=2338601847&amp;site=www.sharesmile.cn&amp;menu=yes">联系我们</a></li>
                </ul>
            </div>
        </div>
    </div>
    <!-- 公共尾部 -->
    <div class="ssretotop" id="goTopButton">
        <div class="SG-sidecont">
            <a style="visibility: visible;" href="javascript:;" id="gotonext"></a>
            <a id="retotop" class="pb-icons" href="javascript:void(0)" style="visibility: visible;" title="点击我 坐飞机到顶部"></a>
            <a href="javascript:;" id="gotopre"></a>
        </div>
    </div>
</div>
<script id="tpl-pb-rule" type="text/x-jsmart-tmpl">
            <img src="images/rule.gif" alt="获奖规则"/>
            <a href="javascript:top.window.location.href='/user#go=cash';" style="position: absolute; cursor:pointer;height: 24px; width: 72px; left: 730px; top: 494px; display:inline-block;background:#fff;opacity:0; filter:alpha(opacity=0);"></a>
        </script>
<script language="javascript" type="text/javascript" src="${App_Path}/static/js/15502332.js"></script>
<noscript>
    <a href="http://www.51.la/?15502332" target="_blank"><img alt="我要啦免费统计" src="${App_Path}/static/img/15502332.asp" style="border:none" /></a>
</noscript>
<script type="text/javascript" language="javascript">
    $(document).ready(function() {
        $(".pb-ucenter").bind('mouseenter', function() {
            $(this).find('ul').stop().slideDown('fast');
            Sys.clearFlicker('uMessageCenter');
        }).bind('mouseleave', function() {
            $(this).find('ul').stop().slideUp('fast');
        });

        $("#goTopButton").click(function() {
            Sys.scrollTo($('body'));
            Sys.commStat(33);
        });
        if (vars.browser != 'IE6') {
            var w_w = parseInt($("body").width());
            var obj = $("#goTopButton");
            $(window).scroll(function() {
                if ($(this).scrollTop() > 500) {
                    if (!isNaN(w_w) && w_w > 0) {
                        obj.css('left', (Math.ceil((w_w - 1050) / 2) + 1050 + 10) + "px");
                    }
                    obj.fadeIn();
                } else {
                    obj.fadeOut();
                }
            });
        }
        Sys.hide51();
    });
</script>
</body>
</html>
