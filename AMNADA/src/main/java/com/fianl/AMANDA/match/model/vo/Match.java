package com.fianl.AMANDA.match.model.vo;

import java.io.Serializable;

public class Match implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 9143988633154789608L;
	private int matchNo;
	private int likes;
	
	public Match() {
		super();
	}
	
	public Match(int matchNo, int likes) {
		super();
		this.matchNo = matchNo;
		this.likes = likes;
	}
	
	public int getMatchNo() {
		return matchNo;
	}
	public void setMatchNo(int matchNo) {
		this.matchNo = matchNo;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Match [matchNo=" + matchNo + ", likes=" + likes + "]";
	}
	
}
 