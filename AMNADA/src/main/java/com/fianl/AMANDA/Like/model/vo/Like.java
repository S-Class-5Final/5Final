package com.fianl.AMANDA.Like.model.vo;

public class Like {
	private int likeNo;
	private int uMid;
	private String sender;
	private String receiver;
	private String likeStatus;
	private String likeSusin;
	
	public Like() {
	}
	public Like(int likeNo, int uMid, String sender, String receiver, String likeStatus, String likeSusin) {
		super();
		this.likeNo = likeNo;
		this.uMid = uMid;
		this.sender = sender;
		this.receiver = receiver;
		this.likeStatus = likeStatus;
		this.likeSusin = likeSusin;
	}
	public int getLikeNo() {
		return likeNo;
	}
	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}
	public int getuMid() {
		return uMid;
	}
	public void setuMid(int uMid) {
		this.uMid = uMid;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getLikeStatus() {
		return likeStatus;
	}
	public void setLikeStatus(String likeStatus) {
		this.likeStatus = likeStatus;
	}
	public String getLikeSusin() {
		return likeSusin;
	}
	public void setLikeSusin(String likeSusin) {
		this.likeSusin = likeSusin;
	}
	@Override
	public String toString() {
		return "Like [likeNo=" + likeNo + ", uMid=" + uMid + ", sender=" + sender + ", receiver=" + receiver
				+ ", likeStatus=" + likeStatus + ", likeSusin=" + likeSusin + "]";
	}
	
	
}
