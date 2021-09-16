package com.refrigerator.report.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.report.model.service.ReportService;

/**
 * @author leeyeji
 * Servlet implementation class ReportInsertController
 */
@WebServlet("/insertRecipe.repo")
public class ReportInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		request.setCharacterEncoding("UTF-8");
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		int recipeNo = Integer.parseInt(request.getParameter("recipeNo"));
		String reportRe = request.getParameter("report-re");
		
		
		int result = new ReportService().insertRecipeReport(userNo, recipeNo, reportRe);
		
		if(result > 0) {
			
			request.getSession().setAttribute("alertMsg", "레시피 신고 성공!");
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
