package com.book.controller.backend;

import com.book.common.CommonUtils;
import com.book.model.backend.ReturnListBean;
import com.book.service.serviceImpl.CategoryService;
import com.book.service.serviceImpl.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "GetCategoryListServlet", urlPatterns = {"/admin/category/all"})
public class GetCategoryListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("json/application;charset=utf-8");
        PrintWriter out = response.getWriter();
        int currentPage = Integer.parseInt(request.getParameter("page"));
        int perPage = Integer.parseInt(request.getParameter("limit"));
        int start = perPage * (currentPage - 1);
        try {
            CategoryService categoryService = new CategoryService();
            ReturnListBean dataBean = categoryService.getAllCategoryByPaginate(start, perPage);
            dataBean.setCode(0);
            dataBean.setMsg("获取成功");
            System.out.println(CommonUtils.toJson(dataBean));
            out.print(CommonUtils.toJson(dataBean));
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
