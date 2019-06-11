package com.book.controller.home;

import com.book.model.backend.UserBean;
import com.book.service.serviceImpl.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "PasswordEditServlet", urlPatterns = {"/passwordEdit", "/passwordEdit.jsp"})
public class PasswordEditServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        HttpSession session = request.getSession();
        UserBean userBean = (UserBean) session.getAttribute("loginUser");
        int id = 0;
        if (userBean != null) {
            id = userBean.getId();
        }
        System.out.println("id: " + id);
        if (!newPassword.equals(confirmPassword)) {
            response.sendRedirect("center.jsp");
        }
        UserService userService = new UserService();
        try {
            userService.editPassword(id, oldPassword, newPassword);
            response.sendRedirect("center.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
