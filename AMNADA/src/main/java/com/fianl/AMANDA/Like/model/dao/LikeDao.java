package com.fianl.AMANDA.Like.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fianl.AMANDA.Like.model.vo.Like;
import com.fianl.AMANDA.member.model.vo.Member;
import com.fianl.AMANDA.member.model.vo.MemberImg;

@Repository("lDao")
public class LikeDao {
	@Autowired
	SqlSessionTemplate sqlSession;

	public ArrayList<Member> selectSender(Member m) {
		return (ArrayList)sqlSession.selectList("likeMapper.selectSender", m);
	}

	public ArrayList<Member> selectReceiver(Member m) {
		return (ArrayList)sqlSession.selectList("likeMapper.selectReceiver", m);
	}

	public ArrayList<MemberImg> selectSenderImg(Member m) {
		return (ArrayList)sqlSession.selectList("likeMapper.selectSenderImg", m);
	}

	public ArrayList<MemberImg> selectReceiverImg(Member m) {
		return (ArrayList)sqlSession.selectList("likeMapper.selectReceiverImg", m);
	}

	public int insertlikego(Like l) {
		return sqlSession.insert("likeMapper.insertLike", l);
	}

	public int updatelikeback(Like k) {
		return sqlSession.update("likeMapper.updateLike", k);
	}

	public int selectLike(Like l) {
		return sqlSession.selectOne("likeMapper.selectLike", l);
	}

	public ArrayList<Member> selectMatchList(Member m) {
		return (ArrayList)sqlSession.selectList("likeMapper.selectMatchList", m);
	}

	public ArrayList<MemberImg> selectMatchImg(Member m) {
		return (ArrayList)sqlSession.selectList("likeMapper.selectMatchImg", m);
	}

	 
}
