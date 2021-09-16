package com.refrigerator.follow.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.refrigerator.common.model.vo.PageInfo;
import com.refrigerator.follow.model.vo.Follow;
import com.refrigerator.follow.model.vo.FollowStats;

import static com.refrigerator.common.JDBCTemplate.close;

public class FollowDao {
	
	Properties prop = new Properties();
	
	public FollowDao() {
		try {
			prop.loadFromXML(new FileInputStream(FollowDao.class.getResource("/sql/follow/follow-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 마이페이지 - 로그인한 유저의 번호 => 팔로잉한 유저들 count
	 * @author HeeRak
	 */
	public int selectFollowListCount(Connection conn, int userNo) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFollowListCount");
		
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
	 * 마이페이지 - 로그인한 유저의 번호 => 팔로잉한 유저들 통계일부 list 조회
	 * @author HeeRak
	 */
	public ArrayList<FollowStats> selectFollowStatsList(Connection conn, PageInfo pi, int userNo) {
		ArrayList<FollowStats> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFollowStatsList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new FollowStats(rset.getInt("USER_NO"),
										 rset.getString("PROFILE_IMG"),
										 rset.getString("NICKNAME"),
										 rset.getInt("SCRAP_COUNT"),
										 rset.getInt("LIKE_COUNT"),
										 rset.getInt("FOL_COUNT")
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
	 * 마이페이지- 팔로우 된 유저의 최근레시피 4장
	 * @author HeeRak
	 */
	public ArrayList<String> selectTopRecipe(Connection conn, int userNo) {
		ArrayList<String> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTopRecipe");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new String(rset.getString(2)));
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
	 * 마이페이지 - 팔로잉한 유저 통계 정보 2개 조회
	 * @author HeeRak
	 */
	public FollowStats selectFollowStatsListCount(Connection conn, int userNo) {
		FollowStats fs = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFollowStatsListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				fs = new FollowStats(rset.getInt(1),
									 (double)(Math.round(rset.getDouble(2)*100))/100);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return fs;
	}

	/**
	 ** 마이페이지 - 팔로우 관계 삭제
	 * @author HeeRak
	 */
	public int deleteFollowRelation(Connection conn, int followUserNo, int followingUserNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteFollowRelation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, followUserNo);
			pstmt.setInt(2, followingUserNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	

}
