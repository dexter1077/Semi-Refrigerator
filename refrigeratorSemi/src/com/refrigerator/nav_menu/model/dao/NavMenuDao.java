package com.refrigerator.nav_menu.model.dao;

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

import com.refrigerator.nav_menu.model.vo.NavMenu;
import com.refrigerator.tos.model.dao.TosDao;
import com.refrigerator.tos.model.vo.Tos;

/** @author Jaewon */

public class NavMenuDao {
	private Properties prop = new Properties();
	
	public NavMenuDao() {
		try {
			prop.loadFromXML(new FileInputStream( NavMenuDao.class.getResource("/sql/nav_menu/nav_menu-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
//-------------------------------------------------------------------------------------------------------------------------
	public ArrayList<NavMenu> seletNavMenuList(Connection conn) {
		ArrayList<NavMenu> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("seletNavMenuList");

		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();

			while(rset.next()) {
				list.add(new NavMenu(rset.getInt("menu_no"),
									 rset.getString("menu_name"),
									 rset.getInt("menu_order")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
				
		return list;
	}
//--------------------------------------------------------------------------------	
	public int updateNavMenu(Connection conn, int[] navOrder) {
		// update문 => 처리된 행수
		int result = 1;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateNavMenu");
								
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, navOrder[0]);
			pstmt.setInt(2, navOrder[1]);
			pstmt.setInt(3, navOrder[2]);
			pstmt.setInt(4, navOrder[3]);
			pstmt.setInt(5, navOrder[4]);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			result=0;
		} finally {
			close(pstmt);
		}
		
		return result;
	}
//-------------------------------------------------------------------------------------
}
