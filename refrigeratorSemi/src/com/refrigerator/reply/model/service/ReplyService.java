package com.refrigerator.reply.model.service;

import static com.refrigerator.common.JDBCTemplate.close;
import static com.refrigerator.common.JDBCTemplate.commit;
import static com.refrigerator.common.JDBCTemplate.getConnection;
import static com.refrigerator.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.refrigerator.banner.model.dao.BannerDao;
import com.refrigerator.common.model.vo.PageInfo;
import com.refrigerator.member.model.dao.MemberDao;
import com.refrigerator.reply.model.dao.ReplyDao;
import com.refrigerator.reply.model.vo.AdmReply;
import com.refrigerator.reply.model.vo.Reply;

public class ReplyService {

	
	/**
	 * 전체 댓글 갯수  조회
	 * @author seong
	 * @Date 05/29
	 * @return
	 */
		
	public int selectReplyListCount() {
		
		Connection conn = getConnection();
		int listCount = new ReplyDao().selectReplyListCount(conn);
		
		close(conn);
	
		return listCount;
	}
		
	
	/**
	 * 
	 * 관리자단에서 신고된 댓글 전체 조회 
	 * @author seong
	 * @Date 5/29
	 *
	 */
		
		public ArrayList<AdmReply> adminSelectReplyList(PageInfo pi){
			
			Connection conn = getConnection();
			ArrayList<AdmReply> list = new ReplyDao().adminSelectReplyList(conn,pi);
			close(conn);
			return list;
			
		}	
		
	/**
	 * 
	 * 관리자단에서 신고된 댓글 삭제
	 * @author seong
	 * @Date 5/29
	 *
	 */
		
		public int adminDeleteReply(int replyNo) {
			
			Connection conn = getConnection();
			
			int result = new ReplyDao().adminDeleteReply(conn,replyNo);
			
			if(result>0) {
				
				commit(conn);
				
			} else {
				
				rollback(conn);
				
			}
			
			 close(conn);
			 
			return result;
			
		}
		
	/** 마이페이지 댓글 페이징 처리용 메소드
	 * @author Jaewon
	 */
	public int selectMyReplyListCount(int userNo) {
		Connection conn = getConnection();
		int listCount = new ReplyDao().selectMyReplyListCount(conn, userNo);
		// 트랜젝션 처리할 필요없음 총개시글 조회만 해오는것이니! 
		close(conn);
		return listCount; 
	}

	/** 내 댓글 조회해오는 메소드
	 * @author Jaewon 
	 */
	public ArrayList<Reply> selectMyReplyList(PageInfo pi, int userNo) {
		Connection conn = getConnection();
		ArrayList<Reply> list = new ReplyDao().selectMyReplyList(conn, pi, userNo);
		close(conn);
		return list;
	}
	
	/** 내 댓글 수정 메소드
	 * @author Jaewon 
	 */
	public int updateMyReply(int replyNo, String replyContent) {
		Connection conn = getConnection();
		int result = new ReplyDao().updateMyReply(conn, replyNo, replyContent);
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		 close(conn);
		return result;		
	}

	/** 내 댓글 삭제 메소드
	 * @author Jaewon 
	 */
	public int deleteMyReply(int replyNo) {
		Connection conn = getConnection();
		int result = new ReplyDao().deleteMyReply(conn, replyNo);
		if(result>0) {
			commit(conn);
		} else {
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
		int result = new ReplyDao().selectUserListCount(conn, userId);
		if(result > 0) {
			commit(conn);
		}else{
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/**
	 * 아이디 검색 결과 목록 조회
	 */
	public ArrayList<AdmReply> selectSearchUserList(PageInfo pi, String userId){
		Connection conn = getConnection();
		ArrayList<AdmReply> list = new ReplyDao().selectSearchUserList(conn, pi, userId);
		close(conn);
		return list;
	}
	
	
	
	
	
	
	
	
}
