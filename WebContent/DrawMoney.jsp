<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page
	import="com.project.dao.Parse,com.project.dao.BeJson,com.project.bean.UserVo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/DrawMoney.css" type="text/css">
<script type="text/javascript" src="js/jquery-1.10.1.js"></script>
<script type="text/javascript" src="js/drawMoney.js"></script>
</head>
<body>
	<script type="text/javascript">
		
	<%Object jsb = (Object) session.getAttribute("jsb");
			BeJson be = new BeJson();
			String jstr = be.ObjectJson(jsb);
			Parse parse = new Parse(jstr);
			UserVo vo = parse.JSON2Object();%>
		
	</script>
	<div id="money_title">请确保你在安全环境下登录并转账，请勿在网吧等地放保存密码。</div>
	<div
		style="width: 100%; background-color: rgb(223, 223, 223); height: 2px; "></div>
	<div id="main-center">
		<form method="post" id="form11" action="UserServlet">
			&nbsp;转账卡号：<span><%=vo.getAccount()%></span><br><br> 
				转账卡余额：<span style="color: rgb(255,102,0);font-size: 24px; font-weight: bold;"><%=vo.getMoney()%></span><br><br>
			&nbsp;对方卡号： <input type="text" name="hisAccount" class="money_put"> <span id="hiscard"></span><br><br>
			&nbsp;转账金额： <input type="text" name="zmoney" class="money_put"> <span id="hismon"></span><br><br>
			<span id="zd1"></span><br>
			<br> <input type="hidden" name="status" value="draw"> <br>
			<input type="hidden" name="zmyacc" value="<%=vo.getAccount()%>">
			<input type="button" value="确定" id="button">
		</form>
	</div>
	<div style="width: 100%; background-color: rgb(223, 223, 223); height: 2px;margin-top: 10px;"></div>
	<div id="drawmoney" style="font-size: 17px;font-weight: bold;padding-top: 10px;">使用遇到问题？
		<ul>
			<li style="list-style: none;font-size: 15px;"><a href="#" style="text-decoration: none;color: rgb(77,77,77);font-size: 15px;">1、转出至银行卡到账时间</a></li><br/>
			<li style="list-style: none;font-size: 15px;"><a href="#" style="text-decoration: none;color: rgb(77,77,77);font-size: 15px;">2、转出至银行卡有次数和额度限制吗？</a></li><br/>
			<li style="list-style: none;font-size: 15px;"><a href="#" style="text-decoration: none;color: rgb(77,77,77);font-size: 15px;">3、转出至银行卡支持的银行</a></li>
		</ul>
	</div>
</body>
</html>