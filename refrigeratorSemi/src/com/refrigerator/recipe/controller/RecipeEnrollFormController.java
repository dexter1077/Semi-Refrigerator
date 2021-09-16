package com.refrigerator.recipe.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.category.model.service.MainCategoryService;
import com.refrigerator.category.model.service.SubCategoryService;
import com.refrigerator.category.model.vo.MainCategory;
import com.refrigerator.category.model.vo.SubCategory;
import com.refrigerator.member.model.vo.Member;

/**
 * 레시피 등록 페이지 화면 요청(카테고리쪽 데이터 조회)
 * @author HeeRak
 * Servlet implementation class RecipeEnrollController
 */
@WebServlet("/enroll.rcp")
public class RecipeEnrollFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeEnrollFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		int userNo = 0;
		
		if(loginUser == null) {// 로그인 정보가 담겨있지 않다면 ! 로그인 페이지로 이동 
			request.getRequestDispatcher("views/member/login.jsp").forward(request, response);
		}else {// 로그인 정보 담겨있으면 
			userNo = loginUser.getUserNo();
		}
		
		ArrayList<MainCategory> mList = new MainCategoryService().selectMainList();
		ArrayList<SubCategory> sList = new SubCategoryService().selectSubListByMainCategory(1);
		
		
		request.setAttribute("userNo", userNo);
		request.setAttribute("mList", mList);
		request.setAttribute("sList", sList);
		
		request.getRequestDispatcher("views/recipe/recipeEnrollView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
