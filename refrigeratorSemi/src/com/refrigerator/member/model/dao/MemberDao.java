package com.refrigerator.member.model.dao;

import static com.refrigerator.common.JDBCTemplate.*;

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

public class MemberDao {
	
	private Properties prop = new Properties();
	
	// xml파일에서 키밸류 세트를 읽어들여서 prop에 담을것임 => * MemberDao의 기본생성자에서 읽어들임!! 
	public MemberDao() {
		
		// 일부 경로를 제시해서 getResource로 파일을 찾고 -> 물리적인 경로를 알아내려면 .getPath()까지!!
		String fileName = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();
	
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/** 회원가입폼
	 * @author daeun
	 * @param m 회원가입 폼에 작성한 사용자가 입력한 값들을 담아놓은 Member객체
	 * @return 처리된 행수
	 */
	public int insertMember(Connection conn, Member m) {
		// insert문 => 처리된행수(한행)
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getNickname());
			pstmt.setString(3, m.getUserPwd());
			pstmt.setString(4, m.getUserName());
			pstmt.setString(5, m.getBirthday());
			pstmt.setString(6, m.getGender());
			pstmt.setString(7, m.getEmail());
			pstmt.setString(8, m.getProfileImg());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	/** 로그인 요청
	 * @author daeun
	 * @param userId 사용자가 입력한 아이디값
	 * @param userPwd 사용자가 입력한 비밀번호값
	 * @return 
	 */
	public Member loginMember(Connection conn, String userId, String userPwd) {
		// select문 => ResultSet객체에 조회결과 받아주기 (unique제약조건때문에 "한행"만 조회됨)
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("user_no")
						     , rset.getString("user_id")
						     , rset.getString("user_pwd")
						     , rset.getString("user_name")
						     , rset.getString("user_type")
						     , rset.getString("grade")
						     , rset.getString("birthday")
						     , rset.getString("gender")
						     , rset.getString("email")
						     , rset.getString("phone")
						     , rset.getString("profile_img")
						     , rset.getString("nickname")
						     , rset.getString("intro")
						     , rset.getDate("modify_date")
						     , rset.getInt("scrap_count")
						     , rset.getInt("like_count")
						     , rset.getInt("fol_count")
						     , rset.getDate("enroll_date")
						     , rset.getString("status"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
		
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
	 * 멤버 전체 목록 조회 
	 */
	public ArrayList<Member> selectList(Connection conn, PageInfo pi){
		ArrayList<Member> list = new ArrayList<>();
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
				list.add(new Member(rset.getInt("user_no"),
								    rset.getString("user_id"),
								    rset.getString("user_name"),
								    rset.getString("grade"),
								    rset.getString("gender"),
								    rset.getString("email"),
								    rset.getString("phone"),
								    rset.getString("nickname"),
								    rset.getString("status")));
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
	 * 특정 회원 상세 조회
	 */
	public Member selectMember(Connection conn, int userNo) {
		// select => ResultSet 한 행
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getString("user_pwd"),
							   rset.getString("user_name"),
							   rset.getString("grade"),
							   rset.getString("gender"),
							   rset.getString("email"),
							   rset.getString("phone"),
							   rset.getString("nickname"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}
	
	/**
	 * @author leeyeji
	 * 회원 수정
	 */
	public int updateMember(Connection conn, Member m) {
		// update => int 결과
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMember");
		
		System.out.println(m);
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(m.getGrade()));
			pstmt.setString(2, m.getGender());
			pstmt.setString(3, m.getEmail());
			pstmt.setString(4, m.getPhone());
			pstmt.setString(5, m.getNickname());
			pstmt.setInt(6, m.getUserNo());
			
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
	 * 회원 삭제
	 */
	public int deleteMember(Connection conn, int userNo) {
		// udpate => int
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
	 * @author HeeRak
	 * 멤버 프로필 DB 조회
	 */
	public Member selectProfile(Connection conn, int userNo) {
		// select =>rset 결과 한행 조회
		Member m = new Member();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProfile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m.setProfileImg(rset.getString("profile_img"));
				m.setNickname(rset.getString("nickname"));
				m.setIntro(rset.getString("intro"));
				m.setModifyDate(rset.getDate("modify_date"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}

	/**
	 * @author HeeRak
	 * 멤버 프로필 DB수정
	 */
	public int updateProfile(Connection conn, Member m) {
		// update => 처리된 행수 반환
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateProfile");
		String sql2 = prop.getProperty("updateProfileNoImg");
		
		try {
			if(!m.getProfileImg().equals("")) {
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, m.getProfileImg());
				pstmt.setString(2, m.getNickname());
				pstmt.setString(3, m.getIntro());
				pstmt.setInt(4, m.getUserNo());
				
				result = pstmt.executeUpdate();
			}else {
				
				pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1, m.getNickname());
				pstmt.setString(2, m.getIntro());
				pstmt.setInt(3, m.getUserNo());
				
				result = pstmt.executeUpdate();
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	/** 아이디 찾기
	 * @author daeun
	 * @return
	 */
	public Member findId(Connection conn, String userName, String phone, String email) {
		//select문 => Rset
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("findId");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userName);
			pstmt.setString(2, phone);
			pstmt.setString(3, email);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getString("user_id")
						     , rset.getString("user_name")
						     , rset.getString("email")
						     , rset.getString("phone")
						     , rset.getDate("enroll_date"));
			}
			
			System.out.println(m); // null반환함 왜ㅠㅠㅠ??????
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
		
	}

	/**
	 * @Author Jaewon
	 *  회원 정보 변경
	 */
	public int updateMemberInfo(Connection conn, Member memInfo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMemberInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memInfo.getUserName());
			pstmt.setString(2, memInfo.getGender());
			pstmt.setString(3, memInfo.getEmail());
			pstmt.setString(4, memInfo.getPhone());
			pstmt.setInt(5, memInfo.getUserNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	/**
	 * @Author Jaewon
	 *  회원 비밀번호 변경
	 */
	public int updatePWD(Connection conn, String userId, String userPwd, String newPwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePWD");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newPwd);
			pstmt.setString(2, userId);
			pstmt.setString(3, userPwd);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	/**
	 * @author HeeRak
	 * 회원 탈퇴
	 */
	public int deleteUserMember(Connection conn, int userNo, String userPwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteUserMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setString(2, userPwd);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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
	
	/**
	 * @author leeyeji
	 * 회원 검색 결과
	 */
	public ArrayList<Member> selectSearchUserList(Connection conn, PageInfo pi, String userId){
		
		ArrayList<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectSearchUserList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() +1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setString(1, userId);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Member(rset.getInt("user_no"),
									rset.getString("user_id"),
									rset.getString("user_name"),
									rset.getString("user_type"),
									rset.getString("grade"),
									rset.getString("gender"),
									rset.getString("email"),
									rset.getString("phone"),
									rset.getString("nickname"),
									rset.getString("status")));
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
	 * @Author Jaewon
	 * 이메일 체크용
	 */
	public Member checkEmail(Connection conn, String newEmail) {
		// select => ResultSet 한 행
		Member count = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("checkEmail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newEmail);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = new Member(rset.getInt("user_No"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}

	/**
	 * @Author Jaewon
	 * 폰 체크용
	 */
	public Member checkPhone(Connection conn, String newPhone) {
		// select => ResultSet 한 행
		Member count = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("checkPhone");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newPhone);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = new Member(rset.getInt("user_No"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}

}
