<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/9/12
  Time: 16:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>添加试卷</title>
</head>
<body>

<form action="${pageContext.request.contextPath}/exam/add" method="post">
    <font color="#ff4500">${requestScope.msg}</font><br>
    标题：<input type="text" name="title" placeholder="请输入标题" value="${requestScope.exam.title}"><br>
   考试 开始时间：<input type="datetime" name="beginTime" placeholder="请输入开始时间" value="${requestScope.exam.beginTime}"><br>
    所需时间：<input type="number" name="needTime" placeholder="单位分钟" value="${requestScope.exam.needTime}"><br>
    <input type="submit" value="添加">
</form>


</body>
</html>
