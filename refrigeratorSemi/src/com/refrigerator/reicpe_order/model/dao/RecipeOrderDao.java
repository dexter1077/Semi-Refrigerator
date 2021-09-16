package com.refrigerator.reicpe_order.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.refrigerator.reicpe_order.model.vo.RecipeOrder;
import static com.refrigerator.common.JDBCTemplate.close;

/**
 * @author HeeRak
 */
public class RecipeOrderDao {

	Properties prop = new Properties();
	
	public RecipeOrderDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(RecipeOrderDao.class.getResource("/sql/recipe_order/recipe_order-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}


}
