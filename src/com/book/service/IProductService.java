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
}
