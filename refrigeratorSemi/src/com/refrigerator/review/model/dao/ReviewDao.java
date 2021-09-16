package com.refrigerator.review.model.dao;


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
import com.refrigerator.review.model.vo.AdmReview;
import com.refrigerator.review.model.vo.Review;



/**
 * 
 * @author heeRak seong
 *
 */



public class ReviewDao {

	
	Properties prop = new Properties();
	
	public ReviewDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(ReviewDao.class.getResource("/sql/review/review-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 등록된 요리 후기 전체 갯수 조회
	 * @author seong
	 * @Date 5/30
	 * 
	 */
	
	public int selectReviewListCount(Connection conn) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReviewListCount");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
		
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				listCount = rset.getInt("COUNT");
				
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
	 * 회원이 작성한 요리 후기 전체 조회 
	 * @author seong
	 * @Date 5/30
	 * @return
	 */
	
	public ArrayList<AdmReview>adminSelectReviewList(Connection conn, PageInfo pi){
		
		ArrayList<AdmReview>list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adminSelectReviewList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new AdmReview(
						
					rset.getInt("REVIEW_NO")
					,rset.getString("USER_ID")
					,rset.getString("RECIPE_TITLE")	
					,rset.getDouble("STAR")	
					,rset.getString("REVIEW_CONTENT")
					,rset.getDate("ENROLL_DATE")
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
	 * 관리자가 선택한 요리 후기 삭제
	 * @author seong
	 * @Date 5/30
	 */
	
	public int deleteReview(Connection conn, int reviewNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminDeleteReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, reviewNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}

	/**
	 * 사용자가 작성한 요리후기&별점 글 count DB조회
	 * @author HeeRak
	 */
	public int selectUserReviewListCount(Connection conn, int userNo) {
		// select => rset 결과 한행 반환
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectUserReviewListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
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
	 * 사용자가 작성한 요리후기&별점 글 list DB조회
	 * @author HeeRak
	 */
	public ArrayList<Review> selectUserReviewList(Connection conn, int userNo, PageInfo pi) {
		// select => rset 여러행 조회
		ArrayList<Review> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectUserReviewList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Review(rset.getInt("review_no"),
									rset.getInt("recipe_no"),
									rset.getString("review_content"),
									rset.getDouble("star"),
									rset.getString("img_name"),
									rset.getDate("modify_date")
									));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	/**
	 * 사용자가 선택한 요리후기&별점 글 DB delete
	 * @author HeeRak
	 */
	public int deleteReviewUser(Connection conn, ArrayList<Integer> deleteList) {
		// delete문 => 결과값 int 반환
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteReviewUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			for(int i=0; i<deleteList.size(); i++) {
				
				pstmt.setInt(1, deleteList.get(i));
				result += pstmt.executeUpdate();
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * 마이페이지_ 수정버튼 클릭시 리뷰 조회
	 * @author HeeRak
	 */
	public Review selectReview(Connection conn, int reviewNo) {
		Review rv = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reviewNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				rv = new Review(rset.getInt("REVIEW_NO"),
								rset.getInt("USER_NO"),
								rset.getInt("RECIPE_NO"),
								rset.getString("REVIEW_CONTENT"),
								rset.getDouble("STAR"),
								rset.getString("IMG_NAME"),
								rset.getDate("MODIFY_DATE")
								);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return rv;
	}

	/**
	 * 마이페이지_ 요리후기 수정
	 * @author HeeRak
	 */
	public int updateReview(Connection conn, Review rv) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateReview");
		String sql2 = prop.getProperty("updateReviewNoImg");
				
		try {
			if(!rv.getImgName().equals("")) {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, rv.getReviewContent());
				pstmt.setDouble(2, rv.getStar());
				pstmt.setString(3, rv.getImgName());
				pstmt.setInt(4, rv.getReviewNo());
				
				result = pstmt.executeUpdate();
			}else {
				pstmt = conn.prepareStatement(sql2);
				
				pstmt.setString(1, rv.getReviewContent());
				pstmt.setDouble(2, rv.getStar());
				pstmt.setInt(3, rv.getReviewNo());
				
				result = pstmt.executeUpdate();
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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
	 * 아이디 검색 목록 조회
	 */
	public ArrayList<AdmReview> selectSearchUserList(Connection conn, PageInfo pi, String userId){
		
		ArrayList<AdmReview> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectSearchUserList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() +1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setString(1, "%"+ userId + "%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new AdmReview(rset.getInt("REVIEW_NO"),
									   rset.getString("USER_ID"),
									   rset.getString("RECIPE_TITLE"),
									   rset.getDouble("STAR"),
									   rset.getString("REVIEW_CONTENT"),
									   rset.getDate("ENROLL_DATE")));
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
