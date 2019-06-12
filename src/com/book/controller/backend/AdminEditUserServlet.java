package com.book.controller.backend;

import com.book.common.CommonUtils;
import com.book.model.backend.ReturnListBean;
import com.book.service.serviceImpl.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "AdminEditUserServlet", urlPatterns = {"/admin/user/edit"})
public class AdminEditUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("json/application;charset=utf-8");
        ReturnListBean dataBean = new ReturnListBean();
        PrintWriter out = response.getWriter();
        String sql = "update user set ";
        String username = request.getParameter("username");
        if (!username.equals("")) {
            sql += "username='" + username + "', ";
        }
        String password = request.getParameter("password");
        if (!password.equals("")) {
            String confirm_password = request.getParameter("confirm_password");
            if (!password.equals(confirm_password)) {
                dataBean.setCode(1);
                dataBean.setMsg("密码不一致");
                out.print(CommonUtils.toJson(dataBean));
                return;
            } else {
                sql += "password='" + password + "',";
            }
        }
        String role = request.getParameter("role_type");
        if (!role.equals("")) {
            int role_type = Integer.parseInt(role);
            sql += "role_type=" + role_type + ",";
        }
        String phone = request.getParameter("phone");
        if (!phone.equals("")) {
            sql += "phone='" + phone + "',";
        }
        sql = sql.substring(0, sql.lastIndexOf(","));
        int id = Integer.parseInt(request.getParameter("id"));
        sql += " where id=" + id;
        UserService userService = new UserService();
        try {
            boolean result = userService.updateUserInfo(sql);
            if (result) {
                dataBean.setCode(0);
                dataBean.setMsg("修改成功");
            } else {
                dataBean.setCode(1);
                dataBean.setMsg("修改失败");
            }
            out.print(CommonUtils.toJson(dataBean));
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
