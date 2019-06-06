package com.book.dao;

import com.book.model.UserBean;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public interface IUserDao {

    // 用户数据交互接口类
    /**
     * 1、获取全部用户
     * 2、获取单个用户
     * 3、修改用户基本信息
     * 4、修改手机号码
     * 5、修改密码
     * 6、根据id删除用户
     * 7、添加用户
     * 8、修改用户的角色
     */

    ArrayList getUserList();

    UserBean getUserById(int id);

    boolean editBasicInfo(UserBean dataBean);

    boolean editPhone(String number);

    boolean editPassword(String password);

    boolean editRoleType(int type);

    boolean destroyUser(int id);

    int addUser(UserBean dataBean);

    UserBean userLogin(String username, String password) throws SQLException;

    boolean userRegister(String username, String password) throws SQLException;


}
