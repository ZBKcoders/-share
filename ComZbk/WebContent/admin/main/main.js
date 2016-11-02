$(function() {

	getList(1);
	validateFunction();
	setFileUpload("#imgInputFile", "#headImg", "#imgAddBtn");

});
//表单验证
function validateFunction(){
$("#mainManageForm").validate({
		
		rules:{
			userName : { required :true ,
				minlength : 2 ,
				maxlength : 12
			},
			passWord:{
				required : true,
				minlength : 6 ,
				maxlength : 12 ,
		
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
}
function getList(pn) {
	var pnum = 1;
	if (pn) {
		pnum = pn;
	}
	var params = {};
	params = $("#SearchForm").serializeJson();
	params["_url"] = "user/pageQuery";
	params["pageNum"]=pnum;
    params["pageSize"] =2;
	

	
	request(params, true, function(data) {
		var dataResult = data.result;
		var currentPage = dataResult.pageNum; // 当前为第几页数
		var totlePage = dataResult.pageAmount; // 显示分页
		var pageSize = dataResult.pageSize;
		showPageStyle(getList, currentPage, totlePage,
				$("#pagination_managelist"));
		showList(dataResult, pageSize);
	});
}
function showList(objdata, pageSize) {
	var tdNum = 10;
	$("#dataList tbody").empty();
	if (objdata == null || objdata.length == 0) {
		var $tr1 = $("<tr/>");
		$tr1.append($("<td/>").attr({
			"colspan" : tdNum
		}).text("暂无数据！"));
		$("#dataList tbody").append($tr1);
		$("#pagination_managelist").hide();
	} else {
		$("#pagination_managelist").show();

		var pageSize = $("#pageSize").val();
		// 查看当前是第几页
		var currentPage = $("#pagination_managelist").find("li.active a")
				.text();

		if (currentPage == 1 && currentPage == 0) {
			$("#nowId").val(objdata[0].userId);
			currentPage = 1;
		}

		for (var i = 0; i < objdata.length; i++) {
			showOneMsg(objdata[i], (currentPage - 1) * pageSize + i + 1);
		}
	}

}

function showOneMsg(dataItem, num) {

	var $tr = $("<tr/>");
	var $headImg = "";
	if (!valueIsEmpty(dataItem.headImg)) {
		$headImg = showImg(dataItem.headImg).popover();
	}
	var $email = "";
	if (!valueIsEmpty(dataItem.email)) {
		$email = showThumbText(dataItem.email).popover();
	}
	$tr.append($("<td/>").append(num).attr("userId", dataItem.userId));
	$tr.append($("<td/>").append($headImg));
	$tr.append($("<td/>").append(dataItem.userName));
	$tr.append($("<td/>").append(dataItem.passWord));
	$tr.append($("<td/>").append(dataItem.age));
	$tr.append($("<td/>").append($email));
	$tr.append($("<td/>").append(dataItem.phoneNum));
	$tr.append($("<td/>").append(dataItem.createTime));
	$tr.append($("<td/>").append(dataItem.userDec));

	var $i_open = $("<i>").addClass("fa fa-power-off");
	var $open_btn = $("<a>").attr({
		"href" : "javascript:;",
		"title" : "开启",
		"data-toggle" : "tooltip",
		"data-placement" : "top"
	}).addClass("opt-btn tooltips text-success mr-xs ml-xs").bind("click",
			function() {
				openMannage(this);
			}).append($i_open).tooltip();
	var $i_edit = $("<i>").addClass("fa fa-pencil-square-o");
	var $edit_btn = $("<a>").attr({
		"href" : "javascript:;",
		"title" : "编辑",
		"data-toggle" : "tooltip",
		"data-placement" : "top"
	}).addClass("opt-btn tooltips text-danger mr-xs ml-xs").bind(
			"click",
			function() {
				getOneUserInfo($(this).parents("tr").find("td:first").attr(
						"userId"));
				  $('#myEditModal').modal('show');
				
			}).append($i_edit).tooltip();
	
	var $i_delete = $("<i>").addClass("fa fa-times")
	var $delete_btn = $("<a>").attr({
		"href" : "javascript:;",
		"title" : "删除",
		"data-toggle" : "tooltip",
		"data-placement" : "top"
	}).addClass("opt-btn tooltips text-success mr-xs ml-xs delete").bind(
		"click",
			function() {
			 $('#modalBootstrap').modal('show');
			getOneUserId($(this).parents("tr").find("td:first").attr("userId"));
			}).append($i_delete).tooltip();
	$tr.append($("<td/>").append($open_btn).append($edit_btn).append(
			$delete_btn));
	$("#dataList tbody").append($tr);
}
function getOneUserId(id){
	
	$("#deleteUserId").val(ifNull(id));
}

function getOneUserInfo(pn){
	var postData = {};
	postData["userId"]=pn;
	postData["_url"]="user/getUserById";
	request(postData,true,function(data){
		$("#userId").val(ifNull(data.value.userId));
		$("#userName").val(ifNull(data.value.userName));
		$("#passWord").val(ifNull(data.value.passWord));
		$("#phoneNum").val(ifNull(data.value.phoneNum));
		$("#email").val(ifNull(data.value.email));
		var url = ifNull(data.value.headImg);
		//有问题
		$("#headImg").val(url);
		$("#imgAddBtn").css({
			"background-image" : "url(" + url + ")"
		}).empty();
		bindInputImg("#imgAddBtn", url);
		
		$("#userDec").val(ifNull(data.value.userDec));
	});
		
}

function editManage(pn){
		postData={};
		postData=$("#mainManageForm").serializeJson();
		postData["_url"]="user/editUser";
		request(postData,true,function(data){
			requestCallBack(data,{
				success:function(){
					
					  getList(1);
			          $('#myEditModal').modal('hide');
			          pageNoteSuccess("修改成功!");
			          clearInput("#myEditModal");
			        },error:function() {
			          pageNoteError(data.message, "修改失败！");
			        }
			});
		});
	
}
function clearInput(pn){
	  $(pn)[0].reset();
	}
function deleteMannage(pn){
	postData={};
	postData["userId"]=$("#deleteUserId").val();
	
	postData["_url"]="user/deleteUser";
		request(postData,true,function(data){
			requestCallBack(data,{
				success:function(){
					  getList(1);
			          $('#modalBootstrap').modal('hide');
			          pageNoteSuccess("删除成功!");
			          $("deleteUserId").val("");
				},
				error:function(){
					pageNoteError(data.message, "删除失败！");
					$('#modalBootstrap').modal('hide');
				}
			});
		});
}