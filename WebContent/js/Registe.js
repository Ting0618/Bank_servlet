$(document).ready(function(){
	$('#but').click(function(){
		var u="UserServlet?status=registe";
		$.ajax({
			type :"post",
			 url:u,
			 data:$('#Credit_form2').serialize(),
			 dataType:'json',
			 "success":function(msg){
				 if(msg=='1'){
					$('#s_kong').html("请输入完整的信息！"); 						
				 }
				 if(msg=='2'){
					 $('#s_tele').html("电话号码格式错误！"); 						
					 }
				 if(msg=='3'){
					 $('#s_email').html("邮箱格式错误！"); 						
				 }
				 if(msg=='4'){
					 $('#s_account').html("帐号输入错误!"); 						
				 }
				 if(msg=='5'){
					 $('#s_ID').html("身份证号码格式错误！"); 						
				 }
				 if(msg=='6'){
					 $('#password').html("密码错误！"); 						
				 }				 
				 if(msg=='7'){
					 $('#s_birth').html("请选择您的出生日期！"); 						
				 }				 			 
				 if(msg=='8'){
					 $('#resuc').html("注册成功！"); 						
				 }				 			 
			 },		 
			 error :function(){
				 alert("信息错误！");
			 }
		});
	});
});