package com.book.service.serviceImpl;

import com.book.dao.IOrderDao;
import com.book.dao.daoImpl.OrderDao;
import com.book.model.home.OrderManagerBean;
import com.book.service.IOrderService;

import java.sql.SQLException;

public class OrderService implements IOrderService {
    IOrderDao orderDao;
    public OrderService() throws ClassNotFoundException {
        orderDao = new OrderDao();
    }
    @Override
    public OrderManagerBean getAllOrderByUserId(int id, int perPageSize) throws SQLException {
        return orderDao.getAllOrderByUserId(id, perPageSize);
    }

    @Override
    public boolean cancelOrderById(int id) throws SQLException {
        return orderDao.cancelOrderById(id);
    }

    @Override
    public boolean destroyOrderById(int id) throws SQLException {
        return orderDao.destroyOrderById(id);
    }
}
