package com.zbk.session;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.zbk.base.Interface.NameCN;
import com.zbk.base.Interface.Pojo;

@NameCN("小节表")
@Entity
@Table(name = "session")
public class Session implements Pojo {

	private static final long serialVersionUID = 4370746510683863405L;
	@NameCN("主键")
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "session_id")
	private Integer sessionId;
	@NameCN("小节编码")
	@Column(name = "session_num")
	private String sessionNum;
	@NameCN("小节标题")
	@Column(name = "session_title")
	private String sessionTitle;
	@NameCN("小节描述")
	@Column(name = "session_dec")
	private String sessionDec;
	@NameCN("创建时间")
	@Column(name = "create_time")
	private String createTime;
	@NameCN("更新时间")
	@Column(name = "update_time")
	private String updateTime;
	@NameCN("课程主键")
	@Column(name = "course_id")
	private Integer courseId;

	public Integer getSessionId() {
		return sessionId;
	}

	public void setSessionId(Integer sessionId) {
		this.sessionId = sessionId;
	}

	public String getSessionNum() {
		return sessionNum;
	}

	public void setSessionNum(String sessionNum) {
		this.sessionNum = sessionNum;
	}

	public String getSessionTitle() {
		return sessionTitle;
	}

	public void setSessionTitle(String sessionTitle) {
		this.sessionTitle = sessionTitle;
	}

	public String getSessionDec() {
		return sessionDec;
	}

	public void setSessionDec(String sessionDec) {
		this.sessionDec = sessionDec;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

	public Integer getCourseId() {
		return courseId;
	}

	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}

	@Override
	public Serializable getKey() {
		return this.sessionId;
	}

}
