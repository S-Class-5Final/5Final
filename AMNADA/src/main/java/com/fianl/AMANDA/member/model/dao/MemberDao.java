package com.fianl.AMANDA.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fianl.AMANDA.member.model.vo.Hobby;
import com.fianl.AMANDA.member.model.vo.Member;
import com.fianl.AMANDA.member.model.vo.MemberImg;

@Repository("mDao")
public class MemberDao {

		@Autowired
		private SqlSessionTemplate sqlSession;

		public int insertMember(Member m) {
			return sqlSession.insert("MemberMapper.insertMember",m);
		}

		public int insertHobby(Hobby h) {
			return sqlSession.insert("MemberMapper.insertHobby",h);
		}

		public int insetMemberImg(MemberImg[] mImglist) {
			int count =0;
			for(int i = 0 ;i < mImglist.length;i++) {
				sqlSession.insert("MemberMapper.insertMemberImg",mImglist[i]);	
				count = i+1;
			}
			return count;
		}

		public Member loginMember(Member m) {
			return sqlSession.selectOne("MemberMapper.loginMember",m);
		}

		public int minsertIdCheck(String user_id) {
			return sqlSession.selectOne("MemberMapper.minsertIdCheck",user_id);
		}

		public int minsertNickCheck(String user_nick) {
			return sqlSession.selectOne("MemberMapper.minsertNickCheck",user_nick);
		}

		public int mUpdatePwd(Member m) {
			return sqlSession.update("MemberMapper.mUpdatePwd",m);
		}

		public int mloginkakaoCheck(Member m) {
			return sqlSession.selectOne("MemberMapper.mloginkakaoCheck",m);
		}

		public int mloginkakaoIdCheck(Member m) {
			return sqlSession.selectOne("MemberMapper.mloginkakaoIdCheck",m);
		}


}
