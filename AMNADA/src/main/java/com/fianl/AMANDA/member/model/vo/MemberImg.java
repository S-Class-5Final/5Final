package com.fianl.AMANDA.member.model.vo;

import java.sql.Date;

public class MemberImg {
	private String user_id;
	private String originalFileName;
	private String renameFileName;
	private int img_count;
	private Date update_date;
	private String status;
	
	public MemberImg() {
		super();
	}

	public MemberImg(String user_id, String originalFileName, String renameFileName, int img_count, Date update_date,
			String status) {
		super();
		this.user_id = user_id;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
		this.img_count = img_count;
		this.update_date = update_date;
		this.status = status;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getRenameFileName() {
		return renameFileName;
	}

	public void setRenameFileName(String renameFileName) {
		this.renameFileName = renameFileName;
	}

	public int getImg_count() {
		return img_count;
	}

	public void setImg_count(int img_count) {
		this.img_count = img_count;
	}

	public Date getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "MemberImg [user_id=" + user_id + ", originalFileName=" + originalFileName + ", renameFileName="
				+ renameFileName + ", img_count=" + img_count + ", update_date=" + update_date + ", status=" + status
				+ "]";
	}


	
	
	
	
}