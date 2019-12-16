package com.fianl.AMANDA.match.model.vo;

import java.sql.Date;

public class MemberImg {
	private String user_id;
	private String originalFileName;
	private String renameFileName;
	private Date update_date;
	private String status;
	
	public MemberImg() {
	}
	public MemberImg(String user_id, String originalFileName, String renameFileName, Date update_date, String status) {
		super();
		this.user_id = user_id;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
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
				+ renameFileName + ", update_date=" + update_date + ", status=" + status + "]";
	}
	
	
}
