package com.refrigerator.recipe.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.recipe.model.service.RecipeService;

/** @author Jaewon */

/**
 * Servlet implementation class MypageMyRecipeDeleteContoller
 */
@WebServlet("/delMyRecipe.rcp")
public class MypageMyRecipeDeleteContoller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageMyRecipeDeleteContoller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// post방식으로 넘겼지만 가지고 노는 값들이 숫자라 인코딩 세팅은 필요없다.
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		int recipeNo = Integer.parseInt(request.getParameter("recipeNo"));
		
		int result = new RecipeService().deleteMyRecipe(userNo, recipeNo);
		
		if(result > 0 ) { 
			request.getSession().setAttribute("alertMsg", "성공적으로 레시피를 삭제하였습니다.");
			response.sendRedirect(request.getContextPath() + "/mylist.rcp?currentPage=1");
			
		}else {
			request.setAttribute("errorTitleMsg", "레시피 삭제 실패");
			request.setAttribute("errorMsg", "너무 정성스럽게 작성하신 레시피라서 <br> 삭제하기 좀그렇네요 <br> 개발자에게 문의해주세요");
			request.getRequestDispatcher("views/common/user/errorPage.jsp").forward(request, response);
		}

	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
