package com.refrigerator.follow.model.service;

import static com.refrigerator.common.JDBCTemplate.rollback;
import static com.refrigerator.common.JDBCTemplate.commit;
import static com.refrigerator.common.JDBCTemplate.close;
import static com.refrigerator.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.refrigerator.common.model.vo.PageInfo;
import com.refrigerator.follow.model.dao.FollowDao;
import com.refrigerator.follow.model.vo.FollowStats;

public class FollowService {


	/**
	 * 마이페이지 - 로그인한 유저의 번호 => 팔로잉한 유저들 count
	 * @author HeeRak
	 */
	public int selectFollowListCount(int userNo) {
		Connection conn = getConnection();
		int listCount = new FollowDao().selectFollowListCount(conn, userNo);
		close(conn);
		return listCount;
	}

	/**
	 * 마이페이지 - 로그인한 유저의 번호 => 팔로잉한 유저들 통계일부 list 조회
	 * @author HeeRak
	 */
	public ArrayList<FollowStats> selectFollowStatsList(PageInfo pi, int userNo) {
		Connection conn = getConnection();
		ArrayList<FollowStats> list = new FollowDao().selectFollowStatsList(conn, pi, userNo);
		close(conn);
		return list;
	}

	/**
	 * 마이페이지 - 팔로잉한 유저 최근 레시피 4개 조회
	 * @author HeeRak
	 */
	public ArrayList<String> selectTopRecipe(int userNo) {
		Connection conn = getConnection();
		ArrayList<String> list = new FollowDao().selectTopRecipe(conn, userNo);
		close(conn);
		return list;
	}

	/**
	 * 마이페이지 - 팔로잉한 유저 통계 정보 2개 조회
	 * @author HeeRak
	 */
	public FollowStats selectFollowStatsListCount(int userNo) {
		Connection conn = getConnection();
		FollowStats fs = new FollowDao().selectFollowStatsListCount(conn, userNo);
		close(conn);
		return fs;
	}

	/**
	 * 마이페이지 - 팔로우 관계 삭제
	 * @author HeeRak
	 */
	public int deleteFollowRelation(int followUserNo, int followingUserNo) {
		Connection conn = getConnection();
		int result = new FollowDao().deleteFollowRelation(conn, followUserNo, followingUserNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

}
