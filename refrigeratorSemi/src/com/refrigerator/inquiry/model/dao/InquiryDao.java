package com.refrigerator.inquiry.model.dao;

import static com.refrigerator.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.refrigerator.common.model.vo.PageInfo;
import com.refrigerator.inquiry.model.vo.Inquiry;

/**
 * @author Heerak 05.27
 *
 */
public class InquiryDao {
	private Properties prop = new Properties();

	public InquiryDao() {
		
		String filePath = InquiryDao.class.getResource("/sql/inquiry/inquiry-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * HeeRak _ 1:1문의 [미해결] 문의수 DB Count
	 * @param conn
	 * @return
	 */
	public int selectUnsolvedListCount(Connection conn) {
		//select문
		int unSolvedListCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectUnsolvedListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				unSolvedListCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return unSolvedListCount;
	}
	
	/**
	 * HeeRak _ 1:1문의 [해결] 문의수 DB Count
	 * @param conn
	 * @return
	 */
	public int selectSolvedListCount(Connection conn) {
		//select문
		int solvedListCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectSolvedListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				solvedListCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return solvedListCount;
	}

	/**
	 * Heerak [문의/답변] 미해결 문의 list DB전체조회
	 * @param conn
	 * @param pi
	 * @return
	 */
	public ArrayList<Inquiry> selectUnSolvedList(Connection conn, PageInfo pi) {
		// select문
		ArrayList<Inquiry> unSolvedList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectUnSolvedList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				unSolvedList.add(new Inquiry(rset.getInt("inqry_no"),
											 rset.getString("user_id"),
											 rset.getString("inqry_title"),
											 rset.getString("inqry_content"),
											 rset.getDate("modify_date")
											 ));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return unSolvedList;
	}

	/**
	 * Heerak [문의/답변] 해결 문의 list DB전체조회
	 * @param conn
	 * @param pi
	 * @return
	 */
	public ArrayList<Inquiry> selectSolvedList(Connection conn, PageInfo pi) {
		// select문
		ArrayList<Inquiry> solvedList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectSolvedList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				solvedList.add(new Inquiry(rset.getInt("inqry_no"),
										   rset.getString("user_id"),
										   rset.getString("inqry_title"),
										   rset.getString("inqry_content"),
										   rset.getDate("modify_date"),
										   rset.getDate("answer_date"),
										   rset.getString("inqry_answer")
											 ));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return solvedList;
	}

	/**
	 * HeeRak 미해결문의 번호 받아 해당문의 내용 조회
	 * @param conn
	 * @param inqNo
	 * @return
	 */
	public Inquiry selectUnSolvedInquiry(Connection conn, int inqNo) {
		// select문 rset 한행 조회
		Inquiry inq = new Inquiry();
		inq.setInqryNo(inqNo);
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectUnSolvedInquiry");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, inqNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				inq.setInqryTitle(rset.getString("inqry_title"));
				inq.setInqryContent(rset.getString("inqry_content"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return inq;
	}

	/**
	 * HeeRak 해결문의 번호 받아 해당문의 내용 DB 조회
	 * @param conn
	 * @param inqNo
	 * @return
	 */
	public Inquiry selectSolvedInquiry(Connection conn, int inqNo) {
		// select -> rset 한행 조회
		Inquiry inq = new Inquiry();
		inq.setInqryNo(inqNo);
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSolvedInquiry");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, inqNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				inq.setInqryTitle(rset.getString("inqry_title"));
				inq.setInqryContent(rset.getString("inqry_content"));
				inq.setInqryAnswer(rset.getString("inqry_answer"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return inq;
	}

	/**
	 * HeeRak [미해결|해결] 답변내용 update 후 처리된 행수 반환
	 * @param conn
	 * @param inq
	 * @return
	 */
	public int updateInquiryAnswer(Connection conn, Inquiry inq) {
		// update 문 => 처리된행수 반환
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateInquiryAnswer");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inq.getInqryAnswer());
			pstmt.setInt(2, inq.getInqryNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	/**
	 * 페이징 - 총 목록 count
	 * @author leeyeji
	 */
	public int selectListCount(Connection conn) {
		// select => ResultSet 한 행 
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
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	
	/**
	 * 페이징 - 전체 목록 조회
	 * @author leeyeji
	 */
	public ArrayList<Inquiry> selectList(Connection conn, PageInfo pi){
		// select => ResultSet 여러행
		ArrayList<Inquiry> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
				
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() +1;
			int endRow = startRow + pi.getBoardLimit() -1;
					
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
					
			rset = pstmt.executeQuery();
					
			while(rset.next()) {
				list.add(new Inquiry(rset.getInt("inqry_no"),
									 rset.getString("user_id"),
									 rset.getString("inqry_title"),
									 rset.getDate("enroll_date"),
									 rset.getDate("modify_date")));
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
	 * 1:1문의 상세 조회
	 * @author leeyeji
	 */
	public Inquiry selectInquiry(Connection conn, int inqryNo) {
		// select => ResultSet 한 행
		Inquiry i = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectInquiry");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, inqryNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				i = new Inquiry(rset.getString("user_id"),
								rset.getString("inqry_title"),
								rset.getString("inqry_content"),
								rset.getDate("enroll_date"),
								rset.getDate("modify_date"),
								rset.getString("inqry_answer"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return i;
	}
	
	/**
	 * 1:1문의 등록
	 * @author leeyeji
	 */
	public int insertInquiry(Connection conn, Inquiry i) {
		// insert => 처리된 행수
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertInquiry");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(i.getInqryWriter()));
			pstmt.setString(2, i.getInqryTitle());
			pstmt.setString(3, i.getInqryContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
	
	
}
