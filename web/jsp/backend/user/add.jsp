<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>新增用户</title>
    <link rel="stylesheet" href="<c:url value="/resources/backend/assets/css/layui.css" /> ">
</head>
<body>
<div class="layui-card">
    <div class="layui-card-header">
        <div class="layui-breadcrumb">
            <a href="#">用户管理</a>
            <a href="#"><cite>新增用户</cite></a>
        </div>
    </div>
    <div class="layui-card-body layui-bg-gray">
        <div class="layui-fluid" style="background: white; padding-bottom: 20px;">
            <form action="#" class="layui-form" style="padding-top: 20px;" lay-filter="addForm">
                <div class="layui-form-item">
                    <label for="username" class="layui-form-label">用户名</label>
                    <div class="layui-input-inline">
                        <input type="text" name="username" id="username" class="layui-input" required placeholder="请输入用户名">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="password" class="layui-form-label">密码</label>
                    <div class="layui-input-inline">
                        <input type="text" name="password" id="password" class="layui-input" required placeholder="请输入密码">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="confirm_password" class="layui-form-label">确认密码</label>
                    <div class="layui-input-inline">
                        <input type="text" name="confirm_password" id="confirm_password" class="layui-input" required placeholder="请确认密码">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">角色</label>
                    <div class="layui-input-block">
                        <input type="radio" name="role_type" value="0" title="普通用户" checked>
                        <input type="radio" name="role_type" value="1" title="管理员">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="phone" class="layui-form-label">手机号码</label>
                    <div class="layui-input-inline">
                        <input type="text" class="layui-input" name="phone" id="phone" placeholder="手机号码">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <input type="button" class="layui-btn" lay-submit lay-filter="submitBtn" value="立即添加">
                        <button class="layui-btn layui-btn-primary">取消</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="<c:url value="/resources/backend/assets/layui/layui.js" />"></script>
<script>
    layui.use(['form', 'element'], function () {
        var element = layui.element,
            form = layui.form,
            $ = layui.jquery;
        form.on("submit(submitBtn)", function (data) {
            $.ajax({
                url: "add",
                type: "post",
                data: data.field,
                success: function (data) {
                     layer.msg(data.msg);
                     form.val("addForm", {
                         username: "",
                         password: "",
                         confirm_password: "",
                         phone: ""
                     });
                },
                error: function (err) {
                    console.log(err);
                    layer.msg("操作失败");
                }
            });
        });
    })
</script>
</body>
</html>