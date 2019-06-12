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

@WebServlet(name = "AdminRemoveProductServlet", urlPatterns = {"/admin/product/remove"})
public class AdminRemoveProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("json/application;charset=utf-8");
        PrintWriter out = response.getWriter();
        ReturnListBean resultBean = new ReturnListBean();
        int id = Integer.parseInt(request.getParameter("id"));
        ProductService productService = new ProductService();
        try {
            boolean result = productService.removeProduct(id);
            if (result){
                resultBean.setCode(0);
                resultBean.setMsg("删除成功");
            } else {
                resultBean.setCode(0);
                resultBean.setMsg("删除失败");
            }
            out.print(CommonUtils.toJson(resultBean));
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
