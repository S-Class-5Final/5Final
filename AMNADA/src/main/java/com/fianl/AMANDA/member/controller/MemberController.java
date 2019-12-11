package com.fianl.AMANDA.member.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
//네이버
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
//
@SessionAttributes("loginUser")
@Controller
public class MemberController {

	@Autowired
	private MemberService mService;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	
	  //구글
	  
//	  @Autowired 
//	  private ResourceLoader resourceLoader;	 
//	  @Autowired 
//	  private CloudVisionTemplate cloudVisionTemplate; //
	 	
	@RequestMapping("minsert.do")
	public String memberInsert(Member m, Model model, Hobby h, HttpServletRequest request,
			@RequestParam("phone1") String p1, @RequestParam("phone2") String p2, @RequestParam("phone3") String p3,
			@RequestParam("user_email") String user_email,
			@RequestParam(value = "thumbnailImg1", required = false) MultipartFile Img1,
			@RequestParam(value = "thumbnailImg2", required = false) MultipartFile Img2,
			@RequestParam(value = "thumbnailImg3", required = false) MultipartFile Img3) {
		String phone = p1 + "-" + p2 + "-" + p3;
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
		MultipartFile Img[] = { Img1, Img2, Img3 };
		MemberImg[] mImglist = new MemberImg[Img.length];
		MemberImg mImg = null;
//		System.out.println(mImglist.length);

		for (int i = 0; i < Img.length; i++) {
			if (!Img[i].getOriginalFilename().contentEquals("")) {
				String renameFileName = saveFile(Img[i], request, i);
//				System.out.println(renameFileName);
//				System.out.println(Img[i].getOriginalFilename());
				mImg = new MemberImg();
				mImg.setUser_id(m.getUser_id());
//				System.out.println(mImglist);

				if (renameFileName != null) { // 파일이 잘 저장된 경우
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

		if ((memberResult > 0) && (hobbyResult > 0) && (memberImgReuslt > 0)) {
			return "home";
		} else {
			throw new MemberException("회원가입 실패하셨습니다.");
		}
	}

	public String saveFile(MultipartFile file, HttpServletRequest request, int i) {
		// 파일이 저장될 경로 설정 하는 메소드

		String root = request.getSession().getServletContext().getRealPath("resources");

		String savePath = root + "\\userface";

		File folder = new File(savePath);

		if (!folder.exists()) {
			folder.mkdirs();
		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss" + i);
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
				+ originFileName.substring(originFileName.lastIndexOf(".") + 1);

		String filePath = folder + "\\" + renameFileName;

		try {
			file.transferTo(new File(filePath));// 이때 파일이 저장된다.
			// 이게 실행되서 파일 경로에 저장될려면 pom.xml에서 파일 업로드 관련 라이브러리 두개를 추가하고
			// root-context.xml에서 파일 크기 지정을 해줘야 하지만 파일이 저장이 된다.
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}
		return renameFileName;
	}
	


	@RequestMapping("mlogin.do")
	public String memberLogin(Model model, @RequestParam("loginId") String user_id,
			@RequestParam("loginPwd") String user_pwd) {
		Member m = new Member(user_id, user_pwd);
		/*
		 * matches() 메소드를 통해 우리는 암호화되어 있는 DB값과 사용자가 입력한 비밀번호를 비교할 수 있다. 당연히 일치하면 로그인
		 * 성공!, 실패하면 로그인 실패!
		 */
		String msg = "아이디 및 비밀번호 확인해 주세요";
		Member loginUser = mService.loginMember(m);

		if (bcryptPasswordEncoder.matches(m.getUser_pwd(), loginUser.getUser_pwd())) {
			model.addAttribute("loginUser", loginUser);
		} else {
			model.addAttribute("msg", msg);
//				throw new MemberException("로그인 실패");
		}

		return "home";
	}

	// 회원가입 아이디 유효성 검사
	@RequestMapping("minsertIdCheck.do")
	@ResponseBody
	public void minsertIdCheck(HttpServletResponse response, String user_id, String user_email)
			throws JsonIOException, IOException {
		String id = null;
		if (user_email == null) {
			id = user_id;
		} else {
			id = user_id + "@" + user_email;
			System.out.println(id);
		}

		boolean IDCheck = mService.minsertIdCheck(id) == 0 ? true : false;

		System.out.println(IDCheck);

		new Gson().toJson(IDCheck, response.getWriter());
	}

	// 회원가입 닉네임 유효성 검사
	@RequestMapping("minsertNickCheck.do")
	public void minsertNickCheck(HttpServletResponse response, String user_nick) throws JsonIOException, IOException {
		boolean NickCheck = mService.minsertNickCheck(user_nick) == 0 ? true : false;

		new Gson().toJson(NickCheck, response.getWriter());
	}

	// 로그인 처리
	@RequestMapping("mloginCheck.do")
	public void loginCheck(HttpServletResponse response, String user_id, String user_pwd)
			throws JsonIOException, IOException {

		boolean IDCheck = mService.minsertIdCheck(user_id) == 0 ? true : false;
		int msg = 0;
		if (IDCheck == false) {
			Member m = new Member(user_id, user_pwd);
			Member loginUser = mService.loginMember(m);

			if (bcryptPasswordEncoder.matches(m.getUser_pwd(), loginUser.getUser_pwd())) {
				msg = 2;
				new Gson().toJson(msg, response.getWriter());
			} else {
				msg = 1;
				new Gson().toJson(msg, response.getWriter());
			}
		} else {
			msg = 0;
			new Gson().toJson(msg, response.getWriter());
		}
	}

	// 비밀번호 찾기
	@RequestMapping("mSerchPwd.do")
	public String SerchPwd(Model model, HttpServletRequest request, @RequestParam("serchId") String user_id,
			@RequestParam("findPwd") String user_pwd) {
		String encPwd = bcryptPasswordEncoder.encode(user_pwd);
		Member m = new Member(user_id, encPwd);

		mService.mUpdatePwd(m);

		return "home";
	}

	// 카카오 로그인
	@RequestMapping("kakaoLogin.do")
	public void kakaoLogin(HttpServletResponse response, HttpServletRequest request, String kakaoId, String kakaoEmail)
			throws JsonIOException, IOException {
		int data = 0;
		Member m = new Member();
		m.setKakao(kakaoId);
		m.setUser_id(kakaoEmail);
		System.out.println(m);

		boolean IDCheck = mService.minsertIdCheck(kakaoEmail) == 0 ? true : false;
		// 카카오 이메일이 이미 존재 했을때
		if (IDCheck == false) {
			// 카카오 아이디와 카카오 이메일을 비교ㅕ
			int kakaoCheck = mService.mloginkakaoCheck(m);
			// 비교 값이 0 즉 일치 하지않는다면
			if (kakaoCheck == 0) {
				// 누군가가 이메일을 등록했으니 이메일 사용 x
				data = 0;
				new Gson().toJson(data, response.getWriter());
			} else {
				// 일치한다면 로그인 성공
				data = 1;
				Member loginUser = mService.loginMember(m);
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", loginUser);
				new Gson().toJson(data, response.getWriter());
			}
		} else {// 카카오 이메일가 존재 하지않을때
				// 카카오 ID를 체크 (이미 누군가가 카카오 ID로 회원가입을 했을시를 대비)
			int kakaoIdCheck = mService.mloginkakaoIdCheck(m);
			if (kakaoIdCheck == 0) {// 카카오 ID도 없을시
				// 회원가입 실시
				data = 2;
				new Gson().toJson(data, response.getWriter());
			} else {
				// 이미 가입한 카카오 아이디가 있음 을 넘김;
				data = 3;
				new Gson().toJson(data, response.getWriter());
			}

		}

		System.out.println(IDCheck);

	}

	
	  //구글
	/*
	@RequestMapping("processImage.do")
	public void processImage() {
		org.springframework.core.io.Resource imageResource = this.resourceLoader.getResource("my_image.jpg");
		com.google.cloud.vision.v1.AnnotateImageResponse response = this.cloudVisionTemplate.analyzeImage(imageResource,
				Type.LABEL_DETECTION);
		System.out.println("Image Classification results: " + response.getLabelAnnotationsList());
	}
	
	public interface GcpProjectIdProvider {
		String getProjectId();
	}
	
	public interface CredentialsProvider {
		  Credentials getCredentials() throws IOException;
		}
		*/
	
	
	@RequestMapping("imgCheckTest.do")
	public void imgCheckTest(HttpServletRequest request , 
			@RequestParam(value = "imgtest", required = false) MultipartFile file, HttpServletResponse response) throws JsonIOException, IOException {
		System.out.println(file);
		
		if (!file.getOriginalFilename().contentEquals("")) {
			StringBuffer data = saveFile(file, request);
			System.out.println(data);
			String test = data.toString();
			System.out.println("String형 :" +test);
			String[] a = test.split("}");
			for(int i = 0 ;i < a.length;i++) {
				System.out.println(a[i]);
			}
			new Gson().toJson(data, response.getWriter());
		}
		 /*if(file != null && !file.isEmpty()) {
			 
			 
	          if(b.getRenameFileName() != null) {
	             deleteFile(b.getRenameFileName(), request);
	          }
	          String renameFileName = saveFile(file, request);
	          
	          if(renameFileName != null) {
	             b.setOriginalFileName(file.getOriginalFilename());
	             b.setRenameFileName(renameFileName);
	          }
	          int result = bService.updateBoard(b);
	          if(result > 0) {
	             mv.addObject("page", page).setViewName("redirect:blist.do");
	          }else {
	             throw new BoardException("게시글 수정 실패!!");
	          }
	          
	       }*/
	}
	public StringBuffer saveFile(MultipartFile file, HttpServletRequest request) {
		// 파일이 저장될 경로 설정 하는 메소드

		StringBuffer response = null;
		String root = request.getSession().getServletContext().getRealPath("resources");

		String savePath = root + "\\testimg";

		File folder = new File(savePath);

		if (!folder.exists()) {
			folder.mkdirs();
		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
				+ originFileName.substring(originFileName.lastIndexOf(".") + 1);

		String filePath = folder + "\\" + renameFileName;

		try {
			file.transferTo(new File(filePath));// 이때 파일이 저장된다.
			// 이게 실행되서 파일 경로에 저장될려면 pom.xml에서 파일 업로드 관련 라이브러리 두개를 추가하고
			// root-context.xml에서 파일 크기 지정을 해줘야 하지만 파일이 저장이 된다.

	        String clientId = "sIBegls0WbFYjxc6c7CV";//애플리케이션 클라이언트 아이디값";
	        String clientSecret = "0bgpNX9UfD";//애플리케이션 클라이언트 시크릿값";

	        try {
	            String paramName = "image"; // 파라미터명은 image로 지정
	            String imgFile = filePath;
	            File uploadFile = new File(imgFile);
	            //String apiURL = "https://openapi.naver.com/v1/vision/celebrity"; // 유명인 얼굴 인식
	            String apiURL = "https://openapi.naver.com/v1/vision/face"; // 얼굴 감지
	            URL url = new URL(apiURL);
	            HttpURLConnection con = (HttpURLConnection)url.openConnection();
	            con.setUseCaches(false);
	            con.setDoOutput(true);
	            con.setDoInput(true);
	            
	            // multipart request
	            String boundary = "---" + System.currentTimeMillis() + "---";
	            con.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
	            con.setRequestProperty("X-Naver-Client-Id", clientId);
	            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	            OutputStream outputStream = con.getOutputStream();
	            PrintWriter writer = new PrintWriter(new OutputStreamWriter(outputStream, "UTF-8"), true);
	            String LINE_FEED = "\r\n";
	            
	            // file 추가
	            String fileName = uploadFile.getName();
	            writer.append("--" + boundary).append(LINE_FEED);
	            writer.append("Content-Disposition: form-data; name=\"" + paramName + "\"; filename=\"" + fileName + "\"").append(LINE_FEED);
	            writer.append("Content-Type: "  + URLConnection.guessContentTypeFromName(fileName)).append(LINE_FEED);
	            writer.append(LINE_FEED);
	            writer.flush();
	            FileInputStream inputStream = new FileInputStream(uploadFile);
	            
	            byte[] buffer = new byte[4096];
	            int bytesRead = -1;
	            while ((bytesRead = inputStream.read(buffer)) != -1) {
	                outputStream.write(buffer, 0, bytesRead);
	            }
	            outputStream.flush();
	            inputStream.close();
	            writer.append(LINE_FEED).flush();
	            writer.append("--" + boundary + "--").append(LINE_FEED);
	            writer.close();
	            BufferedReader br = null;
	            int responseCode = con.getResponseCode();
	            if(responseCode==200) { // 정상 호출
	                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	                System.out.println("con값 : " + con.getInputStream().toString());
	                System.out.println("br값 :" + br.toString());
	            } else {  // 에러 발생
	                System.out.println("error!!!!!!! responseCode= " + responseCode);
	                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	            }
	            String inputLine;
	            if(br != null) {
	                response = new StringBuffer();
	                while ((inputLine = br.readLine()) != null) {
	                    response.append(inputLine);
	                }
	                br.close();
	                System.out.println(response.toString());
	            } else {
	                System.out.println("error !!!");
	            }
	        } catch (Exception e) {
	            System.out.println(e);
	        }
			
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}
		return response;
	}
	
	@RequestMapping("faceImgCheck.do")
	public void faceImgCheck(String imgtest) {
		        StringBuffer reqStr = new StringBuffer();
		        String clientId = "sIBegls0WbFYjxc6c7CV";//애플리케이션 클라이언트 아이디값";
		        String clientSecret = "0bgpNX9UfD";//애플리케이션 클라이언트 시크릿값";

		        try {
		            String paramName = "image"; // 파라미터명은 image로 지정
		            String imgFile = imgtest;
		            File uploadFile = new File(imgFile);
		           // String apiURL = "https://openapi.naver.com/v1/vision/celebrity"; // 유명인 얼굴 인식
		            String apiURL = "https://openapi.naver.com/v1/vision/face"; // 얼굴 감지
		            URL url = new URL(apiURL);
		            HttpURLConnection con = (HttpURLConnection)url.openConnection();
		            con.setUseCaches(false);
		            con.setDoOutput(true);
		            con.setDoInput(true);
		            // multipart request
		            String boundary = "---" + System.currentTimeMillis() + "---";
		            con.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
		            con.setRequestProperty("X-Naver-Client-Id", clientId);
		            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
		            OutputStream outputStream = con.getOutputStream();
		            PrintWriter writer = new PrintWriter(new OutputStreamWriter(outputStream, "UTF-8"), true);
		            String LINE_FEED = "\r\n";
		            // file 추가
		            String fileName = uploadFile.getName();
		            writer.append("--" + boundary).append(LINE_FEED);
		            writer.append("Content-Disposition: form-data; name=\"" + paramName + "\"; filename=\"" + fileName + "\"").append(LINE_FEED);
		            writer.append("Content-Type: "  + URLConnection.guessContentTypeFromName(fileName)).append(LINE_FEED);
		            writer.append(LINE_FEED);
		            writer.flush();
		            FileInputStream inputStream = new FileInputStream(uploadFile);
		            byte[] buffer = new byte[4096];
		            int bytesRead = -1;
		            while ((bytesRead = inputStream.read(buffer)) != -1) {
		                outputStream.write(buffer, 0, bytesRead);
		            }
		            outputStream.flush();
		            inputStream.close();
		            writer.append(LINE_FEED).flush();
		            writer.append("--" + boundary + "--").append(LINE_FEED);
		            writer.close();
		            BufferedReader br = null;
		            int responseCode = con.getResponseCode();
		            if(responseCode==200) { // 정상 호출
		                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		            } else {  // 에러 발생
		                System.out.println("error!!!!!!! responseCode= " + responseCode);
		                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		            }
		            String inputLine;
		            if(br != null) {
		                StringBuffer response = new StringBuffer();
		                while ((inputLine = br.readLine()) != null) {
		                    response.append(inputLine);
		                }
		                br.close();
		                System.out.println(response.toString());
		            } else {
		                System.out.println("error !!!");
		            }
		        } catch (Exception e) {
		            System.out.println(e);
		        }
		    }
	
}
