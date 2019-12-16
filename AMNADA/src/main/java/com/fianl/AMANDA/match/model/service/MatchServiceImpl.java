package com.fianl.AMANDA.match.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fianl.AMANDA.match.model.dao.MatchDao;
import com.fianl.AMANDA.match.model.vo.MemberImg;
import com.fianl.AMANDA.member.model.vo.Member;


@Service("matchService")
public class MatchServiceImpl implements MatchService {
	
	@Autowired
	MatchDao matchDao;

	@Override
	public ArrayList<Member> selectMlist(Member m) {
		return matchDao.selectMlist(m);
	}

	public ArrayList<MemberImg> selectPlist(MemberImg mi) {
		return matchDao.selectPlist(mi);
	}

	
}
