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

@WebServlet(name = "DestroyUserServlet", urlPatterns = {"/admin/user/destroy"})
public class DestroyUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("json/application;charset=utf-8");
        ReturnListBean dataBean = new ReturnListBean();
        PrintWriter out = response.getWriter();
        int id = Integer.parseInt(request.getParameter("id"));
        UserService userService = new UserService();
        try {
            boolean result = userService.destroyUser(id);
            if (result) {
                dataBean.setCode(0);
                dataBean.setMsg("删除成功");
            } else {
                dataBean.setCode(1);
                dataBean.setMsg("删除失败");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        out.print(CommonUtils.toJson(dataBean));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
