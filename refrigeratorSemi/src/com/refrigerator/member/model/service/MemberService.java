package com.refrigerator.member.model.service;

import static com.refrigerator.common.JDBCTemplate.close;
import static com.refrigerator.common.JDBCTemplate.commit;
import static com.refrigerator.common.JDBCTemplate.getConnection;
import static com.refrigerator.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.refrigerator.common.model.vo.PageInfo;
import com.refrigerator.member.model.dao.MemberDao;
import com.refrigerator.member.model.vo.Member;

public class MemberService {
	

	
	
	/** 회원가입폼
	 * @param m 회원가입 폼에 작성한 사용자가 입력한 값들을 담아놓은 Member객체
	 * @return 처리된 행수
	 */
	
	public int insertMember(Member m) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().insertMember(conn, m);
		
		System.out.println(m);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	
	/** 로그인 요청
	 * @author daeun
	 * @param userId 사용자가 입력한 아이디값
	 * @param userPwd 사용자가 입력한 비밀번호값
	 * @return 
	 */
	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection();
		
		Member m = new MemberDao().loginMember(conn, userId, userPwd);
		
		close(conn);
		return m;
	}
	
	/**
	 * @author leeyeji
	 * 페이징 - 총 페이지 수 
	 */
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new MemberDao().selectListCount(conn);
		close(conn);
		return listCount;
	}
	
	/**
	 * @author leeyeji
	 * 멤버 전체 목록 조회  
	 */
	public ArrayList<Member> selectList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Member> list = new MemberDao().selectList(conn, pi);
		close(conn);
		return list;
	}
	
	/**
	 * @author leeyeji
	 * 특정 회원 상세 조회
	 */
	public Member selectMember(int userNo) {
		Connection conn = getConnection();
		Member m = new MemberDao().selectMember(conn, userNo);
		close(conn);
		return m;
	}
	
	/**
	 * @author leeyeji
	 * 회원 수정
	 */
	public int updateMember(Member m) {
		Connection conn = getConnection();
		int result = new MemberDao().updateMember(conn, m);
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
	 * 회원 삭제
	 */
	public int deleteMember(int userNo) {
		Connection conn = getConnection();
		int result = new MemberDao().deleteMember(conn, userNo);
		if(result > 0) {
			commit(conn);
		}else{
			rollback(conn);
		}
		close(conn);
		return result;
	}

	/**
	 * @author HeeRak
	 * 멤버 프로필 조회
	 */
	public Member selectProfile(int userNo) {
		Connection conn = getConnection();
		Member m = new MemberDao().selectProfile(conn, userNo);
		close(conn);
		return m;
	}


	/**
	 * @author HeeRak
	 * 멤버 프로필 수정
	 */
	public int updateProfile(Member m) {
		Connection conn = getConnection();
		int result = new MemberDao().updateProfile(conn, m);
		if(result > 0) {
			commit(conn);
		}else{
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/** 아이디 찾기
	 * @author daeun
	 * @return
	 */
	public Member findId(String userName, String phone, String email) {
		Connection conn = getConnection();
		
		Member m = new MemberDao().findId(conn, userName, phone, email);
		
		System.out.println(m);
		close (conn);
		return m;
	}

	
	/**
	 * @author Jaewon
	 * 회원 정보 변경
	 */
	public int updateMemberInfo(Member memInfo) {
		Connection conn = getConnection();
		int result = new MemberDao().updateMemberInfo(conn, memInfo);
		if(result > 0) {
			commit(conn);
		}else{
			rollback(conn);
		}
		close(conn);
		return result;
	}	
	
	/**
	 * @author Jaewon
	 * 회원 정보 변경
	 */
	public int updatePWD(String userId, String userPwd, String newPwd) {
		Connection conn = getConnection();
		int result = new MemberDao().updatePWD(conn, userId, userPwd, newPwd);
		if(result > 0) {
			commit(conn);
		}else{
			rollback(conn);
		}
		close(conn);
		return result;
	}


	/**
	 * @author HeeRak
	 * 회원 탈퇴
	 */
	public int deleteUserMember(int userNo, String userPwd) {
		Connection conn = getConnection();
		int result = new MemberDao().deleteUserMember(conn, userNo, userPwd);
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
		int result = new MemberDao().selectUserListCount(conn, userId);
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
	public ArrayList<Member> selectSearchUserList(PageInfo pi, String userId){
		Connection conn = getConnection();
		ArrayList<Member> list = new MemberDao().selectSearchUserList(conn, pi, userId);
		close(conn);
		return list;
	}
	
	/**
	 * @author Jaewon
	 * 이메일 체크용 
	 */
	public Member checkEmail(String newEmail){
		Connection conn = getConnection();
		Member count = new MemberDao().checkEmail(conn, newEmail);
		close(conn);
		return count;
	}
	
	/**
	 * @author Jaewon
	 * 폰 체크용 
	 */
	public Member checkPhone(String newPhone){
		Connection conn = getConnection();
		Member count = new MemberDao().checkPhone(conn, newPhone);
		close(conn);
		return count;
	}
	
}
