package com.refrigerator.scrap.model.dao;

import static com.refrigerator.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import com.refrigerator.banner.model.vo.Banner;
import com.refrigerator.scrap.model.vo.Scrap;
import com.refrigerator.tos.model.vo.Tos;

/** @author Jaewon */

public class ScrapDao {
	private Properties prop = new Properties();
	
	public ScrapDao() {
		try {
			prop.loadFromXML(new FileInputStream( ScrapDao.class.getResource("/sql/scrap/scrap-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
//------------------------------------------------------------------------------------------------------------
	public ArrayList<Scrap> selectList(Connection conn,int loginUserNo){
		ArrayList<Scrap> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginUserNo);
			rset = pstmt.executeQuery();

			while(rset.next()) {
				list.add(new Scrap(rset.getInt("RECIPE_NO"),
             					   rset.getString("RECIPE_TITLE"),
             					   rset.getInt("COOKING_TIME"),
             					   rset.getInt("LIKE_COUNT"),
             					   rset.getString("MAIN_IMG"),
             					   rset.getString("NICKNAME"),
             					   rset.getString("PROFILE_IMG"),
             					   rset.getDouble("AVRG_STAR_POINT")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
				
		return list;
	}
//-------------------------------------------------------------------------------------------------------	
	public int deleteScrap(Connection conn, int userNo, int recipeNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteScrap");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, recipeNo);
			pstmt.setInt(2, userNo);
			
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
	 * 유저 레시피 스크랩 insert
	 */
	public int insertScrap(Connection conn, int recipeNo, int userNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertScrap");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, recipeNo);
			pstmt.setInt(2, userNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
	/**
	 * 스크랩 insert시 스크랩 카운트 증가
	 * @author seong
	 */
	
	public int increaseScrapCount(Connection conn, int recipeNo, int userNo) {
		
		int scrapCount = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseScrapCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, recipeNo);
			scrapCount = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			
			close(pstmt);
			
		}
		return scrapCount;
		
	}
	
	
	
	
}
