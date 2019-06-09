package com.book.dao.daoImpl;

import com.book.common.DatabaseConnector;
import com.book.dao.IUserDao;
import com.book.model.UserBean;

import java.sql.*;
import java.util.ArrayList;

public class UserDao implements IUserDao {
    private Connection conn;
    public UserDao() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            this.conn = DatabaseConnector.connect();
        } catch (ClassNotFoundException e) {
            System.out.println("驱动加载失败：" + e.getMessage());
        }
    }

    @Override
    public ArrayList getUserList() {
        ArrayList<UserBean> userList = new ArrayList<>();
        String sql = "select * from user";
        try {
            Statement stmt = this.conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                UserBean dataBean = this.initialUserData(rs);
                userList.add(dataBean);
            }
        } catch (SQLException e) {
            System.out.println("SQLException: " + e.getMessage());
        }
        return userList;
    }

    @Override
    public UserBean getUserById(int id) {
        UserBean dataBean = null;
        try {
            String sql = "select * from user where id=?";
            PreparedStatement pstmt = this.conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            rs.next();
            dataBean = this.initialUserData(rs);
            System.out.println("get user who id is " + id + " is success...");
        } catch (SQLException e) {
            System.out.println("SQLException: " + e.getMessage());
        }
        return dataBean;
    }

    @Override
    public boolean editBasicInfo(UserBean dataBean) {
        String sql = "update user set username=?, role_type=?, phone=?";
        boolean avatarFlag = false, addressdFlag = false;
        if (dataBean.getAvatar() != null) {
            sql += " , avatar=?";
            avatarFlag = true;
        }
        if (dataBean.getDefault_address_id() != 0) {
            sql += " , default_address_id=? ";
            addressdFlag = true;
        }
        sql += " where id=?";
        System.out.println("sql: " + sql);
        try {
            PreparedStatement pstmt = this.conn.prepareStatement(sql);
            pstmt.setString(1, dataBean.getUsername());
            pstmt.setInt(2, dataBean.getRole_type());
            pstmt.setString(3, dataBean.getPhone());
            if (avatarFlag) {
                pstmt.setString(4, dataBean.getAvatar());
                // 如果有头像还有默认地址，则id是第6个
                if (addressdFlag) {
                    pstmt.setInt(5, dataBean.getDefault_address_id());
                    pstmt.setInt(6, dataBean.getId());
                } else {
                    pstmt.setInt(5, dataBean.getId());
                }
            }
            int result = pstmt.executeUpdate();
            // if edited
            if (result != 0) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("SQLException: " + e.getMessage());
        }
        return false;
    }

    @Override
    public boolean editPhone(int id, String number) throws SQLException {
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        String sql = "select phone from user where id=" + id;
        ResultSet rs = stmt.executeQuery(sql);
        if (rs.next()) {
            rs.updateString("phone", number);
            rs.updateRow();
            return true;
        }
        return false;
    }

    @Override
    public boolean editPassword(int id, String old_password, String password) throws SQLException {
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
        String sql = "select password from user where id=" + id;
        ResultSet rs = stmt.executeQuery(sql);
        if (rs.next() && rs.getString("password").equals(old_password)) {
            rs.updateString("password", password);
            rs.updateRow();
            return true;
        }
        return false;
    }

    @Override
    public boolean editDefaultAddress(int id, int default_address_id) throws SQLException {
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        String sql = "select default_address_id from user where id=" + id;
        ResultSet rs = stmt.executeQuery(sql);
        if (rs.next()) {
            rs.updateInt("default_address_id", default_address_id);
            rs.updateRow();
            return true;
        }
        return false;
    }

    @Override
    public boolean editRoleType(int type) {
        return false;
    }

    @Override
    public boolean destroyUser(int id) {
        return false;
    }

    @Override
    public int addUser(UserBean dataBean) {
        return 0;
    }

    private UserBean initialUserData(ResultSet rs) throws SQLException {
        UserBean dataBean = new UserBean();
        dataBean.setId(rs.getInt("id"));
        dataBean.setUsername(rs.getString("username"));
        dataBean.setPassword(rs.getString("password"));
        dataBean.setAvatar(rs.getString("avatar"));
        dataBean.setPhone(rs.getString("phone"));
        dataBean.setRole_type(rs.getInt("role_type"));
        dataBean.setDefault_address_id(rs.getInt("default_address_id"));
        dataBean.setCreate_at(rs.getDate("created_at"));
        dataBean.setDeleted_at(rs.getDate("deleted_at"));
        return dataBean;
    }

    @Override
    public UserBean userLogin(String username, String password) throws SQLException {
        String sql = "select * from user where username=? and password=?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, username);
        pstmt.setString(2, password);
        ResultSet rs = pstmt.executeQuery();
        if (rs != null) {
            UserBean dataBean = new UserBean();
            while(rs.next()) {
                dataBean.setId(rs.getInt("id"));
                dataBean.setRole_type(rs.getInt("role_type"));
                dataBean.setUsername(rs.getString("username"));
                dataBean.setAvatar(rs.getString("avatar"));
            }
            return dataBean;
        } else {
            return null;
        }
    }

    @Override
    public boolean userRegister(String username, String password) throws SQLException {
//        UserBean dataBean = this.userLogin(username, password);

        String sql = "insert into user (username, role_type, password) values(?, ?, ?)";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, username);
        pstmt.setInt(2, 0);
        pstmt.setString(3, password);
        pstmt.execute();
        return true;
    }
}
