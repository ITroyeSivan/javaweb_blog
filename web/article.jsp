<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>CircleYes!</title>
    <%
        String context = request.getContextPath();
    %>
    <meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"
          name="viewport">
    <link rel="shortcut icon" href="<%=context %>/img/favicon.ico"/>
    <link rel="stylesheet" href="<%=context %>/css/blog.css"/>
    <link rel="stylesheet" href="<%=context %>/css/page.css">
    <link rel="stylesheet" href="<%=context %>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=context %>/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=context %>/css/prism.css">
    <link rel="stylesheet" href="<%=context %>/css/comment.css">
    <script src="<%=context %>/js/jquery.min.js"></script>
    <script src="<%=context %>/js/blog.js"></script>
    <script src="<%=context %>/js/bootstrap.min.js"></script>
    <script src="<%=context %>/js/prism.js"></script>
    <script>
        $(function () {
            // alert("test");
            <%--$.ajax({--%>
            <%--    type: "GET",--%>
            <%--    async: true,--%>
            <%--    url: "<%=context %>/servlet/CommentServlet",--%>
            <%--    data: {--%>
            <%--        "name": name,--%>
            <%--        "content": content--%>
            <%--    },--%>
            <%--    success: function (data) {--%>
            <%--        alert(data);--%>
            <%--        window.location.reload();--%>
            <%--    },--%>
            <%--    error: function () {--%>
            <%--        alert("请求失败");--%>
            <%--    },--%>
            <%--    dataType: "text"--%>
            <%--})--%>
        })
        function sendComment() {
            var name = document.getElementById("name").value;
            var content = document.getElementById("comment").value;
            var article = getQueryVariable("id");
            if (confirm("确定发布评论？")) {
                $.ajax({
                    type: "POST",
                    async: true,
                    url: "<%=context %>/servlet/CommentServlet",
                    data: {
                        "name": name,
                        "content": content,
                        "article": article
                    },
                    success: function (data) {
                        alert(data);
                        window.location.reload();
                    },
                    error: function () {
                        alert("请求错误");
                    },
                    dataType: "text"
                })
            }
        };
        function getQueryVariable(variable)
        {
            var query = window.location.search.substring(1);
            var vars = query.split("&");
            for (var i=0;i<vars.length;i++) {
                var pair = vars[i].split("=");
                if(pair[0] == variable){return pair[1];}
            }
            return(false);
        }
    </script>
</head>
<body>
<div id="bar" class="scrollbar"></div>
<div id="gotop"></div>
<div id="switch">
    <div id="iconfixed">
        <div class="icon"></div>
    </div>
</div>
<div id="left-nav">
    <div class="author-nav">
        <img src="<%=context %>/img/avatar.jpg" alt="个人头像">
    </div>
    <div class="main-nav">
        <ul>
            <a href="<%=context %>/index.html">
                <li>返回主页</li>
            </a>
            <a href="#">
                <li>博客首页</li>
            </a>
            <c:forEach items="${mainCategory}" var="maincatetory">
                <c:if test="${maincatetory.name!='工程'}">
                    <a href="javascript:void(0)" class="havasub">
                        <li>${maincatetory.name }</li>
                    </a>
                    <ul class="submenu">
                        <c:forEach items="${maincatetory.sublist}" var="subcatetory">
                            <a href="PostlistServlet?role=0&sub_id=${subcatetory.id}">
                                <li>
                                        ${subcatetory.name}
                                </li>
                            </a>
                        </c:forEach>
                    </ul>
                </c:if>
            </c:forEach>
            <a href="<%=context %>/servlet/PostlistServlet?role=4&main_id=1">
                <li>工程</li>
            </a>
            <a href="<%=context %>/about.html">
                <li>关于我</li>
            </a>
            <a href="<%=context %>/contact.html">
                <li>联系我</li>
            </a>
            <a href="<%=context %>/servlet/PostlistServlet?role=1">
                <li>控制台</li>
            </a>
        </ul>
    </div>
</div>
<div id="wrap">
    <div id="main">
        <div class="container main-inner">
            <div class="row">
                <c:forEach items="${result.dataList }" var="article">
                    <div class="col-md-8 col-md-offset-2 col-xs-12">
                        <div class="single-title"><h2>${article.title }</h2></div>
                        <div class="single-info">
                            发表于${fn:substring(article.createdate,0,10)} | 分类于${article.sname }</div>
                        <div class="single-content">${article.html_content }</div>
                        <br>
                </c:forEach>
                        <h3>评论</h3>
<%--                        <div class="comment">--%>
<%--                            <input id="name">--%>
<%--                            <textarea id="comment" placeholder="发送一条信息给豪豪！" cols="90" rows="13"></textarea>--%>
<%--                        </div>--%>
<%--                        <button type="button" onclick="sendComment()">发送</button>--%>
                        <div class="comment-send">
                            <div class="textarea-container">
                                <i class="ipt-arrow"></i>
                                <input id="name" placeholder="输入你的昵称~">
                                <textarea cols="80" name="msg" rows="5" id="comment" placeholder="快来和豪豪互♂动吧！" class="ipt-txt"></textarea>
                                <button type="submit" class="comment-submit" onclick="sendComment()">发表评论</button>
                            </div>
                        </div>
                        <h3>评论区</h3>
                        <c:forEach items="${comment.commentList}" var="comment">
                        <h3>
                            昵称：${comment.name} 时间：${comment.time} <br>
                            内容：${comment.content}
                            <br>
                        </h3>
                        </c:forEach>
            </div>
        </div>
    </div>
    <footer>
        <div id="block">
            <span id="beian">CircleYes!</span>
            <span id="demo"></span>
        </div>
        Where is haohao?</span>
    </footer>
</div>
</div>
</body>
</html>