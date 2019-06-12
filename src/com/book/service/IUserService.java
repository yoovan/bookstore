package com.book.service;

import com.book.model.backend.UserBean;
import com.book.model.backend.ReturnListBean;
import com.book.model.home.CenterPersonInfo;

import java.sql.SQLException;

public interface IUserService {
    ReturnListBean getUserList(int start, int perPage);

    UserBean getUserById(int id);

    CenterPersonInfo getUserByIdOfCenter(int id);

    boolean editBasicInfo(UserBean dataBean);

    boolean destroyUser(int id) throws SQLException;

    public int addUser(String username, String password, String phone, int role_type) throws SQLException;

    UserBean userLogin(String username, String password) throws SQLException;

    boolean userRegister(String username, String password) throws SQLException;

    boolean editPassword(int id, String old_password, String password) throws SQLException;

    boolean updateUserInfo(String sql) throws SQLException;
}
