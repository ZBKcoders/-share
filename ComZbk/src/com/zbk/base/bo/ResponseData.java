package com.zbk.base.bo;

import com.zbk.base.constant.ResponseVoConstant;

public class ResponseData {
	private String retCode;
	private String message;
	private Object value;
	private String accessToken;
	private long executeTime;
	private String controllerReturn;
	private boolean finished;
	
	public ResponseData(){
		this.controllerReturn="0";
		this.message="";
		this.accessToken="";
		this.value="";
		this.setFinished(false);
	}
	public String getRetCode() {
		return retCode;
	}

	public void setRetCode(String retCode) {
		this.retCode = retCode;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Object getValue() {
		return value;
	}

	public void setValue(Object value) {
		this.value = value;
	}

	public String getAccessToken() {
		return accessToken;
	}

	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}

	public long getExecuteTime() {
		return executeTime;
	}

	public void setExecuteTime(long executeTime) {
		this.executeTime = executeTime;
	}

	public String getControllerReturn() {
		return controllerReturn;
	}

	public void setControllerReturn(String controllerReturn) {
		this.controllerReturn = controllerReturn;
	}

	public boolean isFinished() {
		return finished;
	}

	public void setFinished(boolean finished) {
		this.finished = finished;
	}

	public static ResponseData status(ResponseVoConstant code) {
		ResponseData responseData = new ResponseData();
		responseData.retCode = code.getCode();
		responseData.setControllerReturn("0");
		return responseData;
	}

	public static ResponseData status(String code) {
		ResponseData responseData = new ResponseData();
		responseData.retCode = code;
		return responseData;
	}
	
	public ResponseData retCode(String retCode){
		this.retCode=retCode;
		return this;
	}
	
	public ResponseData message(String message){
		this.message=message;
		return this;
	}
	
	public ResponseData value(Object value){
		this.value=value;
		return this;
	}
	
	public ResponseData accessToken(String accessToken){
		this.accessToken=accessToken;
		return this;
	}
	
	public ResponseData executeTime(long executeTime){
		this.executeTime=executeTime;
		return this;
	}
	
	public ResponseData controllerReturn(String controllerReturn){
		this.controllerReturn=controllerReturn;
		return this;
	}
	
	public ResponseData finished(boolean finished){
		this.finished=finished;
		return this;
	}
	
	public ResponseData reset(ResponseVoConstant code , String message , Object result){
		if(code!=null){
			this.retCode=code.getCode();
		}else{
			this.retCode=ResponseVoConstant.BAD_REQUEST.getCode();
		}
		this.message=message;
		this.value=result;
		return this;
	}
	@Override
	public String toString() {
		return "ResponseData [retCode=" + retCode + ", message=" + message
				+ ", value=" + value + ", accessToken=" + accessToken
				+ ", executeTime=" + executeTime + ", controllerReturn="
				+ controllerReturn + ", finished=" + finished + "]";
	}
	
}
