package com.book.controller.home;

import com.book.service.serviceImpl.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "SearchServlet", urlPatterns = {"/search", "/search.jsp"})
public class SearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String name = request.getParameter("name");
        ProductService productService = new ProductService();
        try {
            ArrayList searchList = productService.searchProductByName(name);
            request.setAttribute("searchList", searchList);
            System.out.println("size: " + searchList.size());
            RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/home/search.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
