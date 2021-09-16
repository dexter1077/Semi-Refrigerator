package com.refrigerator.recent_recipe.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.member.model.vo.Member;
import com.refrigerator.recent_recipe.model.service.RecentRecipeService;
import com.refrigerator.recent_recipe.model.vo.RecentRecipe;

/** @author Jaewon */

/**
 * Servlet implementation class MypageRecentRecipeListController
 */
@WebServlet("/myRecent.rcp")
public class MypageRecentRecipeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageRecentRecipeListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String before = request.getParameter("rcpNo");
		String[] needWork;
		String[] recentRecipeNo = new String[6];
		if(!before.equals("undefined")) {
			needWork = before.split(",");
		}else {
			needWork = new String[]{"0","0","0","0","0","0"};			
		}
				
		if(needWork.length != 6) {
			for(int i=0; i<needWork.length; i++) {
				recentRecipeNo[i] = needWork[i];
			}
		}else {
			recentRecipeNo = needWork;
		}
		
		for(int i=0; i<recentRecipeNo.length ; i++) {
			if((recentRecipeNo[i]) == null) {
				recentRecipeNo[i] = "0";
			}
		}
			
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		
		ArrayList<RecentRecipe> list = new ArrayList<>();
		ArrayList<RecentRecipe> firstRow = new ArrayList<>();
		ArrayList<RecentRecipe> secondRow = new ArrayList<>();

		if(loginUser != null) {
			list = new RecentRecipeService().selectList(recentRecipeNo); 
			
			if(list.size()<4) {
				firstRow = list;			
			}else {
				for(int i=0; i<3; i++){
					firstRow.add(list.get(i));
				}
				for(int i=3; i<list.size(); i++) {
					secondRow.add(list.get(i));
				}
			}
			
		}

		request.setAttribute("myPageNo", 2);

		if(loginUser == null) {
			request.getRequestDispatcher("views/member/login.jsp").forward(request, response);
		}else {// 로그인 정보 담겨있으면 ! member 수정쪽으로 이동 
			request.setAttribute("firstRow", firstRow);
			request.setAttribute("secondRow", secondRow);

			request.getRequestDispatcher("views/recent_recipe/myPageRecentRecipe.jsp").forward(request, response);
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
