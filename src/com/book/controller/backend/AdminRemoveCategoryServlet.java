package com.book.controller.backend;

import com.book.common.CommonUtils;
import com.book.model.backend.ReturnListBean;
import com.book.service.serviceImpl.CategoryService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "AdminRemoveCategoryServlet", urlPatterns = {"/admin/category/remove"})
public class AdminRemoveCategoryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("json/application;charset=utf-8");
        PrintWriter out = response.getWriter();
        ReturnListBean resultBean = new ReturnListBean();
        int id = Integer.parseInt(request.getParameter("id"));
        CategoryService categoryService = null;
        try {
            categoryService = new CategoryService();
            boolean result = categoryService.removeCategory(id);
            if (result) {
                resultBean.setCode(0);
                resultBean.setMsg("删除成功");
            } else {
                resultBean.setCode(1);
                resultBean.setMsg("删除失败");
            }
            out.print(CommonUtils.toJson(resultBean));
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
