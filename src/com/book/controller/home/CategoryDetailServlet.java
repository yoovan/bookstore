package com.book.controller.home;

import com.book.model.home.SingleCategoryBean;
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

@WebServlet(name = "CategoryDetailServlet", urlPatterns = {"/categoryDetail", "/categoryDetail.jsp"})
public class CategoryDetailServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println("id: " + id);
        try {
            CategoryService categoryService = new CategoryService();
            SingleCategoryBean singleCategoryBean = categoryService.getCategoryAndBookById(id);
            System.out.println("size: " + singleCategoryBean.getName());
            request.setAttribute("subList", singleCategoryBean);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/home/categoryDetail.jsp");
            dispatcher.forward(request, response);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
