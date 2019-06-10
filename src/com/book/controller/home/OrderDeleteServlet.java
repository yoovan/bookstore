package com.book.controller.home;

import com.book.model.UserBean;
import com.book.service.serviceImpl.OrderService;
import com.mysql.cj.x.protobuf.MysqlxCrud;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "OrderDeleteServlet", urlPatterns = {"/orderDestroy", "/orderDestroy.jsp"})
public class OrderDeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            OrderService orderService = new OrderService();
            orderService.destroyOrderById(id);
            response.sendRedirect("center.jsp?id="+ ((UserBean)request.getSession().getAttribute("loginUser")).getId());
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
