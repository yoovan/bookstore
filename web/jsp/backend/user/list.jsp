<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>用户列表</title>
    <link rel="stylesheet" href="<c:url value="/resources/backend/assets/css/layui.css" /> ">
</head>
<body>
<div class="layui-card">
    <div class="layui-card-header">
        <span class="layui-breadcrumb">
            <a href="#">用户管理</a>
            <a href="#"><cite>用户列表</cite></a>
        </span>
    </div>
    <div class="layui-card-body layui-bg-gray">
        <div class="layui-fluid" style="background: white; padding-bottom: 20px;">
            <div class="layui-row" style="padding-top: 10px;">
                <form action="#" class="layui-form">
                    <div class="layui-form-item layui-inline">
                        <button class="layui-btn layui-btn-normal layui-icon layui-icon-add-1" id="add">新增</button>
                    </div>
                    <div class="layui-form-item layui-inline">
                        <div class="layui-input-inline">
                            <select name="status" id="">
                                <option value="#"></option>
                                <option value="0">用户名</option>
                                <option value="1">手机号码</option>
                                <option value="2">性别</option>
                            </select>
                        </div>
                        <div class="layui-input-inline">
                            <input type="text" class="layui-input" name="search" placeholder="请输入关键字">
                        </div>
                        <div class="layui-input-inline">
                            <input type="submit" class="layui-btn" value="搜索">
                        </div>
                    </div>
                </form>

            </div>
            <div class="layui-row">
                <table id="userList" class="layui-hide" lay-filter="test"></table>
                <script type="text/html" id="toolbar">
                    <div class="layui-btn-container">
                        <a href="#" class="layui-btn layui-icon layui-icon-edit layui-btn-sm" lay-event="edit"></a>
                        <a href="#" class="layui-btn layui-btn-danger layui-icon layui-icon-delete layui-btn-sm"
                           lay-event="delete"></a>
                    </div>
                </script>
            </div>
        </div>
    </div>
</div>

<script src="<c:url value="/resources/backend/assets/layui/layui.js" />"></script>
<script src="<c:url value="/resources/backend/assets/js/userData.js" />"></script>
<script src="<c:url value="/resources/backend/assets/js/userTable.js" />"></script>
</body>
<div id="testDemo" style="display: none; padding-top: 15px; width: 900px;" class="layui-container">
    <form action="admin/user/plus" method="post" class="layui-form" lay-filter="editForm">
        <input type="hidden" name="id">
        <div class="layui-form-item">
            <label for="username" class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" name="username" value="" id="username" required autocomplete="false"
                       placeholder="用户名" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="password" class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <input type="text" name="password" value="" id="password" required autocomplete="false" placeholder="密码"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="confirm_password" class="layui-form-label">确认密码</label>
            <div class="layui-input-block">
                <input type="text" name="confirm_password" value="" id="confirm_password" required autocomplete="false"
                       placeholder="确认密码" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">角色</label>
            <div class="layui-input-block">
                <input type="radio" name="role_type" value="0" checked title="普通用户">
                <input type="radio" name="role_type" value="1" title="管理员">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="phone" class="layui-form-label">手机号码</label>
            <div class="layui-input-inline">
                <input type="text" name="phone" id="phone" placeholder="手机号码" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <input type="button" value="提交" class="layui-btn" lay-submit lay-filter="submitBtn">
                <input type="button" value="取消" class="layui-btn layui-btn-primary">
            </div>
        </div>
    </form>
</div>
</html>