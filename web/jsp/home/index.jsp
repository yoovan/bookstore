<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>图书商城</title>
    <%@ include file="/jsp/home/common/head_link.jsp" %>
    <style>
        .row {
            margin-top: 20px;;
        }

        .center {
            text-align: center;
        }

        .card {
            margin-top: 10px;
        }

        #dropdown-menu li {
            padding-bottom: 10px;
            line-height: 30px;
        }
    </style>
    <script>
        $(function () {
            $('#myTabs li').click(function (e) {
                $(this).tab('show')
            });
        })
    </script>
</head>
<body>
<%@ include file="/jsp/home/common/head_nav.jsp" %>
<div class="container">
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <c:forEach var="dataBean" items="${requestScope.carouselList}" varStatus="listStatus">
                <c:if test="${listStatus.index == 0}" var="isFirst">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                </c:if>
                <c:if test="${not isFirst}">
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                </c:if>
            </c:forEach>
        </ol>
        <div class="carousel-inner" role="listbox">
            <c:forEach items="${requestScope.carouselList}" var="dataBean" varStatus="listStatus">
                <c:if test="${listStatus.index == 0}" var="isFirst">
                    <div class="item active" onclick="window.location.href = 'bookDetail.jsp?id=${dataBean.id}'">
                        <img src="<c:url value="${dataBean.url}" />" alt="" style="height: 500px;width: 100%;">
                        <div class="carousel-caption">
                            <c:out value="${dataBean.title}"/>
                        </div>
                    </div>
                </c:if>
                <c:if test="${not isFirst}">
                    <div class="item" onclick="window.location.href = 'bookDetail.jsp?id=${dataBean.id}'">
                        <img src="<c:url value="${dataBean.url}" />" alt="" style="height: 500px;width: 100%;">
                        <div class="carousel-caption">
                            <c:out value="${dataBean.title}"/>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
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
    <div class="card">
        <c:forEach items="${requestScope.recommendCategoryList}" var="dataBean" varStatus="listStatus">
            <div class="panel
                    <c:if test="${listStatus.count%2==0}" var="isOdd">
                        panel-info
                    </c:if>
                    <c:if test="${not isOdd}">
                        panel-primary
                    </c:if>
                    ">
                <div class="panel-heading">${dataBean.name}</div>
                <div class="panel-body">
                    <div class="row">
                        <c:forEach items="${dataBean.list}" var="productBean" varStatus="productstatus">
                            <div class="col-sm-4 col-md-3">
                                <div class="thumbnail">
                                    <a href="#">
                                        <img style="width: 100%; height: 200px; display: block;" alt="100%x200"
                                             src="<c:url value="${productBean.url}" />"/>
                                    </a>
                                    <div class="caption">
                                        <div class="text-left"
                                             style="width: 100%; height: 30px; overflow: hidden;">${productBean.title}</div>
                                        <div>
                                            <span class="text-left text-danger">￥${productBean.price}</span>
                                        </div>
                                        <div class="small">
                                            <span style="width: 20px;">${productBean.author}</span> 著 / <span
                                                style="width: 20px;">${productBean.publishing_house}</span>
                                        </div>
                                        <p><a class="btn btn-primary btn-block" role="button"
                                              href="bookDetail.jsp?id=${productBean.id}">查看详情</a>
                                        </p>
                                        <p><a href="javascript: void(0);" onclick="addToCart(${productBean.id})" class="btn btn-danger btn-block"
                                              role="button">加入购物车</a></p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <script>
                            function addToCart(id) {
                                $.ajax({
                                    url: "addToCart.jsp?id=" + id,
                                    callback: "callback",
                                    dataType: "jsonp",
                                    success: function (data) {
                                        alert("已添加到购物车");
                                    },
                                    error: function (err) {

                                    }
                                });
                            }
                        </script>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<%@ include file="/jsp/home/common/footer.jsp" %>
</body>
</html>