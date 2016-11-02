package com.zbk.base.exception;

import com.zbk.base.constant.ResponseVoConstant;

public class CampusPlusException extends Exception {
	private static final long serialVersionUID = -5997091293993642840L;

	public static final String NO_REQUIRED_PARAM = "400";
	public static final String BAD_REQUEST = "400";
	public static final String HAS_FORBIDDEN_PARAM = "403";
	public static final String INTERNAL_ERROR = "500";

	public static final String STAUE_ERROR = "405";

	public static final String NOT_LOGIN = "400";

	public static final String KeyMissed = "400";

	public static final String NoParam = "400";

	@SuppressWarnings("unused")
	private String code;

	/**
	 * s
	 * 
	 * @param errMessage
	 */
	public CampusPlusException(String errMessage) {
		super(errMessage);
		this.code = ResponseVoConstant.PreCondition_Failed.getCode();
	}

	public CampusPlusException(String code, String message) {
		super(message);
		this.code = code;
	}

	public CampusPlusException(ResponseVoConstant status, String message) {
		super(message);
		this.code = status.getCode();
	}
}