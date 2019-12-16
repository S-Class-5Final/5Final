package com.fianl.AMANDA.match.model.vo;

public class Hate {
//	HATENO	NUMBER
//	U_MID	NUMBER
//	H_SENDER	VARCHAR2(500 BYTE)
//	H_RECEIVER	VARCHAR2(500 BYTE)
//	H_STATUS	VARCHAR2(10 BYTE)
	
	private int hateNo;
	private int userNo;
	private String H_Sender;
	private String H_Receiver;
	private String H_Status;
	
	public Hate() {
		super();
	}
	
	public Hate(int hateNo, int userNo, String h_Sender, String h_Receiver, String h_Status) {
		super();
		this.hateNo = hateNo;
		this.userNo = userNo;
		H_Sender = h_Sender;
		H_Receiver = h_Receiver;
		H_Status = h_Status;
	}
	
	public int getHateNo() {
		return hateNo;
	}
	public void setHateNo(int hateNo) {
		this.hateNo = hateNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getH_Sender() {
		return H_Sender;
	}
	public void setH_Sender(String h_Sender) {
		H_Sender = h_Sender;
	}
	public String getH_Receiver() {
		return H_Receiver;
	}
	public void setH_Receiver(String h_Receiver) {
		H_Receiver = h_Receiver;
	}
	public String getH_Status() {
		return H_Status;
	}
	public void setH_Status(String h_Status) {
		H_Status = h_Status;
	}
	@Override
	public String toString() {
		return "Hate [hateNo=" + hateNo + ", userNo=" + userNo + ", H_Sender=" + H_Sender + ", H_Receiver=" + H_Receiver
				+ ", H_Status=" + H_Status + "]";
	}
	
	
}
