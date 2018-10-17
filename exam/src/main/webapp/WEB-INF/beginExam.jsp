<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>

<!-- 引入c标签库 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 引入函数库 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="content-type" content="text/html;charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<title>远程教育考试平台_在线考试</title>
	<link href="${ctx}/static/lib/answerCard/main.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
		@font-face {font-family: "iconfont";
			src: url('${ctx}/static/lib/answerCard/iconfont.eot?t=1506563383179'); /* IE9*/
			src: url('${ctx}/static/lib/answerCard/iconfont.eot?t=1506563383179#iefix') format('embedded-opentype'), /* IE6-IE8 */
			url('data:application/x-font-woff;charset=utf-8;base64,d09GRgABAAAAAAW4AAsAAAAACHgAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAABHU1VCAAABCAAAADMAAABCsP6z7U9TLzIAAAE8AAAARAAAAFZW+EgHY21hcAAAAYAAAABmAAABnM7iahhnbHlmAAAB6AAAAcoAAAI4Rk+YCmhlYWQAAAO0AAAALwAAADYPBDBWaGhlYQAAA+QAAAAcAAAAJAfeA4VobXR4AAAEAAAAABAAAAAQD+kAAGxvY2EAAAQQAAAACgAAAAoBkgCsbWF4cAAABBwAAAAfAAAAIAEZAF1uYW1lAAAEPAAAAUUAAAJtPlT+fXBvc3QAAAWEAAAAMgAAAEODeBECeJxjYGRgYOBikGPQYWB0cfMJYeBgYGGAAJAMY05meiJQDMoDyrGAaQ4gZoOIAgCKIwNPAHicY2Bk/sU4gYGVgYOpk+kMAwNDP4RmfM1gxMjBwMDEwMrMgBUEpLmmMDgwVDyTZm7438AQw9zA0AUUZgTJAQAmXQyTeJzFkLENwCAMBN+YRChKRcsKKaMMlCojMLHXILahYQIenbFfLxkBYAPAyqVEgD4QTK+65D7jcD/i0TnpCXpXyVJamzoTeSJ5x5akHctE61bPOr3eY7L/rgN9ouSO+VI6CD9tRxAnAAB4nHVQvW/TUBC/u+dnJ21i4684ceo4jkkNMljCSUqlKslSCfEhFSkSHyMbC2zQpUOXSpVg4G9ASEiZ6EIzdAEJqStT5wT+g4aJ1uU16dAO3Pv4/U7v7t3vDjjA2ZgdsDKYcAPuwDo8BkA5xoZKHgZRO6EY7YDbjqWyKIwCJWwkrItOQ7ZK6Up72ZEVWUMVa9gK0pUooQg77R6tYVryECtVd2A0lwz2ARfKUW0ne0Af0fbDJa13O7t/q2+ldTO3WTCMimG8z8mc54gkTcVXTinP8wty9olrrn3g3yQfC5XIffS8WK8aL3bbr72mk0fc3kazWlc/93VXF3vLLZlGRblWzJXdYnjdws3fi2Wz4C3/AmFM9PqWfaUjWAQHPNGnikoNnR7eTZAlGAkiXBVZqLc6IcmjqSRNR/tTzqf7w4kkTYbDMefjPX/8nY748Wh0zGf3yY/zp3nAhPayb3VRAc7esT/sjaiqCE8T83WgCj6E0IKHAGbLDu2L8z9+rk8XigIhTBf6mkFaI1u3VAqDRkIdXQz678uZ/bwC2b3+gGjQp9U5nh7SarzRDYLuRnx6eMHo2ZOnYuGXy0C7s/BL6etXkuL5R/8AD+R73gAAeJxjYGRgYABi3+zZj+P5bb4ycLMwgMDVT2XmCPp/GQsDcymQy8HABBIFADv1CsoAeJxjYGRgYG7438AQw8IAAkCSkQEVsAAARwoCbQQAAAAD6QAABAAAAAQAAAAAAAAAAHYArAEcAAB4nGNgZGBgYGEIZOBmAAEmIOYCQgaG/2A+AwARnAF3AHicZY9NTsMwEIVf+gekEqqoYIfkBWIBKP0Rq25YVGr3XXTfpk6bKokjx63UA3AejsAJOALcgDvwSCebNpbH37x5Y08A3OAHHo7fLfeRPVwyO3INF7gXrlN/EG6QX4SbaONVuEX9TdjHM6bCbXRheYPXuGL2hHdhDx18CNdwjU/hOvUv4Qb5W7iJO/wKt9Dx6sI+5l5XuI1HL/bHVi+cXqnlQcWhySKTOb+CmV7vkoWt0uqca1vEJlODoF9JU51pW91T7NdD5yIVWZOqCas6SYzKrdnq0AUb5/JRrxeJHoQm5Vhj/rbGAo5xBYUlDowxQhhkiMro6DtVZvSvsUPCXntWPc3ndFsU1P9zhQEC9M9cU7qy0nk6T4E9XxtSdXQrbsuelDSRXs1JErJCXta2VELqATZlV44RelzRiT8oZ0j/AAlabsgAAAB4nGNgYoAALgbsgIWRiZGZkYWRlYGxgr04IzMrMzGPOzM5Py8+JbEkMzuRgQEAabAICgAA') format('woff'),
			url('${ctx}/static/lib/answerCard/iconfont.ttf?t=1506563383179') format('truetype'), /* chrome, firefox, opera, Safari, Android, iOS 4.2+*/
			url('${ctx}/static/lib/answerCard/iconfont.svg?t=1506563383179#iconfont') format('svg'); /* iOS 4.1- */
		}

		.iconfont {
			font-family:"iconfont" !important;
			font-size:16px;
			font-style:normal;
			-webkit-font-smoothing: antialiased;
			-moz-osx-font-smoothing: grayscale;
		}

		.icon-shijian:before { content: "\e61b"; }

		.icon-icon_datika:before { content: "\e612"; }


	</style>
	<link href="${ctx}/static/lib/answerCard/test.css" rel="stylesheet" type="text/css" />

	<style>
		.hasBeenAnswer {
			background: #5d9cec;
			color: #fff;
		}

		#warning{
			/*position: absolute;
				margin-top: 10px;
				margin-left: 30%;
				background: white;		*/
			margin-right: 300px;
		}


	</style>
</head>

<body onclick="fullScreen()" ondblclick="exitFullScreen()">
<!--<button onclick="fullScreen()">全屏</button>
		<button onclick="exitFullScreen()">退出全屏</button>-->
<h1 id="warning"><font color="red">请不要试图离开当前页面，否则视为立即交卷！！！</font></h1>

<div class="main">


	<!--nr start-->
	<div class="test_main">
		<div class="nr_left">
			<div class="test">
				<form action="" method="post">
					<div class="test_title">
						<p class="test_time">
							<i class="icon iconfont icon-shijian"></i><b class="alt-1">01:40</b>
						</p>
						<font><input type="button" name="test_jiaojuan" value="交卷" onclick="end()"></font>
					</div>

					<div class="test_content">
						<div class="test_content_title">
							<h2>单选题</h2>
							<p>
								<span>共</span><i class="content_lit">${singles.size()}</i><span>题，</span><span>合计</span><i class="content_fs">${singleTotal}</i><span>分</span>
							</p>
						</div>
					</div>
					<div class="test_content_nr">
						<ul>
							<c:forEach items="${singles}" var="ques" varStatus="status">
								<li id="qu_0_${status.index}" class="singles" quesId="${ques.id}">
									<div class="test_content_nr_tt">
										<i>${status.index+1}</i><span>(${ques.score}分)</span>
										<font>${ques.title}</font>
									</div>

									<div class="test_content_nr_main">
										<ul>
											<c:forEach var="one" items="${fn:split(ques.choose,'>')}" varStatus="status1" >
												<li class="option">
													<input type="radio" class="radioOrCheck" name="answer_${status.index+1}" value="${status1.index+1}" id="0_answer_${status.index+1}_option_${status1.index+1}" />
													<label for="0_answer_${status.index+1}_option_${status1.index+1}">
														<p class="ue" style="display: inline;">${one}</p>
													</label>
												</li>
											</c:forEach>
										</ul>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>

					<div class="test_content">
						<div class="test_content_title">
							<h2>多选题</h2>
							<p>
								<span>共</span><i class="content_lit">${muiltis.size()}</i><span>题，</span><span>合计</span><i class="content_fs">${muiltTotal}</i><span>分</span>
							</p>
						</div>
					</div>
					<div class="test_content_nr">
						<ul>

							<c:forEach items="${muiltis}" var="ques" varStatus="status">
								<li id="qu_1_${status.index}" class="muiltis" quesId="${ques.id}" >
									<div class="test_content_nr_tt">
										<i>${status.index+1}</i><span>(${ques.score}分)</span>
										<font>${ques.title}</font>
									</div>

									<div class="test_content_nr_main">
										<ul>
											<c:forEach var="one" items="${fn:split(ques.choose,'>')}" varStatus="status1" >
												<li class="option ">
													<input type="checkbox" class="radioOrCheck" name="answer_${status.index+1}" value="${status1.index+1}" id="1_answer_${status.index+1}_option_${status1.index+1}" />
													<label for="1_answer_${status.index+1}_option_${status1.index+1}">
														<p class="ue" style="display: inline;">${one}</p>
													</label>
												</li>
											</c:forEach>
										</ul>
									</div>
								</li>

							</c:forEach>
						</ul>
					</div>

				</form>
			</div>

		</div>
		<div class="nr_right">
			<div class="nr_rt_main">
				<div class="rt_nr1">
					<div class="rt_nr1_title">
						<h1>
							<i class="icon iconfont icon-icon_datika"></i>答题卡
						</h1>
						<p class="test_time">
							<i class="icon iconfont icon-shijian"></i><b class="alt-1">01:40</b>
						</p>
					</div>

					<div class="rt_content">
						<div class="rt_content_tt">
							<h2>单选题</h2>
							<p>
								<span>共</span><i class="content_lit">${singles.size()}</i><span>题</span>
							</p>
						</div>
						<div class="rt_content_nr answerSheet">
							<ul>
								<c:forEach items="${singles}" var="ques" varStatus="status">
									<li>
										<a href="#qu_0_${status.index}">${status.index+1}</a>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>

					<div class="rt_content">
						<div class="rt_content_tt">
							<h2>多选题</h2>
							<p>
								<span>共</span><i class="content_lit">${muiltis.size()}</i><span>题</span>
							</p>
						</div>
						<div class="rt_content_nr answerSheet">
							<ul>
								<c:forEach items="${muiltis}" var="ques" varStatus="status">
									<li>
										<a href="#qu_1_${status.index}">${status.index+1}</a>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>

				</div>

			</div>
		</div>
	</div>
	<!--nr end-->
	<div class="foot"></div>
</div>

<script src="${ctx}/static/lib/answerCard/jquery-1.11.3.min.js"></script>
<script src="${ctx}/static/lib/answerCard/jquery.easy-pie-chart.js"></script>
<!--时间js-->
<script src="${ctx}/static/lib/answerCard/time/jquery.countdown.js"></script>
<script>
	var examId="${param.examId}";

	window.jQuery(function($) {
		"use strict";
		$('time').countDown({
			with_separators: false
		});
		$('.alt-1').countDown({
			css_class: 'countdown-alt-1'
		});
		$('.alt-2').countDown({
			css_class: 'countdown-alt-2'
		});
	});

	$(function() {
		$('li.option label').click(function() {
			debugger;
			var examId = $(this).closest('.test_content_nr_main').closest('li').attr('id'); // 得到题目ID
			var cardLi = $('a[href=#' + examId + ']'); // 根据题目ID找到对应答题卡
			// 设置已答题
			if(!cardLi.hasClass('hasBeenAnswer')) {
				cardLi.addClass('hasBeenAnswer');
			}
		});



	});

	//监听是否离开本页面
	window.onblur = function() {
		if(!window.isLeave) {
			window.isLeave = true;
			alert("你试图离开当前窗口,系统将自动提交试卷!");
			end();
		}
	}

	/**
	 * 该方法只能由事件触发
	 */
	function fullScreen() {
		var docElm = document.documentElement;
		if(docElm.requestFullscreen) {
			docElm.requestFullscreen();
		} else if(docElm.msRequestFullscreen) {
			docElm.msRequestFullscreen();
		} else if(docElm.mozRequestFullScreen) {
			docElm.mozRequestFullScreen();
		} else if(docElm.webkitRequestFullScreen) {
			docElm.webkitRequestFullScreen();
		}
	}

	function exitFullScreen(){
		if (document.exitFullscreen) {
			document.exitFullscreen();
		}
		else if (document.msExitFullscreen) {
			document.msExitFullscreen();
		}
		else if (document.mozCancelFullScreen) {
			document.mozCancelFullScreen();
		}
		else if (document.webkitCancelFullScreen) {
			document.webkitCancelFullScreen();
		}
	}







	/**
	 * 交卷
	 */
	function end(){
		var choose=["A","B","C","D","E","F","G"];
		var quesIds='';
		var answers='';

		$('.singles').each(function(i,v){
            quesIds+=','+($(v).attr('quesId'));
			var chooseed=''+choose[$('#'+v.id+' .radioOrCheck:checked').val()-1];
			if(chooseed){
				answers+='#'+chooseed;
			}else{
				answers+='#';
			}

		});

		answers=answers.substring(1);
		quesIds=quesIds.substring(1);

		$('.muiltis').each(function(i,v){
            quesIds+=','+($(v).attr('quesId'));
            var tmp='';
			$('#'+v.id+ ' .radioOrCheck:checked').each(function(i1,v1){
                if(v1.value) {
					tmp+=','+choose[v1.value-1];
				}
            });
            //去除第一个逗号后添加
			tmp=tmp.substring(1);
			answers+='#'+tmp;

		});

        //异步提交数据到后台

        $.post('${ctx}/exam/endAjx',{quesIds:quesIds,answers:answers,examId:examId},function(){
			location.href="/exam/result?examId="+examId;
        });


	}


</script>



</body>

</html>