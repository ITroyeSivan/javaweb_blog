package com.model;

import java.util.List;

public class CommentList<T> {
    private List<Comment> commentList;

    public CommentList(){
    }

    public CommentList(List<Comment> commentList) {
        this.commentList = commentList;
    }

    public List<Comment> getCommentList() {
        return commentList;
    }

    public void setCommentList(List<Comment> commentList) {
        this.commentList = commentList;
    }
}
