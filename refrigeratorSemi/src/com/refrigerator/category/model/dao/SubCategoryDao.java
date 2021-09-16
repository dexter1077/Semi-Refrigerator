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

import com.refrigerator.category.model.vo.SubCategory;

/** @author Jaewon */

public class SubCategoryDao {

	private Properties prop = new Properties();
	
	public SubCategoryDao() {
		try {
			prop.loadFromXML(new FileInputStream( SubCategoryDao.class.getResource("/sql/sub_category/sub_category-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
//-----------------------------------------------------------------------------------
	public ArrayList<SubCategory> selectSubList(Connection conn){
		ArrayList<SubCategory> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectSubList");

		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();

			while(rset.next()) {
				list.add(new SubCategory(rset.getInt("category_sno"),
										 rset.getInt("category_no"),
										 rset.getString("ingredient_name")));
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
	public int insertSubCategory(Connection conn, SubCategory sc) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertSubCategory");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sc.getCategoryMainNo()); 
			pstmt.setString(2, sc.getIngredientName()); 
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	/**
	 * Main카테고리 번호 받아서 해당 sub카테고리 list DB조회요청처리
	 * @author HeeRak
	 */
	public ArrayList<SubCategory> selectSubListByMainCategory(Connection conn, int mcNo) {
		// select => rset 여러행 조회
		ArrayList<SubCategory> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectSubListByMainCategory");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mcNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new SubCategory(rset.getInt("category_sno"),
										 rset.getString("ingredient_name")
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
	 * 관리자단에서 카테고리 소분류 수정
	 * @author seong
	 * @date 6/2
	 * 
	 */
	
	public int updateSubCategory(Connection conn, SubCategory sub) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateSubCategory");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, sub.getIngredientName());
			pstmt.setInt(2, sub.getCategoryMainNo());
			pstmt.setInt(3, sub.getCategorySubNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			
			close(pstmt);
			
		}
		
		
		return result;
		
	}
	
	
	
}
