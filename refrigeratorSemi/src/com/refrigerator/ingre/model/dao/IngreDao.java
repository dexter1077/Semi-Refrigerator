package com.refrigerator.ingre.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.refrigerator.common.JDBCTemplate.close;
import com.refrigerator.ingre.model.vo.Ingre;

public class IngreDao {
	Properties prop = new Properties();
	
	public IngreDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(IngreDao.class.getResource("/sql/ingre/ingre-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 레시피등록페이지에서 필수|부가재료 정보 insert 요청처리
	 * @author HeeRak
	 */
	public int insertIngreList(Connection conn, ArrayList<Ingre> ingList, ArrayList<Ingre> addList) {
		int result = 1;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertIngreList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			for(int i=0; i<ingList.size(); i++) {
				pstmt.setInt(1, ingList.get(i).getCategorySno());
				pstmt.setInt(2, ingList.get(i).getIngreAmount());
				pstmt.setString(3, ingList.get(i).getIngreUnit());
				pstmt.setString(4, ingList.get(i).getIngreCategory());
				
				result = result * pstmt.executeUpdate();
			}
			
			for(int i=0; i<addList.size(); i++) {
				pstmt.setInt(1, addList.get(i).getCategorySno());
				pstmt.setInt(2, addList.get(i).getIngreAmount());
				pstmt.setString(3, addList.get(i).getIngreUnit());
				pstmt.setString(4, addList.get(i).getIngreCategory());
				
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
