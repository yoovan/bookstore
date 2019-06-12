<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>订单列表</title>
    <link rel="stylesheet" href="<c:url value='/resources/backend/assets/css/layui.css' />">
</head>
<body>
<div class="layui-card">
    <div class="layui-card-header">
        <span class="layui-breadcrumb">
            <a href="#">订单管理</a>
            <a href="#"><cite>订单列表</cite></a>
        </span>
    </div>
    <div class="layui-card-body layui-bg-gray">
        <div class="layui-fluid" style="background: white; padding-bottom: 20px;">
            <div class="layui-row" style="padding-top: 10px;">
                <form action="#" class="layui-form">
                    <div class="layui-form-item layui-inline">
                        <div class="layui-input-inline">
                            <select name="status" id="">
                                <option value="#"></option>
                                <option value="order_no">订单编号</option>
                                <option value="username">用户名</option>
                                <option value="product_count">商品数量</option>
                                <option value="order_amount_total">实付金额</option>
                                <option value="status">订单状态</option>
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
                <table id="orderList" class="layui-hide" lay-filter="orderList"></table>
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
<script src="<c:url value="/resources/backend/assets/js/orderData.js" />"></script>
<script src="<c:url value="/resources/backend/assets/js/orderTable.js?v=1.0" />"></script>
</body>
<div id="testDemo" style="display: none; padding-top: 15px; width: 900px;" class="layui-container">
    <div class="layui-form" lay-filter="editForm">
        <div class="layui-form-item">
            <label for="username" class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" name="username" value="" id="username" required autocomplete="false" placeholder="用户名" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input type="radio" name="sex" value="男" title="男">
                <input type="radio" name="sex" value="女" title="女">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="phone" class="layui-form-label">签名</label>
            <div class="layui-input-inline">
                <input type="text" name="phone" id="phone" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <input type="submit" value="立即修改" class="layui-btn">
                <input type="button" value="取消" class="layui-btn layui-btn-primary">
            </div>
        </div>
    </div>
</div>
</html>