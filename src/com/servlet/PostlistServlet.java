package com.servlet;

import com.model.*;
import com.service.ArticleService;
import com.service.CategoryService;
import com.service.CommentlistService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class PostlistServlet extends javax.servlet.http.HttpServlet {
    ArticleService articleService = new ArticleService();
    CategoryService categoryService = new CategoryService();
    CommentlistService commentlistService = new CommentlistService();

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        //默认值
        int pageNum = 1;
        int pageSize = 10;
        int main_id = 0;
        int sub_id = 0;
        int id = 0;
        // 接收request里的参数
        String role = request.getParameter("role");
        // 组装查询条件
        Article searchModel = new Article();
        if (request.getParameter("main_id")!=null)
            main_id = Integer.parseInt(request.getParameter("main_id"));
        if (request.getParameter("sub_id")!=null)
            sub_id = Integer.parseInt(request.getParameter("sub_id"));
//        System.out.println(main_id+"----------"+sub_id);
        if (main_id!=0) //分类
            searchModel.setMain_id(Integer.parseInt(request.getParameter("main_id")));
        if (sub_id!=0)
            searchModel.setSub_id(Integer.parseInt(request.getParameter("sub_id")));
        if (request.getParameter("id")!=null)
            searchModel.setId(Integer.parseInt(request.getParameter("id")));
        if (request.getParameter("pageNum")!=null)
            pageNum = Integer.parseInt(request.getParameter("pageNum")); //显示第几页数据
        if (request.getParameter("pageSize")!=null)
            pageSize = Integer.parseInt(request.getParameter("pageSize"));  // 每页显示多少条记录
//        System.out.println(searchModel.toString());
        //调用service 获取查询结果
        Pager<Article> result = articleService.findArticle(searchModel, pageNum, pageSize);
        List<MainCategory> mainCategory = categoryService.getMaincategory();
        //加载评论信息
        CommentList<Comment> comment = commentlistService.getComment(request.getParameter("id"));
//        List comment = commentlistService.getComment();
//        List name = commentlistService.getName();
//        List time = commentlistService.getTime();
//        List Id = commentlistService.getId();
//        comment.addAll(0,commentlistService.getComment());
//        name.addAll(0,commentlistService.getName());
//        time.addAll(0,commentlistService.getTime());
//        Id.addAll(0,commentlistService.getId());
//        request.setAttribute("id", Id);
        request.setAttribute("comment", comment);
//        request.setAttribute("name", name);
//        request.setAttribute("time", time);
        // 返回结果到页面
        request.setAttribute("result", result);
        request.setAttribute("mainCategory", mainCategory);
        if (role.equals("0"))
            request.getRequestDispatcher(request.getContextPath() + "/blog.jsp").forward(request, response);
        else if(role.equals("1"))
            request.getRequestDispatcher(request.getContextPath() + "/admin/postlist.jsp").forward(request, response);
        else if (role.equals("2"))
            request.getRequestDispatcher(request.getContextPath() + "/article.jsp").forward(request, response);
        else if (role.equals("3"))
            request.getRequestDispatcher(request.getContextPath() + "/admin/updatepost.jsp").forward(request, response);
        else if (role.equals("4"))
            request.getRequestDispatcher(request.getContextPath() + "/project.jsp").forward(request, response);
        else if (role.equals("5"))
            request.getRequestDispatcher(request.getContextPath() + "/bbs.jsp").forward(request, response);
    }
}
