package com.book.service;

import com.book.model.backend.ReturnListBean;
import com.book.model.home.SingleCategoryBean;

import java.sql.SQLException;
import java.util.ArrayList;

public interface ICategoryService {
    ArrayList getAllCategory() throws SQLException;

    SingleCategoryBean getCategoryAndBookById(int id) throws SQLException;

    ReturnListBean getAllCategoryByPaginate(int start, int perPage) throws SQLException;

    ArrayList getFirstLevelCategories() throws SQLException;

    boolean addCategory(String sql) throws SQLException;

    boolean removeCategory(int id) throws SQLException;
}
