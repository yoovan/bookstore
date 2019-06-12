package com.book.dao;

import java.sql.SQLException;

public interface IImageDao {

    boolean saveImage(int id, int type, String src) throws SQLException;
}
