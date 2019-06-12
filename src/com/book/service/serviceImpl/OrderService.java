package com.book.service.serviceImpl;

import com.book.dao.IOrderDao;
import com.book.dao.daoImpl.OrderDao;
import com.book.model.backend.ReturnListBean;
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

    @Override
    public void addOrderItem(String order_no, int user_id, int count, float totalAmount) throws SQLException {
        orderDao.addOrderItem(order_no, user_id, count, totalAmount);
    }

    @Override
    public boolean payOrderById(int id) throws SQLException {
        return orderDao.payOrderById(id);
    }

    @Override
    public ReturnListBean getOrdersByPaginate(int start, int perPage) throws SQLException {
        return orderDao.getOrdersByPaginate(start, perPage);
    }
}
