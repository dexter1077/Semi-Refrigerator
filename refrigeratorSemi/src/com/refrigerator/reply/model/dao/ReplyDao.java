package com.refrigerator.reply.model.dao;

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
import com.refrigerator.member.model.vo.Member;
import com.refrigerator.reply.model.vo.AdmReply;
import com.refrigerator.reply.model.vo.Reply;

	
	/**
	 * 
	 * @author seong
	 * @Date 05/29
	 * 
	 */

	public class ReplyDao {

	
	Properties prop = new Properties();
	
	public ReplyDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(ReplyDao.class.getResource("/sql/reply/reply-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * 전체 댓글 갯수  조회
	 * @author seong
	 * @Date 05/29
	 * @return
	 */
	
	
	public int selectReplyListCount(Connection conn) {
		// select문 => ResultSet (한행)
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReplyListCount");
		
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
	 * 
	 * 관리자단에서 신고된 댓글 전체 조회 
	 * @author seong
	 * @Date 5/29
	 *
	 */
	
	public ArrayList<AdmReply>adminSelectReplyList(Connection conn,PageInfo pi){
		
		// 여러행 조회
		ArrayList<AdmReply>list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adminSelectReplyList");
		
		try {
			pstmt = conn.prepareStatement(sql);
		
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new AdmReply(
						
						rset.getString("USER_ID")
						,rset.getInt("REPLY_NO")
						,rset.getString("REPORT_CONTENT")
						,rset.getString("RECIPE_TITLE")
						,rset.getString("REPLY_CONTENT")
						,rset.getDate("ENROLL_DATE")
						,rset.getString("REPORT_STATUS")
						
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
	 * 
	 * 관리자단에서 신고된 댓글 삭제
	 * @author seong
	 * @Date 5/29
	 *
	 */
	
	public int adminDeleteReply(Connection conn, int replyNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminDeleteReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, replyNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
	/** 마이페이지 댓글 페이징 처리용 메소드
	 * @author Jaewon
	 */
	public int selectMyReplyListCount(Connection conn, int userNo) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMyReplyListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
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
	//---------------------------------------------------------------
	/** 마이페이지 내 댓글 리스트들 가져오는 메소드
	 * @author Jaewon
	 */
	public ArrayList<Reply> selectMyReplyList(Connection conn, PageInfo pi, int userNo) {
		ArrayList<Reply>list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMyReplyList");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
		
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Reply(rset.getInt("reply_no")
						         , rset.getInt("recipe_no")	
						         , rset.getString("reply_content")
								 , rset.getDate("modify_date")
								 , rset.getString("recipe_title")));	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	//------------------------------------------------------------------
	/** 마이페이지 내 댓글 수정 메소드
	 * @author Jaewon
	 */
	public int updateMyReply(Connection conn, int replyNo, String replyContent) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMyReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, replyContent);
			pstmt.setInt(2, replyNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
//------------------------------------------------------------------
	/** 마이페이지 내 댓글 삭제 메소드
	 * @author Jaewon
	 */
	public int deleteMyReply(Connection conn, int replyNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMyReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, replyNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	/**
	 * 아이디 검색 총 갯수
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
	
	/**
	 * 아이디 검색 결과 목록 조회
	 */
	public ArrayList<AdmReply> selectSearchUserList(Connection conn, PageInfo pi, String userId){
		
		ArrayList<AdmReply> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectSearchUserList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() +1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setString(1, "%" + userId + "%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new AdmReply(rset.getString("user_id"),
									  rset.getInt("reply_no"),
									  rset.getString("report_content"),
								      rset.getString("recipe_title"),  
								      rset.getString("reply_content"),
								      rset.getDate("enroll_date"),
								      rset.getString("report_status")
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
