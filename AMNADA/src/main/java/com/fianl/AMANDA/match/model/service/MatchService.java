package com.fianl.AMANDA.match.model.service;

import java.util.ArrayList;

import com.fianl.AMANDA.match.model.vo.MemberImg;
import com.fianl.AMANDA.member.model.vo.Member;


public interface MatchService {

	/*
	 * 회원리스트
	 */
	ArrayList<Member> selectMlist(Member m);
	
	
	/*
	 * 회원 사진 리스트
	 */
	ArrayList<MemberImg> selectPlist(MemberImg mi);
	
	/*
	 * 
	 */
	
	
	/*
	 * 
	 */
	
	
	/*
	 * 
	 */
	
	
	/*
	 * 
	 */
}
