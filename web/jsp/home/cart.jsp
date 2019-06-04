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
                <tr>
                    <td>
                        <div class="line-center" style="width: 50px;height: 50px;">
                            <img src="Flat-UI-master/dist/img/icons/png/Book.png" style="height: 100%;" alt=""/>
                        </div>
                    </td>
                    <td>
                        <div class="line-center">java程序设计但是名字还不够是的发的3423424234</div>
                    </td>
                    <td>
                        <div class="line-center">￥55.60</div>
                    </td>
                    <td>
                        <div class=" line-center">
                            <button type="button" class="btn btn-sm btn-danger">
                                <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
                            </button>
                            <input type="text" class="small text-center" value="123"/>
                            <button type="button" class="btn btn-sm btn-success">
                                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                            </button>
                        </div>
                    </td>
                    <td>
                        <div class="line-center">$20000.00</div>
                    </td>
                    <td>
                        <div class="line-center">
                            <button class="btn btn-sm btn-danger">删除</button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="line-center" style="width: 50px;height: 50px;">
                            <img src="Flat-UI-master/dist/img/icons/png/Book.png" style="height: 100%;" alt=""/>
                        </div>
                    </td>
                    <td>
                        <div class="line-center">java程序设计但是名字还不够是的发的3423424234</div>
                    </td>
                    <td>
                        <div class="line-center">￥55.60</div>
                    </td>
                    <td>
                        <div class=" line-center">
                            <button type="button" class="btn btn-sm btn-danger">
                                <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
                            </button>
                            <input type="text" class="small text-center" value="123"/>
                            <button type="button" class="btn btn-sm btn-success">
                                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                            </button>
                        </div>
                    </td>
                    <td>
                        <div class="line-center">$20000.00</div>
                    </td>
                    <td>
                        <div class="line-center">
                            <button class="btn btn-sm btn-danger">删除</button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="line-center" style="width: 50px;height: 50px;">
                            <img src="Flat-UI-master/dist/img/icons/png/Book.png" style="height: 100%;" alt=""/>
                        </div>
                    </td>
                    <td>
                        <div class="line-center">java程序设计但是名字还不够是的发的3423424234</div>
                    </td>
                    <td>
                        <div class="line-center">￥55.60</div>
                    </td>
                    <td>
                        <div class=" line-center">
                            <button type="button" class="btn btn-sm btn-danger">
                                <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
                            </button>
                            <input type="text" class="small text-center" value="123"/>
                            <button type="button" class="btn btn-sm btn-success">
                                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                            </button>
                        </div>
                    </td>
                    <td>
                        <div class="line-center">$20000.00</div>
                    </td>
                    <td>
                        <div class="line-center">
                            <button class="btn btn-sm btn-danger">删除</button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="line-center" style="width: 50px;height: 50px;">
                            <img src="Flat-UI-master/dist/img/icons/png/Book.png" style="height: 100%;" alt=""/>
                        </div>
                    </td>
                    <td>
                        <div class="line-center">java程序设计但是名字还不够是的发的3423424234</div>
                    </td>
                    <td>
                        <div class="line-center">￥55.60</div>
                    </td>
                    <td>
                        <div class=" line-center">
                            <button type="button" class="btn btn-sm btn-danger">
                                <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
                            </button>
                            <input type="text" class="small text-center" value="123"/>
                            <button type="button" class="btn btn-sm btn-success">
                                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                            </button>
                        </div>
                    </td>
                    <td>
                        <div class="line-center">$20000.00</div>
                    </td>
                    <td>
                        <div class="line-center">
                            <button class="btn btn-sm btn-danger">删除</button>
                        </div>
                    </td>
                </tr>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="3">统计</td>
                        <td class="text-center">总数：643</td>
                        <td class="text-center">总价:￥10000</td>
                    </tr>
                </tfoot>
            </table>
        </div>

        <div class="col-sm-offset-9 col-sm-3" style="padding-bottom: 15px;">
            <button class="btn btn-success">继续购物</button>
            <button class="btn btn-danger">提交订单</button>
        </div>
    </div>
</div>


<%@ include file="/jsp/home/common/footer.jsp" %>
</body>
</html>