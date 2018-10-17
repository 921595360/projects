<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>

<!-- 引入c标签库 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>成绩</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-2.1.0.js"></script>
</head>
<body>

<h2><font color="red">本次考试成绩${score}</font></h2>
<table border="1px blue solid;">
    <thead>
    <tr>
        <td>编号</td>
        <td>题目</td>
        <td>选项</td>
        <td>标准答案</td>
        <td>我的答案</td>
        <td>分值</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${requestScope.result }" var="ques" varStatus="status">
        <tr>
            <td>${status.index+1 }</td>
            <td>${ques.title }</td>
            <td>${ques.choose }</td>
            <td>${ques.answer}</td>
            <td>${ques.myAnswer}</td>
            <td>${ques.score }</td>
        </tr>
    </c:forEach>
    </tbody>
</table>


</body>
</html>