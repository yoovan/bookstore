package com.book.model.home;

public class SingleCategoryBean {
    private int id;
    private String name; // 分类名
    private String title; // 书名
    private float price;
    private String author;
    private String publishing_time;
    private String getPublishing_house;
    private String url;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublishing_time() {
        return publishing_time;
    }

    public void setPublishing_time(String publishing_time) {
        this.publishing_time = publishing_time;
    }

    public String getGetPublishing_house() {
        return getPublishing_house;
    }

    public void setGetPublishing_house(String getPublishing_house) {
        this.getPublishing_house = getPublishing_house;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
