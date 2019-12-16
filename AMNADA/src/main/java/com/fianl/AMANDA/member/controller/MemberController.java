package com.fianl.AMANDA.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.fianl.AMANDA.member.model.exception.MemberException;
import com.fianl.AMANDA.member.model.service.MemberService;
import com.fianl.AMANDA.member.model.vo.Hobby;
import com.fianl.AMANDA.member.model.vo.Member;
import com.fianl.AMANDA.member.model.vo.MemberImg;
import com.google.gson.Gson;
import com.google.gson.JsonIOException;

@SessionAttributes("loginUser")
@Controller
public class MemberController {

	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@RequestMapping("minsert.do")
	public String memberInsert(Member m, Model model, Hobby h ,HttpServletRequest request,
	@RequestParam("phone1") String p1,@RequestParam("phone2") String p2, @RequestParam("phone3") String p3,
	@RequestParam("user_email") String user_email,
	@RequestParam(value="thumbnailImg1",required=false) MultipartFile Img1,
	@RequestParam(value="thumbnailImg2",required=false) MultipartFile Img2,
	@RequestParam(value="thumbnailImg3",required=false) MultipartFile Img3) {
		String phone  = p1+ "-" + p2 + "-" +p3;
		String user_id = m.getUser_id() + "@" + user_email;
		m.setUser_id(user_id);
		String encPwd = bcryptPasswordEncoder.encode(m.getUser_pwd());
		m.setUser_pwd(encPwd);
		m.setPhone(phone);
		h.setUser_id(m.getUser_id());
//		System.out.println(m);
//		System.out.println(h);
//		System.out.println(Img1);
//		System.out.println(Img2);
//		System.out.println(Img3);
		MultipartFile Img[] = {Img1,Img2,Img3};
		MemberImg[] mImglist = new MemberImg[Img.length]; 
		MemberImg mImg = null;
//		System.out.println(mImglist.length);
		
		for(int i = 0 ;i < Img.length; i++) {
			if(!Img[i].getOriginalFilename().contentEquals("")) {
				String renameFileName = saveFile(Img[i],request,i);
//				System.out.println(renameFileName);
//				System.out.println(Img[i].getOriginalFilename());
				mImg = new MemberImg();
				mImg.setUser_id(m.getUser_id());
//				System.out.println(mImglist);
				
				  if(renameFileName != null) { // 파일이 잘 저장된 경우
				  mImg.setOriginalFileName(Img[i].getOriginalFilename());
				  mImg.setRenameFileName(renameFileName); 
				  mImg.setImg_count(i);
				  }
				  
				mImglist[i] = mImg;
				
			}	
		}
		
		int memberResult = mService.insertMember(m);
		int hobbyResult = mService.insertHobby(h);
		int memberImgReuslt = mService.insertMemberImg(mImglist);
		
		
		if((memberResult>0)&&(hobbyResult>0)&&(memberImgReuslt>0)) {
			return "home";
		} else {
			throw new MemberException("회원가입 실패하셨습니다.");
		}
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request, int i) {
		//파일이 저장될 경로 설정 하는 메소드
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath =root + "\\userface";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss" +i);
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "." + 
									originFileName.substring(originFileName.lastIndexOf(".")+1);
		
		String filePath = folder + "\\" +renameFileName;
		
		try {
			file.transferTo(new File(filePath));//이때 파일이 저장된다.
			// 이게 실행되서 파일 경로에 저장될려면 pom.xml에서 파일 업로드 관련 라이브러리 두개를 추가하고
			// root-context.xml에서 파일 크기 지정을 해줘야 하지만 파일이 저장이 된다.
		}catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}
		return renameFileName;
	}
	
	@RequestMapping("mlogin.do")
	public String memberLogin(Model model,@RequestParam("loginId") String user_id,
			@RequestParam("loginPwd") String user_pwd) {
		Member m = new Member(user_id,user_pwd);
		/*
		 * matches() 메소드를 통해 우리는 암호화되어 있는 DB값과
		 * 사용자가 입력한 비밀번호를 비교할 수 있다.
		 * 당연히 일치하면 로그인 성공!, 실패하면 로그인 실패!
		 */
		String msg = "아이디 및 비밀번호 확인해 주세요";
		Member loginUser = mService.loginMember(m);
		
	
			if (bcryptPasswordEncoder.matches(m.getUser_pwd(), loginUser.getUser_pwd())) {
				model.addAttribute("loginUser", loginUser);
			} else {
				model.addAttribute("msg", msg);
//				throw new MemberException("로그인 실패");
			}

		
		return "common/matching";
	}
	
	//회원가입 아이디 유효성 검사
	@RequestMapping("minsertIdCheck.do")
	@ResponseBody
	public void minsertIdCheck(HttpServletResponse response ,String user_id, String user_email) throws JsonIOException, IOException {
	String id = null;
		if(user_email == null) {
			id= user_id; 
		}else {
			id = user_id +"@" + user_email;
			System.out.println(id);
		}

		
		
		boolean IDCheck = mService.minsertIdCheck(id) ==0 ? true : false;
		
		System.out.println(IDCheck);
		
		new Gson().toJson(IDCheck,response.getWriter());
	}
	
	//회원가입 닉네임 유효성 검사
	@RequestMapping("minsertNickCheck.do")
	public void minsertNickCheck(HttpServletResponse response,String user_nick) throws JsonIOException, IOException {
		boolean NickCheck = mService.minsertNickCheck(user_nick) == 0 ? true : false;
		
		new Gson().toJson(NickCheck,response.getWriter());
	}
	
	//로그인 처리
	@RequestMapping("mloginCheck.do")
	public void loginCheck(HttpServletResponse response, String user_id , String user_pwd) throws JsonIOException, IOException {
		
		boolean IDCheck = mService.minsertIdCheck(user_id) ==0 ? true : false;
		int msg = 0;
		if(IDCheck == false) {
			Member m = new Member(user_id,user_pwd);
			Member loginUser = mService.loginMember(m);
			
			if (bcryptPasswordEncoder.matches(m.getUser_pwd(), loginUser.getUser_pwd())) {
				msg = 2;
				new Gson().toJson(msg, response.getWriter());
			} else {
				msg = 1;
				new Gson().toJson(msg, response.getWriter());
			}
		}else {
			msg= 0;
			new Gson().toJson(msg,response.getWriter());
		}
	}
	//비밀번호 찾기
	 @RequestMapping("mSerchPwd.do")
	 public String SerchPwd (Model model,HttpServletRequest request,
		@RequestParam("serchId") String user_id ,@RequestParam("findPwd") String user_pwd) {
		 String encPwd = bcryptPasswordEncoder.encode(user_pwd);
		 Member m = new Member(user_id,encPwd);
		 
		 mService.mUpdatePwd(m);
		 

		 return "home";
	 }
	
	
}