package com.refrigerator.common;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCTemplate {

	public static Connection getConnection() {
			
			Properties prop = new Properties(); 
			
			String fileName = JDBCTemplate.class.getResource("/sql/driver/driver.properties").getPath(); 
			
			try {
				prop.load(new FileInputStream(fileName));
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			Connection conn = null;
			
			try {
				Class.forName(prop.getProperty("driver"));
				
					conn = DriverManager.getConnection(prop.getProperty("url"),
													   prop.getProperty("username"),
													   prop.getProperty("password"));
			} catch (ClassNotFoundException e) { 
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return conn;
			
		}
		
		//commit해주는 메소드
		public static void commit(Connection conn) {
			try {
				if(conn != null && !conn.isClosed()) {
					conn.commit();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		//rollback해주는 메소드
		public static void rollback(Connection conn) {
			try {
				if(conn != null && !conn.isClosed()) {
					conn.rollback();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		// Connection 반납시켜주는 메소드
		public static void close(Connection conn) {
			try {
				if(conn != null && !conn.isClosed()) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		//Statement 반납시켜주는 메소드
		public static void close(Statement stmt) {
			try {
				if(stmt != null && !stmt.isClosed()) {
					stmt.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		//ResultSet 반납시켜주는 메소드
		public static void close(ResultSet rset) {
			try {
				if(rset != null && !rset.isClosed()) {
					rset.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	
}
