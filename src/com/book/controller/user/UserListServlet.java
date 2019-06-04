package com.book.controller.user;

import com.book.common.CommonUtils;
import com.book.service.IUserService;
import com.book.service.serviceImpl.UserService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "UserListServlet", urlPatterns = "/user/list")
public class UserListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        IUserService userService = new UserService();
        ArrayList list = userService.getUserList();
        request.setAttribute("userList", list);
        CommonUtils.redirect(request, response, "/index.jsp");
    }
}
