<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>订单详情</title>
    <%@ include file="/jsp/home/common/head_link.jsp" %>
    <style>
        .row {
            margin-left: 20px;
            margin-right: 20px;;
        }

        .row input {
            width: 50px;
        }

        .list-group-item div:first-child:hover {

            cursor: pointer;
        }

        th {
            text-align: right;
            width: 200px;;
        }

        td {
            text-align: left;
            padding: 10px;
        }

        .table th {
            text-align: center;
        }

        .table td {
            text-align: center;
        }
    </style>
</head>
<body>
<%@ include file="/jsp/home/common/head_nav.jsp" %>
<div class="container">
    <div class="row thumbnail center col-sm-12">
        <div class="col-sm-12">
            <h3 class="text-center" style="margin-bottom: 20px">订单详情</h3>
        </div>

        <div class="col-sm-12 ">
            <table>
                <tr>
                    <th>订单编号：</th>
                    <td>123-131-4234-1314-131</td>
                </tr>
                <tr>
                    <th>订单状态：</th>
                    <td>未付款</td>
                </tr>
                <tr>
                    <th>收货人姓名：</th>
                    <td>侯龙超</td>
                </tr>
                <tr>
                    <th>收货人地址：</th>
                    <td>内蒙古科技大学</td>
                </tr>
                <tr>
                    <th>收货人电话：</th>
                    <td>12345678901</td>
                </tr>
            </table>
        </div>
        <div class="col-sm-12">
            <table class="table table-striped table-condensed">
                <thead>
                <tr>
                    <th>书名</th>
                    <th>单价</th>
                    <th>数量</th>
                    <th>小计</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>书名</td>
                    <td>单价</td>
                    <td>数量</td>
                    <td>小计</td>
                </tr>
                <tr>
                    <td>书名</td>
                    <td>单价</td>
                    <td>数量</td>
                    <td>小计</td>
                </tr>
                <tr>
                    <td>书名</td>
                    <td>单价</td>
                    <td>数量</td>
                    <td>小计</td>
                </tr>
                </tbody>
                <tfoot>
                <tr>
                    <td colspan="2"></td>
                    <td class="text-right">商品总数：12</td>
                    <td class="text-center">订单总价：1000元</td>
                </tr>
                <tr>
                    <td>
                        <a href="center.jsp#orderManager" class="btn btn-primary btn-sm col-sm-12">继续购物</a>
                    </td>
                    <td></td>
                    <td>
                        <a href="#" class="btn btn-danger btn-sm col-sm-12">删除订单</a>
                    </td>
                    <td>
                        <a href="#" class="btn btn-success btn-sm col-sm-12">立即支付</a>
                    </td>
                </tr>
                </tfoot>
            </table>
        </div>
    </div>
</div>
<%@ include file="/jsp/home/common/footer.jsp" %>
</body>
</html>