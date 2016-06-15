$(document).ready(function(){
	$('#button').click(function(){
		var u="UserServlet?status=logon";
		$.ajax({
			type :"get",
			 url:u,
			 data:$('#Credit_form1').serialize(),
			 dataType:'json',
			 "success":function(msg){
				 if(msg=='0'){
					 $('#show_pass').html("* 密码错误！请重新输入！"); 						
				 }
				 else if(msg=='1'){
					 $('#show_name').html("* 用户不存在！");
				 }
				 else{
					 window.location.href="System.jsp";
					 }
			 },		 
			 error :function(){
				 alert("信息错误");
			 }
		});
	});
});