<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>首页</title>
    <link rel="stylesheet" href="<c:url value='/resources/backend/assets/css/layui.css' />">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">图书管理系统</div>
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item layui-this">
                <a href="control.jsp" target="right">控制台</a>
            </li>
            <li class="layui-nav-item">
                <a href="#">系统配置</a>
                <dl class="layui-nav-child">
                    <dd><a href="#">配置列表</a></dd>
                    <dd><a href="#">新增配置项</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript: ;">
                    <img src="<c:url value="/resources/backend/assets/images/face.jpeg" />" class="layui-nav-img">
                    yostar
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="#">基本资料</a></dd>
                    <dd><a href="#">修改密码</a></dd>
                    <dd><a href="#">退出登录</a></dd>
                </dl>
            </li>
        </ul>
    </div>
    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <ul class="layui-nav layui-nav-tree">
                <li class="layui-nav-item layui-nav-itemed">
                    <a href="#">用户管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="user/list.jsp" target="right">用户列表</a></dd>
                        <dd><a href="user/add.jsp" target="right">新增用户</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="#">产品管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="product/list.jsp" target="right">产品列表</a></dd>
                        <dd><a href="product/add.jsp" target="right">新增产品</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="#">轮播管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="carousel/list.jsp" target="right">轮播列表</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="#">订单管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="order/list.jsp" target="right">订单列表</a></dd>
                        <!--<dd><a href="#">新增用户</a></dd>-->
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="#">分类管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="category/list.jsp" target="right">分类列表</a></dd>
                        <dd><a href="category/add.jsp" target="right">新增分类</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>
    <div class="layui-body layui-bg-gray">
        <iframe scrolling="auto" src="user/list.jsp" name="right" width="100%" height="100%"></iframe>
    </div>
    <div class="layui-footer" style="background: white;">
        2019&copy;版权信息
    </div>
</div>
<script src="<c:url value="/resources/backend/assets/layui/layui.js" />"></script>
<script>
    layui.use('element', function () {
        var element = layui.element;
    })
</script>
</body>
</html>
