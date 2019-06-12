package com.book.controller.home;

import com.book.service.serviceImpl.OrderService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@WebServlet(name = "CartServlet", urlPatterns = {"/cart", "/cart.jsp"})
public class CartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        if (id == null || id.length() <= 0) {
            response.sendRedirect("login.jsp");
            return;
        }
        int num = Integer.parseInt(id);
        System.out.println("count: " + request.getParameter("totalCount"));
        int count = Integer.parseInt(request.getParameter("totalCount"));
        float amount = Float.parseFloat(request.getParameter("totalAmount"));
        try {
            OrderService orderService = new OrderService();
            orderService.addOrderItem(getOrderNo(), num,count, amount);
            System.out.println("added。。。。。");
            ServletContext application = request.getServletContext();
            application.setAttribute("cartList", null);
            response.sendRedirect("center.jsp?id=" + num);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/home/cart.jsp");
        dispatcher.forward(request, response);
    }

    private String getOrderNo() {
        String k = "book-no";
        Date D = new Date();
        DateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
        String a = df.format(D);
        int data = 10001;
        int e = data + Integer.parseInt(a.substring(a.length() - 4));
        String f = String.valueOf(e);
        String f1 = f.substring(f.length() - 4);
        System.out.println(k + a + f1);
        return k + a + f1;
    }
}
