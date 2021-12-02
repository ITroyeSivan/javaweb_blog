<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head><meta name="generator" content="Hexo 3.9.0">
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">

    <title itemprop="name">CircleYes!</title>
    <%
        String context = request.getContextPath();
    %>
    <link rel="shortcut icon" href="<%=context %>/img/favicon.ico">
    <meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"
          name="viewport">
    <link rel="shortcut icon" href="<%=context %>/img/favicon.ico"/>
    <link rel="stylesheet" href="<%=context %>/css/blog.css"/>
    <link rel="stylesheet" href="<%=context %>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=context %>/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=context %>/css/pagination.css">
    <script src="<%=context %>/js/jquery.min.js"></script>
    <script src="<%=context %>/js/blog.js"></script>
    <script src="<%=context %>/js/bootstrap.min.js"></script>
    <script src="<%=context %>/js/jquery.pagination.js"></script>
    <style type="text/css">
        a:link {
            text-decoration: none;
        }

        a:visited {
            text-decoration: none;
        }

        a:hover {
            text-decoration: none;
        }

        a:active {
            text-decoration: none;
        }
    </style>
    <script>
        // 点击分页按钮以后触发的动作
        function handlePaginationClick(new_page_index, pagination_container) {
            $("#postForm").attr("action", "<%=context %>/servlet/PostlistServlet?role=0&pageNum=" + (new_page_index + 1));
            $("#postForm").submit();
            return false;
        };
        $(function () {
            $("#News-Pagination").pagination(${result.totalRecord}, {
                items_per_page:${result.pageSize}, // 每页显示多少条记录
                current_page: ${result.currentPage} -1, // 当前显示第几页数据
                num_display_entries: 3, // 分页显示的条目数
                next_text: "下一页",
                prev_text: "上一页",
                num_edge_entries: 2, // 连接分页主体，显示的条目数
                callback: handlePaginationClick
            });
        })
    </script>
    <meta http-equiv="x-dns-prefetch-control" content="on">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+SerifMerriweather|Merriweather+Sans|Source+Code+Pro|Ubuntu:400,700|Noto+Serif+SC" media="all">
    <link rel="dns-prefetch" href="//cdn.jsdelivr.net">
    <link rel="stylesheet" id="saukra_css-css" href="<%=context %>/css/style.css" type="text/css" media="all">
    <link rel="stylesheet" href="<%=context %>/css/lib.min.css" media="all">
    <link rel="stylesheet" href="<%=context %>/css/font.css" media="all">
    <link rel="stylesheet" href="<%=context %>/css/insight.css" media="all">
    <link rel="stylesheet" href="<%=context %>/css/jquery.fancybox.min.css" media="all">
    <link rel="stylesheet" href="<%=context %>/css/zoom.css" media="all">
    <link rel="stylesheet" type="text/css" href="<%=context %>/css/sharejs.css">
    <!--   <link rel="stylesheet" id="saukra_css-css" href="https://2heng.xin/wp-content/cache/autoptimize/css/autoptimize_ad42a61f4c7d4bdd9f91afcff6b5dda5.css
    " type="text/css" media="all"> -->
    <script>
        /*Initial Variables*/
        var mashiro_option = new Object();
        var mashiro_global = new Object();
        mashiro_option.NProgressON = true;
        /*
         * 邮箱信息之类的东西可以填在这里，这些js变量基本都作用于sakura-app.js
         * 这样的设置仅是为了方便在基于PHP开发的主题中设置js变量，既然移植到了Node上，我想或许可以精简这一逻辑吧
         */
        mashiro_option.email_domain = "";
        mashiro_option.email_name = "";
        mashiro_option.cookie_version_control = "";
        mashiro_option.qzone_autocomplete = false;
        // mashiro_option.site_name = "YukinoTroy3e";
        mashiro_option.author_name = "Troy3e";
        mashiro_option.site_url = "https://troyess.com";
        mashiro_option.v_appId = "kEnVX5WKqd0JPt4srHAJkgsC-gzGzoHsz";
        mashiro_option.v_appKey = "h05kFRgBHS516pQ6vIsYtG1B";
        mashiro_option.mathjax = "0";
        mashiro_option.qq_api_url = "https://api.mashiro.top/qqinfo/";
        mashiro_option.qq_avatar_api_url = "https://api.mashiro.top/qqinfo/";

        // mashiro_option.jsdelivr_css_src = "https://cdn.jsdelivr.net/gh/moezx/cdn@3.4.5/css/lib.min.css";
        // mashiro_option.float_player_on = true;

        /*End of Initial Variables*/
    </script>
    <script type="text/javascript">
        var bg = "https://cdn.jsdelivr.net/gh/ITroyeSivan/picture/blogpictures/thumb-1920-972788.jpg,https://cdn.jsdelivr.net/gh/ITroyeSivan/picture/blogpictures/nfsgnftn.jpg,https://cdn.jsdelivr.net/gh/ITroyeSivan/picture/blogpictures/thumb-1920-994295.png".split(",");
        var bgindex = Math.floor(Math.random()*bg.length);
        if (!!window.ActiveXObject || "ActiveXObject" in window) { //is IE?
            alert('朋友，IE浏览器未适配哦~');
        }
    </script>
    <style type="text/css">
        .hljs-ln{border-collapse:collapse}.hljs-ln td{padding:0}.hljs-ln-n:before{content:attr(data-line-number)}
    </style>
    <style type="text/css">.site-top .lower nav{display:block !important;}.author-profile i,.post-like a,.post-share .show-share,.sub-text,.we-info a,span.sitename,.post-more i:hover,#pagination a:hover,.post-content a:hover,.float-content i:hover{color:#FE9600}.feature i,.download,.navigator i:hover,.links ul li:before,.ar-time i,span.ar-circle,.object,.comment .comment-reply-link,.siren-checkbox-radio:checked + .siren-checkbox-radioInput:after{background:#FE9600}::-webkit-scrollbar-thumb{background:#FE9600}.download,.navigator i:hover,.link-title,.links ul li:hover,#pagination a:hover,.comment-respond input[type='submit']:hover{border-color:#FE9600}.entry-content a:hover,.site-info a:hover,.comment h4 a,#comments-navi a.prev,#comments-navi a.next,.comment h4 a:hover,.site-top ul li a:hover,.entry-title a:hover,#archives-temp h3,span.page-numbers.current,.sorry li a:hover,.site-title a:hover,i.iconfont.js-toggle-search.iconsearch:hover,.comment-respond input[type='submit']:hover{color:#FE9600}.comments .comments-main{display:block !important;}.comments .comments-hidden{display:none !important;}background-position:center center;background-attachment:inherit;}
    </style>
</head>
</html>
<script src="https://cdn.jsdelivr.net/gh/wallleap/cdn/js/sakura.js"></script>
<body class="page-template page-template-user page-template-page-analytics page-template-userpage-analytics-php page page-id-1297 chinese-font serif isWebKit">
<%--<div class="scrollbar" id="bar1">--%>
<%--</div>--%>
<a href="#" class="cd-top faa-float animated"></a>
<section id="main-container">
    <div class="headertop ">
        <div id="banner_wave_1"></div>
        <div id="banner_wave_2"></div>
        <figure id="centerbg" class="centerbg">
            <div class="focusinfo no-select">
                <div class="header-tou">
                    <a href="https://troyess.com">
                        <img src="<%=context %>/img/avatar.jpg">
                    </a>
                </div>
                <div class="header-info">
                    <p>Troy3e blog</p>
                    <div class="top-social_v2">
                        <li id="bg-pre">
                            <img class="flipx" src="https://cdn.jsdelivr.net/gh/honjun/cdn@1.6/img/other/next-b.svg">
                        </li>



                        <li>
                            <a href="https://space.bilibili.com/129300391" target="_blank" class="social-github" title="bilibili">
                                <img src="https://cdn.jsdelivr.net/gh/ITroyeSivan/picture/blogpictures/1188649.jpg">
                            </a>
                        </li>



                        <li id="bg-next">
                            <img src="https://cdn.jsdelivr.net/gh/honjun/cdn@1.6/img/other/next-b.svg">
                        </li>
                    </div>
                </div>
            </div>
        </figure>
        <div id="video-container" style="">
            <video style="object-fit: fill" id="bgvideo" class="video" video-name="" src="" width="auto" preload="auto">
            </video>
            <div id="video-btn" class="loadvideo videolive">
            </div>
            <div id="video-add">
            </div>
            <div class="video-stu">
            </div>
        </div>
        <div class="headertop-down faa-float animated" onclick="headertop_down()">
    <span>
      <i class="fa fa-chevron-down" aria-hidden="true">
      </i>
    </span>
        </div>
    </div>
    <div id="page" class="site wrapper">
<%--        <header class="site-header no-select gizle sabit" role="banner">--%>
<%--            <div class="site-top">--%>
<%--                <div class="site-branding">--%>
<%--&lt;%&ndash;      <span class="site-title">&ndash;%&gt;--%>
<%--&lt;%&ndash;        <span class="logolink moe-mashiro">&ndash;%&gt;--%>
<%--&lt;%&ndash;          <a href="/">&ndash;%&gt;--%>
<%--&lt;%&ndash;            <span class="sakurasono">Yukino</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <span class="shironeko">Troy3e</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;          </a>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </span>&ndash;%&gt;--%>
<%--&lt;%&ndash;      </span>&ndash;%&gt;--%>
<%--                </div>--%>
<%--                <div class="searchbox search-form-submit">--%>
<%--                    <i class="iconfont js-toggle-search iconsearch icon-search">--%>
<%--                    </i>--%>
<%--                </div>--%>
<%--                <div id="show-nav" class="showNav mobile-fit">--%>
<%--                    <div class="line line1">--%>
<%--                    </div>--%>
<%--                    <div class="line line2">--%>
<%--                    </div>--%>
<%--                    <div class="line line3">--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--&lt;%&ndash;                <div class="lower-cantiner">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <div class="lower">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <nav class="mobile-fit-control hide">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <ul id="menu-new" class="menu">&ndash;%&gt;--%>

<%--&lt;%&ndash;                                <li>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <a href="/">&ndash;%&gt;--%>
<%--&lt;%&ndash;                  <span class="faa-parent animated-hover">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <i class="fa  fa-fort-awesome faa-shake" aria-hidden="true"></i>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    首页&ndash;%&gt;--%>
<%--&lt;%&ndash;                  </span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    </a>&ndash;%&gt;--%>

<%--&lt;%&ndash;                                </li>&ndash;%&gt;--%>

<%--&lt;%&ndash;                                <li>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <a href="/archives">&ndash;%&gt;--%>
<%--&lt;%&ndash;                  <span class="faa-parent animated-hover">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <i class="fa  fa-archive faa-shake" aria-hidden="true"></i>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    归档&ndash;%&gt;--%>
<%--&lt;%&ndash;                  </span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    </a>&ndash;%&gt;--%>

<%--&lt;%&ndash;                                    <ul class="sub-menu">&ndash;%&gt;--%>

<%--&lt;%&ndash;                                    </ul>&ndash;%&gt;--%>

<%--&lt;%&ndash;                                </li>&ndash;%&gt;--%>

<%--&lt;%&ndash;                            </ul>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </nav>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </div>&ndash;%&gt;--%>
<%--            </div>--%>
<%--        </header>--%>

<%--        <div class="pattern-center-blank"></div>--%>

        <div class="pattern-center ">
            <div class="pattern-attachment-img">
                <img src="<%=context %>/img/bbsbg.jpg" data-src="https://cdn.jsdelivr.net/gh/honjun/cdn@1.4/img/banner/comment.jpg" class="lazyload" onerror="imgError(this,3)" style="width: 100%; height: 100%; object-fit: cover; pointer-events: none;">
            </div>
            <header class="pattern-header ">
                <h1 class="entry-title">
                    留言板</h1>
            </header>
        </div>

        <div id="content" class="site-content">
            <article class="post-item post-301 page type-page status-publish has-post-thumbnail hentry">

                <div class="entry-content">
                    <div class="poem-wrap">
                        <div class="poem-border poem-left">
                        </div>
                        <div class="poem-border poem-right">
                        </div>
                        <h1>
                            念两句诗</h1>
                        <p id="poem">
                            叙别梦、扬州一觉。</p>
                        <p id="info">
                            【宋代】吴文英《夜游宫·人去西楼雁杳》</p>
                    </div>
                </div>

                <!-- .entry-content -->

                <div id="vcomments"></div>
                <script>
                    window.onload = function(){
                        var valine = new Valine();
                        valine.init({
                            el: '#vcomments',
                            appId: "kEnVX5WKqd0JPt4srHAJkgsC-gzGzoHsz",
                            appKey: "h05kFRgBHS516pQ6vIsYtG1B",
                            path: window.location.pathname,
                            placeholder: "你是我一生只会遇见一次的惊喜 ..."
                        })
                    }
                </script>

                <div class="single-reward">
                    <div class="reward-open">赏
                        <div class="reward-main">
                            <ul class="reward-row">
                                <li class="alipay-code"><img src="https://cdn.jsdelivr.net/gh/ITroyeSivan/picturenull"></li>
                                <li class="wechat-code"><img src="https://cdn.jsdelivr.net/gh/ITroyeSivan/picture/blogpictures/wechat.jpg"></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div style="text-align:center; width: 100%" class="social-share share-mobile" data-disabled="diandian, tencent"></div>
                <footer class="post-footer">
                    <div class="post-lincenses"><a href="https://creativecommons.org/licenses/by-nc-sa/4.0/deed.zh" target="_blank" rel="nofollow"><i class="fa fa-creative-commons" aria-hidden="true"></i> 知识共享署名-非商业性使用-相同方式共享 4.0 国际许可协议</a></div>
                    <div class="post-tags">
                    </div>
                    <div class="post-share">
                        <div class="social-share sharehidden share-component"></div>
                        <i class="iconfont show-share icon-forward"></i>
                    </div>
                </footer><!-- .entry-footer -->
            </article>
            <!-- #post-## -->
            <section class="author-profile">
                <div class="info" itemprop="author" itemscope="" itemtype="http://schema.org/Person">
                    <a href="/about/" class="profile gravatar"><img src="https://cdn.jsdelivr.net/gh/ITroyeSivan/picture/blogpictures/thumb-1920-1184384.jpg" itemprop="image" alt="Troy3e" height="70" width="70"></a>
                    <div class="meta">
                        <span class="title">Author</span>
                        <h3 itemprop="name">
                            <a href="https://troyess.com" itemprop="url" rel="author">Troy3e</a>
                        </h3>
                    </div>
                </div>
                <hr>
                <p><i class="iconfont icon-write"></i>Troy3e blog</p>
            </section>
        </div><!-- #primary -->
    </div>
    </div>
    <div class="ins-search">
        <div class="ins-search-mask"></div>
        <div class="ins-search-container">
            <div class="ins-input-wrapper">
                <input type="text" class="ins-search-input" placeholder="请输入关键词..."/>
                <span class="ins-close ins-selectable"><i class="fa fa-times-circle"></i></span>
            </div>
            <div class="ins-section-wrapper">
                <div class="ins-section-container"></div>
            </div>
        </div>
    </div>
    <script>
        (function (window) {
            var INSIGHT_CONFIG = {
                TRANSLATION: {
                    POSTS: '文章',
                    // PAGES: '页面',
                    CATEGORIES: '分类',
                    TAGS: '标签',
                },
                ROOT_URL: '/',
                CONTENT_URL: '/content.json',
            };
            window.INSIGHT_CONFIG = INSIGHT_CONFIG;
        })(window);
    </script>
    <!-- <footer id="footer">

  <div class="outer">
    <div id="footer-info" class="inner">
      &copy; 2021 Troye<br>
      powered_by <a href="http://hexo.io/" target="_blank">Hexo</a>
    </div>
  </div>
</footer> -->
    <footer id="colophon" class="site-footer" role="contentinfo">
        <div class="site-info">
            <div class="footertext">
                <div class="img-preload">
                    <img src="https://cdn.jsdelivr.net/gh/honjun/cdn@1.6/img/other/wordpress-rotating-ball-o.svg">
                    <img src="https://cdn.jsdelivr.net/gh/honjun/cdn@1.6/img/other/disqus-preloader.svg">
                </div>
                <p style="color: #666666;">&copy 2018</p>
            </div>
            <div class="footer-device">
                <p style="font-family: 'Ubuntu', sans-serif;">
        <span style="color: #b9b9b9;">Theme <a href="https://github.com/honjun/hexo-theme-sakura" target="_blank" style="color: #b9b9b9;;text-decoration: underline dotted rgba(0, 0, 0, .1);">Sakura</a> <i class="iconfont icon-sakura rotating" style="color: #ffc0cb;display:inline-block"></i> by <a href="https://2heng.xin/" target="_blank" style="color: #b9b9b9;;text-decoration: underline dotted rgba(0, 0, 0, .1);">Mashiro</a>&<a href="https://www.hojun.cn/" target="_blank" style="color: #b9b9b9;;text-decoration: underline dotted rgba(0, 0, 0, .1);">Hojun</a>, Powered by Hexo, Hosted by Coding Pages</a>
        </span>
                </p>
            </div>
        </div><!-- .site-info -->
    </footer>



    <!-- <script src="/js/tocbot.js"></script> -->
    <script type="text/javascript" src="/js/lib.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/clipboard@2/dist/clipboard.min.js"></script>
    <script type="text/javascript" src="/js/InsightSearch.js"></script>
    <script type="text/javascript" src="/js/jquery.fancybox.min.js"></script>
    <script type="text/javascript" src="/js/zoom.min.js"></script>
    <script type="text/javascript" src="/js/sakura-app.js"></script>
    <script src="//cdn1.lncld.net/static/js/3.0.4/av-min.js"></script>
    <script src='//unpkg.com/valine@1.3.4/dist/Valine.min.js'></script>
    <script src="/js/botui.js"></script>
    <!-- 不蒜子 网页计数器 -->
    <script src="//busuanzi.ibruce.info/busuanzi/2.3/busuanzi.pure.mini.js"></script>
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/tocbot/4.4.2/tocbot.min.js"></script> -->
    <script type="text/javascript">
        /* <![CDATA[ */
        if (/Android|webOS|iPhone|iPod|BlackBerry/i.test(navigator.userAgent)) {
            var Poi = {"pjax":"1","movies":{"url": "https://cdn.jsdelivr.net/gh/ITroyeSivan/picture/blogpictures","name":"love.mp4","live":"close"},"windowheight":"fixed","codelamp":"close","ajaxurl":"","order":"asc","formpostion":"bottom"};
        } else {
            var Poi = {"pjax":"1","movies":{"url": "https://cdn.jsdelivr.net/gh/ITroyeSivan/picture/blogpictures","name":"love.mp4","live":"open"},"windowheight":"auto","codelamp":"close","ajaxurl":"","order":"asc","formpostion":"bottom"};
        }
        /* ]]> */

    </script>
    <script>
        $(document).ready(function() {
            if ($(".toc").length > 0 && document.body.clientWidth > 1200) {
                if ($(".pattern-center").length > 0) { //有图的情况
                    tocbot.init({
                        // Where to render the table of contents.
                        tocSelector: '.toc', // 放置目录的容器
                        // Where to grab the headings to build the table of contents.
                        contentSelector: '.entry-content', // 正文内容所在
                        // Which headings to grab inside of the contentSelector element.
                        scrollSmooth: true,
                        headingSelector: 'h1, h2, h3, h4, h5', // 需要索引的标题级别
                        headingsOffset: -400,
                        scrollSmoothOffset: -85
                    });
                } else {
                    tocbot.init({
                        // Where to render the table of contents.
                        tocSelector: '.toc', // 放置目录的容器
                        // Where to grab the headings to build the table of contents.
                        contentSelector: '.entry-content', // 正文内容所在
                        // Which headings to grab inside of the contentSelector element.
                        scrollSmooth: true,
                        headingSelector: 'h1, h2, h3, h4, h5', // 需要索引的标题级别
                        headingsOffset: -85,
                        scrollSmoothOffset: -85
                    });
                }
                var offsetTop = $('.toc').offset().top - 95;
                window.onscroll = function() {
                    var scrollTop = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop;
                    if (scrollTop >= offsetTop) {
                        $('.toc').addClass('toc-fixed');
                    } else {
                        $('.toc').removeClass('toc-fixed');
                    }
                }
            }
        });
    </script>

    <div class="openNav no-select" style="height: 50px;">
        <div class="iconflat no-select" style="width: 50px; height: 50px;">
            <div class="icon"></div>
        </div>
        <div class="site-branding search-form-submit">
            <i class="iconfont js-toggle-search iconsearch icon-search"></i>
        </div>
    </div>
</section>
<div id="mo-nav" class="">
    <div class="m-avatar">
        <img src="https://cdn.jsdelivr.net/gh/ITroyeSivan/picture/blogpictures/thumb-1920-1184384.jpg">
    </div>
<%--    <p style="text-align: center; color: #333; font-weight: 900; font-family: 'Ubuntu', sans-serif; letter-spacing: 1.5px">YukinoTroy3e</p>--%>
    <p style="text-align: center; word-spacing: 20px;">


        <a href="http://github.com/honjun" class="fa fa-github" target="_blank" style="color: #333; margin-left:20px"></a>

        <a href="http://weibo.com/mashirozx?is_all=1" class="fa fa-weibo" target="_blank" style="color: #dd4b39; margin-left:20px"></a>

        <a href="https://wpa.qq.com/msgrd?v=3&uin=954655431&site=qq&menu=yes" class="fa fa-qq" target="_blank" style="color: #25c6fe; margin-left:20px"></a>


    </p>
<%--    <ul id="menu-new-1" class="menu">--%>

<%--        <li>--%>
<%--            <a href="/">--%>
<%--          <span class="faa-parent animated-hover">--%>
<%--            <i class="fa  fa-fort-awesome faa-shake" aria-hidden="true"></i>--%>
<%--            首页--%>
<%--          </span>--%>
<%--            </a>--%>

<%--        </li>--%>

<%--        <li>--%>
<%--            <a href="/archives">--%>
<%--          <span class="faa-parent animated-hover">--%>
<%--            <i class="fa  fa-archive faa-shake" aria-hidden="true"></i>--%>
<%--            归档--%>
<%--          </span>--%>
<%--            </a>--%>

<%--            <ul class="sub-menu">--%>

<%--            </ul>--%>

<%--        </li>--%>

<%--    </ul>--%>
    <p style="text-align: center; font-size: 13px; color: #b9b9b9;">&copy 2019 hexo-sakura</p>
</div>
<button onclick="topFunction()" class="mobile-cd-top" id="moblieGoTop" title="Go to top" style="display: none;"><i class="fa fa-chevron-up" aria-hidden="true"></i></button>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/aplayer/dist/APlayer.min.css">
<script src="https://cdn.jsdelivr.net/npm/aplayer/dist/APlayer.min.js"></script>
<!-- require MetingJS -->
<script src="https://cdn.jsdelivr.net/npm/meting@2/dist/Meting.min.js"></script>
<style>
    .aplayer .aplayer-lrc {
        height: 35px;
    }
    .aplayer .aplayer-lrc p{
        font-size: 16px;
        font-weight: 700;
        line-height: 18px !important;
    }
    .aplayer .aplayer-lrc p.aplayer-lrc-current{
        color: #FF1493;
    }
    .aplayer.aplayer-narrow .aplayer-body{
        left: -66px !important;
    }
    .aplayer.aplayer-fixed .aplayer-lrc {
        display: none;
    }
    .aplayer .aplayer-lrc.aplayer-lrc-hide {
        display:none !important;
    }
    .aplayer.aplayer-fixed .lrc-show {
        display: block;
        background: rgba(255, 255, 255, 0.8);
    }
</style>
<meting-js

        id="819057276"

        server="netease"

        type="playlist"

        fixed="true"

        autoplay="false"

        loop="all"

        order="list"

        preload="auto"

        volume="0.7"

        mutex="true"

        listFolded="false"

</meting-js>
<script>
    $(function(){
        $('body').on('click', '.aplayer', function(){
            if($('.aplayer-button').hasClass('aplayer-play')) {
                $('.aplayer-lrc').removeClass('lrc-show');
            } else {
                $('.aplayer-lrc').addClass('lrc-show');
            }
        })
    });
</script>
</body>
</html>