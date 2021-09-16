package com.refrigerator.banner.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.banner.model.service.BannerService;
import com.refrigerator.banner.model.vo.Banner;
import com.refrigerator.common.model.vo.PageInfo;
import com.refrigerator.recipe.model.service.RecipeService;

/**
 * Servlet implementation class AdminBannerRecipeListController
 */
@WebServlet("/adRecipeList.banner")
public class AdminBannerRecipeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBannerRecipeListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. 페이징처리
		int listCount;		// 현재 총 게시글 개수
		int currentPage;	// 현재 페이지 (즉, 사용자가 요청한 페이지)
		int pageLimit;		// 페이지 하단에 보여질 페이징바의 페이지 최대 개수 (몇개 단위씩)
		int boardLimit;		// 한 페이지 내에 보여질 개시글 최대 개수 (몇개 단위씩)
				
		int maxPage;		// 가장 마지막 페이지 (총 페이지 수)
		int startPage;		// 페이지 하단에 보여질 페이징바의 시작수
		int endPage;		// 페이지 하단에 보여질 페이징바의 끝수
				
		// *1. listCount : 총 게시글 개수
		listCount = new RecipeService().selectListCount();
						
		// *2. currentPate : 현재 페이지 (즉, 사용자가 요청한 페이지)
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
						
		// *3. pageLimit : 하단에 보여질 페이징바의 페이지 최대 개수(페이지 목록들 몇 개 단위)
		pageLimit = 10;
						
		// *4. boardLimit : 한 페이지 내에 보여질 게시글 최대 개수
		boardLimit = 10;
						
		// *5. maxPage : 제일 마지막 페이지 수 (총 페이지 수)
						
		// 1) listCount/boardLimit 둘중에 아무거나 double 실수형으로 강제 형변환   
		// 2) Math.ceil 올림처리한 실수값 ceil은 double형으로 반환함 -> 최종결과를 int로 강제형변환까지 해주기
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
						
		// * 6. startPage : 페이지 하단에 보여질 페이징바의 시작 수
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
						
		// * 7. endPage : 페이지 하단에 보여질 페이징바의 끝 수
		endPage = startPage + pageLimit - 1;
		// => endPage를 maxPage로 변경
		if(endPage > maxPage) {
			endPage = maxPage;
		}
				
		// 2. 7개의 페이지 정보들을 하나의 공간에 담아서 보내자!
		//    페이징 바 만들 때 필요한 객체
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);		
		
		// 3. 게시글 리스트 ArrayList에 담아서 조회해오기
		ArrayList<Banner> list = new BannerService().selectBannerRecipeList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/banner/adminBannerRecipe.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
