package com.fianl.AMANDA.Payment.model.service;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.fianl.AMANDA.Payment.model.dao.PaymentDao;
import com.fianl.AMANDA.Payment.model.vo.Payment;
import com.fianl.AMANDA.member.model.vo.Member;

@Service("pService")
public class PaymentServiceImpl implements PaymentService{
	@Autowired
	PaymentDao pDao;

	@Override
	public int insertPay(Payment p) {
		return pDao.insertPay(p);
	}

	@Override
	public int updatePay(Payment p) {
		return pDao.updatePay(p);
	}

	@Override
	public Member payCheck(Member m) {
		return pDao.payCheck(m);
	}}
