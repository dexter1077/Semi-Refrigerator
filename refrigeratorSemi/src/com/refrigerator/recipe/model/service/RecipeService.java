package com.refrigerator.recipe.model.service;

import static com.refrigerator.common.JDBCTemplate.close;
import static com.refrigerator.common.JDBCTemplate.commit;
import static com.refrigerator.common.JDBCTemplate.getConnection;
import static com.refrigerator.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.refrigerator.common.model.vo.PageInfo;
import com.refrigerator.ingre.model.vo.Ingre;
import com.refrigerator.ingre.model.vo.SubIngre;
import com.refrigerator.ingre_search.model.vo.IngreSearch;
import com.refrigerator.recipe.model.dao.RecipeDao;
import com.refrigerator.recipe.model.vo.Recipe;
import com.refrigerator.reply.model.vo.Reply;
import com.refrigerator.review.model.vo.Review;
import com.refrigerator.reicpe_order.model.vo.RecipeOrder;

public class RecipeService {

	/** 
	 * @author  daeun / seong 
	 */
	
	
	/**
	 * 레시피 상세 페이지의 댓글 전체 목록 조회 리스트 
	 * @author seong
	 * @date 0528
	 * @return
	 */
	
	public ArrayList<Reply> selectReplyList(int recipeNo){
		
		Connection conn = getConnection();
		
		// 조회문 => 여러 행 조회 
		
		ArrayList<Reply> list = new RecipeDao().selectReplyList(conn,recipeNo);
		
		close(conn);
		
		return list;
		
		
	}
	
	/**
	 * 레시피 상세 페이지 댓글 작성 기능 
	 * @author seong
	 * @date 0528
	 */
	
	public int insertReply(Reply r) {
		
		Connection conn = getConnection();
		int result = new RecipeDao().insertReply(conn, r);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	
	/**
	 * 레시피 전체 목록 조회 리스트
	 * @author seong
	 * @date  0528
	 */
	
	public ArrayList<Review> selectReviewList(int recipeNo){
		
		
		Connection conn = getConnection();
		ArrayList<Review> list = new RecipeDao().selectReviewList(conn,recipeNo);
		
		close(conn);
		return list;
		
		
	}
	
	
	/**
	 * 레시피 후기 작성 기능
	 * @author seong
	 * @date 0528
	 */
	
	public int insertReview(Review rv) {
		
		Connection conn = getConnection();
		
		int result = new RecipeDao().insertReview(conn,rv);
				
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
		
	}

	/**
	 * 관리자페이지 - 배너 레시피 조회
	 * @author daeun
	 */
	/*
	public Recipe selectRecipe(int recipeNo) {
		Connection conn = getConnection();
		Recipe rc = new RecipeDao().selectRecipe(conn, recipeNo);
		close(conn);
		return rc;
		
		
	}*/
	
	/**
	 * 레시피등록페이지 - insert요청처리
	 * @author HeeRak
	 */
	public int insertRecipe(Recipe inRecipe, ArrayList<IngreSearch> sbList, ArrayList<Ingre> ingList, ArrayList<Ingre> addList, ArrayList<RecipeOrder> ordList) {
		Connection conn = getConnection();
		int result = new RecipeDao().insertRecipe(conn, inRecipe, sbList, ingList, addList, ordList);
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
	 * 페이징 - 총 페이지 수
	 */
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new RecipeDao().selectListCount(conn);
		close(conn);
		return listCount;
	}
	
	/**
	 * @author leeyeji
	 * 레시피 전체 목록 조회
	 */
	public ArrayList<Recipe> selectRecipeList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Recipe> list = new RecipeDao().selectRecipeList(conn, pi);
		
		close(conn);
		return list;
	}
	
	/** 메인 레시피 조회수별 리스트
	 * @author daeun
	 */
	public ArrayList<Recipe> selectMainSortViewList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Recipe> list = new RecipeDao().selectMainSortViewList(conn, pi);
		close(conn);
		return list;
	}
	
	/**
	 * 
	 * 레시피 상세 페이지 조회
	 * @author seong
	 * @date 6/3
	 */
	
	public Recipe selectRecipeDetailList(int recipeNo){
		Connection conn = getConnection();
		Recipe rc = new RecipeDao().selectRecipeDetailList(conn,recipeNo);
		close(conn);
		return rc;
		
	}
	
	/**
	 * 레시피 상세 페이지에서 요리 순서 조회하기
	 * @author seong
	 * @date 6/3
	 * @return
	 */
	
	public ArrayList<RecipeOrder>selectRecipeOrder(int recipeNo){
		Connection conn = getConnection();
		ArrayList<RecipeOrder> list = new RecipeDao().selectRecipeOrder(conn, recipeNo);
		close(conn);
		return list;
	}
	
	/**
	 * @author leeyeji
	 * 레시피 최신순 조회
	 */
	public ArrayList<Recipe> selectLatestRecipeList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Recipe> list = new RecipeDao().selectLatestRecipeList(conn, pi);
		close(conn);
		return list;
	}
	
	/**
	 * @author leeyeji
	 * 레시피 별점순 조회
	 */
	public ArrayList<Recipe> selectStarRecipeList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Recipe> list = new RecipeDao().selectStarRecipeList(conn, pi);
		close(conn);
		return list;
	}
	
	
	/**
	 * 레시피 상세조회 클릭시 해당 레시피에 조회수 증가
	 * @author seong
	 * @date 6/4
	 */
	
	public int increaseCount(int recipeNo) {
		Connection conn = getConnection();
		int result = new RecipeDao().increaseCount(conn, recipeNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/**
	 * 레시피 상세보기 페이지 [필수 재료 조회]
	 * @author seong
	 * @date 6/4
	 */
	
	public ArrayList<Ingre>selectMainIngreList(int recipeNo){
		Connection conn = getConnection();
		ArrayList<Ingre>ingre = new RecipeDao().selectMainIngreList(conn, recipeNo);
		close(conn);
		return ingre;
	}
	
	/**
	 * 레시피 상세보기 페이지 [부가 재료 조회]
	 * @author seong
	 * @date 6/4
	 */
	
	public ArrayList<SubIngre>selectSubIngreList(int recipeNo){
		Connection conn = getConnection();
		ArrayList <SubIngre> subIngre = new RecipeDao().selectSubIngreList(conn,recipeNo);
		close(conn);
		return subIngre;
	}

	/**
	 * @author leeyeji
	 * 특정 유저 레시피 목록 조회
	 */
	public ArrayList<Recipe> selectUserRecipeList(PageInfo pi, int recipeNo){
		Connection conn = getConnection();
		ArrayList<Recipe> list = new RecipeDao().selectUserRecipeList(conn, pi, recipeNo);
		close(conn);
		return list;
	}
	
	/**
	 * @author leeyeji
	 * 쉐프 레시피 총 페이지 수
	 */
	public int chefRecipeCount(int userNo) {
		Connection conn = getConnection();
		int listCount = new RecipeDao().chefRecipeCount(conn, userNo);
		close(conn);
		return listCount;
	}
	
	/**
	 * @author leeyeji
	 * 오늘의 쉐프 레시피 목록 조회
	 */
	public ArrayList<Recipe> selectChefRecipeList(PageInfo pi, int userNo){
		Connection conn = getConnection();
		ArrayList<Recipe> list = new RecipeDao().selectChefRecipeList(conn, pi, userNo);
		close(conn);
		return list;
	}
	
	/**
	 * 레시피 상세 보기 페이지의 재료 검색 버튼 
	 * @author seong
	 * @date 6/5 
	 */
	
	public ArrayList<IngreSearch>selectIngreSearchList(int recipeNo){
		Connection conn = getConnection();
		ArrayList<IngreSearch> list = new RecipeDao().selectIngreSearchList(conn, recipeNo);
		close(conn);
		return list;
	}
	
	/** 메인페이지 - 레시피 정보 조회
	 * @author daeun
	 */
	public ArrayList<Recipe> selectMainRecipe(){
		Connection conn = getConnection();
		ArrayList<Recipe> list = new RecipeDao().selectMainRecipe(conn);
		close(conn);
		return list;
	}
	
	
	
	/** 마이페이지 내 레시피 목록 갯수 구하는 메소드 
	 * @author Jaewon 
	 */
	public int selectMyRecipeListCount(int userNo) {
		Connection conn = getConnection();
		int listCount = new RecipeDao().selectMyRecipeListCount(conn, userNo);
		close(conn);
		return listCount;
	}


	/** 마이페이지 내 레시피에서  지정한 보여줄 게시글 수에 따른 레시피 정보 조회 메소드 
	 * @author Jaewon 
	 */
	public ArrayList<Recipe> selectMyRecipeList(PageInfo pi, int userNo){
		Connection conn = getConnection();
		ArrayList<Recipe> list = new RecipeDao().selectMyRecipeList(conn, pi, userNo);
		close(conn);
		return list;
	}

	/** 마이페이지 내 레시피에서 삭제 (update status)하는 메소드
	 * @author Jaewon 
	 */
	public int deleteMyRecipe(int userNo,int recipeNo) {
		Connection conn = getConnection();
		int result = new RecipeDao().deleteMyRecipe(conn, userNo, recipeNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	//---------------------------------------------------------------------------
	/** 마이페이지 내 레시피에서 수정페이지로 정보를 넘기며 이동하는 메소드
	 * @author Jaewon 
	 */
	public Recipe selectMyRecipe(int userNo,int recipeNo) {
		Connection conn = getConnection();
		Recipe myRecipe = new RecipeDao().selectMyRecipe(conn, userNo, recipeNo);
		close(conn);
		return myRecipe;
	}
	
	/** 내 레시피의 ingreSearch정보를 가져오는 메소드
	 * @author Jaewon 
	 */
	public ArrayList<IngreSearch> selectMyIngreSearch(int recipeNo){
		Connection conn = getConnection();
		ArrayList<IngreSearch> list = new RecipeDao().selectMyIngreSearch(conn, recipeNo);
		close(conn);
		return list;
	}
	
	/** 내 레시피의 ingre정보를 가져오는 메소드
	 * @author Jaewon 
	 */
	public ArrayList<Ingre> selectMyIngre(int recipeNo){
		Connection conn = getConnection();
		ArrayList<Ingre> list = new RecipeDao().selectMyIngre(conn, recipeNo);
		close(conn);
		return list;
	}

	/** 내 레시피의 RecipeOrder정보를 가져오는 메소드
	 * @author Jaewon 
	 */
	public ArrayList<RecipeOrder> selectMyRecipeOrder(int recipeNo){
		Connection conn = getConnection();
		ArrayList<RecipeOrder> list = new RecipeDao().selectMyRecipeOrder(conn, recipeNo);
		close(conn);
		return list;
	}

	//---------------------------------------------------------------------------


	/**
	 * 레시피 상세 페이지에서 작성된 리뷰의 총 갯수 조회
	 * @author seong
	 * @date 6/6
	 */
	
	public int selectReviewCount(int recipeNo) {
		Connection conn = getConnection();
		int reviewCount = new RecipeDao().selectReviewCount(conn, recipeNo);
		close(conn);
		return reviewCount;
	}
	
	
	/**
	 * 레시피 상세 페이지에서 작성된 댓글의 총 갯수 조회
	 * @author seong
	 * @date 6/6
	 */
	
	public int selectReplyCount(int recipeNo) {
		Connection conn = getConnection();
		int replyCount = new RecipeDao().selectReplyCount(conn, recipeNo);
		close(conn);
		return replyCount;
	}
	
	/**
	 * 레시피 평균 별점 업데이트
	 * @author seong
	 * @date 6/6
	 */
	
	public int avgStarUpdate(int recipeNo) {
		
		Connection conn= getConnection();
		int result = new RecipeDao().avgStarUpdate(conn,recipeNo);
		close(conn);
		return result;
		
	}
	
	
	/**
	 * @author leeyeji
	 * 레시피 검색 총 갯수
	 */
	public int selectSearchListCount(String query) {
		Connection conn= getConnection();
		int listCount = new RecipeDao().selectSearchListCount(conn, query);
		close(conn);
		return listCount;
	}
	
	/**
	 * @author leeyeji
	 * 검색어로 레시피 검색
	 */
	public ArrayList<Recipe> selectSearchList(PageInfo pi, String query){
		Connection conn = getConnection();
		ArrayList<Recipe> list = new RecipeDao().selectSearchList(conn, pi, query);
		close(conn);
		return list;
	}
	
	/** 카테고리별 검색 메소드 (오버로딩개념)
	 * @author Jaewon 
	 */ 
	public int selectListCount(int subCatNo) {
		Connection conn = getConnection();
		int listCount = new RecipeDao().selectListCount(conn, subCatNo);
		close(conn);
		return listCount;
	}

	/** 소분류에 따라 레시피 리스트 가져오는 메소드 (오버로딩 개념 )
	 * @author Jaewon 
	 */ 
	public ArrayList<Recipe> selectRecipeList(PageInfo pi, int subCatNo){
		Connection conn = getConnection();
		ArrayList<Recipe> list = new RecipeDao().selectRecipeList(conn, pi, subCatNo);
		
		close(conn);
		return list;
	}
	
	/** 레시피 일부 수정 
	 * @author Jaewon 
	 */ 
	public int updateRecipe(int recipeNo, int userNo, String recipeTitle,String recipeIntro,int servings,int time,String mainImg) {
		Connection conn = getConnection();
		int result = new RecipeDao().updateRecipe(conn, recipeNo, userNo, recipeTitle, recipeIntro, servings, time, mainImg);
		close(conn);
		return result;
	}
	
	/** 메인페이지 - 오늘의 레시피 정보 조회
	 * @author daeun
	 */
	public ArrayList<Recipe> selectTodayRecipe(){
		Connection conn = getConnection();
		ArrayList<Recipe> list = new RecipeDao().selectTodayRecipe(conn);
		close(conn);
		return list;
	}
	
	/** 메인페이지 - 쉐프가 선택한 레시피 정보 조회
	 * @author daeun
	 */
	public ArrayList<Recipe> selectChefRecipe(){
		Connection conn = getConnection();
		ArrayList<Recipe> list = new RecipeDao().selectChefRecipe(conn);
		close(conn);
		return list;
	}

}
