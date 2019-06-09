package com.book.service;

import com.book.model.home.ProductBean;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.ArrayList;

public interface IProductService {
    ArrayList getCarouselList() throws SQLException;

    ArrayList getRecommendCategories() throws SQLException, UnsupportedEncodingException;

    ArrayList<ProductBean> searchProductByName(String name) throws SQLException;
}
