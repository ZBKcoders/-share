package com.zbk.user;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnore;

import com.zbk.base.Interface.Pojo;

@Entity
@Table(name="user")
@NamedQuery(name="queryUser", query = "from User where userName like :userName")
public class User  implements Pojo {

	private static final long serialVersionUID = -8725423798844312061L;
	
	public User(){
		  this.roleId=3;
		  this.createTime=new Date();
	}
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name="user_id")
	private Integer userId;
	@Column(name="user_name")
	private String userName;
	@Column(name="pass_word")
	private String passWord;
	@Column(name="create_time")
	private Date createTime;
	@Column(name="role_id")
	private Integer roleId;
	@Column(name="age")
	private String age;
	@Column(name="phone_num")
	private String phoneNum;
	@Column(name="e_mail")
	private String email;
	@Column(name="head_img")
	private String headImg;
	@Column(name="user_dec")
	private String userDec;
	
	

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getUserId() {
		return userId;
	}
	
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public Date getCreateTime() {
		return createTime;
	}
	
	public void setCreateTime(Date createTime) {
		this.createTime = new Date();
	}
	
	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	
	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	

	public String getHeadImg() {
		return headImg;
	}

	public void setHeadImg(String headImg) {
		this.headImg = headImg;
	}

	public String getUserDec() {
		return userDec;
	}

	public void setUserDec(String userDec) {
		this.userDec = userDec;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName
				+ ", passWord=" + passWord + ", createTime=" + createTime
				+ ", roleId=" + roleId + ", age=" + age + ", phoneNum="
				+ phoneNum + ", email=" + email + ", headImg=" + headImg
				+ ", userDec=" + userDec + "]";
	}

	public User( String userName, String passWord, int roleId) {
		super();
		this.userName = userName;
		this.passWord = passWord;
		this.roleId = roleId;
		
	}

	@Override
	@JsonIgnore
	public Serializable getKey() {
		return userId;
	}

	


	
	
}

