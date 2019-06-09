package com.book.controller.home;

import com.book.service.serviceImpl.ProductService;
import org.junit.Test;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "HomeServlet", urlPatterns = {"/index", "/index.jsp"})
public class HomeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text.html;charset:utf-8");
        ArrayList carouselList = (ArrayList) request.getAttribute("carouselList");
        ArrayList categoryList = (ArrayList) request.getAttribute("recommendCategoryList");
        ProductService productService = new ProductService();
        if (carouselList == null) {
            try {
                carouselList = productService.getCarouselList();
                request.setAttribute("carouselList", carouselList);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (categoryList == null) {
            try {
                categoryList = productService.getRecommendCategories();
                request.setAttribute("recommendCategoryList", categoryList);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/home/index.jsp");
        dispatcher.forward(request, response);
    }
}
