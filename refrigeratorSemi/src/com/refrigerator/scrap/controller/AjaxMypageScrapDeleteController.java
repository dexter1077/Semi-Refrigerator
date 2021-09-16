package com.refrigerator.scrap.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.member.model.vo.Member;
import com.refrigerator.scrap.model.service.ScrapService;

/** @author Jaewon */

/**
 * Servlet implementation class MypageScrapDeleteController
 */
@WebServlet("/delete.scr")
public class AjaxMypageScrapDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxMypageScrapDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		
		int userNo = 0;
		if(loginUser != null) {
			userNo = loginUser.getUserNo(); 
		}		
		int recipeNo = Integer.parseInt(request.getParameter("recipeNo"));
		
		if(loginUser == null) {// 로그인 정보가 담겨있지 않다면 ! 로그인 페이지로 이동 
			request.getRequestDispatcher("views/member/login.jsp").forward(request, response);
		}
		
		int result = new ScrapService().deleteScrap(userNo, recipeNo);

		response.setContentType("text/html; charset=UTF-8");

		if(result > 0) {// 
			response.getWriter().print("성공적으로 찜한 레시피를 삭제하였습니다");
		}else {
			response.getWriter().print("찜하기 삭제에 실패하였습니다 ");
			
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
