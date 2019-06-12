package com.book.service.serviceImpl;

import com.book.dao.ICategoryDao;
import com.book.dao.daoImpl.CategoryDao;
import com.book.model.backend.ReturnListBean;
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

    @Override
    public ReturnListBean getAllCategoryByPaginate(int start, int perPage) throws SQLException {
        return categoryDao.getAllCategoryByPaginate(start, perPage);
    }

    @Override
    public ArrayList getFirstLevelCategories() throws SQLException {
        return categoryDao.getFirstLevelCategories();
    }

    @Override
    public boolean addCategory(String sql) throws SQLException {
        return categoryDao.addCategory(sql);
    }

    @Override
    public boolean removeCategory(int id) throws SQLException {
        return categoryDao.removeCategory(id);
    }
}
