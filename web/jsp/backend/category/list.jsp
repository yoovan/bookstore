<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>分类列表</title>
    <link rel="stylesheet" href="<c:url value='/resources/backend/assets/css/layui.css' />">
</head>
<body>

<div class="layui-card">
    <div class="layui-card-header">
        <span class="layui-breadcrumb">
            <a href="#">分类管理</a>
            <a href="#"><cite>分类列表</cite></a>
        </span>
    </div>
    <div class="layui-card-body layui-bg-gray">
        <div class="layui-fluid" style="background: white; padding-bottom: 20px;">
            <div class="layui-row" style="padding-top: 10px;">
                <form action="#" class="layui-form">
                    <div class="layui-form-item layui-inline">
                        <button class="layui-btn layui-btn-normal">新增</button>
                    </div>
                    <div class="layui-form-item layui-inline">
                        <div class="layui-input-inline">
                            <select name="status" id="">
                                <option value="name">分类名称</option>
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
                <table id="categoryList" class="layui-hide" lay-filter="categoryList"></table>
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
<script src="<c:url value="/resources/backend/assets/js/categoryTable.js?v=1.0" />"></script>
</body>
<form action="#" class="layui-form" style="padding-top: 20px;display: none;" id="editForm" lay-filter="editForm">
    <div class="layui-form-item">
        <label for="name" class="layui-form-label">分类名称</label>
        <div class="layui-input-inline">
            <input type="text" id="name" name="name" required placeholder="请输入分类名称" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="pid" class="layui-form-label">父级分类</label>
        <div class="layui-input-inline">
            <select name="pid" id="pid">
                <option value="0">顶级分类</option>
                <c:forEach items="${requestScope.categoriesList}" var="dataBean">
                    <option value="${dataBean.id}">${dataBean.name}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">是否推荐</label>
        <div class="layui-input-block">
            <input type="radio" name="type" value="0" title="否" checked>
            <input type="radio" name="type" value="1" title="是">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <input type="submit" class="layui-btn" value="立即修改">
            <button class="layui-btn layui-btn-primary">取消</button>
        </div>
    </div>
</form>
</html>