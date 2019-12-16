package com.fianl.AMANDA.Like.model.service;

import java.util.ArrayList;

import com.fianl.AMANDA.Like.model.vo.Like;
import com.fianl.AMANDA.member.model.vo.Member;
import com.fianl.AMANDA.member.model.vo.MemberImg;


public interface LikeService {

	ArrayList<Member> selectSender(Member m);

	ArrayList<Member> selectReceiver(Member m);

	ArrayList<MemberImg> selectSenderImg(Member m);

	ArrayList<MemberImg> selectReceiverImg(Member m);

	int insertlikego(Like l);

	int updatelikeback(Like k);

	int selectLike(Like l);

	ArrayList<Member> selectMatchList(Member m);

	ArrayList<MemberImg> selectMatchImg(Member m);



}
