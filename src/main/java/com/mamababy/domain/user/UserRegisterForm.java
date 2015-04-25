package com.mamababy.domain.user;

public class UserRegisterForm {

	private String user;
	private String password1;
	private String password2;
	private String passwordQ;
	private String passwordA;
	private String name;
	private String postcode1;
	private String postcode2;
	private String addr1;
	private String addr2;
	private String mobile1;
	private String mobile2;
	private String mobile3;
	private String email1;
	private String email2;
	private String emailT;

	private String birthYear;
	private String birthMonth;
	private String birthDay;
	private String solarCal1;
	private String solarCar2;
	private String child1BirthYear;
	private String child1BirthMonth;
	private String child1BirthDay;
	private String child2BirthYear;
	private String child2BirthMonth;
	private String child2BirthDay;

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPassword1() {
		return password1;
	}

	public void setPassword1(String password1) {
		this.password1 = password1;
	}

	public String getPassword2() {
		return password2;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}

	public String getPasswordQ() {
		return passwordQ;
	}

	public void setPasswordQ(String passwordQ) {
		this.passwordQ = passwordQ;
	}

	public String getPasswordA() {
		return passwordA;
	}

	public void setPasswordA(String passwordA) {
		this.passwordA = passwordA;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPostcode1() {
		return postcode1;
	}

	public void setPostcode1(String postcode1) {
		this.postcode1 = postcode1;
	}

	public String getPostcode2() {
		return postcode2;
	}

	public void setPostcode2(String postcode2) {
		this.postcode2 = postcode2;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getMobile1() {
		return mobile1;
	}

	public void setMobile1(String mobile1) {
		this.mobile1 = mobile1;
	}

	public String getMobile2() {
		return mobile2;
	}

	public void setMobile2(String mobile2) {
		this.mobile2 = mobile2;
	}

	public String getMobile3() {
		return mobile3;
	}

	public void setMobile3(String mobile3) {
		this.mobile3 = mobile3;
	}

	public String getEmail1() {
		return email1;
	}

	public void setEmail1(String email1) {
		this.email1 = email1;
	}

	public String getEmail2() {
		return email2;
	}

	public void setEmail2(String email2) {
		this.email2 = email2;
	}

	public String getEmailT() {
		return emailT;
	}

	public void setEmailT(String emailT) {
		this.emailT = emailT;
	}

	public String getBirthYear() {
		return birthYear;
	}

	public void setBirthYear(String birthYear) {
		this.birthYear = birthYear;
	}

	public String getBirthMonth() {
		return birthMonth;
	}

	public void setBirthMonth(String birthMonth) {
		this.birthMonth = birthMonth;
	}

	public String getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(String birthDay) {
		this.birthDay = birthDay;
	}

	public String getSolarCal1() {
		return solarCal1;
	}

	public void setSolarCal1(String solarCal1) {
		this.solarCal1 = solarCal1;
	}

	public String getSolarCar2() {
		return solarCar2;
	}

	public void setSolarCar2(String solarCar2) {
		this.solarCar2 = solarCar2;
	}

	public String getChild1BirthYear() {
		return child1BirthYear;
	}

	public void setChild1BirthYear(String child1BirthYear) {
		this.child1BirthYear = child1BirthYear;
	}

	public String getChild1BirthMonth() {
		return child1BirthMonth;
	}

	public void setChild1BirthMonth(String child1BirthMonth) {
		this.child1BirthMonth = child1BirthMonth;
	}

	public String getChild1BirthDay() {
		return child1BirthDay;
	}

	public void setChild1BirthDay(String child1BirthDay) {
		this.child1BirthDay = child1BirthDay;
	}

	public String getChild2BirthYear() {
		return child2BirthYear;
	}

	public void setChild2BirthYear(String child2BirthYear) {
		this.child2BirthYear = child2BirthYear;
	}

	public String getChild2BirthMonth() {
		return child2BirthMonth;
	}

	public void setChild2BirthMonth(String child2BirthMonth) {
		this.child2BirthMonth = child2BirthMonth;
	}

	public String getChild2BirthDay() {
		return child2BirthDay;
	}

	public void setChild2BirthDay(String child2BirthDay) {
		this.child2BirthDay = child2BirthDay;
	}

	public String getBirthDate() {
		return getBirthYear() + "-" + getBirthMonth() + "-" + getBirthDay();
	}

	public String getZipcode() {
		return getPostcode1() + "-" + getPostcode2();
	}

	public String getMobile() {
		return getMobile1() + "-" + getMobile2() + "-" + getMobile3();
	}

	public String getEmail() {
		return getEmail1() + "-" + getEmail2();
	}

	public String getChild1Birth() {
		return getChild1BirthYear() + "-" + getChild1BirthMonth() + "-"
				+ getChild1BirthDay();
	}

	public String getChild2Birth() {
		return getChild2BirthMonth() + "-" + getChild2BirthMonth() + "-"
				+ getChild2BirthDay();
	}
}
