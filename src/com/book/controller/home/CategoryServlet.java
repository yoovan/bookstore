package com.book.controller.home;

import com.book.service.ICategoryService;
import com.book.service.serviceImpl.CategoryService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "CategoryServlet", urlPatterns = {"/categories", "/categories.jsp"})
public class CategoryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ICategoryService categoryService = null;
        try {
            categoryService = new CategoryService();
            ArrayList list = categoryService.getAllCategory();
            request.setAttribute("categoryList", list);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/home/categories.jsp");
            dispatcher.forward(request, response);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
