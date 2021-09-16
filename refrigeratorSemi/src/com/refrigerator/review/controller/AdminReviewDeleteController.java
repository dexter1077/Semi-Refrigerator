package com.refrigerator.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.review.model.service.ReviewService;

/**
 * Servlet implementation class AdminReviewDeleteController
 */
@WebServlet("/deleteReview.admin")
public class AdminReviewDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
																    /**
																     * 
																     * @author seong
																     * @Date 5/30
																     * @see HttpServlet#HttpServlet()
																     */
    public AdminReviewDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		
		int result = new ReviewService().deleteReview(reviewNo);
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg", " 요리 후기 삭제 성공 ");
			response.sendRedirect(request.getContextPath() + "/reviewlist.admin?currentPage=1");
		}else {
			
			request.setAttribute("errorMsg", "요리후기가 삭제 되지 않았습니다");
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
