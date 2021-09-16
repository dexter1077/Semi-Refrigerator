package com.refrigerator.report.model.dao;

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
import com.refrigerator.report.model.vo.Report;

public class ReportDao {
	
	Properties prop = new Properties();
		
	public ReportDao() {
			
		try {
			prop.loadFromXML(new FileInputStream(ReportDao.class.getResource("/sql/report/report-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
			
	}
	
	/**
	 * @author leeyeji
	 * 페이징 - 총 페이지 수
	 */
	public int selectListCount(Connection conn) {
		// select => ResultSet 한행
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
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
	 * @author leeyeji
	 * 신고 전체 목록 조회
	 */
	public ArrayList<Report> selectList(Connection conn, PageInfo pi){
		// select => ResultSet 여러행
		ArrayList<Report> list = new ArrayList<>();
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
				list.add(new Report(rset.getInt("report_no"),
									rset.getInt("user_no"),
									rset.getString("user_id"),
									rset.getInt("ref_no"),
									rset.getString("report_content"),
									rset.getDate("report_date"),
									rset.getInt("report_type")));
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
	 * @author leeyeji
	 * 회원 탈퇴 처리
	 */
	public int deleteMember(Connection conn, int userNo) {
		// update => 처리된 행수
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	/**
	 * @author leeyeji
	 * 레시피 신고하기
	 */
	public int insertRecipeReport(Connection conn, int userNo, 
									int recipeNo, String reportRe) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertRecipeReport");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, recipeNo);
			pstmt.setString(3, reportRe);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	/**
	 * @author leeyeji
	 * 검색한 회원 총 count
	 */
	public int selectUserListCount(Connection conn, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectUserListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;		
	}
	

}
