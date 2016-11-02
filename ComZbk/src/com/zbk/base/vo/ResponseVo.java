package com.zbk.base.vo;

import com.zbk.base.constant.ResponseVoConstant;

public class ResponseVo {

	public static ResponseVo status(ResponseVoConstant code) {
		ResponseVo responseVo = new ResponseVo();
		responseVo.retCode = code.getCode();
		responseVo.setControllerReturn("0");
		return responseVo;
	}

	public static ResponseVo status(String code) {
		ResponseVo responseVo = new ResponseVo();
		responseVo.retCode = code;
		return responseVo;
	}

	public ResponseVo() {
		this.controllerReturn = "0";
		this.message = "";
		this.accessToken = "";
		this.value = "";
		this.weixinMessageType = "";
		this.setFinished(false);
	}

	public String getRetCode() {
		return retCode;
	}

	public ResponseVo retCode(String retCode) {
		this.retCode = retCode;
		return this;
	}

	public String getMessage() {
		return message;
	}

	public ResponseVo message(String message) {
		this.message = message;
		return this;
	}

	public Object getValue() {
		return value;
	}

	public ResponseVo value(Object value) {
		this.value = value;
		return this;
	}

	public String getAccessToken() {
		return accessToken;
	}

	public ResponseVo accessToken(String accessToken) {
		this.accessToken = accessToken;
		return this;
	}

	public long getExecuteTime() {
		return executeTime;
	}

	public ResponseVo executeTime(long executeTime) {
		this.executeTime = executeTime;
		return this;
	}

	public String getWeixinMessageType() {
		return weixinMessageType;
	}

	public ResponseVo weixinMessageType(String weixinMessageType) {
		this.weixinMessageType = weixinMessageType;
		return this;
	}

	public String getControllerReturn() {
		return controllerReturn;
	}

	public ResponseVo controllerReturn(String controllerReturn) {
		this.controllerReturn = controllerReturn;
		return this;
	}

	public boolean isFinished() {
		return finished;
	}

	public ResponseVo finished(boolean finished) {
		this.finished = finished;
		return this;
	}

	public ResponseVo reset(ResponseVoConstant code, String message,
			Object result) {
		if (code != null) {
			this.retCode = code.getCode();
		} else {
			this.retCode = ResponseVoConstant.BAD_REQUEST.getCode();
		}
		this.message = message;
		this.value = result;
		return this;
	}

	@Override
	public String toString() {
		return "ResponseVo [retCode=" + retCode + ", message=" + message
				+ ", value=" + value + ", accessToken=" + accessToken
				+ ", executeTime=" + executeTime + ", weixinMessageType="
				+ weixinMessageType + ", controllerReturn=" + controllerReturn
				+ ", finished=" + finished + "]";
	}

	public void setRetCode(String retCode) {
		this.retCode = retCode;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public void setValue(Object value) {
		this.value = value;
	}

	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}

	public void setExecuteTime(long executeTime) {
		this.executeTime = executeTime;
	}

	public void setWeixinMessageType(String weixinMessageType) {
		this.weixinMessageType = weixinMessageType;
	}

	// public void setPicUrl(String picUrl) {
	// this.picUrl = picUrl;
	// }

	public void setControllerReturn(String controllerReturn) {
		this.controllerReturn = controllerReturn;
	}

	public void setFinished(boolean finished) {
		this.finished = finished;
	}

	private String retCode;
	private String message;
	private Object value;
	private String accessToken;
	private long executeTime;
	private String weixinMessageType;
	// private String picUrl;
	private String controllerReturn;
	private boolean finished;
}
