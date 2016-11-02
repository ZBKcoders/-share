$(function(){
//	表单验证
	$("#form").validate({
		
		rules:{
			userName : { required :true ,
				minlength : 2 ,
				maxlength : 12
			},
			passWord:{
				required : true,
				minlength : 6 ,
				maxlength : 120 ,
		
			}
		},
		messages : {
			userName :{
				required : "请输入用户名" ,
				minlength : "用户名至少2个字节",
				maxlength : "用户名太长了"
			},
			passWord : {
				required : "请填写密码" ,
					minlength : "密码至少6位数",
					maxlength : "密码太长了，最多12位"
			}
		}
		
	});

	
});

