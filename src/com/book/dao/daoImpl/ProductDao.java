package com.book.dao.daoImpl;

import com.book.common.DatabaseConnector;
import com.book.dao.IProductDao;
import com.book.model.home.ProductBean;
import com.book.model.home.RecommendCategoryBean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ProductDao implements IProductDao {

    private Connection conn;

    public ProductDao () {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            this.conn = DatabaseConnector.connect();
        } catch (ClassNotFoundException e) {
            System.out.println("驱动加载失败：" + e.getMessage());
        }
    }

    @Override
    public ArrayList getCarouselList() throws SQLException {
        ArrayList<ProductBean> carouselList = new ArrayList<>();
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        String sql  = "select product.id, title, url from product inner join image on product.id=image.product_id where image.type=3";
        ResultSet rs = stmt.executeQuery(sql);
        while(rs.next()) {
            ProductBean dataBean = new ProductBean();
            dataBean.setId(rs.getInt("id"));
            dataBean.setTitle(rs.getString("title"));
            dataBean.setUrl(rs.getString("url"));
            carouselList.add(dataBean);
        }
        return carouselList;
    }

    @Override
    public ArrayList getRecommendCategories() throws SQLException {
        ArrayList<RecommendCategoryBean> recommendCategoryList = new ArrayList<>();
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        String sql = "select p.id as product_id,c.id as category_id, p.author, p.publishing_house, i.url,p.title, p.price, c.name from (product as p INNER JOIN category as c on p.category_id=c.id) INNER JOIN image as i ON p.id=i.product_id WHERE i.type=0";
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()) {
            RecommendCategoryBean dataBean = new RecommendCategoryBean();
            dataBean.setProduct_id(rs.getInt("product_id"));
            dataBean.setCategory_id(rs.getInt("category_id"));
            dataBean.setTitle(rs.getString("title"));
            dataBean.setName(rs.getString("name"));
            dataBean.setPrice(rs.getFloat("price"));
            dataBean.setUrl(rs.getString("url"));
            dataBean.setAuthor(rs.getString("author"));
            dataBean.setPublishing_house(rs.getString("publishing_house"));
            recommendCategoryList.add(dataBean);
        }
        return recommendCategoryList;
    }

    @Override
    public ArrayList<ProductBean> searchProductByName(String name) throws SQLException {
        ArrayList<ProductBean> list = new ArrayList<>();
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        String sql = "select id, title, price, author, publishing_house from product where title like '%" + name + "%'";
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()) {
            ProductBean dataBean = new ProductBean();
            dataBean.setId(rs.getInt("id"));
            dataBean.setTitle(rs.getString("title"));
            dataBean.setPrice(rs.getFloat("price"));
            dataBean.setAuthor(rs.getString("author"));
            dataBean.setPublishing_house(rs.getString("publishing_house"));
            list.add(dataBean);
        }
        return list;
    }
}
