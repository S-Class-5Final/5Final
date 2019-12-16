package com.fianl.AMANDA.match.model.vo;

<<<<<<< HEAD
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
	
=======
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
>>>>>>> refs/remotes/origin/master
}
 