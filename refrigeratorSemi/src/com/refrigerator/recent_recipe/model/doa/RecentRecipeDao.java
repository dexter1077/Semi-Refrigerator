package com.refrigerator.recent_recipe.model.doa;

import static com.refrigerator.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.refrigerator.recent_recipe.model.vo.RecentRecipe;
import com.refrigerator.scrap.model.vo.Scrap;

/** @author Jaewon */

public class RecentRecipeDao {
	private Properties prop = new Properties();
	
	public RecentRecipeDao() {
		try {
			prop.loadFromXML(new FileInputStream(RecentRecipeDao.class.getResource("/sql/recent_recipe/recent_recipe-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
//-----------------------------------------------------------------------------------
	public ArrayList<RecentRecipe> selectList(Connection conn, String[] recentRecipeNo){
		ArrayList<RecentRecipe> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(recentRecipeNo[0]));
			pstmt.setInt(2, Integer.parseInt(recentRecipeNo[1]));
			pstmt.setInt(3, Integer.parseInt(recentRecipeNo[2]));
			pstmt.setInt(4, Integer.parseInt(recentRecipeNo[3]));
			pstmt.setInt(5, Integer.parseInt(recentRecipeNo[4]));
			pstmt.setInt(6, Integer.parseInt(recentRecipeNo[5]));
			pstmt.setInt(7, Integer.parseInt(recentRecipeNo[0]));
			pstmt.setInt(8, Integer.parseInt(recentRecipeNo[1]));
			pstmt.setInt(9, Integer.parseInt(recentRecipeNo[2]));
			pstmt.setInt(10, Integer.parseInt(recentRecipeNo[3]));
			pstmt.setInt(11, Integer.parseInt(recentRecipeNo[4]));
			pstmt.setInt(12, Integer.parseInt(recentRecipeNo[5]));

			rset = pstmt.executeQuery();

			while(rset.next()) {
				list.add(new RecentRecipe(rset.getInt("RECIPE_NO"),
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
}
