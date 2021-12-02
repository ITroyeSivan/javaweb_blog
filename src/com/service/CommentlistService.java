package com.service;

import com.dao.CommentlistDao;
import com.model.Comment;
import com.model.CommentList;

import java.util.List;

public class CommentlistService {
    private CommentlistDao commentlistDao;
    public CommentlistService(){
        commentlistDao = new CommentlistDao();
    }
    public CommentList<Comment> getComment(String id){
        return commentlistDao.getComment(id);
    }
}