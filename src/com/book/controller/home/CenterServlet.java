package com.book.controller.home;

import com.book.model.UserBean;
import com.book.model.home.CenterPersonInfo;
import com.book.service.serviceImpl.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CenterServlet", urlPatterns = {"/center", "/center.jsp"})
public class CenterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println("id: " + id);
        UserService userService = new UserService();
        CenterPersonInfo centerPersonInfo = userService.getUserByIdOfCenter(id);
        System.out.println("username: " + centerPersonInfo.getUsername());
        request.setAttribute("userBean", centerPersonInfo);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/home/center.jsp");
        dispatcher.forward(request, response);
    }
}
