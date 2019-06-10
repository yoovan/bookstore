package com.book.controller.home;

import com.book.model.home.ProductBean;
import com.book.service.serviceImpl.ProductService;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "AddToCartServlet", urlPatterns = {"/addToCart", "/addToCart.jsp"})
public class AddToCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println("id: " +id );
        String callback = request.getParameter("callback");
        ProductService productService = new ProductService();
        ServletContext application = request.getServletContext();
        ArrayList<ProductBean> list = (ArrayList) application.getAttribute("cartList");
        if (list == null) {
            list = new ArrayList<>();
            application.setAttribute("cartList", list);
        }
        try {
            ProductBean productBean = productService.getDetailById(id);
            System.out.println(productBean.getTitle());
            list.add(productBean);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        out.print(callback + "('added')");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
