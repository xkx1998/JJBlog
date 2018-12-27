<%--
  Created by IntelliJ IDEA.
  User: XuKexiang
  Date: 2018/12/16
  Time: 0:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("App_Path", request.getContextPath());
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>关于林俊杰</title>
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

<section class="content page-biography">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12 nopadding titlebox text-center">
                <div class="linebox">
                    <div class="line"></div>
                </div>
                <div class="titletext">
                    <span>关于JJ Biography</span>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12 nopadding linkbox">
                <ul>
                    <li data-id="1">
                        <a class="active" href="javascript:void(0)">JJLIN</a>
                    </li>
                    <li data-id="2">
                        <a class="" href="javascript:void(0)">代言</a>
                    </li>
                    <li data-id="3">
                        <a class="" href="javascript:void(0)">獎項</a>
                    </li>
                    <!--<li data-id="4">
                        <a class="" href="javascript:void(0)">歷年記事</a>
                    </li>-->

                    <li data-id="5">
                        <a class="" href="javascript:void(0)">影視</a>
                    </li>
                </ul>
            </div>
            <div class="col-md-12 col-sm-12 col-xs-12 nopadding contentbox">
                <div class="col-md-12 col-sm-12 col-xs-12 nopadding box active" data-id="1">
                    <div class="col-md-5 col-sm-12 col-xs-12 nopaddingLeft left imgbox">
                        <img src="${App_Path}/static/img/pic2.png">
                    </div>
                    <div class="col-md-7 col-sm-12 col-xs-12 right content">
                        <p>他的创作来自最深的情感，他的声音唱出灵魂的璀璨<br>撼动亚洲数十亿颗心跳，亚洲乐坛全能唱作天王JJ林俊杰</p>
                        <p>2003年，林俊杰以首张专辑《乐行者》正式出道，之后凭着《江南》一曲走红大中华区，9年来共发行8张专辑，张张写下傲人成绩，在华语乐坛获得高度注目。除了唱片的傲人成绩，他也涉足戏剧，更创立自己的潮流品牌SMG，成为真正引领潮流的亚洲天王</p>
                        <p>2011年加盟国际音乐公司–华纳唱片<br>发行首张专辑「学不会」，同名主打「学不会」上线三个月，网路试听及下载量突破千万次，横扫所有实体、数位、铃声下载排行榜冠军：超越18个以上金榜冠军专辑，实力与畅销共同获得肯定！<br>从这一刻起，林俊杰正式晋身亚洲乐坛天王，实至名归。</p>
                        <p>2013年3月，发行出道十年第十张个人专辑「因你而在」，立刻攻占iTunes单曲及各大华语榜冠军，在各排行榜也稳坐所有冠军。JJ林俊杰更凭此张专辑，获第25届金曲奖最佳男歌手，成为金曲歌王，并于短短一年内横扫亚洲各大颁奖典礼的最佳男歌手、最佳创作歌手、最佳制作以及2014 iTunes年度精选《年度最佳艺人》等奖项。<br>JJ林俊杰不仅在个人发行的专辑中表现亮眼，更替香港歌神陈奕迅量身订作最新国语专辑，亚洲流行天后蔡依林、亚洲女子天团SHE的成员Selina谱写及制作专辑主打歌，所制作的歌曲，皆成为红遍全亚洲的热门歌曲，获得各方好评。</p>
                        <p>2014年年底发行第11张专辑【新地球】<br>发行仅5天的时间，便史无前例地成为台湾五大金榜的2014年度销售冠军，横扫海内外所有实体、数位下载…等超过100个金榜的No.1 ，成为亚洲最强百冠王</p>
                        <p>2014年第25届金曲奖颁奖典上，林俊杰与葛莱美流行歌王Jason Mraz首度同台演唱金曲「I'm Yours」，众所期待获媒体一致好评。</p>
                        <p>同年JJ与Jason Mraz更破天荒跨国合作，由JJ作曲，与Jason Mraz共同谱词「I Am Alive」，并收录在JJ【新地球】专辑中，受到全球瞩目，让【新地球】专辑发行首周随即空降美国告示牌（Billboard）世界专辑排行榜第10名。2016年6月25日，凭借第十二张个人专辑《和自己对话》及其主打单曲《不为谁而做的歌》，获得第27届金曲奖最佳国语男歌手奖和最佳作曲人奖。<br>与韩国首席摇滚天团CNBLUE主唱-郑容和，创作并合唱摇滚歌曲「Checkmate」，成为华语乐坛第一人登上韩国KBS「Music Bank」，跨足K-POP市场。</p>
                        <p>
                            JJ继2013-2014举办的「时线世界巡回演唱会」跑遍25个城市突破30万人次<br>
                            2015年2月起跑的「时线：新地球世界巡回演唱会安可场」以台北为起点，<br>
                            再度在全球展开近20场的演唱会表演，<br>
                            台北场更刷新90分钟即完售近3万张门票个人新纪录<br>
                            邀请到日本流行天后—滨崎步担任演唱会嘉宾，<br>
                            并于演唱会上惊人公布JJ已为滨崎步谱写新歌曲的消息<br>
                            震撼全亚洲，成为唯一跨足中、美、日、韩的亚洲乐坛全能唱作天王。
                        </p>

                        <p>
                            JJ林俊杰，其一举一动之影响力同样扩及整个亚洲SNS。<br>
                            个人经营的相关微博已突破2600万人关注，是为大中华区男歌手前3名，<br>
                            再一次证明亚洲乐坛天王的实至名归。
                        </p>
                        <p>
                            他把音乐和梦想当做能量，一路走到无人取代的地位<br>
                            他写下华语乐坛最动人的经典乐章<br>
                            他是亚洲全能唱作天王- JJ林俊杰<br>
                        </p>

                    </div>
                </div>

                <div class="col-md-12 col-sm-12 col-xs-12 nopadding box" data-id="2">
                    <div class="col-md-5 col-sm-12 col-xs-12 nopaddingLeft left imgbox">
                        <img src="${App_Path}/static/img/pic2.png">
                    </div>
                    <div class="col-md-7 col-sm-12 col-xs-12 right content">
                        <h4>國際品牌</h4>
                        <ul>
                            <li>2016年：「HORAE韓媞」韓國保養品台灣代言人，代言歌曲：《關鍵詞》</li>
                            <li>2015年： Beats by Dr. Dre耳機全球代言人</li>
                            <li>2014年： 香港迪士尼樂園 (HK Disneyland)</li>
                            <li>2014年： Adidas Originals</li>
                            <li>2009年：「麥當勞」（McDonald）商品</li>
                            <li>2007年：「樂事薯片」（Lays）商品</li>
                            <li>2006-2015年：「雪碧」（Sprite）商品</li>
                        </ul>
                        <h4>線上遊戲</h4>
                        <ul>
                            <li>2012年：御龍在天，代言歌曲：《御龍三國志》</li>
                            <li>2010年：完美世界國際版2012，代言歌曲：《完美新世界》</li>
                            <li>2008年：赤壁 Online，代言歌曲：《醉赤壁》</li>
                            <li>2005年：EQ II東方版，代言歌曲：《無盡的思念》</li>
                            <li>2004年：天堂II，代言歌曲：《第二天堂》</li>
                        </ul>
                        <h4>手機遊戲</h4>
                        <ul>
                            <li>2015年：部落衝突，代言歌曲：《全面開戰》feat.林志穎</li>
                        </ul>
                        <h4>臺灣</h4>
                        <ul>
                            <li>2016年：中華電信大4G代言人</li>
                            <li>2015年：7-11ibon廣告</li>
                            <li>2015年：飢餓30</li>
                            <li>2013年：7-11超商電信代言</li>
                            <li>2011年：義大世界</li>
                            <li>2010年：點燃生命之火公益活動</li>
                            <li>2008年：六福村主題樂園</li>
                            <li>2007年：臺灣管製藥品管理局反毒大使</li>
                            <li>2007年：悅氏健茶到油切綠茶廣告</li>
                        </ul>

                        <h4>大陸</h4>
                        <ul>
                            <li>2015年：上海大眾汽車《Lamando凌渡》，代言歌曲：《Lamando》</li>
                            <li>電信：中國聯通（2006）</li>
                            <li>食品：「和路雪」（Cornetto）可愛多冰淇淋廣告（2007－2009）</li>
                            <li>飲料：純中純飲料代言／銀鷺花生牛奶（2010）</li>
                            <li>服飾：拜麗德休閒服（2007、2008）／奇安達休閒運動鞋（2007－2009）／大贏家休閒服飾</li>
                        </ul>
                        <h4>新加坡</h4>
                        <ul>
                            <li>2007年：新傳媒電視台《U頻道》</li>
                            <li>2006年：全國推動講華語運動大使</li>
                            <li>2006年：新加坡旅遊局《非常新加坡》旅遊大使</li>
                            <li>手機：韓國三星（2008）新加坡</li>
                        </ul>
                        <h4>馬來西亞</h4>
                        <ul>
                            <li>2010年：Super 咖啡</li>
                            <li>2007年：西爾康《CELCOM》電訊公司代言X-PAX</li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-12 col-sm-12 col-xs-12 nopadding box" data-id="3">
                    <div class="col-md-5 col-sm-12 col-xs-12 nopaddingLeft left imgbox">
                        <img src="${App_Path}/static/img/pic2.png">
                    </div>
                    <div class="col-md-7 col-sm-12 col-xs-12 right content">
                        <h4>2016</h4>
                        <ul>
                            <li>第11屆KKBOX數位音樂風雲榜－年度風雲歌手獎、年度專輯冠軍獎《新地球》</li>
                            <li>第3屆 QQ音樂巔峰盛典－年度最佳港台男歌手獎、年度最佳唱作專輯獎《和自己對話》、 年度暢銷港台數字專輯獎《和自己對話》</li>
                            <li>第6屆全球流行音樂年度盛典－年度最佳男歌手獎、年度最受歡迎專輯獎《和自己對話》、年度20大金曲獎《不為誰而作的歌》</li>
                            <li>第4屆音悅V榜年度盛典－港台最佳男歌手獎</li>
                            <li>第20屆全球華語音樂榜中榜－港台最佳專輯獎《和自己對話》、亞洲影響力最受歡迎歌手獎</li>
                            <li>第14屆MusicRadio中國TOP排行榜－港台地區年度最佳男歌手獎、港台地區年度最佳唱片獎《和自己對話》、年度金曲獎《不為誰而作的歌》</li>
                            <li>第14屆台灣Hito流行音樂獎－Hito製作人獎、Hito男歌手獎、年度華語十大歌曲獎《可惜沒如果》</li>
                            <li>第9屆城市至尊音樂榜－年度20大金曲獎《不為誰而作的歌》、年度至尊男歌手獎</li>
                            <li>第27屆流行音樂金曲獎－演唱類最佳作曲人獎《不為誰而作的歌》、最佳國語男歌手獎《和自己對話》</li>
                        </ul>
                        <h4>2015</h4>
                        <ul>
                            <li>加拿大至HIT中文歌曲排行榜－國語推崇作曲人獎</li>
                            <li>第10屆KKBOX風雲榜－十大風雲歌手獎</li>
                            <li>第02屆QQ音樂年度盛典－港台年度最佳音樂製作人獎、最受歡迎港台男歌手獎、港台年度最佳國語專輯獎《新地球GENESIS》</li>
                            <li>第15屆音樂風雲榜年度盛典－十大金曲獎《可惜沒如果》</li>
                            <li>第3屆音悅V榜年度盛典－港台最佳製作人獎、港台最佳男歌手獎</li>
                            <li>第5屆全球流行音樂金榜－年度最佳製作人獎《新地球》、年度最受歡迎男歌手獎、UFM100.3推崇大獎、年度20大金曲獎《新地球》</li>
                        </ul>

                        <h4>2014</h4>
                        <ul>
                            <li>第09屆KKBOX數位音樂風雲榜－華語百大專輯獎《因你而在 Stories Untold》、十大風雲歌手獎</li>
                            <li>第01屆QQ音樂年度盛典－年度最佳國語專輯獎《因你而在 Stories Untold》、港台最佳男歌手獎</li>
                            <li>第04屆全球流行音樂金榜－年度進榜最久冠軍歌曲獎《修煉愛情》 、年度20大金曲《修煉愛情》、HIT FM聯播網年度點播冠軍《修煉愛情》</li>
                            <li>第3屆音悅V榜年度盛典－最佳創作歌手獎港台最佳男歌手獎、最具影響力歌手獎、最佳專輯獎 《因你而在 Stories Untold》</li>
                            <li>第12屆MusicRadio中國TOP排行榜－年度最佳金曲獎《修煉愛情》、港台年度最佳男歌手獎、年度最受歡迎唱片《因你而在 Stories Untold》</li>
                            <li>第06屆新加坡e樂大賞－最佳本地專輯獎《因你而在 Stories Untold》、人氣本地歌手獎、 最佳男歌手獎</li>
                            <li>第12屆台灣Hito流行音樂獎－2013年度百首單曲獎《修煉愛情》、 年度十大華語歌曲獎《修煉愛情》、最佳男歌手獎</li>
                            <li>第01屆城市至尊音樂盛典－年度20大金曲獎《修煉愛情》、年度至尊男歌手獎、平面傳媒推薦年度最佳製作人獎、聯盟台點播冠軍王</li>
                            <li>中華音樂人交流協會－2013年度十大單曲獎《黑暗騎士》</li>
                            <li>第25屆台灣金曲獎－最佳國語男歌手獎</li>
                            <li>第19屆 新加坡詞曲版權協會獎－最佳本地歌手獎、最佳本地歌曲創作人獎</li>
                            <li>第16屆Mnet Asian Music Awards－新加坡最佳亞洲藝人獎</li>
                            <li>台灣iTunes－年度最佳藝人獎</li>
                            <li>新加坡iTunes－年度最佳藝人獎</li>
                        </ul>

                        <h4>2013</h4>
                        <ul>
                            <li>第8屆KKBOX數位音樂風雲榜－年度十大風雲歌手獎</li>
                            <li>東方風雲榜20年盛典－亞洲人氣歌手獎、華語五強之新加坡最受歡迎歌手獎</li>
                            <li>第1屆音悅台V榜年度盛典－最佳男歌手獎、最佳創作歌手獎、最佳製作人獎、現場人氣歌手獎、年度MV獎</li>
                            <li>第11屆台灣Hito流行音樂頒獎典禮－最佳男歌手獎、最佳製作人獎、年度K歌獎(學不會)、年度十大金曲獎</li>
                            <li>新城國語力頒獎禮－新城國語力歌曲獎《修煉愛情》、新城國語力年度歌曲獎《零度的親吻》、新城國語力年度專輯獎《因你而在》、新城國語力全球最受歡迎歌手大獎</li>
                        </ul>
                        <h4>2012</h4>
                        <ul>
                            <li>第16屆全球華語榜中榜頒獎盛典－臺灣最佳男歌手獎、港臺最佳創作歌手獎</li>
                            <li>MusicRadio中國TOP排行榜－最佳製作人獎、港台最佳男歌手獎、最佳作曲獎《學不會》、10大金曲獎《學不會》</li>
                            <li>第10屆台灣Hito流行音樂頒獎典禮－hito男歌手獎、hito最長壽專輯獎《她說》、hito年度華語歌曲獎《她說》</li>
                            <li>新加坡e樂大賞－最佳人氣本地歌手獎、最佳本地歌手獎、全方位藝人獎</li>
                            <li>新城國語力頒奬禮－亞洲人氣偶像獎、製作人大奬、亞洲創作歌手獎、熱爆K歌獎《學不會》</li>
                        </ul>
                        <h4>2011</h4>
                        <ul>
                            <li>第1屆全球流行音樂金榜－年度最佳製作人獎《她說》、年度最佳創作歌手獎、新加坡電台1003推崇大獎、年度20大金曲獎(第幾個100天)</li>
                        </ul>
                        <h4>2010</h4>
                        <ul>
                            <li>第9屆雪碧音樂榜－最佳男歌手獎、最佳創作歌手獎、年度金曲獎《第幾個100天》、最完美情歌合唱獎</li>
                            <li>新加坡e樂大賞－本地人氣歌手獎、本地最佳製作人獎、人氣MV獎娛樂沸點最熱門十大金曲獎《小酒窩》</li>
                            <li>第16屆東方風雲榜華語五強－新加坡地區</li>
                            <li>2008年度華語音樂聯盟－年度最佳作曲人獎《小酒窩》</li>
                            <li>第10屆全球華語歌曲排行榜－年度二十大金曲獎《背對背擁抱》</li>
                            <li>第15屆新加坡詞曲版權協會頒獎禮－最佳本地歌手獎、最佳本地歌曲創作人獎</li>
                            <li>第8屆東南勁爆榜頒獎典禮－勁爆港台地區最佳唱作歌手獎、勁爆最佳專輯獎《JJ林俊傑_100天》</li>
                        </ul>
                        <h4>2009</h4>
                        <ul>
                            <li>MusicRadio中國TOP排行榜－港台最受歡迎新人獎、最佳作曲獎《放手》</li>
                            <li>潮流盛典頒獎禮－年度潮牌掌柜獎年度潮流價值人物獎</li>
                            <li>2008年北京流行音樂典禮（中歌榜）－港台年度最佳專輯獎《JJ陸》、年度金曲獎《小酒窩》</li>
                            <li>中國TOP排行榜－港台年度金曲獎《小酒窩》、港台年度最佳編曲獎 林俊傑/KennC《不潮不用花錢》</li>
                            <li>騰訊新生代娛樂大明星－80後四大潮人獎：林俊傑（另外三位為陳冠希、羅志祥和林正豪）</li>
                            <li>第2屆城市之音至尊金榜－年度最佳合唱單曲金獎《小酒窩》</li>
                            <li>第14屆加坡詞曲版權協會頒獎禮－最佳獅城歌手獎、年度最佳獅城歌曲創作人獎、最佳獅城配樂獎《自由不變》（東海戰）</li>
                            <li>第15屆新加坡金曲獎－最佳本地歌手獎</li>
                            <li>2008年度十大勁歌金曲頒獎典禮－最受歡迎華語歌曲獎銀獎《小酒窩》（與蔡卓妍合唱）</li>
                        </ul>
                        <h4>2008</h4>
                        <ul>
                            <li>2007北京流行音樂典禮－年度最佳舞台演繹男歌手獎、最佳金曲獎《西界》</li>
                            <li>第13屆新加坡詞曲版權協會－最佳本地創作人獎</li>
                            <li>第1屆中國海西時尚娛樂盛典－時尚亞洲傑出藝人大獎</li>
                        </ul>
                        <h4>2007</h4>
                        <ul>
                            <li>2006年度雪碧中國大陸原創音樂流行榜－港台金曲獎《曹操》</li>
                            <li>第2屆北京流行音樂典禮－年度最受歡迎男歌手獎、年度最佳專輯獎《曹操》、年度金曲獎《曹操》、年度最佳製作人獎、唱作真英雄獎</li>
                            <li>第12屆新加坡詞曲版權協會頒獎禮－最佳本地歌手獎、最佳本地影劇歌曲獎《被風吹過的夏天》</li>
                            <li>2006音樂之聲TOP榜的頒獎禮－最佳唱片銷售男歌手獎《曹操》</li>
                            <li>新城國語力頒獎禮－新城國語力舞台大獎、新城國語力歌曲獎《殺手》、新城國語力熱爆K歌獎《只對你有感覺》</li>
                            <li>新加坡金曲獎－最佳本地歌手獎《西界》</li>
                        </ul>
                        <h4>2006</h4>
                        <ul>
                            <li>臺灣Hito流行音樂獎－新加坡HITO海外歌手獎、HITO十大華語歌曲獎《簡簡單單》</li>
                            <li>第11屆新加坡詞曲版權協會頒獎禮－最佳本地青年詞曲作者獎</li>
                            <li>第6屆全球華語歌曲排行榜頒獎典禮－年度二十首金曲獎《曹操》、最受歡迎創作歌手獎</li>
                        </ul>
                        <h4>2005</h4>
                        <ul>
                            <li>第5屆百事音樂風雲榜－十大金曲獎</li>
                            <li>第2屆勁歌王總選頒獎典禮－十大國語金曲獎《江南》、勁歌唱作人王、網絡人氣男歌手獎</li>
                            <li>第5屆全球華語歌曲排行榜頒獎典禮－年度二十五首金曲獎、最佳專輯獎《編號89757》、最受歡迎創作歌手獎、新加坡最佳傑出藝人獎</li>
                            <li>新加坡金曲獎－最佳演繹男歌手獎、最佳創作歌手獎、最佳本地男歌手獎、最佳本地作曲獎《編號89757》《一千年以後》</li>
                            <li>福建東南勁爆榜－最佳唱作人獎、最受歡迎男歌手獎、十大金曲獎《一千年以後》</li>
                            <li>MusicRadio中國TOP排行榜－港台最受歡迎男歌手獎、港台年度最佳作曲獎《一千年以後》</li>
                        </ul>
                        <h4>2004</h4>
                        <ul>
                            <li>第15屆台灣金曲獎－最佳新人獎</li>
                            <li>第4屆全球華語歌曲排行榜頒獎典禮－年度二十首金曲獎《江南》</li>
                            <li>中國原創歌曲獎－港台最受歡迎男歌手獎、海外最佳創作人獎、最佳編曲《第二天堂》、最佳製作獎</li>
                            <li>MusicRadio中國TOP排行榜－港台年度最佳作曲獎《江南》、港台年度最佳創作歌手獎、港台年度金曲獎《江南》</li>
                            <li>2004年度十大中文金曲獎－全國最受歡迎中文歌曲獎銀獎《江南》</li>
                        </ul>
                        <h4>2003</h4>
                        <ul>
                            <li>第3屆馬來西亞金曲紅人頒獎典禮－最有潛質新人獎</li>
                            <li>第10屆新加坡金曲獎－最佳新人獎</li>
                            <li>第1屆台灣Hito流行音樂獎－第二季Hito十大金曲《翅膀》</li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-12 col-sm-12 col-xs-12 nopadding box" data-id="5">
                    <div class="col-md-5 col-sm-12 col-xs-12 nopaddingLeft left imgbox">
                        <img src="${App_Path}/static/img/pic2.png">
                    </div>
                    <div class="col-md-7 col-sm-12 col-xs-12 right content">
                        <h4>電視劇</h4>
                        <ul>
                            <li>主要演出：莊俊維（原來我不帥，2008年）</li>
                            <li>客串演出：盧靜希（女主角瑞莃的哥哥）（花樣少年少女第6、7集，2006年）</li>
                        </ul>
                        <h4>音樂電影[編輯]</h4>

                        <ul>
                            <li>《殺手》（領銜主演：林俊傑、楊俐思（Liz），導演：比爾賈，片長：25分鐘，2007年）[8]</li>
                            <li>《她說》（傅天余替影像和故事腳本操刀製作，與簡嫚書演出對角戲，2010年）</li>
                            <li>《因你 而在》（導演：《逆光飛翔》導演張榮吉，攝影指導：Dylan Doyle 女主演：香港影壇天后蔡卓妍，2013年）</li>
                            <li>《修煉愛情》（金曲獎最佳導演徐筠軒首度執導音樂動畫作品，林俊傑和郭采潔一同配音，2013年）</li>
                            <li>《黑暗騎士》（領銜主演：林俊傑、阿信、紀培慧，導演：比爾賈，2013年）</li>
                            <li>《裂縫中的陽光》（領銜主演：林俊傑、張嘉年，導演：珍妮花，2013年）</li>
                            <li>《零度的親吻》（領銜主演：林俊傑、王詩安，導演：徐筠庭，2013年）</li>
                            <li>《飛機》（領銜主演：林俊傑、林俊峰，導演：陳映之，2013年）</li>
                            <li>《友人說》（領銜主演：林俊傑、張懷秋，導演：David Barker ，2013年）</li>
                            <li>《One Shot》（領銜主演：林俊傑、張家慧、黃建瑋、賈孝國，導演：廖明毅，2013年）</li>
                            <li>《十秒的衝動》（領銜主演：林俊傑、張卓楠、曾愷弦，導演：傅天余，2013年）</li>
                            <li>《以後要做的事》（領銜主演：林俊傑、路嘉欣、徐華謙，導演：陳映蓉，2013年）</li>
                            <li>《可惜沒如果》（領銜主演：林俊傑、Angelababy、張懷秋，導演：陳映蓉，2014年）</li>
                        </ul>
                        <h4>配音</h4>
                        <ul>
                            <li>2007年，動畫電影《東海戰》（角色：小龍王）</li>
                        </ul>
                        <h4>電影配樂</h4>
                        <ul>
                            <li>2016年，電影《消失的愛人》〔演唱其電影主題曲（只要有你的地方））</li>
                            <li>2011年，電影《夏日樂悠悠》（亦演唱電影主題曲〈Love U U〉，與Angelababy合唱電影插曲〈海底之心〉）</li>
                        </ul>
                        <h4>廣播劇</h4>
                        <ul>
                            <li>2009年1月，海蝶群星廣播劇《歡喜年年新春》（演出：林俊傑、Golf &amp; Mike、菲比、林宇中、李志清、By2等人）</li>
                            <li>2008年6月，手機音樂廣播劇《勇敢期待》（演出：林俊傑）</li>
                            <li>2007年9月8日，《幸福的起點》</li>
                            <li>2007年，《西界戀曲》（MyFm台慶廣播劇，演出：林宇中、林俊傑、菲比）</li>
                            <li>2006年9月，《錯亂J時空》</li>
                            <li>2005年，《你找到他了嗎》（演出：林俊傑、金莎）</li>
                        </ul>
                        <h4>音樂愛情故事</h4>
                        <ul>
                            <li>2006年，被風吹過的夏天（與金莎）</li>
                            <li>2005年，西瓜牛奶（與王心凌）</li>
                            <li>2005年，100分的戀人（與王心凌）</li>
                            <li>2005年，微笑夢幻（JJ filmed this 2005 under the theme of Down Lately）</li>
                            <li>2004年，林俊傑L.A.的愛情故事</li>
                        </ul>
                        <h4>電影</h4>
                        <ul>
                            <li>2016年，首部個人音樂紀實電影《《聽・見 林俊傑 If Miracles Had a Sound》音樂紀實電影》</li>
                            <li>2016年，主演電影《消失的愛人》（並為其電影製作主題曲《只要有你的地方》）</li>
                            <li>2015年，客串演出《大囍臨門》</li>
                        </ul>
                        <h4>綜藝節目</h4>
                        <ul>
                            <li>2016年《快樂大本營》20160123</li>
                            <li>2016年《我是歌手第四季》總決賽第一輪 徐佳瑩幫唱嘉賓</li>
                            <li>2016年《誰是大歌神》第三期「大歌神」</li>
                            <li>2015年《中國好聲音》（第四季）第九期「夢想導師」第十四期 嘉賓</li>
                            <li>2015年《快樂大本營》20151003</li>
                            <li>2015年《快樂大本營》20150718</li>
                            <li>2014年《我是歌手第二季》總決賽第一輪 張杰幫唱嘉賓</li>
                            <li>2014年《奔跑吧兄弟第1季》第十一期 嘉賓</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script type="text/javascript">
    $(document).on('click', 'section.content.page-biography .linkbox ul li a', function () {
        var tmpid = $(this).parent().attr('data-id');
        $('section.content.page-biography .linkbox ul li a').removeClass('active');
        $(this).addClass('active');
        $('section.content.page-biography .contentbox .box').removeClass('active');
        $('section.content.page-biography .contentbox .box[data-id="' + tmpid + '"]').addClass('active');
    });
</script>
</body>
</html>
