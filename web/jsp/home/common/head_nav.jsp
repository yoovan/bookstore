<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header">
            <a href="index.jsp" class="navbar-brand">小小书店</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="categories.jsp">全部分类</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right hidden-sm">
                <li>
                    <form class="navbar-form navbar-left" action="search.jsp">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="输入关键字查询">
                        </div>
                        <button type="submit" class="btn btn-primary">搜索</button>
                    </form>
                </li>
                <li><a href="login.jsp">登录</a></li>
                <li><a href="register.jsp">注册</a></li>
                <li>
                    <a href="cart.jsp"><span class="glyphicon glyphicon-shopping-cart">购物车</span></a>
                </li>
                <li>
                    <a href="center.jsp">欢迎您，yostar</a>
                </li>
            </ul>
        </div>
    </div>
</div>