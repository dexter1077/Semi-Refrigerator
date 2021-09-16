package com.refrigerator.recent_recipe.model.service;

import static com.refrigerator.common.JDBCTemplate.close;
import static com.refrigerator.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.refrigerator.recent_recipe.model.doa.RecentRecipeDao;
import com.refrigerator.recent_recipe.model.vo.RecentRecipe;

/** @author Jaewon */

public class RecentRecipeService {
	//------------------------------------------------------------------------------------------------
		public ArrayList<RecentRecipe> selectList(String[] recentRecipeNo ){
			Connection conn = getConnection();
			ArrayList<RecentRecipe> list = new RecentRecipeDao().selectList(conn, recentRecipeNo);
			close(conn);
			return list;	
		}
}
