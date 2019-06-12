package com.book.controller.backend;

import com.book.common.CommonUtils;
import com.book.model.backend.ReturnListBean;
import com.book.service.serviceImpl.CategoryService;
import com.book.service.serviceImpl.ImageService;
import com.book.service.serviceImpl.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "AdminProductAddServlet", urlPatterns = {"/admin/product/add", "/admin/product/add.jsp"})
public class AdminProductAddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("json/application;charset=utf-8");
        PrintWriter out = response.getWriter();
        ReturnListBean resultBean = new ReturnListBean();
        String sql = this.handleSql(request);
        ProductService productService = new ProductService();
        try {
            int result = productService.addProductReturnInt(sql);
            if (result > 0) {
                ImageService imageService = new ImageService();
                String thumb = request.getParameter("thumb");
                if (!thumb.equals("")) {
                    imageService.saveImage(result, 0, thumb);
                }
                String carousel = request.getParameter("carousel");
                if (!carousel.equals("")) {
                    imageService.saveImage(result, 3, thumb);
                }
                resultBean.setCode(0);
                resultBean.setMsg("添加成功");
            } else {
                resultBean.setCode(1);
                resultBean.setMsg("添加失败");
            }
            out.print(CommonUtils.toJson(resultBean));
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            CategoryService categoryService = new CategoryService();
            ArrayList list = categoryService.getAllCategory();
            request.setAttribute("categoriesList", list);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/backend/product/add.jsp");
        dispatcher.forward(request, response);
    }

    private String handleSql (HttpServletRequest request) {
        String sql = "insert into product ";
        String temp = "(";
        String temp2 = "values(";
        String ISBN = request.getParameter("isbn");
        if (!ISBN.equals("")){
            temp += "isbn,";
            temp2 += "'" + ISBN + "',";
        }
        String title = request.getParameter("title");
        if (!title.equals("")) {
            temp += "title,";
            temp2 += "'" + title + "',";
        }
        String author = request.getParameter("author");
        if(!author.equals("")) {
            temp += "author,";
            temp2 += "'" + author + "',";
        }
        String price_s = request.getParameter("price");
        if (!price_s.equals("")) {
            temp += "price,";
            float price = Float.parseFloat(price_s);
            temp2 += "" + price + ",";
        }
        String series = request.getParameter("series");
        if (!series.equals("")) {
            temp += "series,";
            temp2 += "'" + series + "',";
        }
        String id = request.getParameter("category_id");
        if (!id.equals("")) {
            temp += "category_id,";
            int categroy_id = Integer.parseInt(id);
            temp2 += "" + categroy_id + ",";
        }
        String publishing_house = request.getParameter("publishing_house");
        if (!publishing_house.equals("")) {
            temp += "publishing_house,";
            temp2 += "'" + publishing_house + "',";
        }
        String publishing_time = request.getParameter("publishing_time");
        if (!publishing_time.equals("")) {
            temp += "publishing_time,";
            temp2 += "'" + publishing_time + "',";
        }
        String format = request.getParameter("format");
        if (!format.equals("")) {
            temp += "format,";
            temp2 += "'" + format + "',";
        }
        String pageSize = request.getParameter("page_size");
        if (!pageSize.equals("")) {
            temp += "page_size,";
            int page_size = Integer.parseInt(pageSize);
            temp2 +=  page_size + ",";
        }
        String edition_s = request.getParameter("edition");
        if (!edition_s.equals("")) {
            temp += "edition,";
            int edition = Integer.parseInt(edition_s);
            temp2 += edition + ",";
        }
        String summary = request.getParameter("summary");
        if (!summary.equals("")) {
            temp += "summary,";
            temp2 += "'" + summary + "',";
        }
        String catalogue = request.getParameter("catalogue");
        if (!catalogue.equals("")) {
            temp += "catalogue,";
            temp2 += "'" + catalogue + "',";
        }
        int type = Integer.parseInt(request.getParameter("type"));
        temp += "type,";
        temp2 +=  type + ",";
        temp = temp.substring(0, temp.lastIndexOf(","));
        temp += ")";
        temp2 = temp2.substring(0, temp2.lastIndexOf(","));
        temp2 += ")";
        sql = sql + temp + temp2;
        return sql;
    }
}
