package com.mamababy.domain.user;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="user")
public class Users {
    @Id
    @Column(name="user")
    private String user;
    @Column(name="member_password")
    private String member_password;
    @Column(name="hint")
    private String hint;
    @Column(name="pass_hint_answer", length = 1000)
    private String pass_hint_answer;
    @Column(name="postcode1")
    private String postcode1;
    @Column(name="postcode2")
    private String postcode2;
    @Column(name="addr1", length = 10000)
    private String addr1;
    @Column(name="addr2", length = 1000)
    private String addr2;
    @Column(name="mobile1")
    private String mobile1;
    @Column(name="mobile2")
    private String mobile2;
    @Column(name="mobile3")
    private String mobile3;
    @Column(name="email1")
    private String email1;
    @Column(name="email2")
    private String email2;
    @Column(name="is_news_mail")
    private String is_news_mail;
    @Column(name="birth_year")
    private String birth_year;
    @Column(name="birth_month")
    private String birth_month;
    @Column(name="birth_day")
    private String birth_day;
    @Column(name="is_solar_calendar")
    private String is_solar_calendar;
    @Column(name="partner_year")
    private String partner_year;
    @Column(name="partner_month")
    private String partner_month;
    @Column(name="partner_day")
    private String partner_day;
    @Column(name="partner_year1")
    private String partner_year1;
    @Column(name="partner_month1")
    private String partner_month1;
    @Column(name="partner_day1")
    private String partner_day1;
    @Column(name="point")
    private String point;


    public Users() {

        // TODO Auto-generated constructor stub
    }
    public String getMember_password() {
        return member_password;
    }
    public void setMember_password(String member_password) {
        this.member_password = member_password;
    }
    public String getHint() {
        return hint;
    }
    public void setHint(String hint) {
        this.hint = hint;
    }
    public String getPass_hint_answer() {
        return pass_hint_answer;
    }
    public void setPass_hint_answer(String pass_hint_answer) {
        this.pass_hint_answer = pass_hint_answer;
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
    public String getIs_news_mail() {
        return is_news_mail;
    }
    public void setIs_news_mail(String is_news_mail) {
        this.is_news_mail = is_news_mail;
    }
    public String getBirth_year() {
        return birth_year;
    }
    public void setBirth_year(String birth_year) {
        this.birth_year = birth_year;
    }
    public String getBirth_month() {
        return birth_month;
    }
    public void setBirth_month(String birth_month) {
        this.birth_month = birth_month;
    }
    public String getBirth_day() {
        return birth_day;
    }
    public void setBirth_day(String birth_day) {
        this.birth_day = birth_day;
    }
    public String getIs_solar_calendar() {
        return is_solar_calendar;
    }
    public void setIs_solar_calendar(String is_solar_calendar) {
        this.is_solar_calendar = is_solar_calendar;
    }
    public String getPartner_year() {
        return partner_year;
    }
    public void setPartner_year(String partner_year) {
        this.partner_year = partner_year;
    }
    public String getPartner_month() {
        return partner_month;
    }
    public void setPartner_month(String partner_month) {
        this.partner_month = partner_month;
    }
    public String getPartner_day() {
        return partner_day;
    }
    public void setPartner_day(String partner_day) {
        this.partner_day = partner_day;
    }
    public String getPartner_year1() {
        return partner_year1;
    }
    public void setPartner_year1(String partner_year1) {
        this.partner_year1 = partner_year1;
    }
    public String getPartner_month1() {
        return partner_month1;
    }
    public void setPartner_month1(String partner_month1) {
        this.partner_month1 = partner_month1;
    }
    public String getPartner_day1() {
        return partner_day1;
    }
    public void setPartner_day1(String partner_day1) {
        this.partner_day1 = partner_day1;
    }
    public String getUser() {
        return user;
    }
    public void setUser(String user) {
        this.user = user;
    }
    public String getPoint() {
        return point;
    }
    public void setPoint(String point) {
        this.point = point;
    }




}

