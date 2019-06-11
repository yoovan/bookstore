package com.book.controller.backend;

import com.book.model.backend.UserBean;
import com.book.model.backend.UserListBean;
import com.book.service.serviceImpl.UserService;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "GetUserListServlet", urlPatterns = {"/admin/user/all"})
public class GetUserListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("json/application;charset=utf-8");
        PrintWriter out = response.getWriter();
        UserService userService = new UserService();
        UserListBean userListBean= userService.getUserList();
        userListBean.setCode(0);
        userListBean.setMsg("获取成功");
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(userListBean);
        System.out.println("json: " + json);
        out.print(json);
    }
}
