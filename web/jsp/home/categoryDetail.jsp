<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>分类详情</title>
    <%@ include file="/jsp/home/common/head_link.jsp" %>
</head>
<body>
<%@ include file="/jsp/home/common/head_nav.jsp" %>
<c:set value="${requestScope.subList}" var="subList" scope="request" />
<div class="container">
    <p>${subList.name}</p>
    <div class="table-responsive">
        <table class="table">
            <tbody>
            <c:if test="${subList.list.size() > 0}" var="isNull">
                <c:forEach items="${subList.list}" var="dataBean" varStatus="beanStatus">
                    <tr>
                        <td>
                            <div style="width: 80px; height: 80px;">
                                <img src="<c:url value="${dataBean.url}" /> " alt="book" style="height:100%;">
                            </div>
                        </td>
                        <td>
                            <div>${dataBean.title}</div>
                            <div class="text-danger">￥${dataBean.price}</div>
                            <div>${dataBean.author} 著 ，${dataBean.publishing_time}/${dataBean.publishing_house}</div>
                        </td>
                        <td>
                            <a href="bookDetail.jsp?id=${dataBean.id}" class="btn btn-sm btn-info btn-block">查看详情</a>
                            <a href="#" class="btn btn-sm btn-danger btn-block" onclick="addToCart(${dataBean.id})">加入购入车</a>
                        </td>
                    </tr>
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
            </c:if>
            <c:if test="${not isNull}">
                <p class="text-center">该类别暂无商品</p>
            </c:if>
            </tbody>
        </table>
    </div>
</div>
<%@ include file="/jsp/home/common/footer.jsp" %>
</body>
</html>