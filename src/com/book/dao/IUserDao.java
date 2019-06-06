package com.book.dao;

import com.book.model.UserBean;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public interface IUserDao {

    // 用户数据交互接口类

    ArrayList getUserList();

    UserBean getUserById(int id);

    boolean editBasicInfo(UserBean dataBean);

    boolean editPhone(int id, String number) throws SQLException;

    boolean editPassword(int id, String old_password, String password) throws SQLException;

    boolean editDefaultAddress(int id, int default_address_id) throws SQLException;

    boolean editRoleType(int type);

    boolean destroyUser(int id);

    int addUser(UserBean dataBean);

    UserBean userLogin(String username, String password) throws SQLException;

    boolean userRegister(String username, String password) throws SQLException;


}
