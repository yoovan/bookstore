package com.book.service;

import com.book.model.home.SingleCategoryBean;

import java.sql.SQLException;
import java.util.ArrayList;

public interface ICategoryService {
    ArrayList getAllCategory() throws SQLException;

    SingleCategoryBean getCategoryAndBookById(int id) throws SQLException;
}
