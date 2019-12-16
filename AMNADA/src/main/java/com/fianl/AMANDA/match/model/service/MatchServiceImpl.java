package com.fianl.AMANDA.match.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fianl.AMANDA.match.model.dao.MatchDao;
import com.fianl.AMANDA.match.model.vo.Hate;
import com.fianl.AMANDA.match.model.vo.Match;
import com.fianl.AMANDA.match.model.vo.MemberImg;
import com.fianl.AMANDA.member.model.vo.Member;


@Service("matchService")
public class MatchServiceImpl implements MatchService {
	
	@Autowired
	MatchDao matchDao;

//	@Override
//	public ArrayList<Member> selectMlist(Member m) {
//		return matchDao.selectMlist(m);
//	}
	@Override
	public ArrayList<Member> selectMlist(HashMap<String, Object> map) {
		return matchDao.selectMlist(map);
	}
	
	@Override
	public ArrayList<MemberImg> selectPlist(MemberImg mi) {
		return matchDao.selectPlist(mi);
	}
	@Override
	public int likeInsert(Match ml) {
		return matchDao.likeInsert(ml);
	}
	@Override
	public int HateInsert(Hate h) {
		return matchDao.HateInsert(h);
	}

	public ArrayList<Member> selectMFlist(HashMap<String, Object> map) {
		return matchDao.selectMFlist(map);
	}

	public ArrayList<Member> selectMFYlist(HashMap<String, Object> map) {
		return matchDao.selectMFYlist(map);
	}

	public ArrayList<Member> selectMMlist(HashMap<String, Object> map) {
		return matchDao.selectMMlist(map);
	}

	public ArrayList<Member> selectMMYlist(HashMap<String, Object> map) {
		return matchDao.selectMMYlist(map);
	}

	
	
}
