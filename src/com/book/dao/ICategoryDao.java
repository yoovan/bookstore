package com.book.dao;

import com.book.model.backend.ReturnListBean;
import com.book.model.home.SingleCategoryBean;

import java.sql.SQLException;
import java.util.ArrayList;

public interface ICategoryDao {
    ArrayList getAllCategory() throws SQLException;

    SingleCategoryBean getCategoryAndBookById(int id) throws SQLException;

    ReturnListBean getAllCategoryByPaginate(int start, int perPage) throws SQLException;
}
