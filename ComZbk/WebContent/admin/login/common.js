/* 
 * @auth CIN
 * @date 2014-8-28 14:18:10 
 * @version 1.0 未完待续。。。
 * @function request (params, isAsync ,callback)
 * @function getRootPath ()
 * @plugin .serializeJson()  -- $form to JSON
 * @function checkDataStatus (data, code)  -- code可选，基本不用
 * @function changePage (cPage, e, callback, cp, tp), showPageStyle(callback, cp, tp, pagination) 分页用showPageStyle()方法
 * @function valueIsEmpty (val)  -- 判空 @return boolean
 * @function ifNull (val, replace)  -- 防止出现null值 @return String:"", obj:val, obj:replace
 * @function getDateTime (addtime)  -- 
 * 
 * 
 * 
 */
var webRootPath=window.location.protocol+"//"+window.location.host+"/ComZbk/";
var LOADINGSTATUS = 1;
function request(params, isAsync, callback) { //封装与后台交互的方法，即将前台数据传到后台
  var _url = webRootPath,
  _type = "post",
  _noLoading = false,
  _noNote = false;
  if (params._url) {
    _url = _url + params._url;
    delete params._url;
  }
  if (params._type) {
    _type = params._type;
    delete params._type;
  }
  if (params._noLoading) {
    _noLoading = params._noLoading;
    delete params._noLoading;
  }
  if (params._noNote) {
    _noNote = params._noNote;
    delete params._noNote;
  }
  $.ajax({
    type: _type,
    url: _url,
    dataType: "json",
    data: {
      "json": JSON.stringify(params)
    },
    async: isAsync,
    beforeSend: function() {
      if (isAsync && !_noLoading) {
        LOADINGSTATUS++;
        //showLoading();
        $('#loadingWrapperBase').show();
      }
    },
    success: callback,
    error: function() {
      if (!_noNote) {
        pageNoteError("服务器连接错误！");
      }
      $('#loadingWrapperBase').hide();
    },
    complete: function() {
      if (isAsync && !_noLoading) {--LOADINGSTATUS;
        if (LOADINGSTATUS == 0) {
          $('#loadingWrapperBase').fadeOut('slow');
        }
        hideLoading();
      }
    }
  });
  $('#loadingWrapperBase').hide();
}
function showLoading() {
  $("#loadingWrapper").show();
}
function hideLoading() {
  $("#loadingWrapper").hide();
}

function showShare() {
  $("#shareWrapper").show();
}
function hideShare() {
  //$("#shareWrapper").hide();
  $("#shareWrapper").fadeOut('slow');
}

function getRootPath() {
  //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
  var curWwwPath = window.document.location.href;
  //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
  var pathName = window.document.location.pathname;
  var pos = curWwwPath.indexOf(pathName);
  //获取主机地址，如： http://localhost:8083
  var localhostPaht = curWwwPath.substring(0, pos);
  //获取带"/"的项目名，如：/uimcardprj
  var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
  return (localhostPaht + projectName);
}
//将form表单内的值转换成json数据的插件
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
function checkDataStatus(data, code) {
  if (code) return (data.retCode == code);
  return (data.retCode == "200");
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
      /*
      case '404': //page 404
        if (param.p404) {
          param.p404(data);
          break;
        }
        */
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
function changePage(cPage, e, callback, cp, tp, param, data) {
  var pnum = $(cPage).text();
  var pamount = 1;
  if (cp) pnum = cp;
  if (tp) pamount = tp;
  if (e) {
    switch (e) {
    case "S":
      pnum = 1;
      break;
    case "P":
      if (pnum - 1 < 1) {
        return;
      }
      pnum = pnum - 1;
      break;
    case "N":
      if (pnum + 1 > pamount) {
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
  } else {
    pnum = $(cPage).text();
  }
  if (pnum < 1 || pnum > pamount) {
    return;
  }
  if (param) {
    param["pn"] = pnum;
    callback(param);
    return;
  }
  if (callback) callback(pnum, data);
}
function showPageStyle(callback, cp, tp, pagination, param, data) {
  var pamount = 1;
  var pnum = 1;
  if (cp) pnum = cp;
  if (tp) pamount = tp;
  var $pagediv = $(".pagination");
  if (pagination) $pagediv = pagination;
  $pagediv.empty();
  $li = $("<li/>").append($("<a/>").attr({
    "href": "javascript:;"
  }).text("<<").bind("click",
  function() {
    changePage(this, 'S', callback, cp, tp, param, data);
  }));
  $pagediv.append($li);
  $li = $("<li/>").append($("<a/>").attr({
    "href": "javascript:;"
  }).text("<").bind("click",
  function() {
    changePage(this, 'P', callback, cp, tp, param, data);
  }));
  $pagediv.append($li);
  if (pamount <= 5) {
    for (var i = 1; i <= pamount; i++) {
      $li = $("<li/>").addClass("pageNum").append($("<a/>").attr({
        "href": "javascript:;"
      }).text(i).bind("click",
      function() {
        changePage(this, 'O', callback, cp, tp, param, data);
      }));
      if (pnum == i) {
        $li.addClass("active");
      }
      $pagediv.append($li);
    }
  } else {
    if (pnum - 2 > 0) {
      startPage = pnum - 2;
    } else {
      startPage = 1;
    }
    if (pnum + 2 > pamount) {
      startPage = pamount - 4;
    }
    for (var i = startPage; i <= startPage + 4; i++) {
      $li = $("<li/>").addClass("pageNum").append($("<a/>").attr({
        "href": "javascript:;"
      }).text(i).bind("click",
      function() {
        changePage(this, 'O', callback, cp, tp, param, data);
      }));
      if (pnum == i) {
        $li.addClass("active");
      }
      $pagediv.append($li);
    }
  }
  $li = $("<li/>").append($("<a/>").attr({
    "href": "javascript:;"
  }).text(">").bind("click",
  function() {
    changePage(this, 'N', callback, cp, tp, param, data);
  }));
  $pagediv.append($li);
  $li = $("<li/>").append($("<a/>").attr({
    "href": "javascript:;"
  }).text(">>").bind("click",
  function() {
    changePage(this, 'E', callback, cp, tp, param, data);
  }));
  $pagediv.append($li);

}
//判空
function valueIsEmpty(val) {
  return (val === null || val === "" || typeof val == 'undefined');
}
function ifNull(val, replace) {
  var returnStr = "";
  if (replace) {
    returnStr = replace;
  }
  return (val === null || val === "") ? returnStr: val;
}
/**
 * function getDateTime(addtime)
 * @memberOf Global
 * @param {Long} addtime
 * @type Date
 * @returns {Date}
*/
function getDateTime(addtime) { //addtime is second
  var datetime = new Date();
  return addtime ? (new Date(datetime.getTime() + addtime * 1000)) : datetime;
}

function strToTime(time) {
  if (time === null || time === "") {
    return '';
  } else {
    var datetime = new Date();
    datetime.setTime(time);
    var year = datetime.getFullYear();
    var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
    var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
    var hour = datetime.getHours() < 10 ? "0" + datetime.getHours() : datetime.getHours();
    var minute = datetime.getMinutes() < 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();
    var second = datetime.getSeconds() < 10 ? "0" + datetime.getSeconds() : datetime.getSeconds();
    return year + "-" + month + "-" + date + " " + hour + ":" + minute + ":" + second;
  }
}

function strToDate(time) {
  if (time === null || time === "") {
    return '';
  } else {
    var datetime = new Date();
    datetime.setTime(time);
    var year = datetime.getFullYear();
    var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
    var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
    return year + "-" + month + "-" + date;
  }
}

function strToHour(time) {
  if (time === null || time === "") {
    return '';
  } else {
    var datetime = new Date();
    datetime.setTime(time);
    var hour = datetime.getHours() < 10 ? "0" + datetime.getHours() : datetime.getHours();
    return hour;
  }
}

function strToMinute(time) {
  if (time === null || time === "") {
    return '';
  } else {
    var datetime = new Date();
    datetime.setTime(time);
    var minute = datetime.getMinutes() < 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();
    return minute;
  }
}
//清理时间中的T
function clearT(datetime) {
  return (datetime != null ? datetime.replace("T", "<br/>") : "");
}
function clearTNoBr(datetime) {
  return (datetime != null ? datetime.replace("T", " ") : "");
}

function toDateStr(datetime) {
  return (datetime != null ? datetime.substr(0, 10) : "");
}

function getDate(str, splitStr) {
  if (valueIsEmpty(str)) {
    return '';
  }
  splitStr = splitStr ? splitStr: " ";
  return str.split(splitStr)[0];
}
//获取地址参数值
function getUrlParam(name, default_) { //返回url参数的值
  default_ = (default_ == null) ? "": default_;
  var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
  var r = window.location.search.substr(1).match(reg); //匹配目标参数
  if (r != null) return decodeURI(r[2]);
  return default_; //返回参数值
}

function arryToInt(arr) {
  var arr1 = [];
  if (arr != null && arr.length > 0) {
    for (var i = 0; i < arr.length; i++) {
      arr1[i] = parseInt(arr[i]);
    }
  }
  return arr1;
}
function isNumber(data) {
  if (!isNaN(data)) {
    return true;
  } else {
    return false;
  }
}
function showImg(url) {
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
    stack: {
      "dir1": "up",
      "dir2": "right",
      "spacing1": 0,
      "spacing2": 0
    },
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
function getSelectList(url, $bind, value, text, params, isAsync, noOption, $option) {
  var postData = {};
  postData["_url"] = url;
  isAsync = (valueIsEmpty(isAsync) || !isAsync) ? false: true;
  params = params ? params: {};
  request(postData, isAsync,
  function(data) {
    if (checkDataStatus(data)) {
      var dataResult = data.value;
      if (!noOption) {
        if (valueIsEmpty($option) || !$option) {
          $option = $("<option>").text("全部").val("0");
          if (params.statusColor) {
            $option.addClass("text-" + params.statusColor[0]);
          }
        }
      }
      bindSelect($bind, dataResult, value, text, $option, params);
    }
  });
}
function bindSelect($bind, objdata, bindvalue, bindtext, $option, params) {
  $bind.empty();
  if (!valueIsEmpty($option) || $option) {
    $bind.append($option);
  }
  $.each(objdata,
  function(i, n) {
    var $sel_opt = $("<option>").val(n[bindvalue]).text(n[bindtext]);
    $bind.append($sel_opt);
    if (params.statusColor) {
      $sel_opt.addClass("text-" + params.statusColor[n[bindvalue]]);
    }
  });
}
function validateForm(selector, callback, errPlaceCallback) {
  var $validator = $(selector).validate({
    debug: true,
    ignore: "",
    submitHandler: function(form) {
      if (callback) callback(form);
      return false;
    },
    highlight: function(element) {
      $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
    },
    success: function(element) {
      $(element).closest('.form-group').removeClass('has-error');
      $(element).remove();
    },
    errorPlacement: function(error, element) {
      if (errPlaceCallback) errPlaceCallback(error, element);
      else {
        if(element.parent().hasClass("input-group")) element.parent().parent().append(error);
        else element.parent().append(error);
      }
    }
  });
  return $validator;
}
function setFileUpload(imgInputFile, hiddenSelector, imgAddBtn, childPath, callback, progress) {
  $(imgInputFile).fileupload({
    url: webRootPath + "file/upload",
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
function setImageapiUpload(imgInputFile, hiddenSelector, imgAddBtn, childPath, callback, progress) {
	  $(imgInputFile).fileupload({
	    url: webRootPath + "imageapi/upload",
	    formData: {
	      "childPath": childPath
	    },
	    done: function(e, data) {
	      if(callback) callback(data, hiddenSelector, imgAddBtn);
	      var obj = data["result"]["value"];
	      var url = obj["smallUrl"];
	      if(url==null || url==""){
	    	  url = obj["originalUrl"];
	      }
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

function setUploadDiv(imgInputFile, childPath, type, size, callback, progress) {
  var $file = $(imgInputFile);
  var $uploadDiv = $file.parent().parent();
  var $upUrl = $uploadDiv.find(".upload-url");
  var $upAddBtn = $uploadDiv.find(".upload-btn");
  var $progressall = $uploadDiv.find(".up-progressall");
  $file.fileupload({
    url: webRootPath + "file/upload",
    formData: {
      "childPath": childPath
    },
    autoUpload:false,
    //acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
    done: function(e, data) {
      if(callback) callback();
      var obj = data["result"];
      var url = obj["value"];

      if(400 == obj.retCode){
        var $label = $("<label>").text(obj.message).addClass("error");
        var $i = $("<i>").addClass("fa fa-times text-danger");
      } else {
        var $i = $("<i>").addClass("fa fa-check text-success");
      }
      $upAddBtn.text("").css("background-image","").append($i.addClass("tooltips").attr({
        "data-toggle" : "tooltip",
        "data-placement" : "top",
        "data-original-title" : "点击重新上传"
      }).tooltip());
      $upAddBtn.parent().after($label);
      $progressall.hide();
      $upUrl.parents(".form-group").removeClass("has-error");

      $upUrl.val(url);
      if (url.toLowerCase().indexOf(".jpg") >= 0 || url.toLowerCase().indexOf(".jpeg") >= 0 || url.toLowerCase().indexOf(".png") >= 0) {
        $upAddBtn.css({
          "background-image": "url(" + url + ")"
        }).empty();
        bindInputImg($upAddBtn, url);
      }
    },
    progressall: function (e, data) {
      if(progress) progress()
      else {
        $upAddBtn.text("");
        $uploadDiv.find(".up-progressall").show();
        var percent = data.loaded / data.total,
          perimeter = Math.PI * 2 * 170;
        $uploadDiv.find("circle").eq(1).attr("stroke-dasharray", perimeter * percent + " " + perimeter * (1- percent));
      }
    },
    add: function (e, data) {
      $upUrl.val("");
      $uploadDiv.find(".error").remove();
      $upAddBtn.popover('destroy').css("background-image","");
      $uploadDiv.parent().find(".error").remove();
      
      var name = data.files[0].name.toLowerCase();
      var upSize = data.originalFiles[0].size
      if(type) {
        types = type.split(",");
        var pass = false;
        $.each(types, function(index, dataItem){
          if(name.indexOf(dataItem) >= 0){
            pass = true;
            return;
          }
        });
        if(pass) {
          if(size){
            if(upSize > size){
              console.log(upSize);
              console.log(size);
              pass = false;
              var $label = $("<label>").text("上传文件过大").addClass("error");
            }
          }
        } else {
          var $label = $("<label>").text("上传格式错误").addClass("error");
        }
      }
      if(!pass){
          var $i = $("<i>").addClass("fa fa-times text-danger");
          $upUrl.text("");
          $upAddBtn.text("").css("background-image","").append($i.addClass("tooltips").attr({
            "data-toggle" : "tooltip",
            "data-placement" : "top",
            "data-original-title" : "点击重新上传"
          }).tooltip());
          $upAddBtn.parent().after($label);
        } else {
          data.submit();
        }
    },
    error: function(data){
      $uploadDiv.find(".up-progressall").hide(); 
      var $label = $("<label>").text("上传失败").addClass("error");
      var $i = $("<i>").addClass("fa fa-times text-danger");
      $upUrl.text("");
      $upAddBtn.text("").css("background-image","").append($i.addClass("tooltips").attr({
        "data-toggle" : "tooltip",
        "data-placement" : "top",
        "data-original-title" : "点击重新上传"
      }).tooltip());
      $upAddBtn.parent().after($label);
    }
  });
}

//编辑器上传图片
function uploadImg(imgUrlPath) {
  console.log("Enter uploadImg function!");
  $(".special-edit-url").each(function(index, item){
    $(item).fileupload({
      url: webRootPath + "file/upload",
      formData: {
        "childPath": imgUrlPath
      },
      done: function(e, data) {
        var obj = data["result"];
        var url = obj["value"];
        var $dialog = $(this).closest(".note-image-dialog");

        $dialog.find(".note-image-url").val(url);
        $dialog.find(".special-edit-btn").css({
          "background-image": "url(" + url + ")"
        }).empty();
        bindInputImg(this, url);
        $dialog.find(".note-image-btn").css({
          "class": "btn btn-primary note-image-btn"
        });
        $dialog.find(".note-image-btn").focus();
      }
    });
  })
}

//时间戳转时间串
Date.prototype.format = function(fmt) {
  var o = {
    "M+": this.getMonth() + 1,
    //月份        
    "d+": this.getDate(),
    //日        
    "h+": this.getHours() % 12 == 0 ? 12 : this.getHours() % 12,
    //小时        
    "H+": this.getHours(),
    //小时        
    "m+": this.getMinutes(),
    //分        
    "s+": this.getSeconds(),
    //秒        
    "q+": Math.floor((this.getMonth() + 3) / 3),
    //季度        
    "S": this.getMilliseconds() //毫秒        
  };
  var week = {
    "0": "\u65e5",
    "1": "\u4e00",
    "2": "\u4e8c",
    "3": "\u4e09",
    "4": "\u56db",
    "5": "\u4e94",
    "6": "\u516d"
  };
  if (/(y+)/.test(fmt)) {
    fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
  }
  if (/(E+)/.test(fmt)) {
    fmt = fmt.replace(RegExp.$1, ((RegExp.$1.length > 1) ? (RegExp.$1.length > 2 ? "\u661f\u671f": "\u5468") : "") + week[this.getDay() + ""]);
  }
  for (var k in o) {
    if (new RegExp("(" + k + ")").test(fmt)) {
      fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    }
  }
  return fmt;
}
function Long2TimeString(time, fmt) {
  var d = new Date();
  d.setTime(time);
  var str = d.format(fmt);
  return str;
}
function wxShare(config) {
  wx.config({
    debug: false,
    appId: config.appId,
    timestamp: config.timestamp,
    nonceStr: config.nonceStr,
    signature: config.signature,
    jsApiList: ["onMenuShareTimeline", "onMenuShareAppMessage", "onMenuShareQQ", "onMenuShareWeibo"]
  });
  wx.error(function(res) {
    console.log(res)
  });
  wx.ready(function() {
    wx.onMenuShareTimeline({
      title: config.desc,
      link: config.link,
      imgUrl: config.imgUrl,
      success: config.success,
      cancel: config.cancel
    });
    wx.onMenuShareAppMessage({
      title: config.title,
      desc: config.desc,
      link: config.link,
      imgUrl: config.imgUrl,
      type: (config.type || "link"),
      dataUrl: (config.dataUrl || ""),
      success: config.success,
      cancel: config.cancel
    });
    wx.onMenuShareQQ({
      title: config.title,
      desc: config.desc,
      link: config.link,
      imgUrl: config.imgUrl,
      success: config.success,
      cancel: config.cancel
    });
    wx.onMenuShareWeibo({
      title: config.title,
      desc: config.desc,
      link: config.link,
      imgUrl: config.imgUrl,
      success: config.success,
      cancel: config.cancel
    })
  })
};
function showSubmitLoading(id){
  var $id = $(id);
  var loadText = $(id).text();
  $id.attr("disabled", "disabled").text($id.attr("data-loading-text"));
  $id.attr("data-loading-text",loadText)
}
function hideSubmitLoading(id){
  var $id = $(id);
  var loadText = $(id).text();
  $id.removeAttr("disabled").text($id.attr("data-loading-text"));
  $id.attr("data-loading-text",loadText);
}
//替换元素相对路径
function replaceHref(elements,targetUrl){
	$(elements).each(function(index, item){
        var objItem = $(item);
        var href = objItem.attr("href");
        var attr="href";
        if(typeof(href) == "undefined"){
       	 href = objItem.attr("src");
       	 attr = "src";
        }
       
        if(typeof(href) == "undefined"){
        }else{
	        if(href.indexOf("../")==0){
	       		var paths =new Array();		
	       		paths = targetUrl.replace("http://", "").split("/");
					var imgUrls = new Array();
					imgUrls = href.split("../");
					var num = imgUrls.length-1;
					var path = "";
					for(var i=0;i<paths.length-num-1;i++){
						if(i!=0){
						  path = path+"/";
						}
						path = path+paths[i];
					}
					objItem.attr(attr,"http://"+ path+"/"+imgUrls[num]);	 
	        }else if(href.indexOf("/") == 0){
	       	 objItem.attr(attr,"http://"+targetUrl.replace("http://", "").split("/")[0]+ href);
	        }else{
	        	if(href.indexOf("http://")>-1||href.indexOf("https://")>-1||href.indexOf("www.")>-1){
              if(href.indexOf("http://localhost:8080/CampusPlus/")>-1){
                objItem.attr(attr,href.replace("http://localhost:8080/CampusPlus/",webRootPath)); 
              }
	        	}else{
	             var paths =new Array();	
	             paths = targetUrl.replace("http://", "").split("/");
	             objItem.attr(attr,targetUrl.replace(paths[paths.length-1],"" )+ href);
	        	}
	        } 
        }
   });
}