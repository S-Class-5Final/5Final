package com.fianl.AMANDA.match.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fianl.AMANDA.match.model.exception.MatchException;
import com.fianl.AMANDA.match.model.service.MatchServiceImpl;
import com.fianl.AMANDA.match.model.vo.MemberImg;
import com.fianl.AMANDA.member.model.vo.Member;
import com.google.gson.Gson;
import com.google.gson.JsonIOException;


@Controller
public class MatchController {
	
	@Autowired
	MatchServiceImpl matchService;
	
	
	/*
	 * 회원 리스트
	 */
   @RequestMapping("mList.do")
   @ResponseBody
   public void Mlist(HttpServletResponse response, HttpSession session, Member m, MemberImg mi) throws JsonIOException, IOException {
      response.setContentType("application/json; charset=utf-8");
      
      ArrayList<Member> mlist = matchService.selectMlist(m);
      ArrayList<MemberImg> plist = matchService.selectPlist(mi);
      
      session.setAttribute("mlist", mlist);
      session.setAttribute("plist", plist);
      
      
      
      if(mlist != null && mlist.size() > 0) {
    	  new Gson().toJson(mlist, response.getWriter());
      }else {
         throw new MatchException("조회 실패");
      }
   }
	
   
   /*
    * 사진 리스트
    */
//   @RequestMapping("pList.do")
//   @ResponseBody
//   public void Plist(HttpServletResponse response, MemberImg mi) throws JsonIOException, IOException {
//      response.setContentType("application/json; charset=utf-8");
//      
//      ArrayList<MemberImg> plist = matchService.selectPlist(mi);
//      System.out.println("사진리스트" + plist);
//      
//      if(plist != null && plist.size() > 0) {
//    	  new Gson().toJson(plist, response.getWriter());
//      }else {
//         throw new MatchException("조회 실패");
//      }
//   }
}
