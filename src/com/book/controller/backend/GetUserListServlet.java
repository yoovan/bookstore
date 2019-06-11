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

@WebServlet(name = "GetUserListServlet", urlPatterns = {"/admin/user/all"})
public class GetUserListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("json/application;charset=utf-8");
        PrintWriter out = response.getWriter();
        int currentPage = Integer.parseInt(request.getParameter("page"));
        int perPage = Integer.parseInt(request.getParameter("limit"));
        System.out.println("page: " + currentPage + " - " + " limit: " + perPage );
        int start = perPage * (currentPage - 1);
        UserService userService = new UserService();
        ReturnListBean userListBean= userService.getUserList(start, perPage);
        userListBean.setCode(0);
        userListBean.setMsg("获取成功");
        String json = CommonUtils.toJson(userListBean);
        System.out.println("json: " + json);
        out.print(json);
    }
}
