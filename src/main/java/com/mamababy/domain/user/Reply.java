package com.mamababy.domain.user;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name="reply")
public class Reply implements Serializable{

	private static final long serialVersionUID = -2996961608681856380L;
	
	@Id
	@Column(name="id")
	private String id;
	@Column(name="bbsId")
	private String bbsId;
	@Column(name="regDate")
	private String regDate;
	@Column(name="contents")
	private String contents;
	@Column(name="password")
	private String password;
	@Column(name="userName")
	private String userName;


	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBbsId() {
		return bbsId;
	}
	public void setBbsId(String bbsId) {
		this.bbsId = bbsId;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}




}
