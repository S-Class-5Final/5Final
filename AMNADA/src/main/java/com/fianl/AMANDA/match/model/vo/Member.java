package com.fianl.AMANDA.match.model.vo;

import java.sql.Date;

/**
 * @author GLENN
 *
 */
public class Member {
//	<id property="u_mid" column="U_MID"/>
//	<result property="user_id" column="USER_ID"/>
//	<result property="user_nick" column="USER_NICK"/>
//	<result property="gender" column="GENDER"/>
//	<result property="height" column="HEIGHT"/>
//	<result property="age" column="AGE"/>
//	<result property="address" column="ADDRESS"/>
//	<result property="user_into" column="USER_INTO"/>
//	<result property="gay" column="GAY"/>
//	<result property="status" column="STATUS"/>
//	<result property="kakao" column="KAKAO"/>
	private int u_mid;
	private String user_id;
	private String user_nick;
	private String gender;
	private int height;
	private int age;
	private String address;
	private String user_into;
	private String gay;
	private String status;
	private String kakao;
//	private String renameFileName;
	
	public Member() {
	}

	public Member(int u_mid, String user_id, String user_nick, String gender, int height, int age, String address,
			String user_into, String gay, String status, String kakao) {
		super();
		this.u_mid = u_mid;
		this.user_id = user_id;
		this.user_nick = user_nick;
		this.gender = gender;
		this.height = height;
		this.age = age;
		this.address = address;
		this.user_into = user_into;
		this.gay = gay;
		this.status = status;
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

	public String getUser_nick() {
		return user_nick;
	}

	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getKakao() {
		return kakao;
	}

	public void setKakao(String kakao) {
		this.kakao = kakao;
	}

	@Override
	public String toString() {
		return "Member [u_mid=" + u_mid + ", user_id=" + user_id + ", user_nick=" + user_nick + ", gender=" + gender
				+ ", height=" + height + ", age=" + age + ", address=" + address + ", user_into=" + user_into + ", gay="
				+ gay + ", status=" + status + ", kakao=" + kakao + "]";
	}
}
