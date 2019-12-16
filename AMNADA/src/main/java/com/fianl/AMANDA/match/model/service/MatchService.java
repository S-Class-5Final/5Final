package com.fianl.AMANDA.match.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.fianl.AMANDA.match.model.vo.Hate;
import com.fianl.AMANDA.match.model.vo.Match;
import com.fianl.AMANDA.match.model.vo.MemberImg;
import com.fianl.AMANDA.member.model.vo.Member;


public interface MatchService {

	/*
	 * 회원리스트
	 */
	//ArrayList<Member> selectMlist(Member m);
	ArrayList<Member> selectMlist(HashMap<String, Object> map);
	
	
	/*
	 * 회원 사진 리스트
	 */
	ArrayList<MemberImg> selectPlist(MemberImg mi);
	
	/*
	 * 좋아요 매칭 
	 */
	public int  likeInsert(Match ml);
	
	/*
	 * 
	 */
	public int HateInsert(Hate h);

	
	/*
	 * 
	 */
	
	
	/*
	 * 
	 */
}
