package com.fianl.AMANDA.match.model.vo;

public class Sort {
	private String W;
	private String W2;
	private String M;
	private String M2;
	
	public Sort() {
		super();
	}
	
	public Sort(String w, String w2, String m, String m2) {
		super();
		W = w;
		W2 = w2;
		M = m;
		M2 = m2;
	}
	
	public String getW() {
		return W;
	}
	public void setW(String w) {
		W = w;
	}
	public String getW2() {
		return W2;
	}
	public void setW2(String w2) {
		W2 = w2;
	}
	public String getM() {
		return M;
	}
	public void setM(String m) {
		M = m;
	}
	public String getM2() {
		return M2;
	}
	public void setM2(String m2) {
		M2 = m2;
	}
	
	@Override
	public String toString() {
		return "Sort [W=" + W + ", W2=" + W2 + ", M=" + M + ", M2=" + M2 + "]";
	}
}
