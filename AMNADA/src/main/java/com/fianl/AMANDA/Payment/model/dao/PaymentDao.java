package com.fianl.AMANDA.Payment.model.dao;

import java.sql.Date;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.fianl.AMANDA.Payment.model.vo.Payment;
import com.fianl.AMANDA.member.model.vo.Member;

@Repository("pDao")
public class PaymentDao {
	@Autowired
	SqlSessionTemplate sqlSession;

	public int insertPay(Payment p) {
		return sqlSession.insert("paymentMapper.insertPay", p);
	}

	public int updatePay(Payment p) {
		return sqlSession.update("paymentMapper.updatePay", p);
	}

	public Member payCheck(Member m) {
		return sqlSession.selectOne("paymentMapper.payCheck", m);
	}

	
	
	
	
}
