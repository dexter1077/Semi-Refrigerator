package com.refrigerator.tos.model.service;

import static com.refrigerator.common.JDBCTemplate.close;
import static com.refrigerator.common.JDBCTemplate.commit;
import static com.refrigerator.common.JDBCTemplate.getConnection;
import static com.refrigerator.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.refrigerator.common.model.vo.PageInfo;
import com.refrigerator.tos.model.dao.TosDao;
import com.refrigerator.tos.model.vo.Tos;

/** @author Jaewon */

public class TosService {
//------------------------------------------------------
	public int selectListCount() {
		//※ 페이징 처리를 위한 전체 게시슬 갯수를 가져오는 메소드
		
		Connection conn = getConnection();
		int listCount = new TosDao().selectListCount(conn);
		// 트랜젝션 처리할 필요없음 총개시글 조회만 해오는것이니! 
		
		close(conn);
		return listCount; 
	}
//------------------------------------------------------------	
	public ArrayList<Tos> selectList(PageInfo pi){
		// 넘겨받은 페이지정보 객체를 doa에 넘기고 받아와오는 메소드  
		Connection conn = getConnection();
		ArrayList<Tos> list = new TosDao().selectList(conn , pi);
		close(conn);
		return list;	
	}
//------------------------------------------------------------	
	public int insertTos(Tos t) {
		Connection conn = getConnection();
		
		int result = new TosDao().insertTos(conn, t);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
				
		return result;		
	}
//-----------------------------------------------------------------
	public Tos selectTos(int tosNo) {
		Connection conn = getConnection();
		Tos t = new TosDao().selectTos(conn, tosNo);
		close(conn);
		return t;
	}
//-----------------------------------------------------------------
	public int updateTos(Tos t) {
		Connection conn = getConnection();
		int result = new TosDao().updateTos(conn, t);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
				
		return result;		
	}
//-----------------------------------------------------------------	
	public int deleteTos(int tosNo) {
		Connection conn = getConnection();
		int result = new TosDao().deleteTos(conn, tosNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
				
		return result;		
	}
	//-----------------------------------------------------------------
		public Tos selectUsableTos(String page) {
			Connection conn = getConnection();
			Tos t = new TosDao().selectUsableTos(conn, page);
			close(conn);
			return t;
		}

}
