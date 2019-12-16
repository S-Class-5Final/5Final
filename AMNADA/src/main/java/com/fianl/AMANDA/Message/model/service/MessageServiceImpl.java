package com.fianl.AMANDA.Message.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fianl.AMANDA.Message.model.dao.MessageDao;
import com.fianl.AMANDA.Message.model.vo.Message;
import com.fianl.AMANDA.member.model.vo.Member;


@Service("messageService")
public class MessageServiceImpl implements MessageService{
	@Autowired
	MessageDao messageDao;

	@Override
	public int insertMessage(Message m) {
		return messageDao.messageInsert(m);
	}

	@Override
	public ArrayList<Message> sendMsg(Message ms) {
		return messageDao.sendMsg(ms);
	}

	@Override
	public ArrayList<Message> sendFromMsg(Message ms) {
		return messageDao.sendFromMsg(ms);
	}



	@Override
	public Message selectMessage(Message no) {
		return messageDao.selectMessage(no);
	}

	@Override
	public int updateMessage(Message no) {
		return messageDao.updateMessage(no);
	}

	@Override
	public int deleteMsg(Message no) {
		return messageDao.deleteMsg(no);
	}

	@Override
	public int alramList(Message m) {
		return messageDao.alramList(m);
	}






}
