package com.book.controller.home;

import com.book.model.home.ProductBean;
import com.book.service.serviceImpl.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "BookDetailServlet", urlPatterns = {"/bookDetail", "/bookDetail.jsp"})
public class BookDetailServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        ProductService productService = new ProductService();
        try {
            ProductBean productBean = productService.getDetailById(id);
            request.setAttribute("bookBean", productBean);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/home/bookDetail.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
