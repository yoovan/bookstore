package com.book.model.home;

import java.util.ArrayList;

public class OrderManagerBean {
    private ArrayList<OrderBean> list;
    private int currentPage = 1;
    private int totalPage = 1;
    private int perPageSize = 1;

    public ArrayList<OrderBean> getList() {
        return list;
    }

    public void setList(ArrayList<OrderBean> list) {
        this.list = list;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getPerPageSize() {
        return perPageSize;
    }

    public void setPerPageSize(int perPageSize) {
        this.perPageSize = perPageSize;
    }
}
