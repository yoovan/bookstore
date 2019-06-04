<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>商品详情</title>
    <%@ include file="/jsp/home/common/head_link.jsp" %>
</head>
<body>
<%@ include file="/jsp/home/common/head_nav.jsp" %>
<div class="container">
    <div class="row thumbnail">
        <div class="col-sm-4">
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                </ol>

                <!-- Wrapper for slides -->
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
                            啊！！沈月！！妈！我要娶她！！
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
            <div class="caption center">
                <h5>思考的艺术（原书第11版）</h5>
                <p>定价：<span class="text-danger">￥43.55</span></p>
                <p>
                    <a class="btn btn-danger btn-block" role="button" href="#">立即购买</a>
                    <a class="btn btn-warning btn-block" role="button" href="#">加入购物车</a>
                </p>
            </div>
        </div>
        <div class="col-sm-8">
            <div class="caption">
            </div>
            <div class="panel panel-primary">
                <div class="panel-heading">
                    基本信息
                </div>
                <div class="panel-body">
                    <div>作者： （美） 文森特·赖安·拉吉罗（Vincent Ryan Ruggiero）</div>
                    <div>出版社：机械工业出版社</div>
                    <div>ISBN：9787111616801</div>
                    <div>上架时间：2019-3-19</div>
                    <div>出版日期：2019 年3月</div>
                    <div>开本：32开</div>
                    <div>页码：355</div>
                    <div>版次：1-1</div>
                    <div>所属分类：哲学/宗教 > 哲学 > 哲学知识读物</div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    内容简介
                </div>
                <div class="panel-body">
                    思维活动是自动完成的吗？能不能通过主观努力来管理和控制它？<br>
                    做白日梦是一种思维活动吗？<br>
                    杰出的思想者是否也会像普通人那样经历思维阻塞、不能专心和困惑？<br>
                    创造力是与生俱来、不能习得的？<br>
                    富有创造力的行事方法就是忽略传统方式？<br>
                    只有高智商的人才具有创造力？<br>
                    服用药物可以提高创造力？<br>
                    你对思维这件事了解多少？以上这些问题哪些是正确的？哪些是错误的？<br>
                    这本独特的书将帮你打破思考的局限、克服思考的障碍，让你学会创造性、批判性地思考问题，并有效地沟通想法、说服别人。请不要错过书中俯拾皆是的珍宝——批判性思维和创造性思维的策略与技术、一步一步解决问题的过程。它强调创意和积极的思维过程，深入浅出，引人入胜，对于任何有兴趣探讨批判性和创造性思维的读者，这无疑是一本不折不扣的经典之作！<br>
                </div>
            </div>
        </div>

    </div>
</div>

<%@ include file="/jsp/home/common/footer.jsp" %>
</body>
</html>