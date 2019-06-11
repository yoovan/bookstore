<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value='/resources/backend/assets/css/layui.css' />">
</head>
<body>
控制台
<script src="<c:url value="/resources/backend/assets/layui/layui.js" />"></script>
<script>
    layui.use('element', function () {
        var element = layui.element;
    })
</script>
</body>
</html>