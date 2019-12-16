package com.fianl.AMANDA.Message.model.vo;

import java.sql.Date;

public class Message {
	private int mNo;
	private String userId;
	private String toUserId;
	private String mTitle;
	private String mContent;
	private String mDate;
	private int uMid;
	private String mStatus;
	private String mSusin;

	public Message() {
	}

	public Message(int mNo, String userId, String toUserId, String mTitle, String mContent, String mDate, int uMid,
			String mStatus, String mSusin) {
		super();
		this.mNo = mNo;
		this.userId = userId;
		this.toUserId = toUserId;
		this.mTitle = mTitle;
		this.mContent = mContent;
		this.mDate = mDate;
		this.uMid = uMid;
		this.mStatus = mStatus;
		this.mSusin = mSusin;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getToUserId() {
		return toUserId;
	}

	public void setToUserId(String toUserId) {
		this.toUserId = toUserId;
	}

	public String getmTitle() {
		return mTitle;
	}

	public void setmTitle(String mTitle) {
		this.mTitle = mTitle;
	}

	public String getmContent() {
		return mContent;
	}

	public void setmContent(String mContent) {
		this.mContent = mContent;
	}

	public String getmDate() {
		return mDate;
	}

	public void setmDate(String mDate) {
		this.mDate = mDate;
	}

	public int getuMid() {
		return uMid;
	}

	public void setuMid(int uMid) {
		this.uMid = uMid;
	}

	public String getmStatus() {
		return mStatus;
	}

	public void setmStatus(String mStatus) {
		this.mStatus = mStatus;
	}

	public String getmSusin() {
		return mSusin;
	}

	public void setmSusin(String mSusin) {
		this.mSusin = mSusin;
	}

	@Override
	public String toString() {
		return "Message [mNo=" + mNo + ", userId=" + userId + ", toUserId=" + toUserId + ", mTitle=" + mTitle
				+ ", mContent=" + mContent + ", mDate=" + mDate + ", uMid=" + uMid + ", mStatus=" + mStatus
				+ ", mSusin=" + mSusin + "]";
	}

	
}
