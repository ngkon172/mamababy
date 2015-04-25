package com.mamababy.domain.user;//package com.mamababy.domain.User;
//
//import javax.persistence.Column;
//import javax.persistence.Entity;
//import javax.persistence.Id;
//import javax.persistence.JoinColumn;
//import javax.persistence.ManyToOne;
//import javax.persistence.Table;
//
//@Entity
//@Table(name = "address")
//public class Address {
//	public String id;
//	public String zipcode;
//	public String address1;
//	public String address2;
//	public Users users; // references by user user;
//
//	@Id
//	@Column(name = "Users")
//	public String getId() {
//		return id;
//
//	}
//
//	public void setid(String id) {
//		this.id = id;
//	}
//
//	@Column(name = "zipcode")
//	public String getZipcode() {
//		return zipcode;
//	}
//
//	public void setZipcode(String zipcode) {
//		this.zipcode = zipcode;
//	}
//
//	@Column(name = "address1")
//	public String getAddress1() {
//		return address1;
//	}
//
//	public void setAddress1(String address1) {
//		this.address1 = address1;
//	}
//
//	@Column(name = "address2")
//	public String getAddress2() {
//		return address2;
//	}
//
//	public void setAddress2(String address2) {
//		this.address2 = address2;
//	}
//
//	@ManyToOne
//	@JoinColumn(name = "user")
//	public Users getUser() {
//		return users;
//	}
//
//	public void setUser(Users users) {
//		this.users = users;
//	}
//
//	public Address() {
//
//	}
//
//	public Address(String id, String zipoce, String address1, String address2,
//			Users users) {
//		this.id = id;
//		this.zipcode = zipoce;
//		this.address1 = address1;
//		this.address2 = address2;
//		this.users = users;
//	}
//
//}
