<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册页面</title>
<link rel="stylesheet" href="css/ting.css" type="text/css">
<script type="text/javascript" src="js/jquery-1.10.1.js"></script>
<script type="text/javascript" src="js/Registe.js"></script>
</head>
<body>
<div id="Credit_body">
<div id="kaishi">
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
	</div>
	<div id="Registe_tip"><span id="zy"><a href="LogOn.jsp"></a></span></div>
	<div id="Registe_main">
		<form method="post" id="Credit_form2" action="UserServlet">
		<table id="Registe_table">
			<tr>
				<td>
					<span style="font-size: 10px; color: rgb(0,160,251);">请您填写真实完整的个人信息和联系方式，以确保后续将卡片准确寄给您本人(带*号的必填，其余的选填)</span>					
				</td>
			</tr>
			<tr>
				<td>
					<center>
						<span class="showshow"></span>
					</center>
				</td>
			</tr>
			<tr>
				<td>
					<span>姓名</span> &nbsp;
					<input type="text" name="name">
					<span class="showshow">* </span>
				</td>
			</tr>
			<tr>
				<td>
					<span>出生年月</span>
					<select name="year">
						<option value="1990">1990
						<option value="1991">1991
						<option value="1992">1992
						<option value="1993">1993
						<option  selected="selected">
					</select>年
					<select name="mouth">
						<option value="1">1
						<option value="4">4
						<option value="2">2
						<option value="3">3
						<option  selected="selected">
					</select>月
					<select name="day">
						<option value="1">1
						<option value="4">4
						<option value="2">2
						<option value="3">3
						<option  selected="selected">
					</select>日
					<span class="showshow">* </span>
				</td>
			</tr>
			<tr>
				<td>
					<span>电话号码</span>
					<input type="text" name="tele">	
					<span id="s_tele"></span>	
					<span class="showshow">* </span>			
				</td>
			</tr>
			<tr>
				<td>
					<span>邮箱</span> &nbsp;
					<input type="text" name="email">				
				</td>
			</tr>
			<tr>
				<td>
					<span>卡号</span> &nbsp;
					<input type="text" name="account">	
					<span class="showshow">* </span>			
				</td>
			</tr>
			<tr>
				<td>
					<span>密码</span> &nbsp;
					<input type="password" name="cardPassword">	
					<span class="showshow">* </span>				
				</td>
			</tr>
			<tr>
				<td>
					<span>身份证号</span>
					<input type="text" name="ID">	
					<span class="showshow">* </span>			
				</td>
			</tr>
			<tr>
				<td>
					<span>网银密码</span>
					<input type="password" name="password">	
					<span style="color:rgb(0,160,251) ">密码由6位字母或数字组成，区分大小写 </span>
					<span class="showshow">* </span>				
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" id="but" value="提交" style="border: none;width: 40px;height: 23px;">
					<input type="reset" id="butset" value="重置" style="border: none;width: 40px;height: 23px;" >
				</td>
			</tr>
		</table>
		</form>
	</div>
</div>
</body>
</html>