<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"  %>
<%@include file="common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎登录</title>
</head>
<body>

<div class="container">
	<div class="row">
		<div class="col-xs-4"></div>
		<div class="col-xs-4">
			<form action="login.do" method="post">


				<div class="form-group  <c:if test="${not (empty requestScope.msg ) }">has-error</c:if>">
					<label for="">用户名:</label>
					<input type="text" name="userName" class="form-control" placeholder="请输入用户名"><font color="red">${requestScope.msg }</font>
				</div>

				<div class="form-group">
					<label for="">密码:</label>
					<input type="password" name="userPass" class="form-control" placeholder="请输入密码" />
				</div>
				<div class="form-group">

					<button class="btn btn-primary col-xs-offset-1">登录</button>
					<a href="${ctx}/register" class="btn btn-link col-xs-offset-5">注册</a>
				</div>


			</form>

		</div>
		<div class="col-xs-4"></div>
	</div>

</div>



</body>
</html>