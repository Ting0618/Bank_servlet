<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page
	import="com.project.dao.Parse,com.project.dao.BeJson,com.project.bean.UserVo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.10.1.js"></script>
<script type="text/javascript" src="js/Cardpassword.js"></script>
<link rel="stylesheet" href="css/UpdatePassword.css" type="text/css">
</head>
<body style="background-color: white;">
<%Object jsb = (Object) session.getAttribute("jsb");
			BeJson be = new BeJson();
			String jstr = be.ObjectJson(jsb);
			Parse parse = new Parse(jstr);			
			UserVo vo = parse.JSON2Object();
%>

	<div>
		<div id="pass_alert">
			<span>定期更换密码可以使您的账户更加安全</span><br>
			<span>建议密码采用字母和数字混合，并且不短于6位</span><br>
		</div>
		<div style="width: 100%;background-color: rgb(223,223,223);height: 2px;"></div>
		<div id="pass_change" style="margin-top: 40px; margin-left: 130px;color: rgb(77,77,77);">
			<form method="post" id="form12" action="UserServlet"> 
		  		&nbsp;登录帐号：<span style="font-size: 20px;color: rgb(255,106,105)"><%=vo.getAccount() %></span> <br><br><br>
		   		&nbsp;登录密码：<input name="oldpass" type="password" class="change_pass"><span id="mima1"></span><br><br>
		   		设置新密码：<input name="newpass1" type="password" class="change_pass"><span id="mima2"></span><br>
		   			<span style="padding-left: 90px;font-size: 13px;color: rgb(153,153,153);'">必须是6-20个英文字母、数字或符号，不能是纯数字</span><br><br>
		   		确认原密码：<input name="newpass2" type="password" class="change_pass"><span"></span><br>
		   		<div id="sc"><br></div>
		   		<input type="hidden" name="zmyacc" value="<%=vo.getAccount()%>">
		   		<input type="hidden" name="status" value="change"> <br>
		   </form>  
		   <div>
		   		<input type="button" id="button" name="butt" value="确定"/>
		   </div>
		                                        
		</div>
		<div style="width: 100%;background-color: rgb(223,223,223);height: 2px; margin-top: 40px;"></div>
	</div>

  
</body>
</html>