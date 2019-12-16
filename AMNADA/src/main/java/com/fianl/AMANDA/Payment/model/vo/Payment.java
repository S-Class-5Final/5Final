package com.fianl.AMANDA.Payment.model.vo;

import java.sql.Date;

public class Payment {
	private String goyou;
	private String userId;
	private Date payDay;
	private Date hjDay;
	private int uMid;
	
	public Payment() {
	}

	public Payment(String goyou, String userId, Date payDay, Date hjDay, int uMid) {
		super();
		this.goyou = goyou;
		this.userId = userId;
		this.payDay = payDay;
		this.hjDay = hjDay;
		this.uMid = uMid;
	}

	public String getGoyou() {
		return goyou;
	}

	public void setGoyou(String goyou) {
		this.goyou = goyou;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getPayDay() {
		return payDay;
	}

	public void setPayDay(Date payDay) {
		this.payDay = payDay;
	}

	public Date getHjDay() {
		return hjDay;
	}

	public void setHjDay(Date hjDay) {
		this.hjDay = hjDay;
	}

	public int getuMid() {
		return uMid;
	}

	public void setuMid(int uMid) {
		this.uMid = uMid;
	}

	@Override
	public String toString() {
		return "Payment [goyou=" + goyou + ", userId=" + userId + ", payDay=" + payDay + ", hjDay=" + hjDay + ", uMid="
				+ uMid + "]";
	}

	

}
