package com.book.dao;

import com.book.model.backend.UserBean;
import com.book.model.backend.UserListBean;
import com.book.model.home.CenterPersonInfo;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IUserDao {

    // 用户数据交互接口类

    UserListBean getUserList();

    CenterPersonInfo getUserByIdOfCenter(int id);

    UserBean getUserById(int id);

    boolean editBasicInfo(UserBean dataBean);

    boolean editPhone(int id, String number) throws SQLException;

    boolean editPassword(int id, String old_password, String password) throws SQLException;

    boolean editDefaultAddress(int id, int default_address_id) throws SQLException;

    boolean editRoleType(int type);

    boolean destroyUser(int id);

    UserBean userLogin(String username, String password) throws SQLException;

    boolean userRegister(String username, String password) throws SQLException;


}
