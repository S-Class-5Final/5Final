package com.fianl.AMANDA.Message.model.service;

import java.util.ArrayList;

import com.fianl.AMANDA.Message.model.vo.Message;
import com.fianl.AMANDA.member.model.vo.Member;

public interface MessageService {

	int insertMessage(Message m);

	ArrayList<Message> sendMsg(Message ms);

	ArrayList<Message> sendFromMsg(Message ms);

	Message selectMessage(Message no);

	int updateMessage(Message no);

	int deleteMsg(Message no);

	int alramList(Message m);


	

}
