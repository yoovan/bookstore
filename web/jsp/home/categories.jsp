<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>全部分类</title>
    <%@ include file="/jsp/home/common/head_link.jsp" %>
</head>
<body>
<%@ include file="/jsp/home/common/head_nav.jsp" %>
<c:set var="categoryList" value="${requestScope.categoryList}" scope="request" />
<div class="container">
    <p>全部分类</p>
    <div class="list-group">
        <c:forEach items="${categoryList}" var="dataItem" varStatus="itemStatus">
            <div class="list-group-item">
                <div class="list-group-item-heading">${dataItem.firstCategory}</div>
                <div class="list-group-item-text">
                    <p>
                        <c:forEach items="${dataItem.secondCategory}" var="dataBean" varStatus="beanStatus">
                            <c:if test="${beanStatus.count == dataItem.secondCategory.size()}" var="isLast">
                                <a href="categoryDetail.jsp?id=${dataBean.id}">${dataBean.name}</a>
                            </c:if>
                            <c:if test="${not isLast}">
                                <a href="categoryDetail.jsp?id=${dataBean.id}">${dataBean.name}</a> |
                            </c:if>
                        </c:forEach>
                    </p>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<%@ include file="/jsp/home/common/footer.jsp" %>
</body>
</html>