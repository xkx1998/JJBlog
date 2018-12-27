<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%
    pageContext.setAttribute("App_Path", request.getContextPath());
%>
<html>
<head>
    <title>写文章</title>
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
    <script type="text/javascript">
        $(document).ready(function () {
            //页面加载完成，发送ajax请求获取分类和标签
            getCategories();
            getLabels();

            function getCategories() {
                $("#category_select").empty();
                $.ajax({
                    url: "${App_Path}/category/getAllCategory",
                    type: "GET",
                    success: function (result) {
                        $.each(result.extend.categories, function () {
                            var optionEle = $("<option></option>").append(this.categoryName).attr("value", this.categoryId);
                            optionEle.appendTo("#category_select");
                        });
                    }
                });
            }

            function getLabels() {
                $("#label_select").empty();
                $.ajax({
                    url: "${App_Path}/label/getAllLabel",
                    type: "GET",
                    success: function (result) {
                        $.each(result.extend.labels, function () {
                            var optionEle = $("<option></option>").append(this.labelName).attr("value", this.labelId);
                            optionEle.appendTo("#label_select");
                        });
                    }
                });
            }

            $("#sumbit_btn").click(function () {
                $("#myForm").submit();
            });
        });
    </script>
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
<!-- 公共头部 -->
<h1 align="center">
    <small>${article_msg}</small>
</h1>
<form id="myForm" action="${App_Path}/article/add">
    <div>
        <div class="form-group" align="center">
            <label for="exampleInputTitle">
                <h1>
                    <small>文章标题</small>
                </h1>
            </label>
            <input name="title" style="width:50%" type="email" class="form-control" id="exampleInputTitle"
                   placeholder="输入文章标题">
        </div>

        <div align="center">
            <!-- 加载编辑器的容器 -->
            <%--<script id="container" name="content" type="text/plain">
                这里写你的初始化内容
            </script>--%>
            <h1>
                <small>文章内容</small>
            </h1>
            <textarea id="container" style="width: 80%;height: 260px;"></textarea>
        </div>
        <div style="height: 200px" align="center">
            <div>
                <h1>
                    <small>文章分类</small>
                </h1>
                <select name="categoryId" id="category_select" class="form-control" style="width: 10%">
                </select>
            </div>
            <div>
                <h1>
                    <small>选择标签</small>
                </h1>
                <select name="labelId" id="label_select" class="form-control" style="width: 10%">
                </select>
            </div>

        </div>
        <div align="center">
            <button id="sumbit_btn" type="button" class="btn btn-primary btn-lg active">提交</button>
        </div>
        <!-- 实例化编辑器 -->
        <script type="text/javascript">
            var ue = UE.getEditor('container');
        </script>
    </div>
</form>
</body>
</html>
