package com.fianl.AMANDA.match.model.vo;

public class Match{
	private int likeNo;
	private String likeSender;
	private String likeReceiver;
	private int likeStatus;

	public Match() {
		super();
	}

	public Match(int likeNo, String likeSender, String likeReceiver, int likeStatus) {
		super();
		this.likeNo = likeNo;
		this.likeSender = likeSender;
		this.likeReceiver = likeReceiver;
		this.likeStatus = likeStatus;
	}

	public int getLikeNo() {
		return likeNo;
	}

	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}

	public String getLikeSender() {
		return likeSender;
	}

	public void setLikeSender(String likeSender) {
		this.likeSender = likeSender;
	}

	public String getLikeReceiver() {
		return likeReceiver;
	}

	public void setLikeReceiver(String likeReceiver) {
		this.likeReceiver = likeReceiver;
	}

	public int getLikeStatus() {
		return likeStatus;
	}

	public void setLikeStatus(int likeStatus) {
		this.likeStatus = likeStatus;
	}

	@Override
	public String toString() {
		return "Match [likeNo=" + likeNo + ", likeSender=" + likeSender + ", likeReceiver=" + likeReceiver
				+ ", likeStatus=" + likeStatus + "]";
	}
}
 