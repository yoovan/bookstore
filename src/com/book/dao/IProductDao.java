package com.book.dao;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IProductDao {

    // 获取轮播的产品
    ArrayList getCarouselList() throws SQLException;

    ArrayList getRecommendCategories() throws SQLException;
}