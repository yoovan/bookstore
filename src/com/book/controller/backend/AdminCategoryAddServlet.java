package com.book.controller.backend;

import com.book.common.CommonUtils;
import com.book.model.backend.ReturnListBean;
import com.book.service.serviceImpl.CategoryService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "AdminCategoryAddServlet", urlPatterns = {"/admin/category/add", "/admin/category/add.jsp"})
public class AdminCategoryAddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("json/application;charset=utf-8");
        PrintWriter out = response.getWriter();
        ReturnListBean resultBean = new ReturnListBean();
        String name = request.getParameter("name");
        int pid = Integer.parseInt(request.getParameter("pid"));
        int level = 2;
        if (pid > 0) {
            level = 1;
        }
        int type = Integer.parseInt(request.getParameter("type"));
        String sql = "insert into category (`name`, level, pid, type) values ('" + name + "', " + level + ", " + pid + ", " + type + ")";
        try {
            CategoryService categoryService = new CategoryService();
            boolean result = categoryService.addCategory(sql);
            if (result) {
                resultBean.setCode(0);
                resultBean.setMsg("添加成功");
            } else {
                resultBean.setCode(1);
                resultBean.setMsg("添加失败");
            }
            out.print(CommonUtils.toJson(resultBean));
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            CategoryService categoryService = new CategoryService();
            ArrayList list = categoryService.getFirstLevelCategories();
            request.setAttribute("categoriesList", list);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/backend/category/add.jsp");
        dispatcher.forward(request, response);
    }
}
