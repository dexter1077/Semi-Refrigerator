package com.refrigerator.category.model.dao;

import static com.refrigerator.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.refrigerator.category.model.vo.MainCategory;
import com.refrigerator.common.model.vo.PageInfo;
import com.refrigerator.tos.model.vo.Tos;

/** @author Jaewon */

public class MainCategoryDao {

	private Properties prop = new Properties();
	
	public MainCategoryDao() {
		try {
			prop.loadFromXML(new FileInputStream(MainCategoryDao.class.getResource("/sql/main_category/main_category-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
//-----------------------------------------------------------------------------------
	public ArrayList<MainCategory> selectMainList(Connection conn){
		ArrayList<MainCategory> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMainList");

		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();

			while(rset.next()) {
				list.add(new MainCategory(rset.getInt("category_mno"),
             					 rset.getString("category_name")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
				
		return list;
	}
//-----------------------------------------------------------------------------------
	public int insertMainCategory(Connection conn, String mainCatName) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMainCategory");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mainCatName); 						
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	/**
	 * 관리자단에서 카테고리 대분류 수정
	 * @author seong
	 * @date 6/2
	 */
	
	public int updateMainCategory(Connection conn, int MainCatNo, String MainCatName) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMainCategory");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,MainCatName );
			pstmt.setInt(2, MainCatNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			
			close(conn);
			
		}
		
		return result;
		
	}
	
	
	
	
}
