<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.List,com.project.bean.UserVo,com.project.dao.Parse,com.project.dao.BeJson"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/Chaxun.css" type="text/css">
<script type="text/javascript">
<%
Object jsb = (Object)session.getAttribute("jsb");
BeJson be = new BeJson();
String jstr = be.ObjectJson(jsb);
Parse parse = new Parse(jstr);
UserVo vo = parse.JSON2Object();

%>
</script>
</head>
<body id="chaxun_body">
	<div id="System_infor">
    <div id="chaxun_geshi">
		<ul>
			<li style="font-size: 18px;"> 
				<%=vo.getReaname()%>
			</li>
			<li>昵称: <%=vo.getUsername()%>
			</li>
			<li>
				出生日期：<%=vo.getYear()+"年"+vo.getMouth()+"月"+vo.getDay()+"日" %>
			</li>
			<li>
				银行卡号： 
				<%=vo.getAccount()%>
			</li>
			<li>
				身份证号： 
				<%=vo.getUserID()%>
			</li>
			<li>
				绑定手机号： 
				<%=vo.getTele()%>
			</li>
			<li></li>
		</ul>
		</div>
		<div style="width: 100%;background-color: rgb(223,223,223);height: 2px;"></div>
		<div id="chaxun_battom"><span>联系人</span>
			<span id="chaxun_1">管理联系人列表，并进行设置分组</span>
			<span id="chaxun_dian"><a href="#">管理</a></span>
		</div>
		<div style="width: 100%;background-color: rgb(223,223,223);height: 2px;"></div>
		<div id="chaxun_battom2"><span>注意事项</span>
			<span id="chaxun_2">点击查看我们的注意事项啊亲</span>
			<span id="chaxun_kan"><a href="#">查看</a></span>
		</div>
		<div style="width: 100%;background-color: rgb(223,223,223);height: 2px;"></div>
	</div>
</body>
</html>