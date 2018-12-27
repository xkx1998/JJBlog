<%--
  Created by IntelliJ IDEA.
  User: XuKexiang
  Date: 2018/12/7
  Time: 20:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    pageContext.setAttribute("App_Path", request.getContextPath());
%>
<html>
<head>
    <title>${article.articleTitle}</title>
    <script type="text/javascript" src="${App_Path}/static/js/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${App_Path}/static/css/common.css?v7.2" />
    <link rel="stylesheet" type="text/css" href="${App_Path}/static/css/public.css?v1" />
    <link href="${App_Path}/static/img/favicon.ico?v=0.1" mce_href="http://www.sharesmile.cn/favicon.ico" rel="icon" type="image/x-icon" />
    <link href="${App_Path}/static/img/favicon.ico?v=0.1" mce_href="http://www.sharesmile.cn/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link rel="stylesheet" href="${App_Path}/static/css/liuyan.css">
    <link href="${App_Path}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <script src="${App_Path}/static/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript" src="${App_Path}/static/js/jq.js?v4.1"></script>
    <script type="text/javascript" src="${App_Path}/static/js/ss.js?v4.8"></script>
    <script type="text/javascript">
        function getBrowser()
        {
            var OsObject = "";
            if(navigator.userAgent.indexOf("MSIE")>0) {
                var browser=navigator.appName;
                var b_version=navigator.appVersion;
                var version=b_version.split(";");
                var trim_Version=version[1].replace(/[ ]/g,"");
                if(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE6.0")
                {
                    return("IE6");
                }
                else if(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE7.0")
                {
                    return("IE7");
                }
                else if(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE8.0")
                {
                    return("IE8");
                }
                else if(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE9.0")
                {
                    return("IE9");
                }
                else if(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE10.0")
                {
                    return("IE10");
                }
            }
            if( navigator.userAgent.indexOf("Firefox")>0){
                return "Firefox";
            }
            if( navigator.userAgent.indexOf("Chrome")>0){
                return "Chrome";
            }
            if( navigator.userAgent.indexOf("Opera")>0){
                return "Opera";
            }
            if( navigator.userAgent.indexOf("Safari")>0) {
                return "Safari";
            }
            return 'Others';
        }
        (function(){
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
            vars.cookieUMessage = 'HASMESSAGE'+vars.userid;
            vars.voteBlankColor = new Array( '#5DBBEF', '#95E62A', '#CC1CD9', '#FFCD10', '#F79395');
            var d = new Date();
            vars.todayTimeString = 20160122;
        })();
    </script>

    <script type="text/javascript">
        //页面加载完成后，直接去发送一个ajax请求,要到分页数据

        $(document).ready(function () {
            var articleId = ${article.articleId};
            var username = '${username}';
            to_page(1);
            //要跳转的页码
            function to_page(pn) {
                $.ajax({
                    url: "${App_Path}/comment/getAllComment",
                    dataType:"json",
                    data: {pn:pn,articleId:articleId}
                    , type: "GET"
                    , success: function (result) {
                        console.log(result);
                        //1.解析并显示文章数据
                        build_comment_info(result);
                        //2.解析并显示分页信息
                        //build_page_info(result);
                        //3.显示分页条
                        build_page_nav(result);

                    }
                });
            }

            //date类型的json格式转换
            Date.prototype.format = function (format) {
                var o = {
                    "M+": this.getMonth() + 1, // month
                    "d+": this.getDate(), // day
                    "h+": this.getHours(), // hour
                    "m+": this.getMinutes(), // minute
                    "s+": this.getSeconds(), // second
                    "q+": Math.floor((this.getMonth() + 3) / 3), // quarter
                    "S": this.getMilliseconds()
                    // millisecond
                }
                if (/(y+)/.test(format))
                    format = format.replace(RegExp.$1, (this.getFullYear() + "")
                        .substr(4 - RegExp.$1.length));
                for (var k in o)
                    if (new RegExp("(" + k + ")").test(format))
                        format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
                return format;
            }
            function formatDatebox(value) {
                if (value == null || value == '') {
                    return '';
                }
                var dt;
                if (value instanceof Date) {
                    dt = value;
                } else {

                    dt = new Date(value);

                }

                return dt.format("yyyy-MM-dd hh:mm"); //扩展的Date的format方法(上述插件实现)
            }

            //根据commentId删除评论
            function to_page_delete(pn,commentId,articleId) {
                $.ajax({
                    url: "${App_Path}/comment/deleteCommentById",
                    data: {pn:pn,commentId:commentId,articleId:articleId}
                    , type: "GET"
                    , success: function (result) {
                        console.log(result);
                        //1.解析并显示文章数据
                        build_comment_info(result)
                        //3.显示分页条
                        build_page_nav(result);

                    }
                });
            }

            //根据commentId点赞
            function to_page_like(pn,commentId,articleId) {
                $.ajax({
                    url: "${App_Path}/comment/addCommentLike",
                    data: {pn:pn,commentId:commentId,articleId:articleId}
                    , type: "GET"
                    , success: function (result) {
                        console.log(result);
                        //1.解析并显示文章数据
                        build_comment_info(result)
                        //3.显示分页条
                        build_page_nav(result);

                    }
                });
            }

        /*<div class="pl-text clearfix">*/
            //构建评论信息
            function build_comment_info(result) {
                $("#comment").empty();

                var commentList = result.extend.pageInfo.list;
                $.each(commentList, function (i, item) {
                    var a1 = $("<a></a>").addClass("comment-size-name").attr("href","#").append(item.userName+":&nbsp;&nbsp;&nbsp;");
                    var span1 = $("<span></span>").addClass("my-pl-con").append(item.commentContent);
                    var div1 = $("<div></div>").addClass("pl-text clearfix").append(a1).append(span1);
                    var commentDate = formatDatebox(item.commentDate);
                    var span2 = $("<span></span>").addClass("date-dz-left pull-left comment-time").append(commentDate);
                    var a2;
                    var span3;
                    var a3;
                    var div2 = $("<div></div>").addClass("date-dz").append(span2);
                    if(username == item.userName){
                        a2 = $("<a></a>").addClass("date-dz-pl pl-hf hf-con-block pull-left").attr("href", "#")
                            .attr("id",item.commentId).append("删除");
                        //绑定删除按钮的点击事件
                        a2.click(function () {
                            to_page_delete(result.extend.pageInfo.pageNum,item.commentId,articleId);
                        });
                    }else{
                        a3 = $("<a></a>").addClass("date-dz-pl pl-hf hf-con-block pull-left").attr("href","javascript:;").append("回复");
                        a2 = "";
                        span3="";
                    }
                    var span4 = $("<span></span>").addClass("pull-left date-dz-line").append("|");
                    var a4 = $("<a></a>").addClass("date-dz-pl pl-hf hf-con-block pull-left").attr("href","#").append("赞(");
                    a4.click(function () {
                        to_page_like(result.extend.pageInfo.pageNum,item.commentId,articleId);
                    });
                    var i1 = $("<i></i>").addClass("z-num").append(item.commentLikeCount+")");
                    var b = a4.append(i1);
                    var img = $("<img/>").attr("src","${App_Path}/"+item.userPhoto).attr("height","50").attr("width","50");
                    var div3 = $("<div></div>").addClass("date-dz-right pull-right comment-pl-block").append(a2).append(span3).append(a3).append(span4).append(b);

                    var div4 = $("<div></div>").addClass("hf-list-con");

                    var div11 = $("<div></div>").addClass("comment-show-con-list pull-left clearfix").append(div1).append(div2).append(div3).append(div4);
                    var div12 = $("<div></div>").addClass("comment-show-con-img pull-left").append(img);
                    var div21 = $("<div></div>").addClass("comment-show-con clearfix").append(div12).append(div11);

                    div21.appendTo($("#comment"));
                });
            }

            //显示分页信息
            function build_page_info(result) {
                var currentPage = result.extend.pageInfo.pageNum;
                //清空数据
                $("#page_info_area").empty();
                var pageNum = result.extend.pageInfo.pageNum;
                var pages = result.extend.pageInfo.pages;
                var total = result.extend.pageInfo.total;
                $("#page_info_area")[0].innerHTML = "当前是第 <strong style='color: #47a447'>" + pageNum +
                    "</strong> 页 , 总共有 <strong style='color: #47a447'>" + pages + "</strong> 页 , 总共有<strong style='color: #47a447'>"
                    + total + "</strong> 条记录";
            }


            //解析显示分页条
            function build_page_nav(result) {
                $("#page_nav_area").empty();
                var ul = $("<ul></ul>").addClass("pagination");
                //首页
                var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
                //前一页
                var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
                if (result.extend.pageInfo.hasPreviousPage == false) {
                    firstPageLi.addClass("disabled");
                    prePageLi.addClass("disabled");
                } else {
                    //给元素添加点击事件

                    firstPageLi.click(function () {
                        to_page(1);
                    });

                    prePageLi.click(function () {
                        to_page(result.extend.pageInfo.pageNum - 1);
                    });
                }

                //后一页
                var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
                //尾页
                var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));

                if (result.extend.pageInfo.hasNextPage == false) {
                    nextPageLi.addClass("disabled");
                    lastPageLi.addClass("disabled");
                } else {
                    //添加点击事件
                    nextPageLi.click(function () {
                        to_page(result.extend.pageInfo.pageNum + 1);
                    });

                    //添加点击事件
                    lastPageLi.click(function () {
                        to_page(result.extend.pageInfo.pages);
                    });
                }

                //添加前一页和后一页显示
                ul.append(firstPageLi).append(prePageLi);

                $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
                    var numLi = $("<li></li>").append($("<a></a>").append(item));
                    if (result.extend.pageInfo.pageNum == item) {
                        numLi.addClass("active");
                    }
                    numLi.click(function () {
                        to_page(item);
                    });
                    ul.append(numLi);
                });
                //添加下一页和最后一页
                ul.append(nextPageLi).append(lastPageLi);

                var nav = $("<nav></nav>").append(ul);
                nav.appendTo("#page_nav_area");
            }


            $("#comment_Btn").click(function () {
                $("#myForm").submit();
            });
        });
    </script>
</head>
<body>
<div class="pb-container">
    <div class="pb-container-main pb-after-clear">
        <!-- 公共头部 -->
        <div class="pb-main pb-navwrap pb-after-clear">
            <div class="pb-iblock pb-fl pb-logo">
                <a href="${App_Path}/jsps/main/index.jsp"><img src="${App_Path}/static/img/jj_logo.jpg" /></a>
            </div>
            <div class="pb-iblock pb-fl pb-nav">
                <ul>
                    <li><a href="${App_Path}/jsps/main/index.jsp">首页</a></li>
                    <li><a href="${App_Path}/jsps/articles/add_Article.jsp">写博客</a></li>
                    <li><a href="${App_Path}/jsps/articles/look_Article.jsp">浏览文章</a></li>
                    <li><a href="pic.html">论坛</a></li>
                    <li><a href="${App_Path}/jsps/jjlin/all_discography.jsp">林俊杰专区</a></li>
                    <li><a href="${App_Path}/jsps/jjlin/bio.jsp">关于林俊杰</a></li>
                </ul>
            </div>
            <div class="pb-iblock pb-fr pb-oths">
                <a class="nmt" href="javascript:void(0);" onclick="Sys.commStat(2);commonLib.SetHome(this);">设为首页</a>
                <a class="nmt" href="index.html" rel="sidebar" onclick="Sys.commStat(1);commonLib.addFavorite();">收藏我们</a>
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
                <form action="" onsubmit="W.tips('暂未开放搜索功能，敬请期待!');Sys.commStat(6);return false;">
                    <input class="pb-search-btn" type="submit" value="" />
                    <input class="pb-search" type="text" />
                </form>
            </div>
        </div>
        <!-- 公共头部 -->
        <!-- 面包屑 -->
        <%--<div class="pb-main pb-breadcrumbs pb-mt40 pb-size-small">
            <a href="index.html">首页</a> &gt;&gt;
            <a href="news.html">征文比赛</a> &gt;&gt;
            <a href="news_detail.html?-10">你如何看待高中生恋爱</a> &gt;&gt;
            <a>如果高中生谈恋爱，请善待它</a>
        </div>--%>
        <!-- 面包屑结束 -->
        <!-- 当前页面内容 -->
        <link rel="stylesheet" type="text/css" href="${App_Path}/static/css/article.css?v3" />
        <div class="pb-main pb-mt20">
            <!--主文章展示-->
            <div class="atl-main pb-inner-main">
                <div class="pb-after-clear">
                    <h1 class="pb-fl"><a href="#" class="pb-block">${article.articleTitle}</a></h1>
                </div>
                <div class="pb-mt15 pb-size-tiny meta">
                    <span class="dt"><fmt:formatDate value="${article.articleDate}" pattern="yyyy-MM-dd hh:mm"/></span>
                    <span class="at">作者：${article_username}</span> &nbsp;&nbsp;|&nbsp;&nbsp;
                    <span class="vw"><i class="pb-icons"></i>浏览量(${article.articleViews})</span> &nbsp;&nbsp;|&nbsp;&nbsp;
                    <span class="ct"><i class="pb-icons"></i>评论(${article.articleCommentCount})</span> &nbsp;&nbsp;|&nbsp;&nbsp;
                    <span class="sc"><i class="pb-icons"></i><a href="${App_Path}/article/addArticleLike?articleId=${article.articleId}">点赞</a>(${article.articleLikeCount})</span>
                </div>
                <div class="pb-mt20 cnt">
                    <p>${article.articleContent}</p>
                </div>
                <div class="pb-mt30 pb-after-clear">
                    <c:if test="${!empty lastArticle}">
                    <a href="${App_Path}/article/getOneArticle?articleId=${lastArticle.articleId}" class="pb-fr">上一篇：${lastArticle.articleTitle}</a>
                    </c:if>
                    <c:if test="${empty lastArticle}">
                        <a href="#" class="pb-fr" data-toggle="modal" data-target=".bs-example-modal-sm">上一篇：无</a>
                        <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
                            <div class="modal-dialog modal-sm" role="document">
                                <div class="modal-content" align="center">
                                    <h1><small>没有文章了</small></h1>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </div>

                <div class="pb-mt30 pb-after-clear">
                    <c:if test="${!empty nextArticle}">
                        <a href="${App_Path}/article/getOneArticle?articleId=${nextArticle.articleId}" class="pb-fr">下一篇：${nextArticle.articleTitle}</a>
                    </c:if>
                    <c:if test="${empty nextArticle}">
                        <a href="#" class="pb-fr" data-toggle="modal" data-target=".bs-example-modal-sm">下一篇：无</a>
                        <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
                            <div class="modal-dialog modal-sm" role="document">
                                <div class="modal-content" align="center">
                                    <h1><small>没有文章了</small></h1>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </div>


                <div class="commentAll">
                    <!--评论区域 begin-->
                    <div class="reviewArea clearfix">
                        <form id="myForm" action="${App_Path}/comment/addComment?articleId=${article.articleId}" method="post">
                          <textarea id="comment_cotent" name="comment_cotent" class="content comment-input" placeholder="吐槽一下吧(。・∀・)ノ&hellip;" onkeyup="keyUP(this)"></textarea>
                          <input type="submit" class="plBtn" id="comment_Btn" value="评论" />
                        </form>
                    </div>
                    <!--评论区域 end-->
                    <!--回复区域 begin-->
                     <div class="comment-show" id="comment">
                        <div class="comment-show-con clearfix">
                            <div class="comment-show-con-img pull-left">
                                <img src="https://q2.qlogo.cn/headimg_dl?dst_uin=1479907611&spec=160" height="50" width="50" alt="">
                            </div>
                            <div class="comment-show-con-list pull-left clearfix">
                                <div class="pl-text clearfix">
                                    <%--<a href="#" class="comment-size-name">子成君 : </a>
                                    <span class="my-pl-con">&nbsp;点赞功能模块js(http://www.zcjun.com/)，子成君博客分享！</span>--%>
                                </div>
                                <div class="date-dz">
                                    <%--<span class="date-dz-left pull-left comment-time">2017-5-2 11:11:39</span>--%>
                                </div>
                                <div class="date-dz-right pull-right comment-pl-block">
                                    <%--<a href="javascript:;" class="removeBlock">删除</a>
                                    <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a>
                                    <span class="pull-left date-dz-line">|</span>
                                    <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">666</i>)</a>--%>
                                </div>
                                <div class="hf-list-con"></div>
                            </div>
                        </div>
                     </div>
                    <!--回复区域 end-->
                    <hr>
                    <div class="row">
                        <div class="col-md-12" id="page_nav_area">
                        </div>
                    </div>
                </div>
                <script>
                    $('.yiiPagerA').die().live('click',function(){
                        $.get( $(this).attr('link'),function( d){
                            Sys.scrollTo('pb-cmtlist-wp',function(){
                                $('#pb-cmtlist-wp').html( d);
                                adjustCommentScoreLine();
                            });
                        });
                    });
                </script>
                <%--<div class="atl-cmtbox pb-mt50 pb-after-clear">
                    <input class="but pb-fr" type="button" value="评&nbsp;论" />
                    <div contenteditable="true" class="pb-size-normal ta pb-fl" cpid="0" rcpid="0"></div>
                </div>--%>
            </div>
            <!--主文章展示 end-->
            <!--右侧我要投稿公共部分-->
            <div class="commside">
                <!--右侧我要投稿公共部分-->
                <div class="pb-iblock pb-fr pb-after-clear pb-main-side pb-mt30">
                    <img src="${App_Path}/static/img/icon_tougaoyouqian.jpg" class="pb-block" alt="征文比赛 有奖征文" />
                    <h6 class="pb-mt15 pb-clr1 pb-size-big">下期专题</h6>
                    <div class="pb-line2 pb-mt5">
                    </div>
                    <a class="tle pb-mt5" href="news_detail.html?/add">年味为什么越来越淡了</a>
                    <div class="pb-line2 pb-mt5">
                    </div>
                    <h6 class="pb-mt15"> <span class="pb-clr1 pb-size-normal">已投稿 <i class="tougao">2</i></span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="javascript:Sys.showRuleDiv();" class="pb-clr1 pb-size-small pb-underline">获奖规则</a> </h6>
                    <a class="but pb-clr1 pb-size-normal pb-mt15" href="news_detail.html?/add">有奖征文</a>
                </div>
                <!--右侧我要投稿公共部分-->
                <div style="clear:both;"></div>
                <div class="sidewrap  pb-mt40">
                    <h6 class="pb-clr1 pb-size-big">JJ's DISCOGRAPHY(专辑)</h6>
                    <div class="pb-line2 pb-mt5">
                    </div>
                    <div class="con pr" style="height:480px;overflow:hidden;">
                        <div class="single" style="left:150px;height:150px;top:15px;">
                            <a href="pic_detail.html?1" title="因你而在"><img style="width:145px;" src="${App_Path}/static/img/cover001.jpg" alt="因你而在" /></a>
                        </div>
                        <div class="single" style="left:0px;height:150px;top:15px;">
                            <a href="pic_detail.html?3" title="学不会"><img style="width:145px;" src="${App_Path}/static/img/cover002.jpg" alt="学不会" /></a>
                        </div>
                        <div class="single" style="left:150px;height:150px;top:170px;">
                            <a href="pic_detail.html?4" title="第几个一百天"><img style="width:145px;" src="${App_Path}/static/img/cover006.jpg" alt="第几个一百天" /></a>
                        </div>
                        <div class="single" style="left:0px;height:150px;top:170px;">
                            <a href="pic_detail.html?6" title="JJ陆"><img style="width:145px;" src="${App_Path}/static/img/cover007.jpg" alt="JJ陆" /></a>
                        </div>
                        <div class="single" style="left:150px;height:150px;top:325px;">
                            <a href="pic_detail.html?7" title="伟大的渺小"><img style="width:145px;" src="${App_Path}/static/img/cover023.jpg" alt="伟大的渺小" /></a>
                        </div>
                        <div class="single" style="left:0px;height:150px;top:325px;">
                            <a href="pic_detail.html?10" title="和自己对话"><img style="width:145px;" src="${App_Path}/static/img/cover019.jpg" alt="和自己对话" /></a>
                        </div>
                    </div>
                </div>
            </div>
            <!--右侧我要投稿公共部分-->
        </div>
        <!-- 当前页面内容结束 -->
        <script>

            function getSinleComment( id){
                $.ajax({
                    'url' : gSingleCommentUrl,
                    'type' : 'GET',
                    'data' : 'id='+id,
                    'beforeSend' : function(){
                    },
                    'success' : function( d){
                        if( d){
                            $('.atl-cmtlist ul:first').prepend( d);
                            Sys.scrollTo($('#comment_li_' + id));
                        }
                    },
                    'complete' : function(){
                    }
                });
            }
            function delEssayComment( id){
                W.confirm('确定删除该评论吗？',function(){
                    $.ajax({
                        'url' : gEssayDelUrl,
                        'type' : 'GET',
                        'dataType' : 'JSON',
                        'data' : 'commentId='+id,
                        'beforeSend' : function(){
                        },
                        'success' : function( ret){
                            W.tips(ret.msg);
                        },
                        'complete' : function(){
                        }
                    });
                });
            }

            $(document).ready(function(){
                adjustCommentScoreLine();
                adjustEssayScoreLine();
                var param = Sys.getUrlParams();
                if( param['message']){
                    var messageLi = $('#comment_li_' + param['message']);
                    if( messageLi.length > 0){
                        Sys.scrollTo(messageLi);
                    }else{
                        getSinleComment( param['message']);
                    }
                }

                //对评论分数小气球做处理
                $(".atl-cmtlist .pli").live('mouseenter', function(){
                    $(this).find('.point i').css('opacity', 0).show().animate({
                        opacity: "1"
                    }, "slow");
                }).live('mouseleave', function(){
                    $(this).find('.point i').animate({
                        opacity: "hide"
                    }, "fast");
                });
                //对各个点击回复按钮事件做处理
                $(".atl-cmtlist .ping,.atl-cmtlist .cping").live('click',function(){
                    var cpid = $(this).attr('cpid');
                    var rcpid = $(this).attr('rcpid');
                    var userid = parseInt($(this).attr('userid'));
                    if( parseInt( vars.userid) == userid){
                        W.tips('亲，你想对自己说什么呢？');
                        return false;
                    }
                    //获取父评论对象
                    var cpidObj = $('#comment_li_'+cpid);
                    //获取真正回复的对象
                    var rcpidObj = $('#comment_li_'+rcpid);
                    var nick = rcpidObj.attr('nick');
                    var txt = $.browser.mozilla ? '<img alt="@'+ nick +'："/>' : '<button name="" onclick="return false;" tabindex="-1" contentEditable=false>@'+ nick +':</button>&nbsp;';
                    var iptObj = cpidObj.find('.textarea');
                    function needConfirmLogic(){//以下逻辑当在需要用户确认的时候需要判断后再执行
                        iptObj.html('').append(txt);
                        Sys.placeCaretAtEnd( iptObj[0]);
                        iptObj.attr('rcpid', rcpid);
                        iptObj.unbind('keyup').keyup(function(event){
                            if( event.keyCode == 8){
                                if( $(this).html() == '' || $(this).html() == '<br>'){
                                    //如果内容全部删掉的话，需要执行将内容置为父评论的级别
                                    iptObj.attr('rcpid', cpid);
                                }
                            }
                        });
                    }
                    if( iptObj.html() != '' && iptObj.html() != '<br>'){
                        W.confirm('确定放弃之间编辑的内容吗？',function(){
                            needConfirmLogic();
                        });
                    }else{
                        needConfirmLogic();
                    }
                });
                //对编辑文本框添加焦点失去与捕获时间，处理相关状态的转换问题
                $('.atl-cmtlist .textarea,.atl-cmtbox div').live('focus',function(){
                    Sys.checkUserLogin();
                    var iptObj = $(this);
                    iptObj.removeClass('active').addClass('active');
                    //捕获焦点后，给焦点紧邻的button增加点击事件
                    iptObj.prev('input').removeClass('active').addClass('active').unbind('click').bind('click',function(){
                        submitEssayComment( iptObj);
                    });
                }).live('blur',function(){
                    var iptObj = $(this);
                    var content = Sys.removeHTMLTag(iptObj.html());
                    if( content == ''){//如果失去焦点的时候内容为空
                        $(this).removeClass('active');
                        $(this).prev('input').removeClass('active').unbind('click');
                        $(this).attr('rcpid', $(this).attr('cpid'));
                        iptObj.html('');
                    }
                });
                //对点点击子评论按钮做处理
                $(".atl-cmtlist .jia,.atl-cmtlist .jian").live('click',function(){
                    submitVoteComment( $(this));
                });
                //对点点击文章评论按钮做处理
                $(".votebar button").bind('click',function(){
                    if( gEssayStatus < 1){
                        W.tips('文章审核后才可以开始点评，心急吃不了臭豆腐哦 :)');
                        return false;
                    }
                    if( gEssayFeatureStatus < 2){
                        W.tips('专题评比开始后才可以统一开始点评，不要心急哟 :)');
                        return false;
                    }
                    var act = $(this).attr('act')
                    if( act == 'support' || act == 'oppose'){
                        submitVote( act);
                    }else if( act == 'comment'){
                        var target = $('.atl-cmtbox:first');
                        Sys.scrollTo( target,function(){
                            target.find('div').focus();
                        });

                    }else if( act == 'share'){
                        $('.bdsharebuttonbox').fadeIn();
                    }
                });

                Sys.updateEntityClicknum('/stat/ClickNum','e', gEssayId);
            });
        </script>
        <script id="tpl-essay-comment" type="text/x-jsmart-tmpl">
	<li class="pli" id="comment_li_{$id}" nick="{$nickname}">
		<a href="javascript:void(0);" class="avatars pb-fl">
			<img src="{$headimage}" style="width:60px;height:60px;" alt="{$nickname}">
		</a>
		<div class="rbox">
			<div class="nickbar">
				<div class="point" id="point_{$id}" style="width:0%;" score="{$score}" userId="{$userid}"><i class="pb-icons">{$score}</i></div>
				<a href="javascript:void(0);" class="p7">{$nickname}</a>
			</div>
			<div class="cnt">{$content}</div>
			<div class="btbar pb-size-small pb-after-clear">
				<span title="{$createdate}" class="date">{$createdate}</span>
				<a href="javascript:void(0);" class="jia" act="support" commentid="{$id}"><i class="pb-icons"></i>加分(<span>{$supportnum}</span>)</a>
				<a href="javascript:void(0);" class="jian" act="oppose" commentid="{$id}"><i class="pb-icons"></i>减分(<span>{$opposenum}</span>)</a>
				<a href="javascript:void(0);" class="ping" cpid="{$id}" rcpid="{$id}" userid="{$userid}><i class="pb-icons"></i>回复({$commentnum})</a>
			</div>
		</div>
		<div class="rdiv pb-after-clear">
			<ul></ul>
		   <input class="pb-mt10" type="button" value="回复 +3"/>
		   <div contentEditable=true class="pb-size-normal pb-mt10 textarea" cpid="{$id}" rcpid="{$id}"></div>
	   </div>
   </li>
</script>
        <script id="tpl-essay-childcomment" type="text/x-jsmart-tmpl">
	<li id="comment_li_{$id}" nick="{$nickname}">
		<a href="javascript:void(0);" class="avatars pb-fl">
			<img src="{$headimage}" style="width:60px;height:60px;" alt="{$nickname}">
		</a>
		<div class="rbox rrbox">
			<div class="nickbar rnickbar"><a href="javascript:void(0);">{$nickname}</a>{if $rnickname}@<a href="javascript:void(0);">{$rnickname}</a>{/if}</div>
			<div class="cnt">{$content}</div>
			<div class="btbar pb-size-small">
				<span title="{$createdate}">{$createdate}</span>
				<a href="javascript:void(0);" class="ping cping" cpid="{$cpid}" rcpid="{$id}" userid="{$userid}><i class="pb-icons"></i></a>
			</div>
		</div>
	</li>
</script>
    </div>
    <!-- 公共尾部 -->
    <div style="clear:both;"></div>
    <div class="pb-footer">
        <div class="pb-footer-wp">
            <div class="pb-main pb-footer-cnt pb-size-small">
                <span class="pb-fl">&copy; 2012 - 2015 深圳市JJLIN科技有限公司版权所有 粤 icp 备 13011067 号</span>
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
<script language="javascript" type="text/javascript" src="js/15502332.js"></script>
<noscript>
    <a href="http://www.51.la/?15502332" target="_blank"><img alt="我要啦免费统计" src="images/15502332.asp" style="border:none" /></a>
</noscript>
<script type="text/javascript" language="javascript">
    $(document).ready(function(){
        $(".pb-ucenter").bind('mouseenter', function(){
            $(this).find('ul').stop().slideDown('fast');
            Sys.clearFlicker('uMessageCenter');
        }).bind('mouseleave', function(){
            $(this).find('ul').stop().slideUp('fast');
        });

        $("#goTopButton").click(function(){
            Sys.scrollTo($('body'));
            Sys.commStat(33);
        });
        if( vars.browser != 'IE6'){
            var w_w = parseInt( $("body").width());
            var obj = $("#goTopButton");
            $(window).scroll(function(){
                if($(this).scrollTop() > 500){
                    if( !isNaN(w_w) && w_w > 0){
                        obj.css('left', (Math.ceil((w_w-1050)/2) + 1050 + 10) + "px" );
                    }
                    obj.fadeIn();
                }else{
                    obj.fadeOut();
                }
            });
        }
        Sys.hide51();
    });
</script>
<script type="text/javascript" src="${App_Path}/static/js/form.js"></script>
<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>

<!-- <script type="text/javascript" src="http://www.jsdaima.com/static/js/jquery-1.11.3.min.js"></script> -->
<script>/*
    此插件textarea的高度是 height:100%; 继承父元素的高度 ==> 父元素只有一个 position:relative; 用于定位textarea
    页面中加载完毕又添加了pre标签，pre标签是以块元素存在的并且不可见，但是占用空间，
    不像display:none;什么空间也不占。
    所以textarea父元素的高度是通过pre撑开的(在textarea里面写入文字，文字会被添加到pre底下的span标签里，以此来撑开pre的高度)

    要改变textarea初始化时的高度，只需改变pre的padding值即可，页面加载时pre里面添加<br />标签是为了让pre标签初始时有个高度
 */
;(function ($) {

    // Constructor
    function FT(elem) {
        this.$textarea = $(elem);

        this._init();
    }

    FT.prototype = {
        _init: function () {
            var _this = this;

            // Insert wrapper elem & pre/span for textarea mirroring
            this.$textarea.wrap('<div class="flex-text-wrap" />').before('<pre class="pre"><span /><br /></pre>');

            this.$span = this.$textarea.prev().find('span');

            // Add input event listeners
            // * input for modern browsers
            // * propertychange for IE 7 & 8
            // * keyup for IE >= 9: catches keyboard-triggered undos/cuts/deletes
            // * change for IE >= 9: catches mouse-triggered undos/cuts/deletions (when textarea loses focus)
            this.$textarea.on('input propertychange keyup change', function () {
                _this._mirror();
            });

            // jQuery val() strips carriage return chars by default (see http://api.jquery.com/val/)
            // This causes issues in IE7, but a valHook can be used to preserve these chars
            $.valHooks.textarea = {
                get: function (elem) {
                    return elem.value.replace(/\r?\n/g, "\r\n");
                }
            };

            // Mirror contents once on init
            this._mirror();
        }

        // Mirror pre/span & textarea contents
        ,_mirror: function () {
            this.$span.text(this.$textarea.val());
        }
    };

    // jQuery plugin wrapper
    $.fn.flexText = function () {
        return this.each(function () {
            // Check if already instantiated on this elem
            if (!$.data(this, 'flexText')) {
                // Instantiate & store elem + string
                $.data(this, 'flexText', new FT(this));
            }
        });
    };

})(jQuery);</script>
<!--textarea高度自适应-->
<script type="text/javascript">
    $(function () {
        $('.content').flexText();
    });
</script>
<!--textarea限制字数-->
<script type="text/javascript">
    function keyUP(t){
        var len = $(t).val().length;
        if(len > 139){
            $(t).val($(t).val().substring(0,140));
        }
    }
</script>
<%--<!--点击评论创建评论条-->
<script type="text/javascript">
    $('.commentAll').on('click','.plBtn',function(){
        var myDate = new Date();
        //获取当前年
        var year=myDate.getFullYear();
        //获取当前月
        var month=myDate.getMonth()+1;
        //获取当前日
        var date=myDate.getDate();
        var h=myDate.getHours();       //获取当前小时数(0-23)
        var m=myDate.getMinutes();     //获取当前分钟数(0-59)
        if(m<10) m = '0' + m;
        var s=myDate.getSeconds();
        if(s<10) s = '0' + s;
        var now=year+'-'+month+"-"+date+" "+h+':'+m+":"+s;
        //获取输入内容
        var oSize = $(this).siblings('.flex-text-wrap').find('.comment-input').val();
        console.log(oSize);
        //动态创建评论模块
        oHtml = '<div class="comment-show-con clearfix"><div class="comment-show-con-img pull-left"><img src="http://www.jsdaima.com/Uploads/js/201705/1495781184/header-img-comment_03.png" alt=""></div> <div class="comment-show-con-list pull-left clearfix"><div class="pl-text clearfix"> <a href="#" class="comment-size-name">David Beckham : </a> <span class="my-pl-con">&nbsp;'+ oSize +'</span> </div> <div class="date-dz"> <span class="date-dz-left pull-left comment-time">'+now+'</span> <div class="date-dz-right pull-right comment-pl-block"><a href="javascript:;" class="removeBlock">删除</a> <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">666</i>)</a> </div> </div><div class="hf-list-con"></div></div> </div>';
        if(oSize.replace(/(^s*)|(s*$)/g, "") != ''){
            $(this).parents('.reviewArea ').siblings('.comment-show').prepend(oHtml);
            $(this).siblings('.flex-text-wrap').find('.comment-input').prop('value','').siblings('pre').find('span').text('');
        }
    });
</script>
<!--点击回复动态创建回复块-->
<script type="text/javascript">
    $('.comment-show').on('click','.pl-hf',function(){
        //获取回复人的名字
        var fhName = $(this).parents('.date-dz-right').parents('.date-dz').siblings('.pl-text').find('.comment-size-name').html();
        //回复@
        var fhN = '回复@'+fhName;
        //var oInput = $(this).parents('.date-dz-right').parents('.date-dz').siblings('.hf-con');
        var fhHtml = '<div class="hf-con pull-left"> <textarea class="content comment-input hf-input" placeholder="" onkeyup="keyUP(this)"></textarea> <a href="javascript:;" class="hf-pl">评论</a></div>';
        //显示回复
        if($(this).is('.hf-con-block')){
            $(this).parents('.date-dz-right').parents('.date-dz').append(fhHtml);
            $(this).removeClass('hf-con-block');
            $('.content').flexText();
            $(this).parents('.date-dz-right').siblings('.hf-con').find('.pre').css('padding','6px 15px');
            //console.log($(this).parents('.date-dz-right').siblings('.hf-con').find('.pre'))
            //input框自动聚焦
            $(this).parents('.date-dz-right').siblings('.hf-con').find('.hf-input').val('').focus().val(fhN);
        }else {
            $(this).addClass('hf-con-block');
            $(this).parents('.date-dz-right').siblings('.hf-con').remove();
        }
    });
</script>
<!--评论回复块创建-->
<script type="text/javascript">
    $('.comment-show').on('click','.hf-pl',function(){
        var oThis = $(this);
        var myDate = new Date();
        //获取当前年
        var year=myDate.getFullYear();
        //获取当前月
        var month=myDate.getMonth()+1;
        //获取当前日
        var date=myDate.getDate();
        var h=myDate.getHours();       //获取当前小时数(0-23)
        var m=myDate.getMinutes();     //获取当前分钟数(0-59)
        if(m<10) m = '0' + m;
        var s=myDate.getSeconds();
        if(s<10) s = '0' + s;
        var now=year+'-'+month+"-"+date+" "+h+':'+m+":"+s;
        //获取输入内容
        var oHfVal = $(this).siblings('.flex-text-wrap').find('.hf-input').val();
        console.log(oHfVal)
        var oHfName = $(this).parents('.hf-con').parents('.date-dz').siblings('.pl-text').find('.comment-size-name').html();
        var oAllVal = '回复@'+oHfName;
        if(oHfVal.replace(/^ +| +$/g,'') == '' || oHfVal == oAllVal){

        }else {
            $.getJSON("json/pl.json",function(data){
                var oAt = '';
                var oHf = '';
                $.each(data,function(n,v){
                    delete v.hfContent;
                    delete v.atName;
                    var arr;
                    var ohfNameArr;
                    if(oHfVal.indexOf("@") == -1){
                        data['atName'] = '';
                        data['hfContent'] = oHfVal;
                    }else {
                        arr = oHfVal.split(':');
                        ohfNameArr = arr[0].split('@');
                        data['hfContent'] = arr[1];
                        data['atName'] = ohfNameArr[1];
                    }

                    if(data.atName == ''){
                        oAt = data.hfContent;
                    }else {
                        oAt = '回复<a href="#" class="atName">@'+data.atName+'</a> : '+data.hfContent;
                    }
                    oHf = data.hfName;
                });

                var oHtml = '<div class="all-pl-con"><div class="pl-text hfpl-text clearfix"><a href="#" class="comment-size-name">我的名字 : </a><span class="my-pl-con">'+oAt+'</span></div><div class="date-dz"> <span class="date-dz-left pull-left comment-time">'+now+'</span> <div class="date-dz-right pull-right comment-pl-block"> <a href="javascript:;" class="removeBlock">删除</a> <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">666</i>)</a> </div> </div></div>';
                oThis.parents('.hf-con').parents('.comment-show-con-list').find('.hf-list-con').css('display','block').prepend(oHtml) && oThis.parents('.hf-con').siblings('.date-dz-right').find('.pl-hf').addClass('hf-con-block') && oThis.parents('.hf-con').remove();
            });
        }
    });
</script>
<!--删除评论块-->
<script type="text/javascript">
    $('.commentAll').on('click','.removeBlock',function(){
        var oT = $(this).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con');
        if(oT.siblings('.all-pl-con').length >= 1){
            oT.remove();
        }else {
            $(this).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con').parents('.hf-list-con').css('display','none')
            oT.remove();
        }
        $(this).parents('.date-dz-right').parents('.date-dz').parents('.comment-show-con-list').parents('.comment-show-con').remove();

    })
</script>
<!--点赞-->
<script type="text/javascript">
    $('.comment-show').on('click','.date-dz-z',function(){
        var zNum = $(this).find('.z-num').html();
        if($(this).is('.date-dz-z-click')){
            zNum--;
            $(this).removeClass('date-dz-z-click red');
            $(this).find('.z-num').html(zNum);
            $(this).find('.date-dz-z-click-red').removeClass('red');
        }else {
            zNum++;
            $(this).addClass('date-dz-z-click');
            $(this).find('.z-num').html(zNum);
            $(this).find('.date-dz-z-click-red').addClass('red');
        }
    })
</script>--%>
</body>
</html>
