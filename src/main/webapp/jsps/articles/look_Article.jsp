<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    pageContext.setAttribute("App_Path", request.getContextPath());
%>
<html>
<head>
    <title>文章</title>
    <!--模板-->
    <script type="text/javascript" src="${App_Path}/static/js/jquery-3.3.1.min.js"></script>
    <link href="${App_Path}/static/css/style.css" rel='stylesheet' type='text/css'/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <link href="${App_Path}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <script src="${App_Path}/static/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript" src="${App_Path}/static/js/move-top.js"></script>
    <script type="text/javascript" src="${App_Path}/static/js/easing.js"></script>
    <!--/script-->
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            to_page(1);
            getCategories();
            getLabels();
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

            //要跳转的页码
            function to_page(pn) {
                $.ajax({
                    url: "${App_Path}/article/getAllArticle",
                    data: "pn=" + pn
                    , type: "GET"
                    , success: function (result) {
                        console.log(result);
                        //1.解析并显示文章数据
                        build_article_info(result)
                        //2.解析并显示分页信息
                        build_page_info(result);
                        //3.显示分页条
                        build_page_nav(result);

                    }
                });
            }

            //根据categoryId跳转页面
            function to_page_categoryId(categoryId) {
                $.ajax({
                    url: "${App_Path}/article/getAllArticle",
                    data: "categoryId=" + categoryId
                    , type: "GET"
                    , success: function (result) {
                        console.log(result);
                        //1.解析并显示文章数据
                        build_article_info(result)
                        //2.解析并显示分页信息
                        build_page_info(result);
                        //3.显示分页条
                        build_page_nav(result);

                    }
                });
            }

            //根据labelId跳转页面
            function to_page_labelId(labelId) {
                $.ajax({
                    url: "${App_Path}/article/getAllArticle",
                    data: "labelId=" + labelId
                    , type: "GET"
                    , success: function (result) {
                        console.log(result);
                        //1.解析并显示文章数据
                        build_article_info(result)
                        //2.解析并显示分页信息
                        build_page_info(result);
                        //3.显示分页条
                        build_page_nav(result);

                    }
                });
            }
            //得到所有分类数据
            function getCategories() {
                $("#categories").empty();
                $.ajax({
                    url: "${App_Path}/category/getAllCategory",
                    type: "GET",
                    success: function (result) {
                        $("<h3></h3>").append("分类").appendTo($("#categories"));
                        $.each(result.extend.categories, function (i, item) {
                            var a = $("<a></a>").attr("href", "#").attr("id", item.categoryId).append(item.categoryName);
                            a.click(function () {
                                to_page_categoryId(item.categoryId);
                            });
                            var li = $("<li></li>").append(a);
                            li.appendTo($("#categories"));
                        });
                    }
                });
            }

            //得到所有标签数据
            function getLabels() {
                $("#labels").empty();
                $.ajax({
                    url: "${App_Path}/label/getAllLabel",
                    type: "GET",
                    success: function (result) {
                        $("<h3></h3>").append("标签").appendTo($("#labels"));
                        $.each(result.extend.labels, function (i, item) {
                            var a = $("<a></a>").attr("href", "#").attr("id", item.labelId).append(item.labelName);
                            a.click(function () {
                                to_page_labelId(item.labelId);
                            });
                            var li = $("<li></li>").append(a);
                            li.appendTo($("#labels"));
                        });
                    }
                });
            }


            //构建文章信息
            function build_article_info(result) {
                $("#article_div").empty();
                var articleList = result.extend.pageInfo.list;
                $.each(articleList, function (i, item) {
                    var a = $("<a></a>").attr("href", "${App_Path}/article/getOneArticle?articleId=" + item.articleId).append(item.articleTitle);
                    var articleTitle = $("<h3></h3>").append(a);
                    var articleContent = item.articleContent;
                    var articleDate = formatDatebox(item.articleDate);
                    var usernameAndDate = $("<h4></h4>").append("发表时间 ：" + articleDate + "    作者 : " + item.username);
                    $("<div></div>").addClass("content-sec-info").append(articleTitle)
                        .append(usernameAndDate).append(articleContent).appendTo($("#article_div"));
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
        });
    </script>
    <!--模板-->


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
</head>
<body>
<!-- 公共头部 -->
<div class="pb-main pb-navwrap pb-after-clear">
    <div class="pb-iblock pb-fl pb-logo">
        <a href="${App_Path}/jsps/main/index.jsp"><img src="${App_Path}/static/img/jj_logo.jpg" alt="JJ_Blog_Logo"/></a>
    </div>
    <div class="pb-iblock pb-fl pb-nav">
        <ul>
            <li><a href="${App_Path}/jsps/main/index.jsp">首页</a></li>
            <li><a href="${App_Path}/jsps/articles/add_Article.jsp">写博客</a></li>
            <li><a href="${App_Path}/jsps/articles/look_Article.jsp">浏览文章</a></li>
            <li><a href="pic.html">论坛</a></li>
            <li><a href="${App_Path}/jsps/jjlin/all_discography.jsp">林俊杰专区</a></li>
            <li><a href="${App_Path}/jsps/jjlin/bio.jsp">关于林俊杰</a>
            </li>
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
                <a href="/user" id="uSetEntry-head"><img src="${App_Path}/static/img/default.gif" alt="阿斗"/></a>
                <i class="pb-icons notice pb-hide"></i>
            </div>
            <br/>
            <ul>
                <li><a href="/user" id="uSetEntry"><i class="pb-icons my"></i> 个人中心</a></li>
                <li><a href="/site/logout"><i class="pb-icons logout"></i> 退出登录</a></li>
            </ul>
        </div>
        <br/>
        <form action="" onsubmit="W.tips('暂未开放搜索功能，敬请期待!');
              Sys.commStat(6);
              return false;">
            <input class="pb-search-btn" type="submit" value=""/>
            <input class="pb-search" type="text"/>
        </form>
    </div>
</div>
<%--公共头部--%>
<br><br>
<div class="content">
    <div class="container">
        <div class="content-grids">
            <div class="col-md-9 content-main">
                <div class="content-grid-sec" id="article_div">

                </div>
                <hr>
                <div class="row">
                    <div class="col-md-6" id="page_info_area">
                    </div>
                    <div class="col-md-6" id="page_nav_area">
                    </div>
                </div>
                <!--分页条-->

            </div>
            <div class="col-md-3 content-main-right">
                <div class="search">
                    <h3>查找文章</h3>
                    <form>
                        <input type="text" value="" onFocus="this.value=''" onBlur="this.value=''" placeholder="输入关键词">
                        <input type="submit" value="">
                    </form>
                </div>
                <div class="categories" id="categories">
                    <%--<h3>分类</h3>
                    <li class="active"><a href="#">林俊杰</a></li>
                    <li><a href="#">JAVA</a></li>
                    <li><a href="#">PHP</a></li>--%>
                </div>
                <div class="archives" id="labels">
                    <%--<h3>标签</h3>
                    <li class="active"><a href="#">jj lin</a></li>
                    <li><a href="#">孙笑川</a></li>
                    <li><a href="#">吴亦凡</a></li>--%>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
