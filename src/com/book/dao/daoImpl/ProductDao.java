package com.book.dao.daoImpl;

import com.book.common.DatabaseConnector;
import com.book.dao.IProductDao;
import com.book.model.home.ProductBean;
import com.book.model.home.RecommendCategoryBean;

import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.sql.*;
import java.util.ArrayList;
import java.util.Base64;

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
    public ArrayList getRecommendCategories() throws SQLException, UnsupportedEncodingException {
        ArrayList<RecommendCategoryBean> recommendCategoryList = new ArrayList<>();
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        String sql = "select id, `name` from category where type=1";
        ResultSet rs = stmt.executeQuery(sql);
        ResultSet rs2;
        while (rs.next()) {
            RecommendCategoryBean dataBean = new RecommendCategoryBean();
            dataBean.setCategory_id(rs.getInt("id"));
            dataBean.setName(rs.getString("name"));
            recommendCategoryList.add(dataBean);
        }
        int length = recommendCategoryList.size();
        for (int i = 0 ;i < length; i++) {
            int id = recommendCategoryList.get(i).getCategory_id();
            sql = "select p.id as product_id,c.id as category_id, p.author, p.publishing_house, i.url,p.title, p.price, c.name from (product as p INNER JOIN category as c on p.category_id=c.id) INNER JOIN image as i ON p.id=i.product_id WHERE i.type=0 and c.id=" + id;
            rs2 = stmt.executeQuery(sql);
            ArrayList productList = new ArrayList();
            while(rs2.next()) {
                ProductBean productBean = new ProductBean();
                productBean.setId(rs2.getInt("product_id"));
                productBean.setTitle(rs2.getString("title"));
                productBean.setAuthor(rs2.getString("author"));
                productBean.setPublishing_house(rs2.getString("publishing_house"));
                productBean.setPrice(rs2.getFloat("price"));
                productBean.setUrl(rs2.getString("url"));
                productList.add(productBean);
            }
            recommendCategoryList.get(i).setList(productList);
        }
        return recommendCategoryList;
    }

    @Override
    public ArrayList<ProductBean> searchProductByName(String name) throws SQLException {
        ArrayList<ProductBean> list = new ArrayList<>();
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        String sql = "select id, title, price, author, publishing_house from product where title like '%" + name + "%'";
        System.out.println("sql: " + sql);
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()) {
            System.out.println("row");
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

    @Override
    public ProductBean getDetailById(int id) throws SQLException {
        String sql = "select p.*, i.url, c.name  from `product` as p join image as i on p.id=i.product_id join category as c on p.category_id=c.id where p.id=? and i.type=0";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, id);
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
            ProductBean productBean = new ProductBean();
            productBean.setId(rs.getInt("id"));
            productBean.setTitle(rs.getString("title"));
            productBean.setAuthor(rs.getString("author"));
            productBean.setPrice(rs.getFloat("price"));
            productBean.setUrl(rs.getString("url"));
            productBean.setPublishing_house(rs.getString("publishing_house"));
            productBean.setPublishing_time(rs.getString("publishing_time"));
            productBean.setISBN(rs.getString("ISBN"));
            productBean.setSummary(rs.getString("summary"));
            productBean.setFormat(rs.getString("format"));
            productBean.setPage_size(rs.getInt("page_size"));
            productBean.setUpper_time(rs.getString("upper_time"));
            productBean.setCategory_name(rs.getString("name"));
            productBean.setEdition(rs.getInt("edition"));
            return productBean;
        }
        return null;
    }
}
