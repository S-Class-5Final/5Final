package com.fianl.AMANDA.member.model.vo;

public class Hobby {
	private String user_id;
	private String movie;
	private String sing;
	private String game;
	private String jmt;
	private String pet;
	private String cafe;
	private String working;
	private String poto;
	private String travel;
	public Hobby() {
		super();
	}
	public Hobby(String user_id, String movie, String sing, String game, String jmt, String pet, String cafe,
			String working, String poto, String travel) {
		super();
		this.user_id = user_id;
		this.movie = movie;
		this.sing = sing;
		this.game = game;
		this.jmt = jmt;
		this.pet = pet;
		this.cafe = cafe;
		this.working = working;
		this.poto = poto;
		this.travel = travel;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getMovie() {
		return movie;
	}
	public void setMovie(String movie) {
		this.movie = movie;
	}
	public String getSing() {
		return sing;
	}
	public void setSing(String sing) {
		this.sing = sing;
	}
	public String getGame() {
		return game;
	}
	public void setGame(String game) {
		this.game = game;
	}
	public String getJmt() {
		return jmt;
	}
	public void setJmt(String jmt) {
		this.jmt = jmt;
	}
	public String getPet() {
		return pet;
	}
	public void setPet(String pet) {
		this.pet = pet;
	}
	public String getCafe() {
		return cafe;
	}
	public void setCafe(String cafe) {
		this.cafe = cafe;
	}
	public String getWorking() {
		return working;
	}
	public void setWorking(String working) {
		this.working = working;
	}
	public String getPoto() {
		return poto;
	}
	public void setPoto(String poto) {
		this.poto = poto;
	}
	public String getTravel() {
		return travel;
	}
	public void setTravel(String travel) {
		this.travel = travel;
	}
	@Override
	public String toString() {
		return "Hobby [user_id=" + user_id + ", movie=" + movie + ", sing=" + sing + ", game=" + game + ", jmt=" + jmt
				+ ", pet=" + pet + ", cafe=" + cafe + ", working=" + working + ", poto=" + poto + ", travel=" + travel
				+ "]";
	}
	
}
