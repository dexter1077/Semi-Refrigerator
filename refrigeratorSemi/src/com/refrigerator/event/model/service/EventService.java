package com.refrigerator.event.model.service;

import static com.refrigerator.common.JDBCTemplate.*;
import static com.refrigerator.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import com.refrigerator.common.model.vo.PageInfo;
import com.refrigerator.event.model.dao.EventDao;
import com.refrigerator.event.model.vo.AdmEvent;

public class EventService {

	
	/***
	 * 전체 이벤트 갯수 조회
	 * @author seong
	 * @date 5/31
	 * @return
	 */
	
	public int selectEventListCount() {
		
		Connection conn = getConnection();
		int listCount = new EventDao().selectEventListCount(conn);
		
		
		close(conn);
		
		return listCount;
		
	}
	
	
	/**
	 * 전체 이벤트 목록 조회
	 * @author seong
	 * @date 5/31
	 */
	
	public ArrayList<AdmEvent> adminSelectEventList(PageInfo pi){
		
		Connection conn = getConnection();

		ArrayList<AdmEvent>list = new EventDao().adminSelectEventList(conn,pi);

		close(conn);
		
		return list;
		
		
		
	}
	
	/**
	 * 관리자단에서 이벤트 등록
	 * @author seong
	 * @date 5/31
	 */
	
	public int adminInsertEvent(AdmEvent adEvent) {
		
		Connection conn = getConnection();
		int result = new EventDao().adminInsertEvent(conn,adEvent);
		
		if(result>0) {
			
			commit(conn);
			
		} else {
			
			rollback(conn);
			
		}
		
		 close(conn);
		return result;
		
	}
	
	

	/**
	 * 관리자단에서 이벤트 수정
	 * @author seong
	 * @date 6/1
	 */
	
	public int adminUpdateEvent(AdmEvent adEvent) {
		
		Connection conn = getConnection();
		int result = new EventDao().adminUpdateEvent(conn,adEvent);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
			
		}
		 close(conn);
		return result;
		
	}
	
	
	/**
	 * 관리자단에서 이벤트 삭제
	 * @author seong
	 * @date 6/1 
	 */
	
	public int adminDeleteEvent(int eventNo) {
		
		Connection conn = getConnection();
		int result = new EventDao().adminDeleteEvent(conn,eventNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		 close(conn);
		return result;
		
		
	}
	
	
	/**
	 * 사용자단에서 진행중인 이벤트 조회
	 * @author seong
	 * @date 6/3
	 */
	
	public ArrayList<AdmEvent> userSelectEventList(PageInfo pi){
		
		Connection conn = getConnection();

		ArrayList<AdmEvent>list = new EventDao().userSelectEventList(conn,pi);

		close(conn);
		
		return list;
		
		
		
	}	
	
	/**
	 * 사용자단에서 종료된 이벤트 조회
	 * @author seong
	 * @date 6/3
	 */
	
	public ArrayList<AdmEvent> userSelectEndEventList(PageInfo pi){
		
		Connection conn = getConnection();

		ArrayList<AdmEvent>list = new EventDao().userSelectEndEventList(conn,pi);

		close(conn);
		
		return list;
		
		
		
	}	
	
	
	
}
