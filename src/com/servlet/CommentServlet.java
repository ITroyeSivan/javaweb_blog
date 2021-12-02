package com.servlet;

import com.model.Comment;
import com.service.CommentService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet(name = "CommentServlet")
public class CommentServlet extends HttpServlet {
    CommentService commentService;
    Comment comment;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        commentService = new CommentService();
        String name = request.getParameter("name");
        String article = request.getParameter("article");
        int flag = 1;
        if (name.length() > 10)
        {
            response.getWriter().write("名字太长了噢！");
            flag = 0;
        }
        if (name.equals("")){
            name = "匿名者";
        }
        //获取系统时间
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = df.format(System.currentTimeMillis());
        String content = request.getParameter("content");
        if (content.equals("")){
            content = "这个人啥都没有写~";
        }
        //waf 防止xss钓鱼 虽然已经设置了http-only，但是乱弹窗还是会影响体验
        String evil_tags = "(<|>|alert|onload|javascript|eval|src|script|iframe|embed|frame|frameset|object|img|applet|body|html|style|layer|link|ilayer|meta|bgsound)";
        Pattern pattern = Pattern.compile(evil_tags);
        Matcher matcher = pattern.matcher(content);
        if (matcher.find()) {
            flag = 0;
            response.getWriter().write("我怀疑你想钓鱼，但我没有证据");
        }
        if (flag ==1 && commentService.sendComment(name,time,content,article)){
            response.getWriter().write("发送成功");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
