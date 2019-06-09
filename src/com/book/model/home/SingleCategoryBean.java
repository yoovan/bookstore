package com.book.model.home;

import java.util.ArrayList;

public class SingleCategoryBean {

    private String name; // 分类名
    private ArrayList<ProductBean> list;

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
