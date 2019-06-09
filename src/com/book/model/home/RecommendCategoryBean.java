package com.book.model.home;

import java.util.ArrayList;

public class RecommendCategoryBean {

    private int category_id;
    private String name; // 分类名称
    private ArrayList<ProductBean> list;

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public ArrayList<ProductBean> getList() {
        return list;
    }

    public void setList(ArrayList<ProductBean> list) {
        this.list = list;
    }
}
