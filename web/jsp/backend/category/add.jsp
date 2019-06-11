<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>添加分类</title>
    <link rel="stylesheet" href="<c:url value='/resources/backend/assets/css/layui.css' />">
</head>
<body>

<div class="layui-card">
    <div class="layui-card-header">
        <div class="layui-breadcrumb">
            <a href="#">产品管理</a>
            <a href="#"><cite>新增产品</cite></a>
        </div>
    </div>
    <div class="layui-card-body layui-bg-gray">
        <div class="layui-fluid" style="background: white; padding-bottom: 20px;">
            <form action="#" class="layui-form" style="padding-top: 20px;">
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
                            <option value="0"></option>
                            <option value="1">计算机</option>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <input type="submit" class="layui-btn" value="立即添加">
                        <button class="layui-btn layui-btn-primary">取消</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="<c:url value="/resources/backend/assets/layui/layui.js" />"></script>
<script>
    layui.use(['element', 'form'], function () {
        var element = layui.element,
            form = layui.form;

    })
</script>
</body>
</html>