$(function (){
	 $('#button').click(function (){
	 var u="UserServlet?status=draw";
	  $.ajax({
		 type :"post",
		 url:u,
		 data:$('#form11').serialize(), // 序列化
		 dataType:'json',
		 success:function (msg){
			 if(msg =='1'){
				 $('#hiscard').html(" *帐号不存在");
			 }
			 if(msg =='2'){
				 $('#hismon').html(" *余额不足");
			 }
			 if(msg =='0'){
				 $('#zd1').html(" *转账成功"); 	  
			 }			 
		 },
		 error :function(){
			 $('#zd1').html("错误信息");
		 }
		 
	  });
	 });
});
function  tui(data,a){
	 for(data=a;data>0;data--){
		 $('#d1').html("3s后跳转回主界面");
	 }
};