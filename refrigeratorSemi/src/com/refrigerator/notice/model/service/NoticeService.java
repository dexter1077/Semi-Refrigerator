package com.refrigerator.notice.model.service;

import static com.refrigerator.common.JDBCTemplate.close;
import static com.refrigerator.common.JDBCTemplate.commit;
import static com.refrigerator.common.JDBCTemplate.getConnection;
import static com.refrigerator.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.refrigerator.common.model.vo.PageInfo;
import com.refrigerator.notice.model.dao.NoticeDao;
import com.refrigerator.notice.model.vo.Notice;

public class NoticeService {
	
	/**
	 * 공지사항 전체 목록 조회
	 * @author leeyeji
	 */
	
	public ArrayList<Notice> selectList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectList(conn, pi);
		close(conn);
		return list;
	}
	
	/**
	 * 공지사항 조회수 증가
	 * @author leeyeji
	 */
	
	public int increaseCount(int noticeNo) {
		Connection conn = getConnection();
		int result = new NoticeDao().increaseCount(conn, noticeNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}
	
	/**
	 * 공지사항 상세 조회
	 * @author leeyeji
	 */
	
	public Notice selectNotice(int noticeNo) {
		Connection conn = getConnection();
		Notice n = new NoticeDao().selectNotice(conn, noticeNo);
		close(conn);
		return n;
	}

	/**
	 * 공지사항 목록(count)조회
	 * @author HeeRak
	 */
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new NoticeDao().selectListCount(conn);
		close(conn);
		return listCount;
	}

	/**
	 * [관리자]공지사항 전체목록 조회 p(8/5)
	 * @author HeeRak
	 */
	public ArrayList<Notice> adminSelectNoticeList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Notice> list = new NoticeDao().adminSelectNoticeList(conn, pi);
		close(conn);
		return list;
	}

	/**
	 * [관리자]공지사항  _클릭된 공지사항_삭제요청
	 * @author HeeRak
	 */
	public int deleteNotice(int noticeNo) {
		Connection conn = getConnection();
		int result = new NoticeDao().deleteNotice(conn, noticeNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	/**
	 *[관리자]공지사항_ 새로운 글 등록
	 *@author HeeRak
	 */
	public int insertNotice(Notice n) {
		Connection conn = getConnection();
		int result = new NoticeDao().insertNotice(conn, n);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	/**
	 * [관리자] 공지사항_ 기존 글 수정
	 * @author HeeRak
	 */
	public int updateNotice(Notice n) {
		Connection conn = getConnection();
		int result = new NoticeDao().updateNotice(conn, n);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

}
