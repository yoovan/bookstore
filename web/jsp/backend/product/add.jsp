<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>添加产品</title>
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
            <form action="#" class="layui-form" style="padding-top: 20px;" lay-filter="addForm">
                <div class="layui-form-item">
                    <label for="isbn" class="layui-form-label">ISBN</label>
                    <div class="layui-input-inline">
                        <input type="text" name="ISBN" placeholder="必填" id="isbn" class="layui-input" required>
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
        </div>
    </div>
</div>

<script src="<c:url value="/resources/backend/assets/layui/layui.js" />"></script>
<script>
    layui.use(['element', 'form', 'upload'], function () {
        var element = layui.element,
            form = layui.form,
            upload = layui.upload,
            $ = layui.jquery;
        //执行实例
        var uploadThumb = upload.render({
            elem: '#thumb', //绑定元素,
            auto: false,
            url: '', //上传接口
            done: function (res) {
                //上传完毕回调
            }
            , error: function () {
                //请求异常回调
            }
        });
        var uploadCarousel = upload.render({
            elem: '#carousel', //绑定元素,
            auto: false,
            url: '', //上传接口
            done: function (res) {
                //上传完毕回调
            }
            , error: function () {
                //请求异常回调
            }
        });
        form.on("submit(submitBtn)", function (data) {
            $.ajax({
                url: "add",
                method: "post",
                data: data.field,
                success: function (data) {
                    layer.msg(data.msg);
                    setTimeout(function () {
                        location.href = "list.jsp"
                    }, 1500);
                },
                error: function (err) {
                    layer.msg("操作失败");
                }
            });
        });
    });
</script>
</body>
</html>