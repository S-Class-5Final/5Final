package com.fianl.AMANDA.Payment.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fianl.AMANDA.Payment.model.exception.PaymentException;
import com.fianl.AMANDA.Payment.model.service.PaymentService;
import com.fianl.AMANDA.Payment.model.vo.Payment;
import com.fianl.AMANDA.member.model.vo.Member;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
public class PaymentController {
	@Autowired
	PaymentService pService;
	
	@RequestMapping(value = "payment.do", method = RequestMethod.POST)
	public ModelAndView payment(Payment p, ModelAndView mv, String pName, String sudanKor, String price, String phone) {
		int result = pService.insertPay(p);
		int result2 = pService.updatePay(p);
		if(result > 0 && result2 >0) {
			mv.addObject("pName", pName);
			mv.addObject("sudanKor", sudanKor);
			mv.addObject("userId", p.getUserId());
			mv.addObject("pDay", p.getPayDay());
			mv.addObject("hDay", p.getHjDay());
			mv.setViewName("Payment/paymentSuccess");
			
			String api_key = "NCSHC4PJEACT6MCT";
		    String api_secret = "WBPBAYJQYZUIPTGEZQY9MOKTOJGAMZWD";
		    String content = "[AMANDA] - No1.소개팅 사이트"+ "\n" + " \n" + p.getUserId() + "님의 결제가 성공적으로 완료되었습니다.\n" + "결제 상품명 : " + pName + "\n"
		    +"결제 금액 : " + price + "원\n" + "결제 수단 : " + sudanKor + "\n" +"상품 이용기한 : " + p.getPayDay() + " 까지" +"\n";
		    Message coolsms = new Message(api_key, api_secret);

		    // 4 params(to, from, type, text) are mandatory. must be filled
		    HashMap<String, String> params = new HashMap<String, String>();
		    params.put("to", phone);
		    params.put("from", "01026470792");
		    params.put("type", "LMS");
		    params.put("text", content);
		    params.put("app_version", "test app 1.2"); // application name and version

		    try {
		      JSONObject obj = (JSONObject) coolsms.send(params);
		    } catch (CoolsmsException e) {
		      System.out.println(e.getMessage());
		      System.out.println(e.getCode());
		    }
		  
		}else {
			throw new PaymentException("결제에 실패했습니다.");
		}
		return mv;
	}
	
	@RequestMapping("OrderPage.do")
	public String OrderPage() {
		return "Payment/OrderPage";
	}
	
	@RequestMapping("SuccessReturn.do")
	public String SuccessReturn() {
		return "common/matching";
	}
	@RequestMapping("Mlogout.do")
	public String Mlogout(HttpSession session) {
		session.invalidate();
		return "redirect:home.do";
	}
	
	@RequestMapping("payCheck.do")
	public void payCheck(Member m, HttpServletResponse response) throws JsonIOException, IOException{
		Member result = pService.payCheck(m);
		String pay = result.getPay_status();
		
		Gson gson = new GsonBuilder().create();
		gson.toJson(pay, response.getWriter());
	}
	
}
