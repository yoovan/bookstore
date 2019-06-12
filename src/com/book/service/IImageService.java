package com.book.service;

import java.sql.SQLException;

public interface IImageService {
    boolean saveImage(int id, int type, String src) throws SQLException;
}
