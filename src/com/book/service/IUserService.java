package com.book.service;

import com.book.model.backend.UserBean;
import com.book.model.backend.ReturnListBean;
import com.book.model.home.CenterPersonInfo;

import java.sql.SQLException;

public interface IUserService {
    ReturnListBean getUserList();

    UserBean getUserById(int id);

    CenterPersonInfo getUserByIdOfCenter(int id);

    boolean editBasicInfo(UserBean dataBean);

    UserBean userLogin(String username, String password) throws SQLException;

    boolean userRegister(String username, String password) throws SQLException;

    boolean editPassword(int id, String old_password, String password) throws SQLException;
}
