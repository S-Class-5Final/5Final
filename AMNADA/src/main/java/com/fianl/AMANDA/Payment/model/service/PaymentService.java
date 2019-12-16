package com.fianl.AMANDA.Payment.model.service;

import java.sql.Date;

import org.springframework.ui.Model;

import com.fianl.AMANDA.Payment.model.vo.Payment;
import com.fianl.AMANDA.member.model.vo.Member;

public interface PaymentService {

	int insertPay(Payment p);

	int updatePay(Payment p);

	Member payCheck(Member m);

}
