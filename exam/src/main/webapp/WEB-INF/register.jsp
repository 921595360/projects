<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false" %>
<%@include file="common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎注册</title>

</head>
<body>
<br><br><br><br>
	<div class="container">

		<div class="row">
			<div class="col-xs-4"></div>
			<div class="col-xs-4">
				<form action="register.do" method="post">

					<div class="form-group">
						<label>用户名:</label>
						<input type="text" class="form-control" name="userName" id="userName" placeholder="请输入用户名" />
						<span id="userNameMsg"><font color="red">${requestScope.msg }</font></span>
					</div>

					<div class="form-group">
						<label for="">密码:</label><input type="password" name="userPass" class="form-control" placeholder="请输入密码" >
					</div>

					<div class="form-group">
						<button class="btn btn-primary col-xs-offset-1">注册</button>
						<a href="${ctx}/login" class="btn btn-link col-xs-offset-5">已有帐号</a>
					</div>
				</form>

			</div>
			<div class="col-xs-4"></div>
		</div>


	</div>





	
	<script type="text/javascript">
		$(function(){
			//用户名绑定change事件
			$('#userName').change(function(){
				var userName=$('#userName').val();
				//发起异步请求验证用户名是否存在
				$.get("checkUserName.do?userName="+userName,function(data){
					
					if(data.result){
						//提示用户
						$('#userNameMsg').html(data.msg.fontcolor('red'));
					}else{
						//打勾
						$('#userNameMsg').html('√'.fontcolor('green'));
					}
				});
			});
		});
	</script>

</body>
</html>