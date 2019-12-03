package com.fianl.AMANDA.member.model.service;

import com.fianl.AMANDA.member.model.vo.Hobby;
import com.fianl.AMANDA.member.model.vo.Member;
import com.fianl.AMANDA.member.model.vo.MemberImg;

public interface MemberService {
	int insertMember(Member m);
	
	int insertHobby(Hobby h);
	
	int insertMemberImg(MemberImg[] mImglist);

	Member loginMember(Member m);
}
