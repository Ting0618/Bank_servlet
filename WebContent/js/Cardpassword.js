$(function (){
	 $('#button').click(function (){    	 	       	   
	 var u="UserServlet?status=change";
	  $.ajax({		
		 type :'post',
		 url:u,
		 data:$('#form12').serialize(),
		 dataType:'json', 
		 async: false,
		 success:function (msg){
			 if(msg=='0'){				
				 $('#mima1').html(" * 初始密码错误！");
			 }	
			 if(msg=='1'){				 
				 $('#mima2').html(" * 两次密码不匹配");
			 }	
			 if(msg=='2'){				 
				 $('#sc').html(" 修改成功");
			 }	
		 },
		 error :function(){
			 alert("信息错误");			 
		 }		 
	  });
	 });
});