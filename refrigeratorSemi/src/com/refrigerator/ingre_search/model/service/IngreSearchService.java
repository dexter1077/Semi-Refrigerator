package com.refrigerator.ingre_search.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static com.refrigerator.common.JDBCTemplate.*;

import com.refrigerator.ingre_search.model.dao.IngreSearchDao;
import com.refrigerator.ingre_search.model.vo.IngreSearch;

/**
 * 레시피등록페이지에서 받은 검색버튼 insert요청
 * @author HeeRak
 */
public class IngreSearchService {

	public int insertIngreSearch(ArrayList<IngreSearch> sbList) {
		Connection conn = getConnection();
		int result = new IngreSearchDao().insertIngreSearch(conn, sbList);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
}
