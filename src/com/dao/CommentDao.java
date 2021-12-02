package com.dao;

import com.model.Pager;
import com.util.JdbcUtil;
import com.model.Comment;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class CommentDao {
    public boolean sendComment(String name,String time,String content,String article){
        boolean result = false;
        List<Object> paramList = new ArrayList<Object>();
        paramList.add(name);
        paramList.add(time);
        paramList.add(content);
        paramList.add(article);
        StringBuilder sql = new StringBuilder("insert into comment(name,time,content,article) values(?,?,?,?);");
        JdbcUtil jdbcUtil = null;
        try {
            jdbcUtil = new JdbcUtil();
            jdbcUtil.getConnection();
            result = jdbcUtil.updateByPreparedStatement(sql.toString(),paramList);
        }catch (SQLException e) {
            throw new RuntimeException("请求错误", e);
        }
        return result;
    }
}
