/**
 * 周博开 1.0
 */
var webRootPath=window.location.protocol+"//"+window.location.host+"/ComZbk/";
function request(params, isAsync ,callback) {//封装与后台交互的方法，即将前台数据传到后台
	  var _url = webRootPath,
	      _type = "post";
	  if(params._url){
	    _url = _url + params._url;
	    delete params._url;
	  }
	  if(params._type){
	    _type = params._type;
	    delete params._type;
	  }
	 
	  $.ajax({
	    type: _type,
	    url: _url,
	    dataType: "json",
	    data: {"json":JSON.stringify(params)},
	    async: isAsync,
	    beforeSend: function() {
	      if (isAsync) {
	       
//	       $('#loadingWrapperBase').show();
	      }
	    },
	    success: callback,
	    error: function() {
    pageNoteError("服务器连接错误！");
	    },
	    complete: function() {
	      if (isAsync) {
	        
	  // pageNoteSuccess("加载数据成功","数据加载");
	         // $('#loadingWrapperBase').fadeOut('slow');
	     
	      }
	    }
	  });
	}
function requestCallBack(data, param) {
	  if (param) {
	    switch (data.retCode) {
	    case '200':
	      //success
	      if (param.success) {
	        param.success(data);
	        break;
	      }
	    case '412':
	      //warning
	      if (param.warning) {
	        param.warning(data);
	      } else {
	    	if(!(param.warning === false)) {
	    	  pageNoteWarning(data.message);
	    	}
	      }
	      break;
	    default:
	      //error
	      if("拒绝访问，请登录后再试." === data.message){
	        pageNoteWarning("登陆失效，请重新登陆","温馨提示");
	        setTimeout(function(){
	          var urlref = encodeURIComponent(window.location.href);
	          window.location.href = g_path + "login?urlref=" + urlref;
	        },2000);
	        return;
	      }
	      if (param.error) {
	        param.error(data);
	      }
	    }
	  }
	}
function setFileUpload(imgInputFile, hiddenSelector, imgAddBtn, childPath, callback, progress) {
	  $(imgInputFile).fileupload({
	    url: webRootPath + "upload/img",
	    formData: {
	      "childPath": childPath
	    },
	    done: function(e, data) {
	      if(callback) callback(data, hiddenSelector, imgAddBtn);
	      var obj = data["result"];
	      var url = obj["value"];
	      $(hiddenSelector).val(url);
	      if (url.indexOf(".jpg") >= 0 || url.indexOf(".jpeg") >= 0 || url.indexOf(".png") >= 0 || url.indexOf(".JPG") >= 0 ) {
	        $(imgAddBtn).css({
	          "background-image": "url(" + url + ")"
	        }).empty();
	        bindInputImg(imgAddBtn, url);
	      }
	    },
	    progressall: function (e, data) {
	      if(progress) progress(data, hiddenSelector, imgAddBtn);
	    }
	  });
	}
function changePage(cPage, e, callback, cp, tp, param){
  var pnum = $(cPage).text();
  var pamount = 1;
  if(cp)
    pnum = cp;
  if(tp)
    pamount = tp;
  if(e){
    switch(e){
      case "S":
        pnum = 1;
        break;
      case "P":
        if(pnum - 1 < 1){
          return;
        }
        pnum = pnum - 1;
        break;
      case "N":
        if(pnum + 1 > pamount){
          return;
        }
        pnum = pnum + 1;
        break;
      case "E":
        pnum = pamount;
        break;
      case "O":
        pnum = $(cPage).text();
        break;
    }
  }else{
    pnum = $(cPage).text();
  }
  if(pnum < 1 || pnum > pamount){
    return;
  }
  if(param) {
    param["pn"] = pnum;
    callback(param);
    return;
  }
  if(callback) callback(pnum);
}
function showPageStyle(callback, cp, tp, pagination, param){
  var pamount = 1;
  var pnum = 1;
  if(cp)
    pnum = cp;
  if(tp)
    pamount = tp;
  var $pagediv = $(".pagination");
  if(pagination)
    $pagediv = pagination;
  $pagediv.empty();
  $li = $("<li/>").append($("<a/>").attr({"href":"javascript:;"}).text("<<").bind("click", function(){
    changePage(this, 'S', callback, cp, tp, param);
  }));
  $pagediv.append($li);
  $li = $("<li/>").append($("<a/>").attr({"href":"javascript:;"}).text("<").bind("click", function(){
    changePage(this, 'P', callback, cp, tp, param);
  }));
  $pagediv.append($li);
  if(pamount <= 5){
    for(var i = 1; i <= pamount; i ++){
      $li = $("<li/>").addClass("pageNum").append($("<a/>").attr({"href":"javascript:;"}).text(i).bind("click", function(){
        changePage(this, 'O', callback, cp, tp, param);
      }));
      if(pnum == i){
        $li.addClass("active");
      }
      $pagediv.append($li);
    }
  }else{
    if(pnum - 2 > 0){
      startPage = pnum - 2;
    }else{
      startPage = 1;
    }
    if(pnum + 2 > pamount){
      startPage = pamount - 4;
    }
    for(var i = startPage; i <= startPage + 4; i ++){
      $li = $("<li/>").addClass("pageNum").append($("<a/>").attr({"href":"javascript:;"}).text(i).bind("click", function(){
        changePage(this, 'O', callback, cp, tp, param);
      }));
      if(pnum == i){
        $li.addClass("active");
      }
      $pagediv.append($li);
    }
  }
  $li = $("<li/>").append($("<a/>").attr({"href":"javascript:;"}).text(">").bind("click", function(){
    changePage(this, 'N', callback, cp, tp, param);
  }));
  $pagediv.append($li);
  $li = $("<li/>").append($("<a/>").attr({"href":"javascript:;"}).text(">>").bind("click", function(){
    changePage(this, 'E', callback, cp, tp, param);
  }));
  $pagediv.append($li);
    
}

//list列表显示img时应用，$img 其实没有太大作用
function showImg(url) {
	//疑问，有什么用
	  var $img = $("<img/>").attr({
	    "src": url,
	    "width": "130px!important",
	    "background-size":"contain"
	  });
	  var $img_thumbnail = $("<img/>").addClass("tip img-thumbnail").attr({
	    "src": url,
	    "width": "30px",
	    "height": "30px",
	    "data-html": "true",
	    "data-trigger": "hover",
	    "rel": "popover",
	    "data-content": $img[0].outerHTML
	  });
	  return $img_thumbnail;
	}
//上传图片的图片绑定 显示图片用的
function bindInputImg(selector, url) {
	  var $img = $("<img/>").attr({
	    "src": url,
	    "width": "200px"
	  });
	  if($(selector).hasClass("special-edit-url")){
	    selector = $(selector).closest(".note-image-dialog").find(".special-edit-btn");
	  }
	  var $img_thumbnail = $(selector).addClass("tip").attr({
	    "data-html": "true",
	    "data-trigger": "hover",
	    "rel": "popover",
	    "data-content": $img[0].outerHTML
	  }).popover();
	}

//显示文字
function showThumbText(content){
	var $p=$("<p/>").addClass("tip").html(content).attr({
		"data-content": content,
		"data-html" : "true",
		"data-trigger" : "hover"
	});
	return $p;
}
//判空
function valueIsEmpty(val) {
  return (val === null || val === "" || typeof val == 'undefined');
}
//如果对象为空默认值为空字符串
function ifNull(val, replace) {
  var returnStr = "";
  if (replace) {
    returnStr = replace;
  }
  return (val === null || val === "") ? returnStr: val;
}
//表单序列化
(function($) {
	  $.fn.serializeJson = function() {
	    var serializeObj = {};
	    var array = this.serializeArray();
	    var str = this.serialize();
	    $(array).each(function() {
	      if (serializeObj[this.name]) {
	        if ($.isArray(serializeObj[this.name])) {
	          serializeObj[this.name].push(this.value);
	        } else {
	          serializeObj[this.name] = [serializeObj[this.name], this.value];
	        }
	      } else {
	        serializeObj[this.name] = this.value;
	      }
	    });
	    return serializeObj;
	  };
	})(jQuery);

var stack_topleft = {"dir1": "down", "dir2": "right", "push": "top"};
var stack_bottomleft = {"dir1": "right", "dir2": "up", "push": "top"};
var stack_bottomright = {"dir1": "up", "dir2": "left", "firstpos1": 15, "firstpos2": 15};
var stack_bar_top = {"dir1": "down", "dir2": "right", "push": "top", "spacing1": 0, "spacing2": 0};
var stack_bar_bottom = {"dir1": "up", "dir2": "right", "spacing1": 0, "spacing2": 0};
function pageNote(config) {
	  var hide = true;
	  if (config.hasOwnProperty("hide")) {
	    if (config.hide == false) {
	      hide = false;
	    }
	  }
	  new PNotify({
	    title: config.title || "错误！",
	    text: config.text || "",
	    type: config.type || 'error',
	    addclass: 'stack-bar-bottom',
	    stack:stack_bar_bottom ,
	      width: "70%",
	      delay: 3000,
	      hide: hide
	  });
	}

	function pageNoteError(message, title) {
	  var _title = "发生错误！";
	  if (title) _title = title;
	  pageNote({
	    title: _title,
	    text: message,
	    type: "error"
	  });
	}
	function pageNoteWarning(message, title) {
	  var _title = "警告！";
	  if (title) _title = title;
	  pageNote({
	    title: _title,
	    text: message,
	    type: "warning"
	  });
	}
	function pageNoteSuccess(message, title) {
	  var _title = "成功！";
	  if (title) _title = title;
	  pageNote({
	    title: _title,
	    text: message,
	    type: "success"
	  });
	}
	
	
		$('.modal-basic').magnificPopup({
			type: 'inline',
			preloader: false,
			modal: true
		});
	$(document).on('click', '.modal-confirm', function (e) {
		e.preventDefault();
		$.magnificPopup.close();

		new PNotify({
			title: 'Notification',
			text: 'Some notification text.',
			type: 'success',
			addclass: 'stack-bottomright',
			stack: stack_bottomright
		});
	});