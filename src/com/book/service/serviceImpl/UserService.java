package com.book.service.serviceImpl;

import com.book.dao.IUserDao;
import com.book.dao.daoImpl.UserDao;
import com.book.model.UserBean;
import com.book.service.IUserService;

import java.sql.SQLException;
import java.util.ArrayList;

public class UserService implements IUserService {

    private IUserDao userDao = new UserDao();

    @Override
    public ArrayList getUserList() {
        return userDao.getUserList();
    }

    @Override
    public UserBean getUserById(int id) {
        return userDao.getUserById(id);
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
}
