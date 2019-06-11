package com.book.controller.home;

import com.book.model.backend.UserBean;
import com.book.model.home.CenterPersonInfo;
import com.book.model.home.OrderManagerBean;
import com.book.service.serviceImpl.OrderService;
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

@WebServlet(name = "CenterServlet", urlPatterns = {"/center", "/center.jsp"})
public class CenterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserBean userBean = (UserBean) session.getAttribute("loginUser");
        if (userBean == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        int id = Integer.parseInt(request.getParameter("id"));
        UserService userService = new UserService();
        CenterPersonInfo centerPersonInfo = userService.getUserByIdOfCenter(id);
        try {
            OrderService orderService = new OrderService();
            OrderManagerBean targetBean = orderService.getAllOrderByUserId(id, 8);
            request.setAttribute("orderList", targetBean);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("userBean", centerPersonInfo);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/home/center.jsp");
        dispatcher.forward(request, response);
    }
}
