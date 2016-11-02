package com.zbk.Image.controller;

import java.util.Date;

public class ResponveImg {
	
	
	private String imgName;
	private String imgUrl;
	private Date createTime;
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public ResponveImg() {
		super();
	}
	
}
