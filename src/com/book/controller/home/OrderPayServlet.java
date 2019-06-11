package com.book.controller.home;

import com.book.model.backend.UserBean;
import com.book.service.serviceImpl.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "OrderPayServlet", urlPatterns = {"/payOrder", "/payOrder.jsp"})
public class OrderPayServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            OrderService orderService = new OrderService();
            orderService.payOrderById(id);
            response.sendRedirect("center.jsp?id=" + ((UserBean)request.getSession().getAttribute("loginUser")).getId());
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
