package com.fianl.AMANDA.match.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fianl.AMANDA.match.model.exception.MatchException;
import com.fianl.AMANDA.match.model.service.MatchServiceImpl;
import com.fianl.AMANDA.match.model.vo.Hate;
import com.fianl.AMANDA.match.model.vo.Match;
import com.fianl.AMANDA.match.model.vo.MemberImg;
import com.fianl.AMANDA.match.model.vo.Sort;
import com.fianl.AMANDA.member.model.vo.Member;
import com.google.gson.Gson;
import com.google.gson.JsonIOException;


@Controller
public class MatchController {
	
	@Autowired
	MatchServiceImpl matchService;
	
	/*
	 * 회원 리스트
//	 */
//   @RequestMapping("mList.do")
//   @ResponseBody
//   public void Mlist(HttpServletResponse response, 
//		   			 HttpServletRequest request,
//		   			 Member m, MemberImg mi) throws JsonIOException, IOException {
//      response.setContentType("application/json; charset=utf-8");
//      HttpSession session = request.getSession();
//
//      ArrayList<Member> mlist = matchService.selectMlist(m);
//      ArrayList<MemberImg> plist = matchService.selectPlist(mi);
//      
//      System.out.println("회원리스트" + mlist);
//      System.out.println("사진리스트" + plist);
//      
//      session.setAttribute("mlist", mlist);
//      session.setAttribute("plist", plist);
//      
//      if(mlist != null && mlist.size() > 0) {
//    	  new Gson().toJson(mlist, response.getWriter());
//      }else {
//    	  throw new MatchException("조회 실패");
//      }
//   }
   
   
   
    /*  
	 * 회원 리스트
	 */
  @RequestMapping("mList.do")
  @ResponseBody
  public void Mlist(HttpServletResponse response, 
		   			 HttpServletRequest request,
		   			 Member m, MemberImg mi, Sort s,
		   			 @RequestParam("genderSelect") String genderSelect, 
		   			 @RequestParam("loginUser") String loginUser) throws JsonIOException, IOException {
     response.setContentType("application/json; charset=utf-8");
     HttpSession session = request.getSession();
    
     Member user = new Member();
     user.setUser_nick(loginUser);
     
//     if(genderSelect != null) {
//    	 genderSelect = genderSelect;
//     }else if (genderSelect == null && genderSelect == " " ) {
//    	 genderSelect = "ALL";
//	 }
//     System.out.println("성별 : " + "d" + genderSelect + "d" + genderSelect.getClass().getName());

     HashMap<String, Object> map = new HashMap<String, Object>();
     map.put("user", user);
     map.put("genderSelect", genderSelect);
     
     //System.out.println(user);
     System.out.println("성별 : " + genderSelect);
     ArrayList<Member> mlist =null;
     ArrayList<MemberImg> plist = null;
     //////////////////
     switch (genderSelect) {
	case "":
		 mlist = matchService.selectMlist(map);
		 plist = matchService.selectPlist(mi);
		 System.out.println(mlist);
		 System.out.println(plist);
		 break;
	case "F":
		 mlist = matchService.selectMFlist(map);
		 plist = matchService.selectPlist(mi);
		 System.out.println(mlist);
		 System.out.println(plist);
		break;
	case "FY":
		mlist = matchService.selectMFYlist(map);
		plist = matchService.selectPlist(mi);
		System.out.println(mlist);
		System.out.println(plist);
		break;
	case "M":
		mlist = matchService.selectMMlist(map);
		plist = matchService.selectPlist(mi);
		System.out.println(mlist);
		System.out.println(plist);
		break;
	case "MY":
		mlist = matchService.selectMMYlist(map);
		plist = matchService.selectPlist(mi);
		System.out.println(mlist);
		System.out.println(plist);
		break;
		
	}
     ////////////////
		/*
		 * mlist = matchService.selectMlist(map); 
		 * plist = matchService.selectPlist(mi);
		 */
     System.out.println("회원리스트" + mlist);
     System.out.println("사진리스트" + plist);
     
     session.setAttribute("mlist", mlist);
     session.setAttribute("plist", plist);
     
     if(mlist != null && mlist.size() > 0) {
   	  new Gson().toJson(mlist, response.getWriter());
     }else {
   	  //throw new MatchException("조회 실패");
     }
  }
   
   /*
    * 좋아요 내역 삽입
    */
   @RequestMapping("mLike.do")
   public String matchLike(@RequestParam("sender") String sender,
		   				   @RequestParam("receiver") String receiver,
		   				   Match ml) {
	   System.out.println("sender : " + sender + "\n" + "receiver : " + receiver);
	   
	   ml.setLikeSender(sender); // Session값임.
	   ml.setLikeReceiver(receiver);
	   System.out.println(ml);
	   
	   int likeResult = matchService.likeInsert(ml);
	 
	   System.out.println("잘됬나?" + likeResult);
	   
	   if(likeResult > 0) {
		   return "success";
	   }else {
		   throw new MatchException("좋아요 등록 실패");
	   }
   }
   
   /*
    * 싫어요 내역 삽입
    */
   @RequestMapping("mHate.do")
   public String matchHate(@RequestParam("sender") String sender,
		   				   @RequestParam("receiver") String receiver,
		   				   @RequestParam("userNo") int userNo, 	
		   				   Hate h) {
	   System.out.println("sender : " + sender + "\n" + "receiver : " + receiver);
	   
	   h.setH_Sender(sender); // Session값임.
	   h.setH_Receiver(receiver);
	   h.setUserNo(userNo);
	  
	   System.out.println("실험해보자~~" + h);
	   
	   int HateResult = matchService.HateInsert(h);
	   
	   System.out.println("잘됬나2?" + HateResult);
	   
	   if(HateResult > 0) {
		   return "success";
	   }else {
		   throw new MatchException("좋아요 등록 실패");
	   }
   }

   
   
   
   
}
