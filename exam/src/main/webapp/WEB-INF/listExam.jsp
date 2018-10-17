<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@include file="/WEB-INF/common/common.jsp"%>
    
<!-- 引入c标签库 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>考试列表</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-2.1.0.js"></script>
</head>
<body>

<%@include file="/WEB-INF/common/header.jsp"%>
<div class="container-fluid">
	<table class="table table-bordered table-hover">
		<thead>
		<tr>
			<td>选中</td>
			<td>编号</td>
			<td>题目</td>
			<td>开始时间</td>
			<td>所需时间</td>
			<td>操作</td>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${requestScope.exams }" var="exam" >
			<tr>
				<td><input type="checkbox"  class="examId " value="${exam.id}"></td>
				<td>${exam.id }</td>
				<td>${exam.title }</td>
				<td>${exam.beginTime }</td>
				<td>${exam.needTime}</td>
				<td>
					<a href="${ctx}/question/list?examId=${exam.id }">添加试题</a>
					<a href="${ctx}/question/begin?examId=${exam.id }">开始考试</a>
					<a href="${ctx}/exam/result?examId=${exam.id }">查看成绩</a>
					<a href="${ctx}/exam/exportScore/${exam.title}-成绩.xls?examId=${exam.id }&title=${exam.title }">导出成绩</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>


</div>





</body>
</html>