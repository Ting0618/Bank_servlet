$(document).ready(function(){
	$('#but_change').click(function(){
		var u="UserServlet?status=change_infer";
		$.ajax({
			type :"post",
			 url:u,
			 data:$('#form_change').serialize(),
			 dataType:'json',
			 "success":function(msg){
				 if(msg=='0'){
					 $('#alerttele').html("* 格式错误！请重新输入！"); 						
				 }
				 if(msg=='1'){
					 $('#alertemail').html("*请选择完整的出生日期！");
				 }
				 if(msg=='2'){
					 $('#ok').html("修改成功");
					 }
			 },		 
			 error :function(){
				 alert("信息错误");
			 }
		});
	});
});