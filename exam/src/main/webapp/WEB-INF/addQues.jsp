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
    <title>添加题库</title>
</head>
<body>

<form action="${pageContext.request.contextPath}/question/add" method="post">
    <font color="#ff4500">${requestScope.msg}</font><br>
    题目：<input type="text" name="title" placeholder="请输入题目" value="${requestScope.question.title}"><br>
    选项：<br>
    <textarea name="choose" cols="50" rows="5">
        ${requestScope.question.choose}
    </textarea>
   <br>
    答案：<input type="text" name="answer" placeholder="请输入标准答案" value="${requestScope.question.answer}"><br>
    分值：<input type="number" name="score" placeholder="分值" value="${requestScope.question.score}"><br>
    <input type="submit" value="添加">
</form>


</body>
</html>
