package com.dao;

import com.model.Article;
import com.model.CommentList;
import com.model.Pager;
import com.util.JdbcUtil;
import com.model.Comment;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class CommentlistDao {
    public CommentList<Comment> getComment(String id) {
        CommentList<Comment> comment = null;
        // 存放查询参数
        List<Object> paramList = new ArrayList<Object>();
        StringBuilder sql = new StringBuilder("select * from comment where article = ?");
        paramList.add(id);
        List<Comment> commentList = new ArrayList<Comment>();
        JdbcUtil jdbcUtil = null;
        try {
            jdbcUtil = new JdbcUtil();
            jdbcUtil.getConnection(); // 获取数据库链接
            List<Map<String, Object>> result = jdbcUtil.findResult(sql.toString(), paramList);
            if (result != null) {
                for (Map<String, Object> map : result) {
                    Comment s = new Comment(map);
                    commentList.add(s);
                }
            }
            comment = new CommentList<Comment>(commentList);
        } catch (SQLException e) {
            throw new RuntimeException("查询所有数据异常！", e);
        } finally {
            if (jdbcUtil != null) {
                jdbcUtil.releaseConn(); // 释放资源
            }
        }
        return comment;
    }
}
//    public List getName(){
//        List<Object> paramList = new ArrayList<Object>();
//        paramList.add(" where 1=1;");
//        JdbcUtil jdbcUtil = new JdbcUtil();
//        jdbcUtil.getConnection(); // 获取数据库链接
//        StringBuilder sql = new StringBuilder("select name from comment");
//        List<Map<String, Object>> result = null;
//        try{
//            result = jdbcUtil.findResult(sql.toString(),paramList);
//        }catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return result;
//    }
//
//    public List getTime(){
//        List<Object> paramList = new ArrayList<Object>();
//        paramList.add(" where 1=1;");
//        JdbcUtil jdbcUtil = new JdbcUtil();
//        jdbcUtil.getConnection(); // 获取数据库链接
//        StringBuilder sql = new StringBuilder("select time from comment");
//        List<Map<String, Object>> result = null;
//        try{
//            result = jdbcUtil.findResult(sql.toString(),paramList);
//        }catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return result;
//    }
//
//    public List getId(){
//        List<Object> paramList = new ArrayList<Object>();
//        paramList.add(" where 1=1;");
//        JdbcUtil jdbcUtil = new JdbcUtil();
//        jdbcUtil.getConnection(); // 获取数据库链接
//        StringBuilder sql = new StringBuilder("select id from comment");
//        List<Map<String, Object>> result = null;
//        try{
//            result = jdbcUtil.findResult(sql.toString(),paramList);
//        }catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return result;
//    }
