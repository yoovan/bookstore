package com.book.dao;

import com.book.model.backend.UserBean;
import com.book.model.backend.ReturnListBean;
import com.book.model.home.CenterPersonInfo;

import java.sql.SQLException;

public interface IUserDao {

    // 用户数据交互接口类

    ReturnListBean getUserList(int start, int perPage);

    CenterPersonInfo getUserByIdOfCenter(int id);

    UserBean getUserById(int id);

    boolean editBasicInfo(UserBean dataBean);

    boolean updateUserInfo(String sql) throws SQLException;

    boolean editPhone(int id, String number) throws SQLException;

    boolean editPassword(int id, String old_password, String password) throws SQLException;

    boolean editDefaultAddress(int id, int default_address_id) throws SQLException;

    boolean editRoleType(int type);

    boolean destroyUser(int id) throws SQLException;

    int addUser(String username, String password, String phone, int role_type) throws SQLException;

    UserBean userLogin(String username, String password) throws SQLException;

    boolean userRegister(String username, String password) throws SQLException;


}
