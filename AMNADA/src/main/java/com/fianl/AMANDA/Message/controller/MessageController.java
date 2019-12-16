package com.fianl.AMANDA.Message.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.fianl.AMANDA.Message.model.exception.MessageException;
import com.fianl.AMANDA.Message.model.service.MessageService;
import com.fianl.AMANDA.Message.model.vo.Message;
import com.fianl.AMANDA.member.model.vo.Member;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

@SessionAttributes("loginUser")
@Controller
public class MessageController {
	@Autowired
	MessageService messageService;
	
	@RequestMapping(value = "messageSend.do", method = RequestMethod.POST)
	public String Message(Message m, HttpSession session) {
		int result = messageService.insertMessage(m);
		
		return "Like/LikeList";
		
	}
	@RequestMapping(value = "sendMsg.do", method = RequestMethod.POST)
	public void sendMsg(HttpServletResponse response, Message ms, HttpSession session) throws JsonIOException, IOException {
		
		ArrayList<Message> result = messageService.sendMsg(ms);
		
		for(Message m : result) {
			m.setmTitle(URLEncoder.encode(m.getmTitle(), "utf-8"));
			m.setmContent(URLEncoder.encode(m.getmContent(), "utf-8"));
			m.setmSusin(URLEncoder.encode(m.getmSusin(), "utf-8"));
		}
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(result, response.getWriter());
	}
	
	@RequestMapping(value = "sendFromMsg.do", method = RequestMethod.POST)
	public void sendFromMsg(HttpServletResponse response, Message ms, HttpSession session) throws JsonIOException, IOException {
		ArrayList<Message> result = messageService.sendFromMsg(ms);
		for(Message m : result) {
			m.setmTitle(URLEncoder.encode(m.getmTitle(), "utf-8"));
			m.setmContent(URLEncoder.encode(m.getmContent(), "utf-8"));
			m.setmSusin(URLEncoder.encode(m.getmSusin(), "utf-8"));
		}
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(result, response.getWriter());
	}
	
	@RequestMapping("MsgSend.do")
	public String MsgSend() {
		return "Message/Message";
	}
	@RequestMapping("SendMsg.do")
	public String SendMsg() {
		return "Message/SendMsg";
	}
	
	@RequestMapping("susinone.do")
	public ModelAndView susinone(Message no, ModelAndView mv) {
		Message result = messageService.selectMessage(no);
		int result2 = messageService.updateMessage(no);
		mv.addObject("result", result);
		mv.setViewName("Message/susinone");
		
		return mv;
	}
	@RequestMapping("susintwo.do")
	public ModelAndView susintwo(Message no, ModelAndView mv) {
		Message result = messageService.selectMessage(no);
		mv.addObject("result", result);
		mv.setViewName("Message/susintwo");
		
		return mv;
	}
	@RequestMapping("deleteMsg.do")
	public String deleteMsg(Message no, ModelAndView mv) {
		
		int result = messageService.deleteMsg(no);
		
		return null;
	}
	@RequestMapping("ReMsg.do")
	public ModelAndView ReMsg(Message no, ModelAndView mv) {
		mv.addObject("userId", no.getUserId());
		mv.setViewName("Message/ReMsgOne");
		return mv;
	}
	
	@RequestMapping(value = "goMsgRe.do", method = RequestMethod.POST)
	public String goMsgRe(Message m, HttpSession session, HttpServletResponse response) throws UnsupportedEncodingException {
		response.setContentType("application/json;charset=utf-8");
		int result = messageService.insertMessage(m);
		if(result > 0) {
			System.out.println("전송됨");
		}
		return null;
	}
	
	@RequestMapping("alramMsg.do")
	public void alramMsg(Message m, String user_id, HttpServletResponse response) throws JsonIOException, IOException {
		m.setmSusin("읽지않음");
		m.setUserId(user_id);
		int result = messageService.alramList(m);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(result, response.getWriter());
	}
}
