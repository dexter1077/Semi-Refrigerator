package com.refrigerator.like.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class LikeDao {
	
	private Properties prop = new Properties();

	public LikeDao() {
		
		String filePath = LikeDao.class.getResource("/sql/like/like-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
