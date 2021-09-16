package com.refrigerator.scrap.model.service;

import static com.refrigerator.common.JDBCTemplate.close;
import static com.refrigerator.common.JDBCTemplate.commit;
import static com.refrigerator.common.JDBCTemplate.getConnection;
import static com.refrigerator.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.refrigerator.scrap.model.dao.ScrapDao;
import com.refrigerator.scrap.model.vo.Scrap;

/** @author Jaewon */

public class ScrapService {
//------------------------------------------------------------------------------------------------
	public ArrayList<Scrap> selectList(int loginUserNo){
		Connection conn = getConnection();
		ArrayList<Scrap> list = new ScrapDao().selectList(conn, loginUserNo);
		close(conn);
		return list;	
	}
//-----------------------------------------------------------------------------------------------
	public int deleteScrap(int userNo, int recipeNo){
		Connection conn = getConnection();
		int result = new ScrapDao().deleteScrap(conn, userNo, recipeNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;		
	}
	
	/**
	 * @author leeyeji
	 * 유저 레시피 스크랩 insert
	 */
	public int insertScrap(int recipeNo, int userNo) {
		Connection conn = getConnection();
		int result = new ScrapDao().insertScrap(conn, recipeNo, userNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;	
	}
	
	
	/**
	 * 스크랩 insert시 스크랩 카운트 증가
	 * @author seong
	 */
	
	public int increaseScrapCount(int recipeNo,int userNo) {
		
		Connection conn = getConnection();
		int scrapCount = new ScrapDao().increaseScrapCount(conn,recipeNo,userNo);
		if(scrapCount>0){
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return scrapCount;
	}
	
	
	
	
}
