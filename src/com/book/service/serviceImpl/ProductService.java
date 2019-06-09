package com.book.service.serviceImpl;

import com.book.dao.IProductDao;
import com.book.dao.daoImpl.ProductDao;
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
}
