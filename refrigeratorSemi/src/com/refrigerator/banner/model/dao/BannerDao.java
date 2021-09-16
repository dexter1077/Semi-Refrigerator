package com.refrigerator.banner.model.dao;

import static com.refrigerator.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.refrigerator.banner.model.vo.Banner;
import com.refrigerator.common.model.vo.PageInfo;
import com.refrigerator.tos.model.vo.Tos;

/** @author Jaewon */

public class BannerDao {
	private Properties prop = new Properties();
	
	public BannerDao() {
		try {
			prop.loadFromXML(new FileInputStream( BannerDao.class.getResource("/sql/banner/banner-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
//---------------------------------------------------------------------------------------------------------------------------
	public int selectListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	
//---------------------------------------------------------------------------------------------------------------------------
	public ArrayList<Banner> selectList(Connection conn,PageInfo pi){
		
		ArrayList<Banner> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");

		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();

			while(rset.next()) {
				list.add(new Banner(rset.getInt("banner_no"),
             					    rset.getString("banner_name"),
             					    rset.getString("company_name"),
             					    rset.getString("banner_category"),
             					    rset.getString("banner_status"),
             					    rset.getDate("enroll_date"),
             					    rset.getDate("modify_date"),
             					    rset.getString("start_date"),
             					    rset.getString("end_date"),
             					    rset.getString("banner_img"),
             					    rset.getString("page")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
				
		return list;
	}
//-----------------------------------------------------------------------------------------
	public int insertBanner(Connection conn,Banner ba) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertBanner");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ba.getBannerName()); 
			pstmt.setString(2, ba.getCompanyName()); 
			pstmt.setString(3, ba.getBannerCategory()); 
			pstmt.setString(4, ba.getBannerStatus()); 
			pstmt.setString(5, ba.getStartDate()); 
			pstmt.setString(6, ba.getEndDate()); 
			pstmt.setString(7, ba.getBannerImg()); 
			pstmt.setString(8, ba.getPage()); 
						
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
//--------------------------------------------------------------------------------------------	
	public int deleteBanner(Connection conn,int bannerNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteBanner");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bannerNo);
						
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
//---------------------------------------------------------------------------------------------
	public Banner selectBanner(Connection conn,int bannerNo){
		Banner selectedBanner = new Banner();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBanner");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bannerNo);
			
			rset = pstmt.executeQuery();

			while(rset.next()) {
				selectedBanner = new Banner(rset.getString("banner_name"),
											rset.getString("company_name"),	
											rset.getString("banner_category"),
											rset.getString("banner_status"),
											rset.getString("start_date"),	
											rset.getString("end_date"),
											rset.getString("banner_img"),
											rset.getString("page"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return selectedBanner;
	}
//------------------------------------------------------------------------------------------	
	public int updateBanner(Connection conn,Banner ba) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateBanner");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ba.getBannerName()); 
			pstmt.setString(2, ba.getCompanyName()); 
			pstmt.setString(3, ba.getBannerCategory()); 
			pstmt.setString(4, ba.getBannerStatus()); 
			pstmt.setString(5, ba.getStartDate()); 
			pstmt.setString(6, ba.getEndDate()); 
			pstmt.setString(7, ba.getBannerImg()); 
			pstmt.setString(8, ba.getPage()); 
			pstmt.setInt(9, ba.getBannerNo());
						
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

//---------------------------------------------------------------------------------------------------------------------------
		public ArrayList<Banner> selectBannerInfo(Connection conn){
			ArrayList<Banner> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectBannerInfo");

			try {
				pstmt = conn.prepareStatement(sql);
				rset = pstmt.executeQuery();

				while(rset.next()) {
					list.add(new Banner(rset.getString("banner_name"),
	             					    rset.getString("banner_img"),
	             					    rset.getString("page")));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
					
			return list;
		}	
//-----------------------------------------------------------------------------------------
	
	/** 배너 관리자페이지 : 메인 레시피 리스트 조회
	 * @author daeun
	 */
	public ArrayList<Banner> selectBannerRecipeList(Connection conn, PageInfo pi){
		// select => Rset
		ArrayList<Banner> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBannerRecipeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			// 페이징 (레시피 갯수에 따라 끝페이지, 마지막페이지 구하기)
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
						
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Banner(rset.getInt("banner_no"),
 					                rset.getString("banner_name"),
 					                rset.getString("company_name"),
 					                rset.getString("banner_category"),
 					                rset.getString("banner_status"),
 					                rset.getDate("enroll_date"),
 					                rset.getDate("modify_date"),
 					                rset.getString("start_date"),
 					                rset.getString("end_date"),
 					                rset.getString("banner_img"),
 					                rset.getString("page")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	
	/** 배너 관리자페이지 : 메인 레시피 등록
	 * @author daeun
	 */
	public int insertBannerRecipe(Connection conn, Banner ba){
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertBannerRecipe");
		try {
			pstmt = conn.prepareStatement(sql);
			//pstmt.setInt(1, ba.getBannerNo());
			pstmt.setString(1, ba.getBannerCategory());
			pstmt.setString(2, ba.getBannerName());
			pstmt.setString(3, ba.getCompanyName());
			pstmt.setString(4, ba.getBannerStatus());
			pstmt.setString(5, ba.getStartDate());
			pstmt.setString(6, ba.getEndDate());
			pstmt.setString(7, ba.getBannerImg());
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	/** 배너 관리자페이지 : 메인 레시피 수정
	 * @author daeun
	 */
	public int updateBannerRecipe(Connection conn, Banner ba) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateBannerRecipe");
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, ba.getBannerCategory());
			pstmt.setString(2, ba.getBannerName());
			pstmt.setString(3, ba.getCompanyName());
			pstmt.setString(4, ba.getBannerStatus());
			pstmt.setString(5, ba.getStartDate());
			pstmt.setString(6, ba.getEndDate());
			pstmt.setString(7, ba.getBannerImg());
			pstmt.setInt(8, ba.getBannerNo());
			System.out.println(ba);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	/** 배너 관리자페이지 : 메인 레시피 삭제
	 * @author daeun
	 */
	public int deleteBannerRecipe(Connection conn, int bannerNo) {
		
		// delete문 => 처리된 행 수
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteBannerRecipe");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bannerNo);
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}
