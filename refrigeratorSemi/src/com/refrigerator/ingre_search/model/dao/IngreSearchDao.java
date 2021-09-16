package com.refrigerator.ingre_search.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.refrigerator.common.JDBCTemplate.*;

import com.refrigerator.ingre_search.model.vo.IngreSearch;

/**
 * @author HeeRak
 */
public class IngreSearchDao {
	
	Properties prop = new Properties();
	
	public IngreSearchDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(IngreSearchDao.class.getResource("/sql/ingre_search/ingre_search-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * 레시피등록페이지에서 받은 검색버튼 DB insert요청
	 * @author HeeRak
	 */
	public int insertIngreSearch(Connection conn, ArrayList<IngreSearch> sbList) {
		int result = 1;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertIngreSearch");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			for(int i=0; i<sbList.size(); i++) {
				pstmt.setInt(1, sbList.get(i).getIngredientSearch());
				pstmt.setInt(2, sbList.get(i).getCategorySno());
				
				result = result * pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
}
