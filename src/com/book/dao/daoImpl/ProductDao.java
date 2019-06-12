package com.book.dao.daoImpl;

import com.book.common.DatabaseConnector;
import com.book.dao.IProductDao;
import com.book.model.backend.ReturnListBean;
import com.book.model.home.ProductBean;
import com.book.model.home.RecommendCategoryBean;
import com.sun.org.apache.bcel.internal.generic.RETURN;
import jdk.internal.org.objectweb.asm.commons.StaticInitMerger;

import javax.xml.transform.Result;
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
        String sql  = "select product.id, title, url from product inner join image on product.id=image.product_id where image.type=3 and product.type=1";
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
            sql = "select p.id as product_id,c.id as category_id, p.author, p.publishing_house, i.url,p.title, p.price, c.name from (product as p INNER JOIN category as c on p.category_id=c.id) INNER JOIN image as i ON p.id=i.product_id WHERE i.type=0 and c.id=" + id + " and p.type=2";
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
        String sql = "select product.id, title, price, author, publishing_house, url from product join image on product.id=image.product_id where image.type=0 and title like '%" + name + "%'";
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()) {
            ProductBean dataBean = new ProductBean();
            dataBean.setId(rs.getInt("id"));
            dataBean.setTitle(rs.getString("title"));
            dataBean.setPrice(rs.getFloat("price"));
            dataBean.setAuthor(rs.getString("author"));
            dataBean.setPublishing_house(rs.getString("publishing_house"));
            dataBean.setUrl(rs.getString("url"));
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
            productBean.setISBN(rs.getString("isbn"));
            productBean.setType(rs.getInt("type"));
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

    @Override
    public ReturnListBean getAllProductsByPaginate(int start, int perPage) throws SQLException {
        ReturnListBean resultBean = new ReturnListBean();
        String sql = "select count(*) as total from product where isnull(deleted_at)";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
        rs.next();
        resultBean.setCount(rs.getInt("total"));
        sql = "select * from product where isnull(deleted_at) limit ?, ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, start);
        pstmt.setInt(2, perPage);
        rs = pstmt.executeQuery();
        ArrayList list = new ArrayList();
        while(rs.next()) {
            ProductBean productBean = new ProductBean();
            productBean.setId(rs.getInt("id"));
            productBean.setTitle(rs.getString("title"));
            productBean.setAuthor(rs.getString("author"));
            productBean.setPrice(rs.getFloat("price"));
            productBean.setPublishing_house(rs.getString("publishing_house"));
            productBean.setPublishing_time(rs.getString("publishing_time"));
            productBean.setISBN(rs.getString("isbn"));
            productBean.setType(rs.getInt("type"));
            System.out.println("type: " + productBean.getType());
            productBean.setSummary(rs.getString("summary"));
            productBean.setFormat(rs.getString("format"));
            productBean.setPage_size(rs.getInt("page_size"));
            productBean.setUpper_time(rs.getString("upper_time"));
            productBean.setEdition(rs.getInt("edition"));
            productBean.setPage_size(rs.getInt("page_size"));
            productBean.setCategory_id(rs.getInt("category_id"));
            productBean.setSeries(rs.getString("series"));
            productBean.setCatalogue(rs.getString("catalogue"));
            list.add(productBean);
        }
        resultBean.setData(list);
        return resultBean;
    }

    @Override
    public ReturnListBean getAllCarouselByPaginate(int start, int perPage) throws SQLException {
        ArrayList<ProductBean> carouselList = new ArrayList<>();
        ReturnListBean dataBean = new ReturnListBean();
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        String sql  = "select product.id, title, url, author from product inner join image on product.id=image.product_id where image.type=3 and product.type=1 limit " + start + ", " + perPage;
        ResultSet rs = stmt.executeQuery(sql);
        while(rs.next()) {
            ProductBean productBean = new ProductBean();
            productBean.setId(rs.getInt("id"));
            productBean.setTitle(rs.getString("title"));
            productBean.setUrl(rs.getString("url"));
            productBean.setAuthor(rs.getString("author"));
            carouselList.add(productBean);
        }
        dataBean.setData(carouselList);
        sql = "select count(*) as total from product where type=1";
        rs = stmt.executeQuery(sql);
        if (rs.next()) {
            dataBean.setCount(rs.getInt("total"));
        } else {
            dataBean.setCount(0);
        }
        return dataBean;
    }

    @Override
    public boolean addProductReturnBool(String sql) throws SQLException {
       int id = this.addProductReturnInt(sql);
        if (id > 0) {
            return true;
        }
        return false;
    }

    @Override
    public int addProductReturnInt(String sql) throws SQLException {
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        stmt.execute(sql);
        sql = "select last_insert_id() as id";
        ResultSet rs = stmt.executeQuery(sql);
        int id = 0;
        if (rs.next()) {
            id = rs.getInt("id");
        }
        return id;
    }

    @Override
    public boolean updateProduct(String sql) throws SQLException {
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        int result = stmt.executeUpdate(sql);
        if (result > 0) {
            return true;
        }
        return false;
    }

    @Override
    public boolean setStatus(int id, int type) throws SQLException {
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        String sql = "update product set type=" + type + " where id=" + id;
        int result = stmt.executeUpdate(sql);
        if (result > 0) {
             return true;
        }
        return false;
    }

    @Override
    public boolean removeProduct(int id) throws SQLException {
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        String sql = "update product set deleted_at=now() where id=" + id;
        int result = stmt.executeUpdate(sql);
        if (result > 0) {
            return true;
        }
        return false;
    }
}
