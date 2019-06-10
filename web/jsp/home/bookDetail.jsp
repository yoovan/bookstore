<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>商品详情</title>
    <%@ include file="/jsp/home/common/head_link.jsp" %>
</head>
<body>
<%@ include file="/jsp/home/common/head_nav.jsp" %>
<jsp:useBean id="bookBean" class="com.book.model.home.ProductBean" scope="request" />
<div class="container">
    <div class="row thumbnail">
        <div class="col-sm-4">
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="<c:url value="${bookBean.url}" />" alt="" style="height: 500px;width: 100%;">

                    </div>
                </div>

                <!-- Controls -->
                <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <div class="caption center">
                <h5>${bookBean.title}</h5>
                <p>定价：<span class="text-danger">￥${bookBean.price}</span></p>
                <p>
                    <a class="btn btn-danger btn-block" role="button" href="#">立即购买</a>
                    <a class="btn btn-warning btn-block" role="button" href="#">加入购物车</a>
                </p>
            </div>
        </div>
        <div class="col-sm-8">
            <div class="caption">
            </div>
            <div class="panel panel-primary">
                <div class="panel-heading">
                    基本信息
                </div>
                <div class="panel-body">
                    <div>作者： ${bookBean.author}</div>
                    <div>出版社：${bookBean.publishing_house}</div>
                    <div>ISBN：${bookBean.ISBN}</div>
                    <div>上架时间：${bookBean.upper_time}</div>
                    <div>出版日期：${bookBean.publishing_time}</div>
                    <div>开本：${bookBean.format}</div>
                    <div>页码：${bookBean.page_size}</div>
                    <div>版次：${bookBean.edition}</div>
                    <div>所属分类：${bookBean.category_name}</div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    内容简介
                </div>
                <div class="panel-body">
                    ${bookBean.summary}
                </div>
            </div>
        </div>

    </div>
</div>

<%@ include file="/jsp/home/common/footer.jsp" %>
</body>
</html>