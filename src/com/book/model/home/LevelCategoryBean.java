package com.book.model.home;

import java.util.ArrayList;

public class LevelCategoryBean {
    private int id;
    private String firstCategory;
    private ArrayList<CategoryBean> secondCategory;

    public String getFirstCategory() {
        return firstCategory;
    }

    public void setFirstCategory(String firstCategory) {
        this.firstCategory = firstCategory;
    }

    public ArrayList<CategoryBean> getSecondCategory() {
        return secondCategory;
    }

    public void setSecondCategory(ArrayList<CategoryBean> secondCategory) {
        this.secondCategory = secondCategory;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
