<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>登录</title>
    <%@ include file="/jsp/home/common/head_link.jsp" %>
    <style>
        .pagination {
            background: #16a085;
        }
    </style>
    <script>
        $(function () {
            $('#myTabs a').click(function () {
                if ($(this)[0].hash == "#orderManager" && $("#footer").hasClass("navbar-fixed-bottom")) {
                    $("#footer").removeClass("navbar-fixed-bottom");
                } else {
                    if (!$("#footer").hasClass("navbar-fixed-bottom")) {
                        $("#footer").addClass("navbar-fixed-bottom");
                    }
                }
                $(this).tab('show')
            });
        })
    </script>
</head>
<body>
<%@ include file="/jsp/home/common/head_nav.jsp" %>
<div class="container">
    <div class="row thumbnail center col-sm-12">
        <div class="col-sm-12">
            <h3 class="text-center" style="margin-bottom: 20px">个人中心</h3>
        </div>

        <ul class="nav nav-tabs nav-justified" id="myTabs">
            <li class="active"><a href="#editInfo">个人资料</a></li>
            <%--<li><a href="#editPassword">密码修改</a></li>--%>
            <li><a href="#orderManager">订单管理</a></li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="editInfo">
                <c:set value="${requestScope.userBean}" var="userBean" />
                <div class="table-responsive" style="padding: 20px;">
                    <table class="table">
                        <tbody>
                        <tr>
                            <td>用户名</td>
                            <td>${sessionScope.loginUser.username}</td>
                            <td><a href="#" class="text-info">修改</a></td>
                        </tr>
                        <tr>
                            <td>手机号码</td>
                            <td>${userBean.phone}</td>
                            <td><a href="#" class="text-info">修改</a></td>
                        </tr>
                        <tr>
                            <td>默认收货地址</td>
                            <td>
                                <div>${userBean.address}</div>
                                <div>${userBean.contactName}</div>
                                <div>${userBean.contactPhone}</div>
                            </td>
                            <td>
                                <a href="#" class="text-info">修改</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <%--<div role="tabpanel" class="tab-pane" id="editPassword">
                <div class="container" style="margin-top: 20px;">
                    <div class="col-sm-12">
                        <form class="form-horizontal caption" action="passwordEdit" method="post">
                            <div class="form-group">
                                <label for="old_password" class="col-sm-4 control-label">旧密码</label>
                                <div class="col-sm-5">
                                    <input type="password" class="form-control" id="old_password" name="oldPassword" placeholder="请输入旧密码">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="new_password" class="col-sm-4 control-label">新密码</label>
                                <div class="col-sm-5">
                                    <input type="password" class="form-control" id="new_password" name="newPassword" placeholder="请输入新密码">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="confirm_password" class="col-sm-4 control-label">确认密码</label>
                                <div class="col-sm-5">
                                    <input type="password" class="form-control" id="confirm_password" name="confirmPassword"
                                           placeholder="请确认密码">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-4 col-sm-5">
                                    <input type="submit" class="btn btn-info btn-block" value="立即修改"></button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>--%>
            <div role="tabpanel" class="tab-pane" id="orderManager">
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th class="text-center">订单编号</th>
                            <th class="text-center">订单状态</th>
                            <th class="text-center">商品数量</th>
                            <th class="text-center">订单总价</th>
                            <th class="text-center">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td class="text-center">
                                <div onclick="myClick(1)">ahiudsfhjk-23423-23asd-12</div>
                            </td>
                            <td class="text-center"><span class="text-danger">未付款</span></td>
                            <td class="text-center">
                                <span>12</span>
                            </td>
                            <td class="text-center">
                                <span>$20000.00</span>
                            </td>

                            <td class="text-center">
                                <a href="#" class="btn btn-sm btn-success" data-toggle="tooltip" title="提交订单"><i
                                        class="glyphicon glyphicon-shopping-cart"></i></a>
                                <a href="#" class="btn btn-sm btn-primary" data-toggle="tooltip" title="查看订单"><i
                                        class="glyphicon glyphicon-eye-open"></i></a>
                                <a href="#" class="btn btn-sm btn-danger" data-toggle="tooltip" title="取消订单"><i
                                        class="glyphicon glyphicon-remove"></i></a>
                                <a href="#" class="btn btn-sm btn-danger" data-toggle="tooltip" title="删除订单"><i
                                        class="glyphicon glyphicon-trash"></i></a>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-center">
                                <div class="" onclick="myClick(1)">ahiudsfhjk-23423-23asd-12</div>
                            </td>
                            <td class="text-center"><span class="text-info">已付款</span></td>
                            <td class="text-center">
                                <span>12</span>
                            </td>
                            <td class="text-center">
                                <span>$20000.00</span>
                            </td>

                            <td class="text-center">
                                <a href="#" class="btn btn-sm btn-success" data-toggle="tooltip" title="提交订单"><i
                                        class="glyphicon glyphicon-shopping-cart"></i></a>
                                <a href="orderDetail.jsp" class="btn btn-sm btn-primary" data-toggle="tooltip" title="查看订单"><i
                                        class="glyphicon glyphicon-eye-open"></i></a>
                                <a href="#" class="btn btn-sm btn-danger" data-toggle="tooltip" title="取消订单"><i
                                        class="glyphicon glyphicon-remove"></i></a>
                                <a href="#" class="btn btn-sm btn-danger" data-toggle="tooltip" title="删除订单"><i
                                        class="glyphicon glyphicon-trash"></i></a>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-center">
                                <div class="" onclick="myClick(1)">ahiudsfhjk-23423-23asd-12</div>
                            </td>
                            <td class="text-center"><span class="text-danger">已取消</span></td>
                            <td class="text-center">
                                <span>12</span>
                            </td>
                            <td class="text-center">
                                <span>$20000.00</span>
                            </td>

                            <td class="text-center">
                                <a href="#" class="btn btn-sm btn-success" data-toggle="tooltip" title="提交订单"><i
                                        class="glyphicon glyphicon-shopping-cart"></i></a>
                                <a href="#" class="btn btn-sm btn-primary" data-toggle="tooltip" title="查看订单"><i
                                        class="glyphicon glyphicon-eye-open"></i></a>
                                <a href="#" class="btn btn-sm btn-danger" data-toggle="tooltip" title="取消订单"><i
                                        class="glyphicon glyphicon-remove"></i></a>
                                <a href="#" class="btn btn-sm btn-danger" data-toggle="tooltip" title="删除订单"><i
                                        class="glyphicon glyphicon-trash"></i></a>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-center">
                                <div class="" onclick="myClick(1)">ahiudsfhjk-23423-23asd-12</div>
                            </td>
                            <td class="text-center"><span class="text-info">已发货</span></td>
                            <td class="text-center">
                                <span>12</span>
                            </td>
                            <td class="text-center">
                                <span>$20000.00</span>
                            </td>

                            <td class="text-center">
                                <a href="#" class="btn btn-sm btn-success" data-toggle="tooltip" title="提交订单"><i
                                        class="glyphicon glyphicon-shopping-cart"></i></a>
                                <a href="orderDetail.jsp" class="btn btn-sm btn-primary" data-toggle="tooltip" title="查看订单"><i
                                        class="glyphicon glyphicon-eye-open"></i></a>
                                <a href="#" class="btn btn-sm btn-danger" data-toggle="tooltip" title="取消订单"><i
                                        class="glyphicon glyphicon-remove"></i></a>
                                <a href="#" class="btn btn-sm btn-danger" data-toggle="tooltip" title="删除订单"><i
                                        class="glyphicon glyphicon-trash"></i></a>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-center">
                                <div class="" onclick="myClick(1)">ahiudsfhjk-23423-23asd-12</div>
                            </td>
                            <td class="text-center"><span class="text-danger">未付款</span></td>
                            <td class="text-center">
                                <span>12</span>
                            </td>
                            <td class="text-center">
                                <span>$20000.00</span>
                            </td>

                            <td class="text-center">
                                <a href="#" class="btn btn-sm btn-success" data-toggle="tooltip" title="提交订单"><i
                                        class="glyphicon glyphicon-shopping-cart"></i></a>
                                <a href="orderDetail.jsp" class="btn btn-sm btn-primary" data-toggle="tooltip" title="查看订单"><i
                                        class="glyphicon glyphicon-eye-open"></i></a>
                                <a href="#" class="btn btn-sm btn-danger" data-toggle="tooltip" title="取消订单"><i
                                        class="glyphicon glyphicon-remove"></i></a>
                                <a href="#" class="btn btn-sm btn-danger" data-toggle="tooltip" title="删除订单"><i
                                        class="glyphicon glyphicon-trash"></i></a>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-center">
                                <div onclick="myClick(1)">ahiudsfhjk-23423-23asd-12</div>
                            </td>
                            <td class="text-center"><span class="text-success">已完成</span></td>
                            <td class="text-center">
                                <span>12</span>
                            </td>
                            <td class="text-center">
                                <span>$20000.00</span>
                            </td>

                            <td class="text-center">
                                <a href="#" class="btn btn-sm btn-success" data-toggle="tooltip" title="提交订单"><i
                                        class="glyphicon glyphicon-shopping-cart"></i></a>
                                <a href="orderDetail.jsp" class="btn btn-sm btn-primary" data-toggle="tooltip" title="查看订单"><i
                                        class="glyphicon glyphicon-eye-open"></i></a>
                                <a href="#" class="btn btn-sm btn-danger" data-toggle="tooltip" title="取消订单"><i
                                        class="glyphicon glyphicon-remove"></i></a>
                                <a href="#" class="btn btn-sm btn-danger" data-toggle="tooltip" title="删除订单"><i
                                        class="glyphicon glyphicon-trash"></i></a>
                            </td>
                        </tr>
                        </tbody>
                        <tfoot>
                        <tr>
                            <td colspan="5" class="text-center">
                                <nav class="text-center">
                                    <ul class="pagination pagination-danger">
                                        <li><a href="#" class="btn-primary">&laquo;</a></li>
                                        <li class="active"><a href="#">1</a></li>
                                        <li><a href="#" class="btn-primary">2</a></li>
                                        <li><a href="#">3</a></li>
                                        <li><a href="#">4</a></li>
                                        <li><a href="#">5</a></li>
                                        <li><a href="#">&raquo;</a></li>
                                    </ul>
                                </nav>
                            </td>
                        </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/jsp/home/common/footer.jsp" %>
</body>
</html>