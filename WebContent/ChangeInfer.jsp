<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.List,com.project.bean.UserVo,com.project.dao.Parse,com.project.dao.BeJson"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.10.1.js"></script>
<script type="text/javascript" src="js/ChangeInfer.js"></script>
<link rel="stylesheet" href="css/Change_Infer.css" type="text/css">
</head>
<body>
	<%
		Object jsb = (Object) session.getAttribute("jsb");
		BeJson be = new BeJson();
		String jstr = be.ObjectJson(jsb);
		Parse parse = new Parse(jstr);
		UserVo vo = parse.JSON2Object();
	%>
<div id="infer_title">
	<div id="title_xiu"><a href="#" id="infer_a1">我的休闲</a></div>
	<div id="title_nv"><a href="#" id="infer_a2" >我的旅游</a></div>
	<div id="title_tong"><a href="#" id="infer_a3" style="padding-left: 50px;">通讯</a></div>
	<div id="title_go"><a href="#" id="infer_a4">我的购物</a></div>
	<div id="title_shui"><a href="#" id="infer_a5" style="padding-left: 47px;">水电煤</a></div>
</div>
<div style="width: 100%;background-color: rgb(223,223,223);height: 2px;"></div>
<div id="infer">
	<form action="UserServlet2" method="post" id="form_change">	
		<table id="System_table">
			<tr>
				<td>基本信息：</td>
			</tr>
			<tr>
				<td>
					<span>&nbsp;&nbsp;&nbsp;&nbsp;姓名:<%= "  "+vo.getReaname()%></span> &nbsp;
				</td>
			</tr>
			<tr>
				<td>
					<span>出生年月:</span>
					<select name="year">
						<option value="1990">1990
						<option value="1991">1991
						<option value="1992">1992
						<option value="1993">1993
					</select>年
					<select name="month">
						<option value="1">1
						<option value="4">4
						<option value="2">2
						<option value="3">3
					</select>月
					<select name="day">
						<option value="1">1
						<option value="4">4
						<option value="2">2
						<option value="3">3
					</select>日
				</td>
			</tr>
			<tr>
				<td>
					<span>电话号码:</span>
					<input type="text" name="newtele" value="<%= "  "+vo.getTele()%>">	
					<span id="alerttele"></span>			
				</td>
			</tr>
			<tr>
				<td>
					<span>&nbsp;&nbsp;卡号:<%= "  "+vo.getAccount()%></span>				
				</td>
			</tr>
			<tr>
				<td>
					<span>身份证号:<%="  "+vo.getUserID()%></span>				
				</td>
			</tr>
		</table>
		<div id="ok"></div>
		<input type="button" id="but_change" value="保存">
		<input type="hidden" value="change_infer" name="status">
		<input type="hidden" name="zmyacc" value="<%=vo.getAccount()%>">
	</form>
</div>                                                                                                                                                                                                                                                                                                                                                                                                                  
<div style="width: 100%;background-color: rgb(223,223,223);height: 2px;margin-top: 20px;"></div>
<div id="infer_endl">
	<span style="font-weight: bold;color: black;">我的服务：</span>
	<ul>
		<li><a href="#">快速支付</a></li>
		<li><a href="#">网上支付</a></li>
		<li><a href="#">可查询优惠券账户数</a></li>
	</ul>
</div>
<div style="height: 105px;width: 2px;background-color:rgb(223,223,223);float: left; "></div>
<div id="infer_endr">
	<span  style="font-weight: bold;color: black;">我的资讯：</span>
	<ul>
		<li><a href="#">建行小新闻</a></li>
		<li><a href="#">建行管家</a></li>
		<li><a href="#">还可开快捷支付、查积分、查账单</a></li>
	</ul>
</div>
</body>
</html>