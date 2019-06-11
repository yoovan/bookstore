package com.book.controller.user;

import com.book.common.CommonUtils;
import com.book.model.backend.UserBean;
import com.book.service.IUserService;
import com.book.service.serviceImpl.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "SingleUserServlet", urlPatterns = "/user/show")
public class SingleUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sid = request.getParameter("id");
        PrintWriter writer = response.getWriter();
        if (sid != null && sid.length() > 0){
            int id = Integer.parseInt(sid);
            IUserService userService = new UserService();
            UserBean dataBean = userService.getUserById(id);
            request.setAttribute("userBean", dataBean);
            CommonUtils.redirect(request, response, "/index.jsp");
        } else {
            writer.print("need id");
        }
    }


}
