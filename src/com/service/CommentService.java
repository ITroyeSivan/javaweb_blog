package com.service;


import com.dao.CommentDao;
import com.model.Comment;

public class CommentService {
    private CommentDao commentDao;
    public CommentService(){
        commentDao = new CommentDao();
    }
    public boolean sendComment(String name,String time,String content,String article){
        return commentDao.sendComment(name,time,content,article);
    }
}
