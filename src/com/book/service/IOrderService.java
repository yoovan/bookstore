package com.book.service;

import com.book.model.home.OrderManagerBean;

import java.sql.SQLException;

public interface IOrderService {
    OrderManagerBean getAllOrderByUserId(int id, int perPageSize) throws SQLException;
}