package com.fianl.AMANDA.Message.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fianl.AMANDA.Message.model.vo.Message;
import com.fianl.AMANDA.member.model.vo.Member;

@Repository("messageDao")
public class MessageDao {
	@Autowired
	SqlSessionTemplate sqlSession;

	public int messageInsert(Message m) {
		return sqlSession.insert("messageMapper.insertMessage", m);
	}

	public ArrayList<Message> sendMsg(Message ms) {
		return (ArrayList)sqlSession.selectList("messageMapper.sendMsg", ms);
	}

	public ArrayList<Message> sendFromMsg(Message ms) {
		return (ArrayList)sqlSession.selectList("messageMapper.sendFromMsg", ms);
	}

	public Message selectMessage(Message no) {
		return sqlSession.selectOne("messageMapper.selectMg", no);
	}

	public int updateMessage(Message no) {
		return sqlSession.update("messageMapper.updateMg", no);
	}

	public int deleteMsg(Message no) {
		return sqlSession.update("messageMapper.deleteMsg", no);
	}

	public int alramList(Message m) {
		return sqlSession.selectOne("messageMapper.alramMsg", m);
	}



}
