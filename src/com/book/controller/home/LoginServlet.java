package com.book.controller.home;

import com.book.model.backend.UserBean;
import com.book.service.serviceImpl.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login", "/login.jsp"})
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (username == null || username.equals("") || password == null || password.equals("")) {
            response.sendRedirect("login.jsp");
            return;
        }
        UserService userService = new UserService();
        HttpSession session = request.getSession();
        try {
            UserBean userBean = userService.userLogin(username, password);
            if (userBean == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            session.setAttribute("loginUser", userBean);
            response.sendRedirect("index.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/home/login.jsp");
        dispatcher.forward(request, response);
    }
}
