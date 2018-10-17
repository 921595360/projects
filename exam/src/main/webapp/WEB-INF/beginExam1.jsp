<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
    
<!-- 引入c标签库 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>正在考试。。。。</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-2.1.0.js"></script>
</head>
<body>


<form action="${ctx}/exam/end" onsubmit="return confirm('确认提交?')" method="post">
	<input type="hidden" name="examId" value="${param.examId}" />
	<table border="1px blue solid;">
		<thead>
		<tr>
			<td>编号</td>
			<td>题目</td>
			<td>选项</td>
			<td>分值</td>
			<td>答案</td>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${requestScope.questions }" var="ques" varStatus="status" >
			<tr>
				<td>${status.index+1 }</td>
				<td>${ques.title }</td>
				<td>${ques.choose }</td>
				<td>${ques.score }</td>
				<td><input type="text" name="answers">
					<input type="hidden" name="quesIds" value="${ques.id }">
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<input type="submit" value="提交试卷">

</form>

	

</body>
</html>