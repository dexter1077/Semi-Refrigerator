package com.refrigerator.report.model.service;

import static com.refrigerator.common.JDBCTemplate.close;
import static com.refrigerator.common.JDBCTemplate.commit;
import static com.refrigerator.common.JDBCTemplate.getConnection;
import static com.refrigerator.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.refrigerator.common.model.vo.PageInfo;
import com.refrigerator.member.model.dao.MemberDao;
import com.refrigerator.report.model.dao.ReportDao;
import com.refrigerator.report.model.vo.Report;


public class ReportService {
	
	/**
	 * @author leeyeji
	 * 페이징 - 총 페이지 수
	 */
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new ReportDao().selectListCount(conn);
		close(conn);
		return listCount;
	}
	
	/**
	 * @author leeyeji
	 * 신고 전체 목록 조회
	 */
	public ArrayList<Report> selectList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Report> list = new ReportDao().selectList(conn, pi);
		close(conn);
		return list;
	}
	
	/**
	 * @author leeyeji
	 * 회원 탈퇴 처리
	 */
	public int deleteMember(int userNo) {
		Connection conn = getConnection();
		int result = new ReportDao().deleteMember(conn, userNo);
		if(result > 0) {
			commit(conn);
		}else{
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/**
	 * @author leeyeji
	 * 레시피 신고하기
	 */
	public int insertRecipeReport(int userNo, int recipeNo, String reportRe) {
		Connection conn = getConnection();
		int result = new ReportDao().insertRecipeReport(conn, userNo, recipeNo, reportRe);
		if(result > 0) {
			commit(conn);
		}else{
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/**
	 * @author leeyeji
	 * 검색한 총 회원 count
	 */
	public int selectUserListCount(String userId) {
		Connection conn = getConnection();
		int result = new ReportDao().selectUserListCount(conn, userId);
		if(result > 0) {
			commit(conn);
		}else{
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/**
	 * @author leeyeji
	 * 회원 검색 결과
	 */
	public ArrayList<Report> selectSearchUserList(PageInfo pi, String userId){
		Connection conn = getConnection();
		ArrayList<Report> list = new ReportDao().selectSearchUserList(conn, pi, userId);
		close(conn);
		return list;
	}
	
}
