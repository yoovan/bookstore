<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>购物车</title>
    <%@ include file="/jsp/home/common/head_link.jsp" %>
    <style>
        .row {
            margin-left: 20px;
            margin-right: 20px;;
        }

        .line-center {
            line-height: 50px;
            text-align: center;
        }

        .row input {
            width: 50px;
        }
    </style>
</head>
<body>
<%@ include file="/jsp/home/common/head_nav.jsp" %>
<div class="container">
    <div class="row thumbnail center">
        <div class="col-sm-12">
            <h3 class="text-center" style="margin-bottom: 20px">购物车</h3>
        </div>
        <div class="col-sm-12 table-responsive">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th class="text-center">#</th>
                    <th class="text-center">图书</th>
                    <th class="text-center">单价</th>
                    <th class="text-center">数量</th>
                    <th class="text-center">小计</th>
                    <th class="text-center">操作</th>
                </tr>
                </thead>
                <tbody>
                <script>
                    var totalAmount = 0;
                    var totalCount = 0;
                </script>
                <c:forEach items="${applicationScope.cartList}" var="productBean" varStatus="beanStatus">
                    <tr>
                        <td>
                            <div class="line-center" style="width: 50px;height: 50px;">
                                <img src="<c:url value="${productBean.url}" /> " style="height: 100%;" alt=""/>
                            </div>
                        </td>
                        <td>
                            <div class="line-center">${productBean.title}</div>
                        </td>
                        <td>
                            <div class="line-center">￥${productBean.price}</div>
                        </td>
                        <td>
                            <div class=" line-center">
                                <button type="button" class="btn btn-sm btn-danger" id="minus${productBean.id}">
                                    <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
                                </button>
                                <input type="text" id="count${productBean.id}" class="small text-center" value="1"/>
                                <button type="button" class="btn btn-sm btn-success" id="plus${productBean.id}">
                                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                                </button>
                                <script>
                                    var count${productBean.id} = $("#count${productBean.id}").val();
                                    var price${productBean.id} = ${productBean.price};
                                    $("#minus${productBean.id}").click(function () {
                                        if (count${productBean.id} <= 1) {
                                            alert("不能再减啦。。。");
                                        } else {
                                            --count${productBean.id};
                                            totalAmount -= price${productBean.id};
                                            --totalCount;
                                            $("#totalCount").text(totalCount);
                                            $("#totalAmount").text(totalAmount.toFixed(2));
                                            $("#count${productBean.id}").val(count${productBean.id});
                                            $("#itemTotal${productBean.id}").text("￥" + (count${productBean.id} * price${productBean.id}).toFixed(2));
                                        }
                                    });
                                    $("#plus${productBean.id}").click(function () {
                                        ++count${productBean.id};
                                        ++totalCount;
                                        totalAmount += price${productBean.id};
                                        $("#totalCount").text(totalCount);
                                        $("#totalAmount").text(totalAmount.toFixed(2));
                                        $("#count${productBean.id}").val(count${productBean.id});
                                        $("#itemTotal${productBean.id}").text("￥" + (count${productBean.id} * price${productBean.id}).toFixed(2));
                                    });
                                </script>
                            </div>
                        </td>
                        <td>
                            <div class="line-center" id="itemTotal${productBean.id}"></div>
                            <script>
                                var count${productBean.id} = $("#count${productBean.id}").val();
                                var price${productBean.id} = ${productBean.price};
                                totalAmount += count${productBean.id} * price${productBean.id};
                                totalCount += parseInt(count${productBean.id});
                                $("#totalCount").text(totalCount);
                                $("#totalAmount").text(totalAmount.toFixed(2));
                                $("#itemTotal${productBean.id}").text("￥" + (count${productBean.id} * price${productBean.id}));
                            </script>
                        </td>
                        <td>
                            <div class="line-center">
                                <button class="btn btn-sm btn-danger">删除</button>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="3">统计</td>
                        <td class="text-center">总数：<span id="totalCount"></span></td>
                        <td class="text-center">总价:￥<span id="totalAmount"></span></td>
                    </tr>
                    <script>
                        $(document).ready(function () {
                            $("#totalCount").text(totalCount);
                            $("#totalAmount").text(totalAmount.toFixed(2));
                            $("input[type=text][name=totalCount]").val(totalCount);
                            $("input[type=text][name=totalAmount]").val(totalAmount.toFixed(2));
                        });
                    </script>
                </tfoot>
            </table>
        </div>

        <div class="col-sm-offset-8 col-sm-4" style="padding-bottom: 15px;">
            <form action="cart.jsp" method="post" onsubmit="return isLogin();">
                <input type="hidden" name="id" value="${sessionScope.loginUser.id}">
                <input type="hidden" name="totalCount" />
                <input type="hidden" name="totalAmount">
                <a class="btn btn-success" style="width: 100%; margin-bottom: 5px;" href="index.jsp">继续购物</a>
                <input type="submit" class="btn btn-danger" value="提交订单" style="width: 100%;">
            </form>
            <script>
                function isLogin () {
                    if ("${sessionScope.loginUser.id}" == "") {
                        alert("请先登录！");
                        window.location.href = "login.jsp";
                        return false;
                    }
                    $("input[type=text][name=totalCount]").val(totalCount);
                    $("input[type=text][name=totalAmount]").val(totalAmount.toFixed(2));
                    return true;
                }
            </script>
        </div>
    </div>
</div>


<%@ include file="/jsp/home/common/footer.jsp" %>
</body>
</html>