package com.fianl.AMANDA.Like.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.maven.model.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fianl.AMANDA.Like.model.exception.LikeException;
import com.fianl.AMANDA.Like.model.service.LikeService;
import com.fianl.AMANDA.Like.model.vo.Like;
import com.fianl.AMANDA.Message.model.vo.Message;
import com.fianl.AMANDA.member.model.vo.Member;
import com.fianl.AMANDA.member.model.vo.MemberImg;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

@Controller
public class LikeController {
	@Autowired
	LikeService lService;
	
	@RequestMapping("likeTo.do")
	public void likeTo(HttpServletResponse response, Member m) throws JsonIOException, IOException {
		response.setContentType("application/json;charset=utf-8");
		ArrayList<Member> result = lService.selectSender(m);
		ArrayList<MemberImg> result2 = lService.selectSenderImg(m);
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("info", result);
		map.put("image", result2);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(map, response.getWriter());
		
	}	
		
	@RequestMapping("likeListTwo.do")
	public void likeListTwo(HttpServletResponse response, Member m) throws JsonIOException, IOException {
		response.setContentType("application/json;charset=utf-8");
		ArrayList<Member> result3 = lService.selectReceiver(m);
		ArrayList<MemberImg> result4 = lService.selectReceiverImg(m);
		
		Map<String, Object> map1 = new HashMap<String, Object>();
		
		map1.put("info1", result3);
		map1.put("image1", result4);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(map1, response.getWriter());
	}
	
	@RequestMapping("LikeLists.do")
	public String LikeLists() {
		return "Like/LikeList";
	}
	
	@RequestMapping(value="LikeGo.do", method=RequestMethod.POST)
	@ResponseBody
	public String LikeGo(Like l) {
		int likeSelect = lService.selectLike(l);
		if(likeSelect < 1) {
			int likeGo = lService.insertlikego(l);
			return "success";
		}else {
			return null;
		}
	}
	@RequestMapping(value="LikeBack.do", method=RequestMethod.POST)
	@ResponseBody
	public String LikeBack(Like k, ModelAndView mv) {
		int likeBack = lService.updatelikeback(k);
		
		return "ok";
	}
	
	@RequestMapping("matchList.do")
	public void matchList(HttpServletResponse response, Member m) throws JsonIOException, IOException {
		response.setContentType("application/json;charset=utf-8");
		ArrayList<Member> result1 = lService.selectMatchList(m);
		ArrayList<MemberImg> result2 = lService.selectMatchImg(m);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("match", result1);
		map.put("matchImg", result2);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(map, response.getWriter());
	}
	
}
