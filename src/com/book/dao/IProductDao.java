package com.book.dao;

import com.book.model.backend.ReturnListBean;
import com.book.model.home.ProductBean;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.ArrayList;

public interface IProductDao {

    // 获取轮播的产品
    ArrayList getCarouselList() throws SQLException;

    ArrayList getRecommendCategories() throws SQLException, UnsupportedEncodingException;

    ArrayList<ProductBean> searchProductByName(String name) throws SQLException;

    ProductBean getDetailById(int id) throws SQLException;

    ReturnListBean getAllProductsByPaginate(int start, int perPage) throws SQLException;

    ReturnListBean getAllCarouselByPaginate(int start, int perPage) throws SQLException;

    boolean addProduct(String sql) throws SQLException;

    boolean updateProduct(String sql) throws  SQLException;

    boolean setStatus(int id, int status) throws SQLException;
}
