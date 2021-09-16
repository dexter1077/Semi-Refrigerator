package com.refrigerator.ingre.model.service;

import static com.refrigerator.common.JDBCTemplate.getConnection;
import static com.refrigerator.common.JDBCTemplate.commit;
import static com.refrigerator.common.JDBCTemplate.rollback;
import static com.refrigerator.common.JDBCTemplate.close;

import java.sql.Connection;
import java.util.ArrayList;

import com.refrigerator.ingre.model.dao.IngreDao;
import com.refrigerator.ingre.model.vo.Ingre;

public class IngreService {

	/**
	 * 레시피등록페이지에서 필수|부가재료 정보 insert 요청처리
	 * @author HeeRak
	 */
	public int insertIngreList(ArrayList<Ingre> ingList, ArrayList<Ingre> addList) {
		Connection conn = getConnection();
		int result = new IngreDao().insertIngreList(conn, ingList, addList);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return 0;
	}

}
