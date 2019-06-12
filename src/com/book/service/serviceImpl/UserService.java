package com.book.service.serviceImpl;

import com.book.dao.IUserDao;
import com.book.dao.daoImpl.UserDao;
import com.book.model.backend.UserBean;
import com.book.model.backend.ReturnListBean;
import com.book.model.home.CenterPersonInfo;
import com.book.service.IUserService;

import java.sql.SQLException;

public class UserService implements IUserService {

    private IUserDao userDao = new UserDao();

    @Override
    public ReturnListBean getUserList(int start, int perPage) {
        return userDao.getUserList(start, perPage);
    }

    @Override
    public UserBean getUserById(int id) {
        return userDao.getUserById(id);
    }

    @Override
    public CenterPersonInfo getUserByIdOfCenter(int id) {
        return userDao.getUserByIdOfCenter(id);
    }

    @Override
    public boolean editBasicInfo(UserBean dataBean) {
        return userDao.editBasicInfo(dataBean);
    }

    @Override
    public UserBean userLogin(String username, String password) throws SQLException {
        return userDao.userLogin(username, password);
    }

    @Override
    public boolean userRegister(String username, String password) throws SQLException {
        return userDao.userRegister(username, password);
    }

    @Override
    public boolean editPassword(int id, String old_password, String password) throws SQLException {
        return userDao.editPassword(id, old_password, password);
    }

    @Override
    public boolean destroyUser(int id) throws SQLException {
        return userDao.destroyUser(id);
    }

    @Override
    public int addUser(String username, String password, String phone, int role_type) throws SQLException {
        return userDao.addUser(username, password, phone, role_type);
    }

    @Override
    public boolean updateUserInfo(String sql) throws SQLException {
        return userDao.updateUserInfo(sql);
    }
}
