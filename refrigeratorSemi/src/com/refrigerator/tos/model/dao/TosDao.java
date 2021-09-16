package com.refrigerator.tos.model.dao;

import static com.refrigerator.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import com.refrigerator.common.model.vo.PageInfo;
import com.refrigerator.tos.model.vo.Tos;

/** @author Jaewon */

public class TosDao {
	
	// 실행되는 sql문을 실행할 xml파일을 등록을 해주자! 
	private Properties prop = new Properties();
	// 전역변수로 쓰기위해서 텅비어있는 Properties객체를 생성한것이다. 
	
	public TosDao() {
		//prop.loadFromXML(new FileInputStream( 읽어들이고자하는 물리적인 경로));
		// 동기화 되어있는 경로를 제시해야한다. (드라이브에서의 물리적인 경로를 알아올수있다것이다.) .getPath메소드는 필수 ! 
		try {
			prop.loadFromXML(new FileInputStream( TosDao.class.getResource("/sql/tos/tos-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		//dao쪽 세팅 끝났다. 
	}
//-------------------------------------------------------------------------------------------------------------------------
	public int selectListCount(Connection conn) {
		//※ 페이징 처리를 위한 전체 게시슬 갯수를 가져오는 메소드
		// select문 => ResultSet객체 (한행 count만 담겨있을것이다.)
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		// 이제 받아주는 컬럼은 !!! SQLDEVELOPER상에서 조회시 나오는  컬럼명으로 받아줘야한다.
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			// 한행한열짜리가 지금 rset에 담겨있다 그래도 무조건 커서는 한번 움직여줘야한다.
			
			//한행이기에 조건문을 단것이다.
			if(rset.next()) {
				listCount = rset.getInt("count");
				// sql상에서 별칭을 부여했기에 컬럼명을 별칭으로 써주면 된다.
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
//--------------------------------------------------------------------------------	
	public ArrayList<Tos> selectList(Connection conn,PageInfo pi){
		// 넘겨받은 페이지정보 객체를 doa에 활용하여 일부의 list를 뽑아오는 메소드 그후 반환
		//select문 => resultSet (여러행)
		ArrayList<Tos> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");

		try {
			pstmt = conn.prepareStatement(sql);
			/*
			 * ex) boardLimit : 10 라는 가정하에 
			 * currentPage = 1 => 시작값 : 1 끝깞 : 10
			 * currentPage = 2 => 시작값 : 11 끝깞 : 20
			 * currentPage = 3 => 시작값 : 21 끝깞 : 30
			 * 
			 * <공식>
			 * 시작값 = (currentPage - 1) * boardLimit + 1 
			 * 끝 값 = 시작값 + boardLimit - 1
			 */
			
			// 가져올 rset에서의 첫행에 테이블기준으로 몇번째 행을 가져올것인지 정하는 숫자 (ex 1, 11, 21)
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			// 첫행에서 BoardLimit(10)개에서 -1 한 행까지 가져오겠다는것
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			// 이미 sql문에서 정렬까지 끝난것을 가상의 테이블에 정렬을 해놓은 상태로 RNUM을 바탕으로 between 사용하여 
			// 10개정도의 행을 가져오는것을 선정함 
			rset = pstmt.executeQuery();

			//☆ 다만 10개 미만의 셈플데이터가 있을시에 담겨있는 객체의 수는 자동적으로 해당 행만큼만 가져온다.
			// tos 셈플데이터 쪽에서는 일단 4개의 행만이 rset에 담겨있는것이다. 
			while(rset.next()) {
				list.add(new Tos(rset.getInt("tos_no"),
             					 rset.getString("tos_category"),
             					 rset.getString("tos_page"),
              					 rset.getString("upload_date"),
              					 rset.getDate("enroll_date"),
              					 rset.getDate("modify_date"),
              					 rset.getString("tos_note"),
              					 rset.getString("tos_title"),
              					 rset.getString("tos_content")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
				
		return list;
	}

//-------------------------------------------------------------------------------------------------------------------------
	public int insertTos(Connection conn, Tos t) {
		// insert문 => 처리된 행수 
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertTos");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, t.getTosCategory()); // 카테고리
			pstmt.setString(2, t.getTosPage()); // 페이지 
			pstmt.setString(3, t.getTosNote()); // 비고   
			pstmt.setString(4, t.getTosTitle()); // 제목   
			pstmt.setString(5, t.getTosContent()); // 내용   
						
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
//---------------------------------------------------------------------------------------------------------------------
	public Tos selectTos(Connection conn,int tosNo) {
		// select문 => ResultSet객체 (한행만 조회된다.)
		Tos t = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTos");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,tosNo);
						
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				//이제 rset에 담긴것을 Notice객체에 넣어주자 (매개변수 생성자 이용해서 )
				t = new Tos(rset.getInt("tos_no"),
							rset.getString("tos_category"),	
							rset.getString("tos_page"),
							rset.getString("tos_note"),
							rset.getString("tos_title"),	
							rset.getString("tos_content")
							);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return t;
	}
//----------------------------------------------------------------------------------------
	public int updateTos(Connection conn, Tos t) {
		// update문 => 처리된 행수
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateTos");

		//util에 있는것 import해야함 
		Date sysdate = new Date();
		SimpleDateFormat fm = new SimpleDateFormat("yy/MM/dd");

		
		String uploadDate = null;
		if(t.getTosCategory().equals("게시중")){
			uploadDate = fm.format(sysdate);
		}
				
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, t.getTosTitle());
			pstmt.setString(2, t.getTosCategory());
			pstmt.setString(3, t.getTosPage());
			pstmt.setString(4, uploadDate);
			pstmt.setString(5, t.getTosContent());
			pstmt.setString(6, t.getTosNote());
			pstmt.setInt(7, t.getTosNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
//----------------------------------------------------------------------
	public int deleteTos(Connection conn, int tosNo) {
		// delete문 => 처리된 행수
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteTos");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, tosNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;

	}
//----------------------------------------------------------------------
	public Tos selectUsableTos(Connection conn,String page) {
		// select문 => ResultSet객체 (한행만 조회된다.)
		Tos t = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectUsableTos");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, page);
						
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				//이제 rset에 담긴것을 Notice객체에 넣어주자 (매개변수 생성자 이용해서 )
				t = new Tos(rset.getInt("tos_no"),
							rset.getString("tos_category"),	
							rset.getString("tos_page"),
							rset.getString("tos_note"),
							rset.getString("tos_title"),	
							rset.getString("tos_content")
							);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return t;
	}
	
}
