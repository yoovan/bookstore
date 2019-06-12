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
    <link rel="stylesheet" href="<c:url value='/resources/backend/assets/css/layui.css' />">
</head>
<body>
<div class="layui-card">
    <div class="layui-card-header">
        <span class="layui-breadcrumb">
            <a href="#">产品管理</a>
            <a href="#"><cite>产品列表</cite></a>
        </span>
    </div>
    <div class="layui-card-body layui-bg-gray">
        <div class="layui-fluid" style="background: white; padding-bottom: 20px;">
            <div class="layui-row" style="padding-top: 10px;">
                <form action="#" class="layui-form">
                    <div class="layui-form-item layui-inline">
                        <button class="layui-btn layui-btn-normal layui-icon layui-icon-add-1">新增</button>
                    </div>
                    <div class="layui-form-item layui-inline">
                        <div class="layui-input-inline">
                            <select name="status" id="">
                                <option value="#"></option>
                                <option value="ISBN">ISBN</option>
                                <option value="title">书名</option>
                                <option value="publishing_house">出版社</option>
                                <option value="publishing_time">出版时间</option>
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
                <table id="bookList" class="layui-hide" lay-filter="bookList"></table>
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
<script src="<c:url value="/resources/backend/assets/js/bookData.js" />"></script>
<script src="<c:url value="/resources/backend/assets/js/bookTable.js?v=1.1" />"></script>
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
<form action="#" class="layui-form" style="padding-top: 20px; display: none;" id="editForm" lay-filter="editForm">
    <input type="hidden" name="id" value="">
    <div class="layui-form-item">
        <label for="isbn" class="layui-form-label">ISBN</label>
        <div class="layui-input-inline">
            <input type="text" name="book_no" placeholder="必填" id="isbn" class="layui-input" required>
        </div>
    </div>
    <div class="layui-form-item">
        <label for="title" class="layui-form-label">书名</label>
        <div class="layui-input-block">
            <input type="text" id="title" name="title" placeholder="必填" class="layui-input" required>
        </div>
    </div>
    <div class="layui-form-item">
        <label for="thumb" class="layui-form-label">缩略图</label>
        <div class="layui-input-inline">
            <button type="button" class="layui-btn" id="thumb">
                <i class="layui-icon">&#xe67c;</i>上传缩略图
            </button>
            <input type="hidden" name="thumb" value="">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="carousel" class="layui-form-label">轮播图</label>
        <div class="layui-input-inline">
            <button type="button" class="layui-btn" id="carousel">
                <i class="layui-icon">&#xe67c;</i>上传轮播图
            </button>
            <input type="hidden" name="carousel" value="">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="author" class="layui-form-label">作者</label>
        <div class="layui-input-inline">
            <input type="text" id="author" name="author" placeholder="必填" class="layui-input" required>
        </div>
    </div>
    <div class="layui-form-item">
        <label for="price" class="layui-form-label">定价</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input" id="price" placeholder="必填" name="price" required>
        </div>
    </div>
    <div class="layui-form-item">
        <label for="series" class="layui-form-label">丛书名</label>
        <div class="layui-input-inline">
            <input type="text" id="series" name="series" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="category_id" class="layui-form-label">分类</label>
        <div class="layui-input-block">
            <select name="category_id" id="category_id">
                <option value="1">计算机</option>
                <option value="2">青春文学</option>
                <option value="3">散文</option>
                <option value="4">小说</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label for="publishing_house" class="layui-form-label">出版社</label>
        <div class="layui-input-block">
            <input type="text" id="publishing_house" name="publishing_house" required class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="publishing_time" class="layui-form-label">出版时间</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input" id="publishing_time" name="publishing_time">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="format" class="layui-form-label">开本</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input" id="format" name="format">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="page_size" class="layui-form-label">页码</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input" id="page_size" name="page_size">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="edition" class="layui-form-label">版次</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input" id="edition" name="edition">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="summary" class="layui-form-label">内容简介</label>
        <div class="layui-input-block">
            <textarea name="summary" id="summary" class="layui-textarea" cols="30" rows="10"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <label for="catalogue" class="layui-form-label">目录</label>
        <div class="layui-input-block">
            <textarea name="catalogue" id="catalogue" class="layui-textarea" cols="30" rows="10"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <input type="button" class="layui-btn" lay-submit lay-filter="submitBtn" value="立即添加">
            <button class="layui-btn layui-btn-primary">取消</button>
        </div>
    </div>
</form>
</html>