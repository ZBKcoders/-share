package com.zbk.base.constant;

public enum ResponseVoConstant {
	OK("200"), CREATED("201"), ACCEPTED("202"), MOVED_PERMANENTLY("301"), BAD_REQUEST(
			"400"), UNAUTHORIZED("401"), FORBIDDEN("403"), NOT_FOUND("404"), INTERNAL_ERROR(
			"500"), NOT_IMPLEMENTED("501"), PreCondition_Failed("412"),NOT_ISAPPUSER("440");
	private ResponseVoConstant(String code) {
		this.code = code;
	}

	public String getCode() {
		return this.code;
	}

	private String code;
}
