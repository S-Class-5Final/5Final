package com.fianl.AMANDA.member.model.vo;

import java.sql.Date;

/**
 * @author JangJunHa
 *
 */
public class Member {

	private int u_mid;
	private String user_id;
	private String user_pwd;
	private String user_nick;
	private String grade;
	private String gender;
	private String phone;
	private int height;
	private int age;
	private String address;
	private String user_into;
	private String gay;
	private int r_count;
	private Date updata_date;
	private String status;
	private String pay_status;
	private String kakao;
	
	public Member() {
	}

	
	public Member(String user_id, String user_pwd) {
		super();
		this.user_id = user_id;
		this.user_pwd = user_pwd;
	}


	public Member(int u_mid, String user_id, String user_pwd, String user_nick, String grade, String gender,
			String phone, int height, int age, String address, String user_into, String gay, int r_count,
			Date updata_date, String status, String pay_status, String kakao) {
		super();
		this.u_mid = u_mid;
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_nick = user_nick;
		this.grade = grade;
		this.gender = gender;
		this.phone = phone;
		this.height = height;
		this.age = age;
		this.address = address;
		this.user_into = user_into;
		this.gay = gay;
		this.r_count = r_count;
		this.updata_date = updata_date;
		this.status = status;
		this.pay_status = pay_status;
		this.kakao = kakao;
	}

	public int getU_mid() {
		return u_mid;
	}

	public void setU_mid(int u_mid) {
		this.u_mid = u_mid;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public String getUser_nick() {
		return user_nick;
	}

	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getUser_into() {
		return user_into;
	}

	public void setUser_into(String user_into) {
		this.user_into = user_into;
	}

	public String getGay() {
		return gay;
	}

	public void setGay(String gay) {
		this.gay = gay;
	}

	public int getR_count() {
		return r_count;
	}

	public void setR_count(int r_count) {
		this.r_count = r_count;
	}

	public Date getUpdata_date() {
		return updata_date;
	}

	public void setUpdata_date(Date updata_date) {
		this.updata_date = updata_date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPay_status() {
		return pay_status;
	}

	public void setPay_status(String pay_status) {
		this.pay_status = pay_status;
	}

	public String getKakao() {
		return kakao;
	}

	public void setKakao(String kakao) {
		this.kakao = kakao;
	}

	@Override
	public String toString() {
		return "Member [u_mid=" + u_mid + ", user_id=" + user_id + ", user_pwd=" + user_pwd + ", user_nick=" + user_nick
				+ ", grade=" + grade + ", gender=" + gender + ", phone=" + phone + ", height=" + height + ", age=" + age
				+ ", address=" + address + ", user_into=" + user_into + ", gay=" + gay + ", r_count=" + r_count
				+ ", updata_date=" + updata_date + ", status=" + status + ", pay_status=" + pay_status + ", kakao="
				+ kakao + "]";
	}

	
	
	
	
	
}
