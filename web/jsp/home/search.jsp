<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>搜索结果</title>
    <%@ include file="/jsp/home/common/head_link.jsp" %>
</head>
<body>
<%@ include file="/jsp/home/common/head_nav.jsp" %>
<div class="container">
    <p>共有“4”条搜索结果</p>
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
                    <p><a class="btn btn-primary btn-block" role="button" href="bookDetail.jsp">查看详情</a></p>
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
                    <p><a class="btn btn-primary btn-block" role="button" href="bookDetail.jsp">查看详情</a></p>
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
                    <p><a class="btn btn-primary btn-block" role="button" href="bookDetail.jsp">查看详情</a></p>
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
                    <p><a class="btn btn-primary btn-block" role="button" href="bookDetail.jsp">查看详情</a></p>
                    <p><a href="#" class="btn btn-danger btn-block" role="button">加入购物车</a></p>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/jsp/home/common/footer.jsp" %>
</body>
</html>