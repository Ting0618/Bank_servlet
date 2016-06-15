<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.List,com.project.bean.UserVo,com.project.dao.Parse,com.project.dao.BeJson"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人中心</title>
<link rel="stylesheet" href="css/System.css" type="text/css">
<script type="text/javascript" src="js/jquery-1.10.1.js"></script>
<script type="text/javascript">
	function changeColor1() {
         document.getElementById("bt1").style.backgroundColor="rgb(245,245,245)";
         document.getElementById("bt2").style.backgroundColor="rgb(235,235,235)";
         document.getElementById("bt3").style.backgroundColor="rgb(235,235,235)";
         document.getElementById("bt4").style.backgroundColor="rgb(235,235,235)";
         document.getElementById("bt5").style.backgroundColor="rgb(235,235,235)";
	};
	function changeColor2() {
         document.getElementById("bt1").style.backgroundColor="rgb(235,235,235)";
         document.getElementById("bt2").style.backgroundColor="rgb(245,245,245)";
         document.getElementById("bt3").style.backgroundColor="rgb(235,235,235)";
         document.getElementById("bt4").style.backgroundColor="rgb(235,235,235)";
         document.getElementById("bt5").style.backgroundColor="rgb(235,235,235)";
	};
	function changeColor3() {
         document.getElementById("bt1").style.backgroundColor="rgb(235,235,235)";
         document.getElementById("bt2").style.backgroundColor="rgb(235,235,235)";
         document.getElementById("bt3").style.backgroundColor="rgb(245,245,245)";
         document.getElementById("bt4").style.backgroundColor="rgb(235,235,235)";
         document.getElementById("bt5").style.backgroundColor="rgb(235,235,235)";
	};
	function changeColor4() {
         document.getElementById("bt1").style.backgroundColor="rgb(235,235,235)";
         document.getElementById("bt2").style.backgroundColor="rgb(235,235,235)";
         document.getElementById("bt3").style.backgroundColor="rgb(235,235,235)";
         document.getElementById("bt4").style.backgroundColor="rgb(245,245,245)";
         document.getElementById("bt5").style.backgroundColor="rgb(235,235,235)";
	};
	function changeColor5() {
         document.getElementById("bt1").style.backgroundColor="rgb(235,235,235)";
         document.getElementById("bt2").style.backgroundColor="rgb(235,235,235)";
         document.getElementById("bt3").style.backgroundColor="rgb(235,235,235)";
         document.getElementById("bt4").style.backgroundColor="rgb(235,235,235)";
         document.getElementById("bt5").style.backgroundColor="rgb(245,245,245)";
	};
	function showUrl(urlId) {
		var frame = document.getElementById("frame_1");
		if (urlId == "1") {
			frame.src = "ChaXun.jsp";
		} else if (urlId == "2") {
			frame.src = "DrawMoney.jsp";
		} else if (urlId == "3") {
			frame.src = "UpdatePassword.jsp";
		} else if (urlId == "4") {
			window.location.href='LogOn.jsp';
		} else if (urlId == "5") {
			frame.src = "ChangeInfer.jsp";
		}
	};
	function dontShow(d){
		document.getElementById(d).style.display='none';
	};
	function quit(){
		// session.removeAttribute("sessionUserName");
		session.invalidate();
	};
</script>

</head>
<body style="background-color: white;">

	<div id="Credit_body">
		<div id="bank">
			<div id="bank_begain">
				<span style="color: rgb(167,30,50)">123456   </span><span>服务热线:</span>
				<span style="color: rgb(167,30,50)">78965234875  </span><span>信用卡热线:</span>
			</div>
			<div style="width: 95%;background-color: rgb(167,30,50);height: 2px;margin-top: 35px;margin-left: 20px;"></div>
			<div id="bank_page">
				<ul>
					<li><a href="LogOn.jsp" style="color: rgb(167,30,50);">首页</a></li>
					<li><a href="#">关于本行</a></li>
					<li><a href="#">电子银行</a></li>
					<li><a href="#">个人金融</a></li>
				</ul>
			</div>
		</div>
		<div id="System_begain"><span id="System_span">个人中心</span></div>
		<div style="width: 100%;background-color: rgb(223,223,223);height: 2px;"></div>
		<div class="System_main">
			<div id="System_main_l">
				<div id="System_xinxi">
					<input type="button" value="个人信息" name="bt" class="b" id="bt1"
						onclick="showUrl('1');changeColor1();dontShow('first')">
				    <input type="hidden" value="gray" id="color1">
				</div>
				<div class="button" >
					<input type="button" value="转账" class="b" name="bt" id="bt2"
						onclick="showUrl('2');changeColor2();dontShow('first')">
						<input type="hidden" value="gray" id="color2">
				</div>
				<div class="button">
					<input type="button" value="修改密码" class="b" name="bt" id="bt3"
						onclick="showUrl('3');changeColor3();dontShow('first')">
						<input type="hidden" value="gray" id="color3">
				</div>
				<div class="button">
					<input type="button" value="安全退出" class="b" name="bt" id="bt4"
						onclick="showUrl('4');changeColor4();dontShow('first');quit();">
						<input type="hidden" value="gray" id="color4">
				</div>
				<div class="button">
					<input type="button" value="修改个人信息" class="b" name="bt" id="bt5"
						onclick="showUrl('5');changeColor5();dontShow('first')">
						<input type="hidden" value="gray" id="color5">
				</div>
			</div>
			<div id="System_main_r">
				<div id="first">
					欢迎您，<span id="user_name"><%=session.getAttribute("reaname") %></span><br><br>
					<span id="user_tell">快快点击左侧的功能键享受我们的优质服务吧</span>				
				<div style="width: 100%;background-color: rgb(223,223,223);height: 2px; margin-top: 30px;"></div>
				<div id="last"></div>
				</div>
				<iframe id="frame_1"></iframe>				
			</div>			
		</div>		
	</div>	
</body>
</html>