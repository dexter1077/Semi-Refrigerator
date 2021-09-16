package com.refrigerator.category.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.common.model.vo.PageInfo;
import com.refrigerator.recipe.model.service.RecipeService;
import com.refrigerator.recipe.model.vo.Recipe;

/** @author Jaewon */

/**
 * Servlet implementation class SearchCategoryViewController
 */
@WebServlet("/saerchCat.cat")
public class SearchCategoryViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchCategoryViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int subCatNo= Integer.parseInt(request.getParameter("sno"));	
		
		int listCount; 	
		int currentPage;
		int pageLimit;	
		int boardLimit;	
						
		int maxPage;
		int startPage;
		int endPage;
						
		listCount = new RecipeService().selectListCount(subCatNo);
						
		currentPage = Integer.parseInt(request.getParameter("currentPage"));		
		
		pageLimit = 5;
						
		boardLimit = 12;
						
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
						
		startPage = (currentPage -1) / pageLimit * pageLimit + 1;
						
		endPage = startPage + pageLimit - 1;
						
		if(endPage > maxPage) {
			endPage = maxPage;
		}
						
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Recipe> pageList = new RecipeService().selectRecipeList(pi, subCatNo);
		
		request.setAttribute("pi", pi);
		request.setAttribute("pageList", pageList);
		
		request.getRequestDispatcher("views/recipe/recipeListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
