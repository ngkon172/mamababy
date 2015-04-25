package com.mamababy.domain.user;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;



@Entity
@Table(name = "AdditionalInfo")
public class AdditionalInfo implements Serializable {

	public String id;
	public String birthDate;
	public String CbirthDate1;
	public String CbirthDate2;
	public Users user; // references by User user

	@Id
	@Column(name = "addinfoId")
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "birth_date")
	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	@Column(name = "child_birth_date_1")
	public String getCbirthDate1() {
		return CbirthDate1;
	}

	public void setCbirthDate1(String cbirthDate1) {
		CbirthDate1 = cbirthDate1;
	}

	@Column(name = "child_birth_date_2")
	public String getCbirthDate2() {
		return CbirthDate2;
	}

	public void setCbirthDate2(String cbirthDate2) {
		CbirthDate2 = cbirthDate2;
	}

	@ManyToOne
	@JoinColumn(name = "user")
	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public AdditionalInfo() {
		super();
	}

	public AdditionalInfo(String id, String birthDate, String cbirthDate1,
			String cbirthDate2, Users user) {

		this.id = id;
		this.birthDate = birthDate;
		CbirthDate1 = cbirthDate1;
		CbirthDate2 = cbirthDate2;
		this.user = user;
	}

}
