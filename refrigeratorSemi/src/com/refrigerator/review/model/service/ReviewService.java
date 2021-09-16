package com.refrigerator.review.model.service;

import static com.refrigerator.common.JDBCTemplate.close;
import static com.refrigerator.common.JDBCTemplate.commit;
import static com.refrigerator.common.JDBCTemplate.getConnection;
import static com.refrigerator.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.refrigerator.common.model.vo.PageInfo;
import com.refrigerator.member.model.dao.MemberDao;
import com.refrigerator.member.model.vo.Member;
import com.refrigerator.review.model.dao.ReviewDao;
import com.refrigerator.review.model.vo.AdmReview;
import com.refrigerator.review.model.vo.Review;


/**
 * 
 * @author heeRak seong
 *
 */


public class ReviewService {

	
	
	/***
	 * 등록된 요리 후기 전체 갯수 조회
	 * @author seong
	 * @Date 5/30
	 */
	
	public int selectReviewListCount() {
		
		Connection conn = getConnection();
		int listCount = new ReviewDao().selectReviewListCount(conn);
		
		close(conn);
		
		return listCount;
		
		
	}
	
	
	
	/***
	 * 회원이 작성한 요리 후기 전체 조회 
	 * @author seong
	 * @Date 5/30
	 */
	
	public ArrayList<AdmReview> adminSelectReviewList(PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<AdmReview> list = new ReviewDao().adminSelectReviewList(conn,pi);
		
		close(conn);
		
		return list;
		
		
	}
	
	/**
	 * 관리자가 선택한 요리 후기 삭제
	 * @author seong
	 * @Date 5/30
	 */
	
	public int deleteReview(int reviewNo) {
		
		Connection conn = getConnection();
		
		int result = new ReviewDao().deleteReview(conn,reviewNo);
		
		close(conn);
		
		return result;
		
		
	}


	/**
	 * 사용자가 작성한 요리후기&별점 글 count
	 * @author HeeRak
	 */
	public int selectUserReviewListCount(int userNo) {
		Connection conn = getConnection();
		int listCount = new ReviewDao().selectUserReviewListCount(conn, userNo);
		close(conn);
		return listCount;
	}



	/**
	 * 사용자가 작성한 요리후기&별점 글 list
	 * @author HeeRak
	 */
	public ArrayList<Review> selectUserReviewList(int userNo, PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Review> list = new ReviewDao().selectUserReviewList(conn, userNo, pi);
		close(conn);
		return list;
	}



	/**
	 * 사용자가 선택한 요리후기&별점 글 delete
	 * @author HeeRak
	 */
	public int deleteReviewUser(ArrayList<Integer> deleteList) {
		Connection conn = getConnection();
		int result = new ReviewDao().deleteReviewUser(conn, deleteList);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}



	/**
	 * 마이페이지_ 수정버튼 클릭시 리뷰 조회
	 * @author HeeRak
	 */
	public Review selectReview(int reviewNo) {
		Connection conn = getConnection();
		Review rv = new ReviewDao().selectReview(conn, reviewNo);
		close(conn);
		return rv;
	}



	/**
	 * 마이페이지_ 요리후기 수정
	 * @author HeeRak
	 */
	public int updateReview(Review rv) {
		Connection conn = getConnection();
		int result = new ReviewDao().updateReview(conn, rv);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	/**
	 * 아이디 검색 총 갯수
	 */
	public int selectUserListCount(String userId) {
		Connection conn = getConnection();
		int result = new ReviewDao().selectUserListCount(conn, userId);
		if(result > 0) {
			commit(conn);
		}else{
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/**
	 * 아이디 검색 목록 조회
	 */
	public ArrayList<AdmReview> selectSearchUserList(PageInfo pi, String userId){
		Connection conn = getConnection();
		ArrayList<AdmReview> list = new ReviewDao().selectSearchUserList(conn, pi, userId);
		close(conn);
		return list;
	}
	
}
