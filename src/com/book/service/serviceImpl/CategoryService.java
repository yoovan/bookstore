package com.book.service.serviceImpl;

import com.book.dao.ICategoryDao;
import com.book.dao.daoImpl.CategoryDao;
import com.book.model.home.SingleCategoryBean;
import com.book.service.ICategoryService;

import java.sql.SQLException;
import java.util.ArrayList;

public class CategoryService implements ICategoryService {

    private ICategoryDao categoryDao;

    public CategoryService() throws ClassNotFoundException {
        categoryDao = new CategoryDao();
    }

    @Override
    public ArrayList getAllCategory() throws SQLException {
        return categoryDao.getAllCategory();
    }

    @Override
    public SingleCategoryBean getCategoryAndBookById(int id) throws SQLException {
        return categoryDao.getCategoryAndBookById(id);
    }
}
