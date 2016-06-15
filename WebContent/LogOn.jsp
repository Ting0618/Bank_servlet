<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>银行主页</title>
<link rel="stylesheet" href="css/ting.css" type="text/css">
<script type="text/javascript" src="js/jquery-1.10.1.js"></script>
<script type="text/javascript" src="js/Credit.js"></script>
</head>
<body>
	<div id="Credit_body">
		<div id="Credit_title">
			<center>欢迎来到这个银行</center>
		</div>
		<div class="navw2"></div>
		<div id="Credit_main">
			<div id="Credit_left">
				<ul>
					<li>了解更多:</li></br>					
					<li><a href="#">超级卡</a></li>
					<li><a href="#">超级黑卡</a></li>
					<li><a href="#">唯品会优惠卡</a></li>
					<li><a href="#">阿里巴巴金银卡</a></li>
					<a href="#" style="color: rgb(255,130,75);text-decoration: none;padding-left: 130px;">更多></a>
				</ul>						
			</div>
			<div class="navw"></div>
			<div id="Credit_log"><br>&nbsp;个人网银登录<br><br>
				<form method="get" id="Credit_form1" action="UserServlet2">
					<span>用户名/银行帐号:</span><input type="text" id="Credit_count" name="Credit_count">
						<div id="show_name"></div>
						<br><br>
					<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;密码:</span>
					<input type="password" id="Credit_passward" name="Credit_passward"><br><br>
					<div id="show_pass"></div>
					<input type="hidden" name="status" valse="logon">
				</form>
				<input type="submit" id="button" value="确认登录" style="margin-left: 130px;">
				<div id="d1" style="height: 30px;"></div>
			</div>
			<div class="navw"></div>
			<div id="Credit_right">
				<ul>
					<li>帮助:</li></br>					
					<li><a href="#">如何使用网上银行</a></li>
					<li><a href="#">如何开通网上银行</a></li>
					<li><a href="#">开通网银的要求</a></li>
					<li><a href="#">更改手机号</a></li>
					<a href="#" style="color: rgb(255,130,75);text-decoration: none;padding-left: 130px;">更多></a>
				</ul>	
			</div>
		</div>
		<div class="navw2"></div>
		<div id="Credit_end">
			<div id="Credit_func">	
				<ul>
					<li id="func_li"></li>
					<li id="func_lili"><a href="#">长城国际vip卡</a></li><br><br>
					<li>取现无忧 消费返现</li><br>
					<li>安心留学 快乐生活</li>
				</ul>	
			</div>
			<div class="navw" style="margin-left: 9px; width: 3px;"></div>
			<div id="Credit_rejister">
				<span id="f_span">还没有网银？
					<input type="button" value="马上注册" id="re_button" onclick="window.location='Registe.jsp'">
				</span>
				<ul>
					<li style="color: rgb(0,160,251);">通过网银您可以在任何时间，任何地点完成如下功能：</li>
					<li>1、办理网上同行或跨行之间的转帐</li>
					<li>2、申请信用卡的功能</li>
					<li>3、申请专用于网购的E卡</li>
					<li>4、办理帐户的口头挂失手续；</li>
					<li>5、网上购物：</li>
					<li>6、网银的好处：</li>
				</ul>		
			</div>
			<div class="navw" style="margin-left: 9px; width: 3px;"></div>
			<div id="Credit_func1">
				<ul>
					<li id="func1_li"></li>
					<li id="func1_lili"><a href="#">快国通超级卡</a></li><br><br>
					<li>取现无忧 消费返现</li><br>
					<li>安心留学 快乐生活</li>
				</ul>			
			</div>
		</div>
		<div class="navw" style="width: 100%;height: 5px;border-color: rgb(240,240,240);"></div>
		<div id="log_last">
			<div id="last_left">aaaaaaaaaaaa</div>
			<div class="navw" style="margin-left: 9px; width: 4px;"></div>
			<div id="last_center"></div>
			<div class="navw" style="margin-left: 9px; width: 3px;"></div>
			<div id="last_right"></div>
		</div>		
	</div>
</body>
</html>