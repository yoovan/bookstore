package com.book.service;

import com.book.model.backend.ReturnListBean;
import com.book.model.home.ProductBean;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.ArrayList;

public interface IProductService {
    ArrayList getCarouselList() throws SQLException;

    ArrayList getRecommendCategories() throws SQLException, UnsupportedEncodingException;

    ArrayList<ProductBean> searchProductByName(String name) throws SQLException;

    ProductBean getDetailById(int id) throws SQLException;

    ReturnListBean getAllProductsByPaginate(int start, int perPage) throws SQLException;

    ReturnListBean getAllCarouselByPaginate(int start, int perPage) throws SQLException;

    boolean addProductReturnBool(String sql) throws SQLException;

    int addProductReturnInt(String sql) throws SQLException;

    boolean updateProduct(String sql) throws  SQLException;

    boolean setStatus(int id, int status) throws SQLException;

    boolean removeProduct(int id) throws SQLException;
}
