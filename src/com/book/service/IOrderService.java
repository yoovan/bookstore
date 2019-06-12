package com.book.service;

import com.book.model.backend.ReturnListBean;
import com.book.model.home.OrderManagerBean;

import java.sql.SQLException;

public interface IOrderService {
    OrderManagerBean getAllOrderByUserId(int id, int perPageSize) throws SQLException;

    boolean cancelOrderById(int id) throws SQLException;

    boolean destroyOrderById(int id) throws SQLException;

    void addOrderItem(String order_no, int user_id,int count, float totalAmount) throws SQLException;

    boolean payOrderById(int id) throws SQLException;

    ReturnListBean getOrdersByPaginate(int start, int perPage) throws SQLException;
}
