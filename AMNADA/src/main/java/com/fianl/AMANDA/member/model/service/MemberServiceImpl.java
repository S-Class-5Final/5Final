package com.fianl.AMANDA.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fianl.AMANDA.member.model.dao.MemberDao;
import com.fianl.AMANDA.member.model.vo.Hobby;
import com.fianl.AMANDA.member.model.vo.Member;
import com.fianl.AMANDA.member.model.vo.MemberImg;

@Service("mService")
public class MemberServiceImpl implements MemberService{

	
		@Autowired
		MemberDao mDao;

		@Override
		public int insertMember(Member m) {
			return mDao.insertMember(m);
		}

		@Override
		public int insertHobby(Hobby h) {
			return mDao.insertHobby(h);
		}

		@Override
		public int insertMemberImg(MemberImg[] mImglist) {
			// TODO Auto-generated method stub
			return mDao.insetMemberImg(mImglist);
		}

		@Override
		public Member loginMember(Member m) {
			return mDao.loginMember(m);
		}

		@Override
		public int minsertIdCheck(String id) {
			return mDao.minsertIdCheck(id);
		}

		@Override
		public int minsertNickCheck(String user_nick) {
			return mDao.minsertNickCheck(user_nick);
		}

		@Override
		public int mUpdatePwd(Member m) {
			return mDao.mUpdatePwd(m);
		}

		@Override
		public int mloginkakaoCheck(Member m) {
			return mDao.mloginkakaoCheck(m);
		}

		@Override
		public int mloginkakaoIdCheck(Member m) {
			return mDao.mloginkakaoIdCheck(m);
		}


}
