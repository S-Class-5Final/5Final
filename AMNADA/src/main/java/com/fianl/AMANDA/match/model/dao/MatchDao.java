package com.fianl.AMANDA.match.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fianl.AMANDA.match.model.vo.Hate;
import com.fianl.AMANDA.match.model.vo.Match;
import com.fianl.AMANDA.match.model.vo.MemberImg;
import com.fianl.AMANDA.member.model.vo.Member;


@Repository("matchDao")
public class MatchDao {
	@Autowired
	SqlSessionTemplate sqlSession;

//	public ArrayList<Member> selectMlist(Member m) {
//		return (ArrayList)sqlSession.selectList("matchMapper.selectMlist", m);
//	}
	public ArrayList<Member> selectMlist(HashMap<String, Object> map) {
		return (ArrayList)sqlSession.selectList("matchMapper.selectMlist", map);
	}

	public ArrayList<MemberImg> selectPlist(MemberImg mi) {
		return (ArrayList)sqlSession.selectList("matchMapper.selectPlist", mi);
	}

	public int likeInsert(Match ml) {
		return sqlSession.insert("matchMapper.likeInsert", ml);
	}

	public int HateInsert(Hate h) {
		return sqlSession.insert("matchMapper.HateInsert", h);
	}

	public ArrayList<Member> selectMFlist(HashMap<String, Object> map) {
		return (ArrayList)sqlSession.selectList("matchMapper.selectMFlist", map);
	}

	public ArrayList<Member> selectMFYlist(HashMap<String, Object> map) {
		return (ArrayList)sqlSession.selectList("matchMapper.selectMFYlist", map);
	}

	public ArrayList<Member> selectMMlist(HashMap<String, Object> map) {
		return (ArrayList)sqlSession.selectList("matchMapper.selectMMlist", map);
	}

	public ArrayList<Member> selectMMYlist(HashMap<String, Object> map) {
		return (ArrayList)sqlSession.selectList("matchMapper.selectMMYlist", map);
	}




}
