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
<c:set value="${requestScope.searchList}" var="searchList" scope="request" />
<c:set value="${searchList.size()}" var="length" scope="request" />
<div class="container">
    <c:if test="${length > 0}" var="isNull" >
        <p>共有“${length}”条搜索结果</p>
    </c:if>
    <c:if test="${not isNull}">
        <p class="text-center">暂无搜索结果</p>
    </c:if>
    <div class="row">
        <c:forEach items="${searchList}" var="dataBean" varStatus="itemStatus">
            <div class="col-sm-4 col-md-3">
                <div class="thumbnail">
                    <a href="#">
                        <img style="width: 100%; height: 200px; display: block;" alt="100%x200"
                             src="${dataBean.url}" >
                    </a>
                    <div class="caption">
                        <div class="text-left">${dataBean.title}</div>
                        <div>
                            <span class="text-left text-danger">￥${dataBean.price}</span>
                        </div>
                        <div class="small" style="height: 60px;">
                            ${dataBean.author} 著 / ${dataBean.publishing_house}
                        </div>
                        <p><a class="btn btn-primary btn-block" role="button" href="bookDetail.jsp?id=${dataBean.id}">查看详情</a></p>
                        <p><a href="#" class="btn btn-danger btn-block" role="button">加入购物车</a></p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<%@ include file="/jsp/home/common/footer.jsp" %>
</body>
</html>