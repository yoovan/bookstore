package com.book.dao.daoImpl;

import com.book.common.DatabaseConnector;
import com.book.dao.IOrderDao;
import com.book.model.home.OrderBean;
import com.book.model.home.OrderManagerBean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class OrderDao implements IOrderDao {

    private Connection conn;
    public OrderDao() throws ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        this.conn = DatabaseConnector.connect();
    }

    @Override
    public OrderManagerBean getAllOrderByUserId(int id, int perPageSize) throws SQLException {
        ArrayList<OrderBean> list = new ArrayList();
        OrderManagerBean targetBean = new OrderManagerBean();
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        String sql = "select id, order_no, status, product_count, order_amount_total from `order` where user_id=" + id;
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()) {
            OrderBean dataBean = new OrderBean();
            dataBean.setId(rs.getInt("id"));
            dataBean.setOrder_no(rs.getString("order_no"));
            dataBean.setProduct_count(rs.getInt("product_count"));
            dataBean.setStatus(rs.getInt("status"));
            dataBean.setOrder_amount_total(rs.getFloat("order_amount_total"));
            list.add(dataBean);
        }
        targetBean.setList(list);
        targetBean.setPerPageSize(perPageSize);
        int size = list.size();
        int totalPage = 1;
        if (size % perPageSize != 0) {
            totalPage = (size / perPageSize) + 1;
        } else {
            totalPage = size / perPageSize;
        }
        targetBean.setTotalPage(totalPage);
        return targetBean;
    }
}
