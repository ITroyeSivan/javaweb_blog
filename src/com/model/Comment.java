package com.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class Comment {
    private int id;
    private String name;
    private String time;
    private String content;
    private String article;


    public Comment(){
    }

    public Comment(int id, String name, String time, String content){
        this.id = id;
        this.name = name;
        this.time = time;
        this.content = content;
        this.article = article;
    }

    public Comment(Map<String, Object> map){
        this.id = (int) map.get("id");
        this.name = (String) map.get("name");
        this.time = (String) map.get("time");
        this.content = (String) map.get("content");
        this.article = (String) map.get("article");
    }
    public int getId(){
        return id;
    }
    public void setId(){
        this.id = id;
    }
    public String getName(){
        return name;
    }
    public void setName(){
        this.name = name;
    }
    public String getTime(){
        return time;
    }
    public void setTime(){
        this.time = time;
    }
    public String getContent(){
        return content;
    }
    public void setContent(){
        this.content = content;
    }
    public String getArticle(){
        return article;
    }
    public void setArticle(){
        this.article = article;
    }

    @Override
    public String toString() {
        return "Article{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", time='" + time + '\'' +
                ", content='" + content + '\'' +
                ", article='" + article + '\'' +
                '}';
    }

    public List toList() {
        List list = new ArrayList();
        list.add(id);
        list.add(name);
        list.add(time);
        list.add(content);
        list.add(article);
        return list;
    }
}
