package com.book.controller.backend;

import com.book.common.CommonUtils;
import com.book.model.backend.ReturnListBean;
import com.book.service.serviceImpl.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "GetCarouselListServlet", urlPatterns = {"/admin/carousel/carouselList"})
public class GetCarouselListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("是访问这个吗？");
        response.setContentType("json/application;charset=utf-8");
        PrintWriter out = response.getWriter();
        int currentPage = Integer.parseInt(request.getParameter("page"));
        int perPage = Integer.parseInt(request.getParameter("limit"));
        int start = perPage * (currentPage - 1);
        ProductService productService = new ProductService();
        try {
            ReturnListBean dataBean = productService.getAllCarouselByPaginate(start, perPage);
            dataBean.setCode(0);
            dataBean.setMsg("获取成功");
            out.print(CommonUtils.toJson(dataBean));
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
