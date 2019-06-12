package com.book.service.serviceImpl;

import com.book.dao.IProductDao;
import com.book.dao.daoImpl.ProductDao;
import com.book.model.backend.ReturnListBean;
import com.book.model.home.ProductBean;
import com.book.service.IProductService;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProductService implements IProductService {

    IProductDao productDao;

    public ProductService() {
        productDao = new ProductDao();
    }

    @Override
    public ArrayList getCarouselList() throws SQLException {
        return productDao.getCarouselList();
    }

    @Override
    public ArrayList getRecommendCategories() throws SQLException, UnsupportedEncodingException {
        return productDao.getRecommendCategories();
    }

    @Override
    public ArrayList<ProductBean> searchProductByName(String name) throws SQLException {
        return productDao.searchProductByName(name);
    }

    @Override
    public ProductBean getDetailById(int id) throws SQLException {
        return productDao.getDetailById(id);
    }

    @Override
    public ReturnListBean getAllProductsByPaginate(int start, int perPage) throws SQLException {
        return productDao.getAllProductsByPaginate(start, perPage);
    }

    @Override
    public ReturnListBean getAllCarouselByPaginate(int start, int perPage) throws SQLException {
        return productDao.getAllCarouselByPaginate(start, perPage);
    }

    @Override
    public boolean addProductReturnBool(String sql) throws SQLException {
        return productDao.addProductReturnBool(sql);
    }

    @Override
    public int addProductReturnInt(String sql) throws SQLException {
        return productDao.addProductReturnInt(sql);
    }

    @Override
    public boolean updateProduct(String sql) throws SQLException {
        return productDao.updateProduct(sql);
    }

    @Override
    public boolean setStatus(int id, int status) throws SQLException {
        return productDao.setStatus(id, status);
    }

    @Override
    public boolean removeProduct(int id) throws SQLException {
        return productDao.removeProduct(id);
    }
}
