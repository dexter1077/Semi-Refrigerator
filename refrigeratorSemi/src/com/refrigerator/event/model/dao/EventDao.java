package com.refrigerator.event.model.dao;

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
import com.refrigerator.event.model.vo.AdmEvent;

public class EventDao {
	
	
	Properties prop = new Properties();
	
	public EventDao() {
		
		
		try {
			prop.loadFromXML(new FileInputStream(EventDao.class.getResource("/sql/event/event-mapper.xml").getPath()));
	
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	/***
	 * 전체 이벤트 갯수 조회
	 * @author seong
	 * @date 5/31
	 * @return
	 */
	
	public int selectEventListCount(Connection conn) {
		
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectEventListCount");
		
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
	 * 전체 이벤트 목록 조회
	 * @author seong
	 * @date 5/31
	 */
	
	public ArrayList<AdmEvent> adminSelectEventList(Connection conn, PageInfo pi){
		
		ArrayList<AdmEvent> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adminSelectEventList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new AdmEvent(
						
						rset.getInt("EVEN_NO")
						,rset.getString("EVEN_TITLE")
						,rset.getString("EVEN_CATEGORY")
						,rset.getString("START_DATE")
						,rset.getString("END_DATE")
						,rset.getDate("ENROLL_DATE")
						,rset.getString("STATUS")
						));
				
				
				
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
	 * 관리자단에서 이벤트 등록
	 * @author seong
	 * @date 5/31
	 */
	
	public int adminInsertEvent(Connection conn, AdmEvent adEvent) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminInsertEvent");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, adEvent.getEventTitle());
			pstmt.setString(2, adEvent.getEventCategory());
			pstmt.setString(3, adEvent.getStartDate());
			pstmt.setString(4, adEvent.getEndDate());
			pstmt.setString(5, adEvent.getEventImg());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	/**
	 * 관리자단에서 이벤트 수정
	 * @author seong
	 * @date 6/1
	 */
	
	public int adminUpdateEvent(Connection conn, AdmEvent adEvent) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminUpdateEvent");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, adEvent.getEventTitle());
			pstmt.setString(2, adEvent.getEventCategory());
			pstmt.setString(3, adEvent.getStartDate());
			pstmt.setString(4, adEvent.getEndDate());
			pstmt.setString(5, adEvent.getStatus());
			pstmt.setString(6, adEvent.getEventImg());
			pstmt.setInt(7, adEvent.getEventNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
		
	}
	
	
	/**
	 * 관리자단에서 이벤트 삭제
	 * @author seong
	 * @date 6/1 
	 */
	
	public int adminDeleteEvent(Connection conn, int eventNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminDeleteEvents");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, eventNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
		
	}
	
	/**
	 * 사용자단에서 진행중인 이벤트 조회
	 * @author seong
	 * @date 6/3
	 */
	
	public ArrayList<AdmEvent> userSelectEventList(Connection conn, PageInfo pi){
		
		ArrayList<AdmEvent> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("userSelectEventList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new AdmEvent(
						
						rset.getInt("EVEN_NO")
						,rset.getString("EVEN_TITLE")
						,rset.getString("EVEN_CATEGORY")
						,rset.getString("START_DATE")
						,rset.getString("END_DATE")
						,rset.getDate("ENROLL_DATE")
						,rset.getString("STATUS")
						,rset.getString("EVEN_IMG")
						));
				
				
				
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
	 * 사용자단에서 종료된 이벤트 조회
	 * @author seong
	 * @date 6/3
	 */
	
	public ArrayList<AdmEvent> userSelectEndEventList(Connection conn, PageInfo pi){
		
		ArrayList<AdmEvent> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("userSelectEndEventList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new AdmEvent(
						
						rset.getInt("EVEN_NO")
						,rset.getString("EVEN_TITLE")
						,rset.getString("EVEN_CATEGORY")
						,rset.getString("START_DATE")
						,rset.getString("END_DATE")
						,rset.getDate("ENROLL_DATE")
						,rset.getString("STATUS")
						,rset.getString("EVEN_IMG")
						));
				
				
				
			}
				
		
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			
			close(rset);
			close(pstmt);
		}

		return list;
		
		
	}

	
	

}
