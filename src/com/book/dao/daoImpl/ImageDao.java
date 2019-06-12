package com.book.dao.daoImpl;

import com.book.common.DatabaseConnector;
import com.book.dao.IImageDao;

import java.sql.*;

public class ImageDao implements IImageDao {
    private Connection conn;
    public ImageDao() throws ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        this.conn = DatabaseConnector.connect();
    }

    @Override
    public boolean saveImage(int id, int type, String src) throws SQLException {
        String sql = "insert into image (url, type, product_id) values (?,?,?)";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, src);
        pstmt.setInt(2, type);
        pstmt.setInt(3, id);
        pstmt.execute();
        return true;
    }
}
