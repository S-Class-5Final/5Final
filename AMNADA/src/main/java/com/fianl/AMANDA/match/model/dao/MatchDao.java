package com.fianl.AMANDA.match.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fianl.AMANDA.match.model.vo.MemberImg;
import com.fianl.AMANDA.member.model.vo.Member;


@Repository("matchDao")
public class MatchDao {
	@Autowired
	SqlSessionTemplate sqlSession;

	public ArrayList<Member> selectMlist(Member m) {
		return (ArrayList)sqlSession.selectList("matchMapper.selectMlist", m);
	}

	public ArrayList<MemberImg> selectPlist(MemberImg mi) {
		return (ArrayList)sqlSession.selectList("matchMapper.selectPlist", mi);
	}
}
