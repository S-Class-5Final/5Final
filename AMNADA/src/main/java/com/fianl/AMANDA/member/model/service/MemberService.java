package com.fianl.AMANDA.member.model.service;

import com.fianl.AMANDA.member.model.vo.Hobby;
import com.fianl.AMANDA.member.model.vo.Member;
import com.fianl.AMANDA.member.model.vo.MemberImg;

public interface MemberService {
	// insert는 회원 가입할때 만들어짐
	int insertMember(Member m);
	
	int insertHobby(Hobby h);
	
	int insertMemberImg(MemberImg[] mImglist);
	
	//로그인
	Member loginMember(Member m);
	
	//아이디 중복 검사
	int minsertIdCheck(String id);
	
	//닉네임 중복검사 
	int minsertNickCheck(String user_nick);

	int mUpdatePwd(Member m);
}