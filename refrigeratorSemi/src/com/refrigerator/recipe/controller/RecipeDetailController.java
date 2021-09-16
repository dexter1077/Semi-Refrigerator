package com.refrigerator.recipe.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.ingre.model.vo.Ingre;
import com.refrigerator.ingre.model.vo.SubIngre;
import com.refrigerator.ingre_search.model.vo.IngreSearch;
import com.refrigerator.recipe.model.service.RecipeService;
import com.refrigerator.recipe.model.vo.Recipe;
import com.refrigerator.reicpe_order.model.vo.RecipeOrder;

/**
 * @author seong
 * @date 6/4 맵핑값 변경
 * Servlet implementation class RecipeDetailController
 */

@WebServlet("/detail.recipe")
public class RecipeDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// 레시피 번호 
		int recipeNo = Integer.parseInt(request.getParameter("rno"));
		
		//조회수 증가
		int result = new RecipeService().increaseCount(recipeNo);

		// 레시피 메인 정보 조회!
		Recipe rc = new RecipeService().selectRecipeDetailList(recipeNo);
		
		//필수 재료 조회
		ArrayList <Ingre> ingre = new RecipeService().selectMainIngreList(recipeNo);
		
		//부가 재료 조회 
		ArrayList<SubIngre> subIngre = new RecipeService().selectSubIngreList(recipeNo);
		
		//재료 검색 버튼
		ArrayList<IngreSearch> ingreSearch =  new RecipeService().selectIngreSearchList(recipeNo);
		
		// 리뷰의 총 갯수
		int reviewCount = new RecipeService().selectReviewCount(recipeNo);
		
		// 댓글의 총 갯수
		int replyCount = new RecipeService().selectReplyCount(recipeNo);
		
		
		if(rc != null ) { // 레시피 정보가 있을 때 
			
			ArrayList<RecipeOrder> list = new RecipeService().selectRecipeOrder(recipeNo);
			
			request.setAttribute("ingre", ingre);
			request.setAttribute("subIngre", subIngre);
			request.setAttribute("list2", list);
			request.setAttribute("rc", rc);
			request.setAttribute("recipeNo", recipeNo);
			request.setAttribute("IngreSeach", ingreSearch);
			request.setAttribute("reviewCount", reviewCount);
			request.setAttribute("replyCount",replyCount);
			request.getRequestDispatcher("views/recipe/recipeDetailView.jsp").forward(request, response);
			
		/*윗부분 작업중*/

		}else { // 레시피 정보가 없을 때 
			
			request.setAttribute("errorTitleMst","레시피 정보를 찾을 수 없습니다");
			request.setAttribute("errorMsg", "삭제된 레시피 입니다.");
			request.getRequestDispatcher("views/common/user/errorPage.jsp").forward(request, response);

			
		};
		
	
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
