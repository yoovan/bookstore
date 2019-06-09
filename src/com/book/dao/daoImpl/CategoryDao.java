package com.book.dao.daoImpl;

import com.book.common.DatabaseConnector;
import com.book.dao.ICategoryDao;
import com.book.model.home.CategoryBean;
import com.book.model.home.LevelCategoryBean;
import com.book.model.home.ProductBean;
import com.book.model.home.SingleCategoryBean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class CategoryDao implements ICategoryDao {
    private Connection conn;

    public CategoryDao() throws ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        this.conn = DatabaseConnector.connect();
    }

    @Override
    public ArrayList getAllCategory() throws SQLException {
        ArrayList<LevelCategoryBean> levelList = new ArrayList<>();
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        String sql = "select id, `name` from category where level=1";
        ResultSet rs = stmt.executeQuery(sql);
        ResultSet rs2;
        while (rs.next()) {
            LevelCategoryBean levelLBean = new LevelCategoryBean();
            levelLBean.setFirstCategory(rs.getString("name"));
            levelLBean.setId(rs.getInt("id"));
            levelList.add(levelLBean);
        }
        for (int i = 0; i < levelList.size(); i++) {
            sql = "select id, `name` from category where level=2 and pid=" + levelList.get(i).getId();
            rs2 = stmt.executeQuery(sql);
            ArrayList<CategoryBean> categoriesList = new ArrayList<>();
            while (rs2.next()){
                CategoryBean dataBean = new CategoryBean();
                dataBean.setId(rs2.getInt("id"));
                dataBean.setName(rs2.getString("name"));
                categoriesList.add(dataBean);
            }
            levelList.get(i).setSecondCategory(categoriesList);
        }
        return levelList;
    }

    @Override
    public SingleCategoryBean getCategoryAndBookById(int id) throws SQLException {
        SingleCategoryBean dataBean = new SingleCategoryBean();
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        String sql = "select name from category where id="+id;
        ResultSet rs1 = stmt.executeQuery(sql);
        if (rs1.next()) {
            dataBean.setName(rs1.getString("name"));
        }
        sql = "select p.id, c.`name`, p.title, p.price, p.author, p.publishing_time, p.publishing_house, i.url from product as p JOIN category as c on p.category_id=c.id JOIN image as i on i.product_id=p.id where  c.id="+id;
        ResultSet rs2 = stmt.executeQuery(sql);
        ArrayList productList = new ArrayList();
        while(rs2.next()) {
            ProductBean productBean = new ProductBean();
            productBean.setId(rs2.getInt("id"));
            productBean.setTitle(rs2.getString("title"));
            productBean.setAuthor(rs2.getString("author"));
            productBean.setPrice(rs2.getFloat("price"));
            productBean.setPublishing_time(rs2.getString("publishing_time"));
            productBean.setPublishing_house(rs2.getString("publishing_house"));
            productBean.setUrl(rs2.getString("url"));
            productList.add(productBean);
        }
        dataBean.setList(productList);
        return dataBean;
    }
}
