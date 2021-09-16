package com.refrigerator.faq.model.dao;

import static com.refrigerator.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.refrigerator.faq.model.vo.Faq;
import com.refrigerator.common.model.vo.PageInfo;
import com.refrigerator.faq.model.dao.FaqDao;

public class FaqDao {
	
	private Properties prop = new Properties();
		
	public FaqDao() {
			
		try {
			prop.loadFromXML(new FileInputStream(FaqDao.class.getResource("/sql/faq/faq-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
			
	}
	
	/**
	 * FAQ 전체 목록 조회
	 * @author leeyeji
	 */
	
	public ArrayList<Faq> selectFaqList(Connection conn, PageInfo pi){
		// ArrayList => ResultSet 여러행
		ArrayList<Faq> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFaqList");
				
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() +1;
			int endRow = startRow + pi.getBoardLimit() -1;
					
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
					
			rset = pstmt.executeQuery();
					
			while(rset.next()) {
				list.add(new Faq(rset.getInt("faq_no"),
								 rset.getString("ques_content"),
								 rset.getString("answer_content"),
								 rset.getDate("enroll_date"),
								 rset.getDate("modify_date"),
								 rset.getInt("count")));
			}
					
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
		return list;
	}

	/**
	 * FAQ 전체 목록 [count] DB 조회
	 * @author HeeRak
	 * @return listCount 
	 */
	public int selectListCount(Connection conn) {
		// select => rset 1행반환
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	/**
	 *  FAQ [페이지객체기준]전체 목록  DB조회
	 * @author HeeRak
	 * @param conn
	 * @param pi
	 * @return
	 */
	public ArrayList<Faq> adminSelectFaqList(Connection conn, PageInfo pi) {
		// SELECT => RSET 여러행 반환
		ArrayList<Faq> faqList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("adminSelectFaqList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				faqList.add(new Faq(rset.getInt("faq_no"),
									rset.getString("ques_content"),
									rset.getString("answer_content"),
									rset.getDate("modify_date"),
									rset.getInt("count")
						    	 	));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return faqList;
	}

	/**
	 * FAQ [관리자_insert] DB insert
	 * @author HeeRak
	 * @param conn
	 * @param f
	 * @return
	 */
	public int insertFaq(Connection conn, Faq f) {
		// insert => 결과 한행 반환
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertFAQ");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, f.getQuesContent());
			pstmt.setString(2, f.getAnswerContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * FAQ /FaqNo받아 Faq객체 한개 DB응답
	 * @author HeeRak
	 * @param faqNo
	 * @return
	 */
	public Faq selectFaq(Connection conn, int faqNo) {
		// select => 결과 한행
		Faq f = new Faq();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFaq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, faqNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				f.setFaqNo(rset.getInt("faq_no"));
				f.setQuesContent(rset.getString("ques_content"));
				f.setAnswerContent(rset.getString("answer_content"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return f;
	}

	/**
	 * FAQ / 1행 수정내용 받아 update DB 
	 * @author HeeRak
	 * @param conn
	 * @param f
	 * @return
	 */
	public int updateFaq(Connection conn, Faq f) {
		// update => 처리된 행수 반환
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateFaq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, f.getQuesContent());
			pstmt.setString(2, f.getAnswerContent());
			pstmt.setInt(3, f.getFaqNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * FAQ / faqNo 받아  DB Update status='y' 
	 * @author HeeRak
	 * @param conn
	 * @param faqNo
	 * @return
	 */
	public int deleteFaq(Connection conn, int faqNo) {
		// update => 처리된 행수 반환
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteFaq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, faqNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
