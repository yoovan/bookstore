package com.book.dao.daoImpl;

import com.book.common.DatabaseConnector;
import com.book.dao.ICategoryDao;
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
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        /**
         * todo
         */
        String sql = "";
        ResultSet rs = stmt.executeQuery(sql);
        return null;
    }

    @Override
    public ArrayList getCategoryAndBookById(int id) throws SQLException {
        ArrayList<SingleCategoryBean> list = new ArrayList<>();
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        String sql = "select p.id, c.`name`, p.title, p.price, p.author, p.publishing_time, p.publishing_house, i.url from product as p JOIN category as c on p.category_id=c.id JOIN image as i on i.product_id=p.id";
        ResultSet rs = stmt.executeQuery(sql);
        if (rs.next()) {
            SingleCategoryBean dataBean = new SingleCategoryBean();
            dataBean.setId(rs.getInt("id"));
            dataBean.setName(rs.getString("name"));
            dataBean.setTitle(rs.getString("title"));
            dataBean.setAuthor(rs.getString("author"));
            dataBean.setPrice(rs.getFloat("price"));
            dataBean.setPublishing_time(rs.getString("publishing_time"));
            dataBean.setGetPublishing_house(rs.getString("publishing_house"));
            dataBean.setUrl(rs.getString("ur;"));
            list.add(dataBean);
        }
        return list;
    }
}