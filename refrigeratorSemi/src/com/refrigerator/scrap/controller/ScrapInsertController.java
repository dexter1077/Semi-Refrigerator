package com.refrigerator.scrap.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.scrap.model.service.ScrapService;

/**
 * @author leeyeji
 * Servlet implementation class ScrapInsertController
 */
@WebServlet("/insert.scrap")
public class ScrapInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScrapInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 수정하기
		int recipeNo = Integer.parseInt(request.getParameter("recipeNo"));
		int userNo = Integer.parseInt(request.getParameter("userNo"));
	
		int result = new ScrapService().insertScrap(recipeNo, userNo);
		
		int scrapCount = new ScrapService().increaseScrapCount(recipeNo,userNo);
		
		if(result>0) {
			
			
			request.getSession().setAttribute("alertMsg", " 이 레피시를 찜했습니다! ");
			response.sendRedirect(request.getContextPath() + "/detail.recipe?rno=" + recipeNo);
			
		}else {
			
			request.getRequestDispatcher("views/common/user/errerPage.jsp").forward(request, response);
			
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
