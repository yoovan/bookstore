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
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="<c:url value="/resources/home/img/1.jpg" />" alt="" style="height: 500px;width: 100%;">
                <div class="carousel-caption">
                    这是他妈是什么人间疾苦
                </div>
            </div>
            <div class="item">
                <img src="<c:url value="/resources/home/img/sy2.jpg" />" alt="" style="height: 500px;width: 100%;">
                <div class="carousel-caption">
                    啊！！沈月！！妈！我要娶她！
                </div>
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
    <div class="card">
        <div class="panel panel-info">
            <div class="panel-heading">计算机</div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-sm-4 col-md-3">
                        <div class="thumbnail">
                            <a href="#">
                                <img style="width: 100%; height: 200px; display: block;" alt="100%x200"
                                     src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzNDggMjAwIiBwcmVzZXJ2ZUFzcGVjdFJhdGlvPSJub25lIG1lZXQiIHdpZHRoPSIzNDgiIGhlaWdodD0iMjAwIj48ZGVmcyAvPjxyZWN0IGZpbGw9IiNlZWVlZWUiIHdpZHRoPSIzNDgiIGhlaWdodD0iMjAwIiAvPjxnPjx0ZXh0IHN0eWxlPSJmb250LWZhbWlseTogQXJpYWwsIEhlbHZldGljYSwgT3BlbiBTYW5zLCBzYW5zLXNlcmlmLCBtb25vc3BhY2U7IGZvbnQtc2l6ZTogMjJweDsgZm9udC13ZWlnaHQ6IGJvbGQ7IGRvbWluYW50LWJhc2VsaW5lOiBjZW50cmFsOyBmaWxsOiAjYWFhYWFhOyIgeD0iMTMxLjE2IiB5PSIxMDAiPjM0OHgyMDA8L3RleHQ+PC9nPjwvc3ZnPg=="
                                     data-src="holder.js/100%x200" data-holder-rendered="true">
                            </a>
                            <div class="caption">
                                <div class="text-left">林徽因传</div>
                                <div>
                                    <span class="text-left text-danger">￥100.00</span>
                                </div>
                                <div class="small">
                                    XXX著 / 中国邮电出版社
                                </div>
                                <p><a class="btn btn-primary btn-block" role="button" href="bookDetail.jsp">查看详情</a>
                                </p>
                                <p><a href="#" class="btn btn-danger btn-block" role="button">加入购物车</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4 col-md-3">
                        <div class="thumbnail">
                            <a href="#">
                                <img style="width: 100%; height: 200px; display: block;" alt="100%x200"
                                     src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzNDggMjAwIiBwcmVzZXJ2ZUFzcGVjdFJhdGlvPSJub25lIG1lZXQiIHdpZHRoPSIzNDgiIGhlaWdodD0iMjAwIj48ZGVmcyAvPjxyZWN0IGZpbGw9IiNlZWVlZWUiIHdpZHRoPSIzNDgiIGhlaWdodD0iMjAwIiAvPjxnPjx0ZXh0IHN0eWxlPSJmb250LWZhbWlseTogQXJpYWwsIEhlbHZldGljYSwgT3BlbiBTYW5zLCBzYW5zLXNlcmlmLCBtb25vc3BhY2U7IGZvbnQtc2l6ZTogMjJweDsgZm9udC13ZWlnaHQ6IGJvbGQ7IGRvbWluYW50LWJhc2VsaW5lOiBjZW50cmFsOyBmaWxsOiAjYWFhYWFhOyIgeD0iMTMxLjE2IiB5PSIxMDAiPjM0OHgyMDA8L3RleHQ+PC9nPjwvc3ZnPg=="
                                     data-src="holder.js/100%x200" data-holder-rendered="true">
                            </a>
                            <div class="caption">
                                <div class="text-left">林徽因传</div>
                                <div>
                                    <span class="text-left text-danger">￥100.00</span>
                                </div>
                                <div class="small">
                                    XXX著 / 中国邮电出版社
                                </div>
                                <p><a class="btn btn-primary btn-block" role="button" href="bookDetail.jsp">查看详情</a>
                                </p>
                                <p><a href="#" class="btn btn-danger btn-block" role="button">加入购物车</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4 col-md-3">
                        <div class="thumbnail">
                            <a href="#">
                                <img style="width: 100%; height: 200px; display: block;" alt="100%x200"
                                     src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzNDggMjAwIiBwcmVzZXJ2ZUFzcGVjdFJhdGlvPSJub25lIG1lZXQiIHdpZHRoPSIzNDgiIGhlaWdodD0iMjAwIj48ZGVmcyAvPjxyZWN0IGZpbGw9IiNlZWVlZWUiIHdpZHRoPSIzNDgiIGhlaWdodD0iMjAwIiAvPjxnPjx0ZXh0IHN0eWxlPSJmb250LWZhbWlseTogQXJpYWwsIEhlbHZldGljYSwgT3BlbiBTYW5zLCBzYW5zLXNlcmlmLCBtb25vc3BhY2U7IGZvbnQtc2l6ZTogMjJweDsgZm9udC13ZWlnaHQ6IGJvbGQ7IGRvbWluYW50LWJhc2VsaW5lOiBjZW50cmFsOyBmaWxsOiAjYWFhYWFhOyIgeD0iMTMxLjE2IiB5PSIxMDAiPjM0OHgyMDA8L3RleHQ+PC9nPjwvc3ZnPg=="
                                     data-src="holder.js/100%x200" data-holder-rendered="true">
                            </a>
                            <div class="caption">
                                <div class="text-left">林徽因传</div>
                                <div>
                                    <span class="text-left text-danger">￥100.00</span>
                                </div>
                                <div class="small">
                                    XXX著 / 中国邮电出版社
                                </div>
                                <p><a class="btn btn-primary btn-block" role="button" href="bookDetail.jsp">查看详情</a>
                                </p>
                                <p><a href="#" class="btn btn-danger btn-block" role="button">加入购物车</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4 col-md-3">
                        <div class="thumbnail">
                            <a href="#">
                                <img style="width: 100%; height: 200px; display: block;" alt="100%x200"
                                     src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzNDggMjAwIiBwcmVzZXJ2ZUFzcGVjdFJhdGlvPSJub25lIG1lZXQiIHdpZHRoPSIzNDgiIGhlaWdodD0iMjAwIj48ZGVmcyAvPjxyZWN0IGZpbGw9IiNlZWVlZWUiIHdpZHRoPSIzNDgiIGhlaWdodD0iMjAwIiAvPjxnPjx0ZXh0IHN0eWxlPSJmb250LWZhbWlseTogQXJpYWwsIEhlbHZldGljYSwgT3BlbiBTYW5zLCBzYW5zLXNlcmlmLCBtb25vc3BhY2U7IGZvbnQtc2l6ZTogMjJweDsgZm9udC13ZWlnaHQ6IGJvbGQ7IGRvbWluYW50LWJhc2VsaW5lOiBjZW50cmFsOyBmaWxsOiAjYWFhYWFhOyIgeD0iMTMxLjE2IiB5PSIxMDAiPjM0OHgyMDA8L3RleHQ+PC9nPjwvc3ZnPg=="
                                     data-src="holder.js/100%x200" data-holder-rendered="true">
                            </a>
                            <div class="caption">
                                <div class="text-left">林徽因传</div>
                                <div>
                                    <span class="text-left text-danger">￥100.00</span>
                                </div>
                                <div class="small">
                                    XXX著 / 中国邮电出版社
                                </div>
                                <p><a class="btn btn-primary btn-block" role="button" href="bookDetail.jsp">查看详情</a>
                                </p>
                                <p><a href="#" class="btn btn-danger btn-block" role="button">加入购物车</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="panel panel-primary">
            <div class="panel-heading">计算机</div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-sm-4 col-md-3">
                        <div class="thumbnail">
                            <a href="#">
                                <img style="width: 100%; height: 200px; display: block;" alt="100%x200"
                                     src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzNDggMjAwIiBwcmVzZXJ2ZUFzcGVjdFJhdGlvPSJub25lIG1lZXQiIHdpZHRoPSIzNDgiIGhlaWdodD0iMjAwIj48ZGVmcyAvPjxyZWN0IGZpbGw9IiNlZWVlZWUiIHdpZHRoPSIzNDgiIGhlaWdodD0iMjAwIiAvPjxnPjx0ZXh0IHN0eWxlPSJmb250LWZhbWlseTogQXJpYWwsIEhlbHZldGljYSwgT3BlbiBTYW5zLCBzYW5zLXNlcmlmLCBtb25vc3BhY2U7IGZvbnQtc2l6ZTogMjJweDsgZm9udC13ZWlnaHQ6IGJvbGQ7IGRvbWluYW50LWJhc2VsaW5lOiBjZW50cmFsOyBmaWxsOiAjYWFhYWFhOyIgeD0iMTMxLjE2IiB5PSIxMDAiPjM0OHgyMDA8L3RleHQ+PC9nPjwvc3ZnPg=="
                                     data-src="holder.js/100%x200" data-holder-rendered="true">
                            </a>
                            <div class="caption">
                                <div class="text-left">林徽因传</div>
                                <div>
                                    <span class="text-left text-danger">￥100.00</span>
                                </div>
                                <div class="small">
                                    XXX著 / 中国邮电出版社
                                </div>
                                <p><a class="btn btn-primary btn-block" role="button" href="bookDetail.jsp">查看详情</a>
                                </p>
                                <p><a href="#" class="btn btn-danger btn-block" role="button">加入购物车</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4 col-md-3">
                        <div class="thumbnail">
                            <a href="#">
                                <img style="width: 100%; height: 200px; display: block;" alt="100%x200"
                                     src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzNDggMjAwIiBwcmVzZXJ2ZUFzcGVjdFJhdGlvPSJub25lIG1lZXQiIHdpZHRoPSIzNDgiIGhlaWdodD0iMjAwIj48ZGVmcyAvPjxyZWN0IGZpbGw9IiNlZWVlZWUiIHdpZHRoPSIzNDgiIGhlaWdodD0iMjAwIiAvPjxnPjx0ZXh0IHN0eWxlPSJmb250LWZhbWlseTogQXJpYWwsIEhlbHZldGljYSwgT3BlbiBTYW5zLCBzYW5zLXNlcmlmLCBtb25vc3BhY2U7IGZvbnQtc2l6ZTogMjJweDsgZm9udC13ZWlnaHQ6IGJvbGQ7IGRvbWluYW50LWJhc2VsaW5lOiBjZW50cmFsOyBmaWxsOiAjYWFhYWFhOyIgeD0iMTMxLjE2IiB5PSIxMDAiPjM0OHgyMDA8L3RleHQ+PC9nPjwvc3ZnPg=="
                                     data-src="holder.js/100%x200" data-holder-rendered="true">
                            </a>
                            <div class="caption">
                                <div class="text-left">林徽因传</div>
                                <div>
                                    <span class="text-left text-danger">￥100.00</span>
                                </div>
                                <div class="small">
                                    XXX著 / 中国邮电出版社
                                </div>
                                <p><a class="btn btn-primary btn-block" role="button" href="bookDetail.jsp">查看详情</a>
                                </p>
                                <p><a href="#" class="btn btn-danger btn-block" role="button">加入购物车</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4 col-md-3">
                        <div class="thumbnail">
                            <a href="#">
                                <img style="width: 100%; height: 200px; display: block;" alt="100%x200"
                                     src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzNDggMjAwIiBwcmVzZXJ2ZUFzcGVjdFJhdGlvPSJub25lIG1lZXQiIHdpZHRoPSIzNDgiIGhlaWdodD0iMjAwIj48ZGVmcyAvPjxyZWN0IGZpbGw9IiNlZWVlZWUiIHdpZHRoPSIzNDgiIGhlaWdodD0iMjAwIiAvPjxnPjx0ZXh0IHN0eWxlPSJmb250LWZhbWlseTogQXJpYWwsIEhlbHZldGljYSwgT3BlbiBTYW5zLCBzYW5zLXNlcmlmLCBtb25vc3BhY2U7IGZvbnQtc2l6ZTogMjJweDsgZm9udC13ZWlnaHQ6IGJvbGQ7IGRvbWluYW50LWJhc2VsaW5lOiBjZW50cmFsOyBmaWxsOiAjYWFhYWFhOyIgeD0iMTMxLjE2IiB5PSIxMDAiPjM0OHgyMDA8L3RleHQ+PC9nPjwvc3ZnPg=="
                                     data-src="holder.js/100%x200" data-holder-rendered="true">
                            </a>
                            <div class="caption">
                                <div class="text-left">林徽因传</div>
                                <div>
                                    <span class="text-left text-danger">￥100.00</span>
                                </div>
                                <div class="small">
                                    XXX著 / 中国邮电出版社
                                </div>
                                <p><a class="btn btn-primary btn-block" role="button" href="bookDetail.jsp">查看详情</a>
                                </p>
                                <p><a href="#" class="btn btn-danger btn-block" role="button">加入购物车</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4 col-md-3">
                        <div class="thumbnail">
                            <a href="#">
                                <img style="width: 100%; height: 200px; display: block;" alt="100%x200"
                                     src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzNDggMjAwIiBwcmVzZXJ2ZUFzcGVjdFJhdGlvPSJub25lIG1lZXQiIHdpZHRoPSIzNDgiIGhlaWdodD0iMjAwIj48ZGVmcyAvPjxyZWN0IGZpbGw9IiNlZWVlZWUiIHdpZHRoPSIzNDgiIGhlaWdodD0iMjAwIiAvPjxnPjx0ZXh0IHN0eWxlPSJmb250LWZhbWlseTogQXJpYWwsIEhlbHZldGljYSwgT3BlbiBTYW5zLCBzYW5zLXNlcmlmLCBtb25vc3BhY2U7IGZvbnQtc2l6ZTogMjJweDsgZm9udC13ZWlnaHQ6IGJvbGQ7IGRvbWluYW50LWJhc2VsaW5lOiBjZW50cmFsOyBmaWxsOiAjYWFhYWFhOyIgeD0iMTMxLjE2IiB5PSIxMDAiPjM0OHgyMDA8L3RleHQ+PC9nPjwvc3ZnPg=="
                                     data-src="holder.js/100%x200" data-holder-rendered="true">
                            </a>
                            <div class="caption">
                                <div class="text-left">林徽因传</div>
                                <div>
                                    <span class="text-left text-danger">￥100.00</span>
                                </div>
                                <div class="small">
                                    XXX著 / 中国邮电出版社
                                </div>
                                <p><a class="btn btn-primary btn-block" role="button" href="bookDetail.jsp">查看详情</a>
                                </p>
                                <p><a href="#" class="btn btn-danger btn-block" role="button">加入购物车</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">计算机</div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-sm-4 col-md-3">
                        <div class="thumbnail">
                            <a href="#">
                                <img style="width: 100%; height: 200px; display: block;" alt="100%x200"
                                     src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzNDggMjAwIiBwcmVzZXJ2ZUFzcGVjdFJhdGlvPSJub25lIG1lZXQiIHdpZHRoPSIzNDgiIGhlaWdodD0iMjAwIj48ZGVmcyAvPjxyZWN0IGZpbGw9IiNlZWVlZWUiIHdpZHRoPSIzNDgiIGhlaWdodD0iMjAwIiAvPjxnPjx0ZXh0IHN0eWxlPSJmb250LWZhbWlseTogQXJpYWwsIEhlbHZldGljYSwgT3BlbiBTYW5zLCBzYW5zLXNlcmlmLCBtb25vc3BhY2U7IGZvbnQtc2l6ZTogMjJweDsgZm9udC13ZWlnaHQ6IGJvbGQ7IGRvbWluYW50LWJhc2VsaW5lOiBjZW50cmFsOyBmaWxsOiAjYWFhYWFhOyIgeD0iMTMxLjE2IiB5PSIxMDAiPjM0OHgyMDA8L3RleHQ+PC9nPjwvc3ZnPg=="
                                     data-src="holder.js/100%x200" data-holder-rendered="true">
                            </a>
                            <div class="caption">
                                <div class="text-left">林徽因传</div>
                                <div>
                                    <span class="text-left text-danger">￥100.00</span>
                                </div>
                                <div class="small">
                                    XXX著 / 中国邮电出版社
                                </div>
                                <p><a class="btn btn-primary btn-block" role="button" href="bookDetail.jsp">查看详情</a>
                                </p>
                                <p><a href="#" class="btn btn-danger btn-block" role="button">加入购物车</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4 col-md-3">
                        <div class="thumbnail">
                            <a href="#">
                                <img style="width: 100%; height: 200px; display: block;" alt="100%x200"
                                     src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzNDggMjAwIiBwcmVzZXJ2ZUFzcGVjdFJhdGlvPSJub25lIG1lZXQiIHdpZHRoPSIzNDgiIGhlaWdodD0iMjAwIj48ZGVmcyAvPjxyZWN0IGZpbGw9IiNlZWVlZWUiIHdpZHRoPSIzNDgiIGhlaWdodD0iMjAwIiAvPjxnPjx0ZXh0IHN0eWxlPSJmb250LWZhbWlseTogQXJpYWwsIEhlbHZldGljYSwgT3BlbiBTYW5zLCBzYW5zLXNlcmlmLCBtb25vc3BhY2U7IGZvbnQtc2l6ZTogMjJweDsgZm9udC13ZWlnaHQ6IGJvbGQ7IGRvbWluYW50LWJhc2VsaW5lOiBjZW50cmFsOyBmaWxsOiAjYWFhYWFhOyIgeD0iMTMxLjE2IiB5PSIxMDAiPjM0OHgyMDA8L3RleHQ+PC9nPjwvc3ZnPg=="
                                     data-src="holder.js/100%x200" data-holder-rendered="true">
                            </a>
                            <div class="caption">
                                <div class="text-left">林徽因传</div>
                                <div>
                                    <span class="text-left text-danger">￥100.00</span>
                                </div>
                                <div class="small">
                                    XXX著 / 中国邮电出版社
                                </div>
                                <p><a class="btn btn-primary btn-block" role="button" href="bookDetail.jsp">查看详情</a>
                                </p>
                                <p><a href="#" class="btn btn-danger btn-block" role="button">加入购物车</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4 col-md-3">
                        <div class="thumbnail">
                            <a href="#">
                                <img style="width: 100%; height: 200px; display: block;" alt="100%x200"
                                     src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzNDggMjAwIiBwcmVzZXJ2ZUFzcGVjdFJhdGlvPSJub25lIG1lZXQiIHdpZHRoPSIzNDgiIGhlaWdodD0iMjAwIj48ZGVmcyAvPjxyZWN0IGZpbGw9IiNlZWVlZWUiIHdpZHRoPSIzNDgiIGhlaWdodD0iMjAwIiAvPjxnPjx0ZXh0IHN0eWxlPSJmb250LWZhbWlseTogQXJpYWwsIEhlbHZldGljYSwgT3BlbiBTYW5zLCBzYW5zLXNlcmlmLCBtb25vc3BhY2U7IGZvbnQtc2l6ZTogMjJweDsgZm9udC13ZWlnaHQ6IGJvbGQ7IGRvbWluYW50LWJhc2VsaW5lOiBjZW50cmFsOyBmaWxsOiAjYWFhYWFhOyIgeD0iMTMxLjE2IiB5PSIxMDAiPjM0OHgyMDA8L3RleHQ+PC9nPjwvc3ZnPg=="
                                     data-src="holder.js/100%x200" data-holder-rendered="true">
                            </a>
                            <div class="caption">
                                <div class="text-left">林徽因传</div>
                                <div>
                                    <span class="text-left text-danger">￥100.00</span>
                                </div>
                                <div class="small">
                                    XXX著 / 中国邮电出版社
                                </div>
                                <p><a class="btn btn-primary btn-block" role="button" href="bookDetail.jsp">查看详情</a>
                                </p>
                                <p><a href="#" class="btn btn-danger btn-block" role="button">加入购物车</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4 col-md-3">
                        <div class="thumbnail">
                            <a href="#">
                                <img style="width: 100%; height: 200px; display: block;" alt="100%x200"
                                     src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzNDggMjAwIiBwcmVzZXJ2ZUFzcGVjdFJhdGlvPSJub25lIG1lZXQiIHdpZHRoPSIzNDgiIGhlaWdodD0iMjAwIj48ZGVmcyAvPjxyZWN0IGZpbGw9IiNlZWVlZWUiIHdpZHRoPSIzNDgiIGhlaWdodD0iMjAwIiAvPjxnPjx0ZXh0IHN0eWxlPSJmb250LWZhbWlseTogQXJpYWwsIEhlbHZldGljYSwgT3BlbiBTYW5zLCBzYW5zLXNlcmlmLCBtb25vc3BhY2U7IGZvbnQtc2l6ZTogMjJweDsgZm9udC13ZWlnaHQ6IGJvbGQ7IGRvbWluYW50LWJhc2VsaW5lOiBjZW50cmFsOyBmaWxsOiAjYWFhYWFhOyIgeD0iMTMxLjE2IiB5PSIxMDAiPjM0OHgyMDA8L3RleHQ+PC9nPjwvc3ZnPg=="
                                     data-src="holder.js/100%x200" data-holder-rendered="true">
                            </a>
                            <div class="caption">
                                <div class="text-left">林徽因传</div>
                                <div>
                                    <span class="text-left text-danger">￥100.00</span>
                                </div>
                                <div class="small">
                                    XXX著 / 中国邮电出版社
                                </div>
                                <p><a class="btn btn-primary btn-block" role="button" href="bookDetail.jsp">查看详情</a>
                                </p>
                                <p><a href="#" class="btn btn-danger btn-block" role="button">加入购物车</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/jsp/home/common/footer.jsp" %>
</body>
</html>