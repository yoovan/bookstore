package com.book.dao.daoImpl;

import com.book.common.DatabaseConnector;
import com.book.dao.IOrderDao;
import com.book.model.backend.ReturnListBean;
import com.book.model.home.OrderBean;
import com.book.model.home.OrderManagerBean;
import com.mysql.cj.protocol.Resultset;
import com.sun.corba.se.spi.monitoring.StatisticMonitoredAttribute;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

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
        String sql = "select id, order_no, status, product_count, order_amount_total from `order` where user_id=" + id + " and ISNULL(deleted_at)";
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

    @Override
    public boolean cancelOrderById(int id) throws SQLException {
        String sql = "update `order` set status=4 where id=" + id;
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        int result = stmt.executeUpdate(sql);
        if (result > 0) {
            return true;
        }
        return false;
    }

    @Override
    public boolean destroyOrderById(int id) throws SQLException {
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        String sql = "update `order` set deleted_at=now() where id="+id;
        int result = stmt.executeUpdate(sql);
        if (result > 0) {
            return true;
        }
        return false;
    }

    @Override
    public void addOrderItem(String order_no, int user_id, int count, float totalAmount) throws SQLException {
        String sql = "insert into `order` (`order_no`, `user_id`, `product_count`, `product_amount_total`, `order_amount_total`, `created_at`) values (?,?,?,?,?,now())";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, order_no);
        pstmt.setInt(2, user_id);
        pstmt.setInt(3, count);
        pstmt.setFloat(4, totalAmount);
        pstmt.setFloat(5, totalAmount);
        pstmt.execute();
    }

    @Override
    public boolean payOrderById(int id) throws SQLException {
        String sql = "update `order` set status=1 where id=" + id;
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        int result = stmt.executeUpdate(sql);
        if (result > 0) {
            return true;
        }
        return false;
    }

    @Override
    public ReturnListBean getOrdersByPaginate(int start, int perPage) throws SQLException {
        ReturnListBean resultBean = new ReturnListBean();
        String sql = "select count(*) as total from product where isnull(deleted_at)";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
        rs.next();
        resultBean.setCount(rs.getInt("total"));
        sql = "select order.id, order.order_no, user.username, order.product_count, order.order_amount_total, order.status from `user` join `order` on order.user_id=user.id limit ?,?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, start);
        pstmt.setInt(2, perPage);
        rs = pstmt.executeQuery();
        ArrayList list = new ArrayList();
        while(rs.next()) {
            OrderBean dataBean = new OrderBean();
            dataBean.setId(rs.getInt("id"));
            dataBean.setOrder_no(rs.getString("order_no"));
            dataBean.setOrder_amount_total(rs.getFloat("order_amount_total"));
            dataBean.setProduct_count(rs.getInt("product_count"));
            dataBean.setUsername(rs.getString("username"));
            int status = rs.getInt("status");
            String status_name = "";
            switch (status) {
                case 0: status_name="未付款";break;
                case 1: status_name="已付款"; break;
                case 2: status_name = "已发货"; break;
                case 3: status_name = "已签收"; break;
                case 4: status_name = "取消交易"; break;
            }
            dataBean.setStatus_name(status_name);
            list.add(dataBean);
        }
        resultBean.setData(list);
        return resultBean;
    }
}
