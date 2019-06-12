package com.book.controller.backend;

import com.book.common.CommonUtils;
import com.book.model.backend.ReturnListBean;
import com.book.service.serviceImpl.UserService;

import javax.print.attribute.standard.RequestingUserName;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Enumeration;

@WebServlet(name = "AdminUserAddServlet", urlPatterns = {"/admin/user/add", "/admin/user/add.jsp"})
public class AdminUserAddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("json/application;charset=utf-8");
        PrintWriter out = response.getWriter();
        ReturnListBean dataBean = new ReturnListBean();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirm_password = request.getParameter("confirm_password");
        String phone = request.getParameter("phone");
        int role_type = Integer.parseInt(request.getParameter("role_type"));
        if (!password.equals(confirm_password)) {
            dataBean.setCode(1);
            dataBean.setMsg("密码不一致");
            out.print(CommonUtils.toJson(dataBean));
            return;
        }
        UserService userService = new UserService();
        try {
            int id = userService.addUser(username, password, phone, role_type);
            System.out.println("servlet insert id: " + id);
            if (id > 0) {
                dataBean.setCode(0);
                dataBean.setMsg("添加成功");
                out.print(CommonUtils.toJson(dataBean));
            } else {
                dataBean.setCode(1);
                dataBean.setMsg("添加失败");
                out.print(CommonUtils.toJson(dataBean));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/backend/user/add.jsp");
        dispatcher.forward(request, response);
    }
}
