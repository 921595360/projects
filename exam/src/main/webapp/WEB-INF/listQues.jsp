<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
    
<!-- 引入c标签库 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>题库列表</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-2.1.0.js"></script>
</head>
<body>

	<script type="text/javascript">
		function reload(){
			var title=document.getElementById('title').value;
			var id=document.getElementById('id').value;
			this.location.href='${pageContext.request.contextPath}/question/list?title='+title+'&id='+id;
		}

		/**
		 * 批量删除
		 */
		function del(){
			//获取选中行的id
			var ids='0';
			$.each($('.delId:checked'),function(i,val){
				ids+=','+val.value;
			});

			//向后台发起请求，删除选中行
			$.post('${pageContext.request.contextPath}/question/del',{'ids':ids},function(data){
				if(data.success){
					$('.delId:checked').parent().parent().empty();
					alert('操作成功');
				}else{
					alert(data.msg);
				}
			});

		}

		function addToExam(){

			//获取选中编号
			var ids='';
			$.each($('.delId:checked'),function(i,val){
				ids+=','+val.value;
			});

			//提交到后台
			$.post('${ctx}/exam/addQuestion',{examId:${(param.examId eq null)?0:param.examId},ids:ids},function(data){
				if(data.success){
					alert("添加成功");
				}else{
					alert("添加失败，原因："+data.msg);
				}
			});
		}

		function go(){
			var pageNum=$('#pageNum').val();
			var pageSize=$('#pageSize').val();
			this.location.href='${ctx}/question/list?pageNum='+pageNum+'&pageSize='+pageSize+'&title=${param.title}&id=${param.id}&examId=${param.examId}';
		}
	</script>
	
	<input type="text" placeholder="标题" id="title">
	<input type="text" placeholder="编号" id="id">
	<button onclick="reload()">搜索</button><br>
	<a href="${pageContext.request.contextPath}/question/add">添加试题</a>
	<button onclick="del()">批量删除</button>
	<c:if test="${not empty param.examId }">
		<button onclick="addToExam()">批量添加到试卷</button><br>
	</c:if>
	<br>

	<table border="1px blue solid;">
		<thead>

			<tr>
				
				<td>选中</td>
				<td>编号</td>
				<td>题目</td>
				<td>选项</td>
				<td>分值</td>
				<td>操作</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.questions }" var="ques" >
				<tr>
					<td><input type="checkbox" class="delId" value="${ques.id}"></td>
					<td>${ques.id }</td>
					<td>${ques.title }</td>
					<td>${ques.choose }</td>
					<td>${ques.score }</td>
					<td><a href="?id=${ques.id }">编辑</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	每页记录：<select name="pageSize" id="pageSize">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
		 </select>
	<a href="${ctx}/question/list?title=${param.title}&id=${param.id}&examId=${param.examId}">首页</a>
	<c:if test="${not (page.pageNum  eq 1)}">
		<a href="${ctx}/question/list?pageNum=${page.pageNum-1}&pageSize=${page.pageSize}&title=${param.title}&id=${param.id}&examId=${param.examId}">上一页</a>
	</c:if>

	<input type="text" id="pageNum" style="width: 30px;"><button onclick="go()">跳转</button>

	<c:if test="${not (page.pageNum  eq page.totalPage)}">
		<a href="${ctx}/question/list?pageNum=${page.pageNum+1}&pageSize=${page.pageSize}&title=${param.title}&id=${param.id}&examId=${param.examId}">下一页</a>
	</c:if>
	<a href="${ctx}/question/list?pageNum=${page.totalPage}&pageSize=${page.pageSize}&title=${param.title}&id=${param.id}&examId=${param.examId}">尾页</a>
</body>
</html>