package com.book.controller.backend;

import com.book.common.CommonUtils;
import com.book.model.backend.ReturnListBean;
import com.book.model.home.ProductBean;
import com.book.service.serviceImpl.ImageService;
import com.book.service.serviceImpl.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "AdminEditProductServlet", urlPatterns = {"/admin/product/edit"})
public class AdminEditProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("json/application;charset=utf-8");
        PrintWriter out = response.getWriter();
        ReturnListBean resultBean = new ReturnListBean();
        String sql = this.handleSql(request);
        String id_s = request.getParameter("id");
        if (!id_s.equals("")) {
            int id = Integer.parseInt(id_s);
            sql += " where id=" + id;
            System.out.println("sql: " + sql);
            ProductService productService = new ProductService();
            try {
                boolean result = productService.updateProduct(sql);
                if (result) {
                    ImageService imageService = new ImageService();
                    String thumb = request.getParameter("thumb");
                    if (!thumb.equals("")) {
                        imageService.saveImage(id, 0, thumb);
                    }
                    String carousel = request.getParameter("carousel");
                    if (!carousel.equals("")) {
                        imageService.saveImage(id, 3, thumb);
                    }
                    resultBean.setCode(0);
                    resultBean.setMsg("修改成功");
                } else {
                    resultBean.setCode(1);
                    resultBean.setMsg("修改失败");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            out.print(CommonUtils.toJson(resultBean));
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private String handleSql(HttpServletRequest request) {
        String sql = "update product set ";
        String isbn = request.getParameter("isbn");
        if (!isbn.equals("")) {
            sql += "isbn='" + isbn + "',";
        }
        String title = request.getParameter("title");
        if (!title.equals("")) {
            sql += "title='" + title+ "',";
        }
        String author = request.getParameter("author");
        if(!author.equals("")) {
            sql += "author='" + author+ "',";
        }
        String price_s = request.getParameter("price");
        if (!price_s.equals("")) {
            float price = Float.parseFloat(price_s);
            sql += "price=" + price+ ",";
        }
        int type = Integer.parseInt(request.getParameter("type"));
        sql += "type=" + type + ",";
        String series = request.getParameter("series");
        if (!series.equals("")) {
            sql += "series='" + series + "',";
        }
        String id = request.getParameter("category_id");
        if (!id.equals("")) {
            int categroy_id = Integer.parseInt(id);
            sql += "category_id=" + categroy_id + ",";
        }
        String publishing_house = request.getParameter("publishing_house");
        if (!publishing_house.equals("")) {
            sql += "publishing_house='" + publishing_house + "',";
        }
        String publishing_time = request.getParameter("publishing_time");
        if (!publishing_time.equals("")) {
            sql += "publishing_time='" + publishing_time + "',";
        }
        String format = request.getParameter("format");
        if (!format.equals("")) {
            sql += "format='" + format + "',";
        }
        String pageSize = request.getParameter("page_size");
        if (!pageSize.equals("")) {
            int page_size = Integer.parseInt(pageSize);
            sql += "page_size=" + page_size + ",";
        }
        String edition_s = request.getParameter("edition");
        if (!edition_s.equals("")) {
            int edition = Integer.parseInt(edition_s);
            sql += "edition=" + edition + ",";
        }
        String summary = request.getParameter("summary");
        if (!summary.equals("")) {
            sql += "summary='" + summary + "',";
        }
        String catalogue = request.getParameter("catalogue");
        if (!catalogue.equals("")) {
            sql += "catalogue='" + catalogue + "',";
        }
        sql = sql.substring(0, sql.lastIndexOf(","));
        return sql;
    }
}
