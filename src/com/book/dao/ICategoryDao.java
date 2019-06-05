package com.book.dao;

import java.sql.SQLException;
import java.util.ArrayList;

public interface ICategoryDao {
    ArrayList getAllCategory() throws SQLException;

    ArrayList getCategoryAndBookById(int id) throws SQLException;
}
