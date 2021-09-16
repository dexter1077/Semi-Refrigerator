package com.refrigerator.faq.model.service;

import static com.refrigerator.common.JDBCTemplate.close;
import static com.refrigerator.common.JDBCTemplate.getConnection;
import static com.refrigerator.common.JDBCTemplate.commit;
import static com.refrigerator.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.refrigerator.common.model.vo.PageInfo;
import com.refrigerator.faq.model.dao.FaqDao;
import com.refrigerator.faq.model.vo.Faq;

public class FaqService {
	
	/**
	 * FAQ 전체 목록 조회
	 * @author leeyeji
	 */
	public ArrayList<Faq> selectFaqList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Faq> list = new FaqDao().selectFaqList(conn, pi);
		close(conn);
		return list;
	}
	
	

	/**
	 * FAQ 전체 목록 [count] 조회
	 * @author HeeRak
	 * @return listCount
	 */
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new FaqDao().selectListCount(conn);
		close(conn);
		return listCount;
	}

	/**
	 * FAQ [페이지객체기준] 전체 목록  조회
	 * @author HeeRak
	 * @return
	 */
	public ArrayList<Faq> adminSelectFaqList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Faq> faqList = new FaqDao().adminSelectFaqList(conn, pi);
		close(conn);
		return faqList;
	}

	/**
	 * FAQ [관리자_insert] commit/rollback
	 * @author HeeRak
	 * @param f
	 * @return
	 */
	public int insertFaq(Faq f) {
		Connection conn = getConnection();
		int result = new FaqDao().insertFaq(conn, f);
		if(result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	/**
	 * FAQ / FaqNo받아 Faq객체 한개 응답
	 * @author HeeRak
	 * @param faqNo
	 * @return
	 */
	public Faq selectFaq(int faqNo) {
		Connection conn = getConnection();
		Faq f = new FaqDao().selectFaq(conn, faqNo);
		close(conn);
		return f;
	}

	/**
	 * FAQ / 수정내용 받아 update 후 commit/rollback
	 * @author HeeRak
	 * @param f
	 * @return
	 */
	public int updateFaq(Faq f) {
		Connection conn = getConnection();
		int result = new FaqDao().updateFaq(conn, f);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	/**
	 * FAQ / faqNo 받아 status="y" update
	 * @author HeeRak
	 * @param faqNo
	 * @return
	 */
	public int deleteFaq(int faqNo) {
		Connection conn = getConnection();
		int result = new FaqDao().deleteFaq(conn, faqNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
}
