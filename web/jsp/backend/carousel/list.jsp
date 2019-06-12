<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>轮播列表</title>
    <link rel="stylesheet" href="<c:url value='/resources/backend/assets/css/layui.css' />">
</head>
<body>
<div class="layui-card">
    <div class="layui-card-header">
        <span class="layui-breadcrumb">
            <a href="#">轮播管理</a>
            <a href="#"><cite>轮播列表</cite></a>
        </span>
    </div>
    <div class="layui-card-body layui-bg-gray">
        <div class="layui-fluid" style="background: white; padding-bottom: 20px;">
            <div class="layui-row" style="padding-top: 10px;">
                <table id="carouselList" class="layui-hide" lay-filter="carouselList"></table>
                <script type="text/html" id="toolbar">
                    <div class="layui-btn-container">
                        <a href="#" class="layui-btn layui-btn-danger layui-icon layui-icon-delete layui-btn-sm"
                           lay-event="delete"></a>
                    </div>
                </script>
            </div>
        </div>
    </div>
</div>
<script src="<c:url value="/resources/backend/assets/layui/layui.js" />"></script>
<script src="<c:url value="/resources/backend/assets/js/carouselTable.js?v=1.1" />"></script>
</body>
</html>