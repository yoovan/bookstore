package com.book.service;

import com.book.model.UserBean;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IUserService {
    ArrayList getUserList();

    UserBean getUserById(int id);

    boolean editBasicInfo(UserBean dataBean);

    UserBean userLogin(String username, String password) throws SQLException;

    boolean userRegister(String username, String password) throws SQLException;
}
