package com.book.service;

import com.book.model.UserBean;

import java.util.ArrayList;

public interface IUserService {
    ArrayList getUserList();

    UserBean getUserById(int id);

    boolean editBasicInfo(UserBean dataBean);
}
