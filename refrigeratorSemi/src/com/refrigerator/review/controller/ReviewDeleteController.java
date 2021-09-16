package com.refrigerator.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.review.model.service.ReviewService;

/**
 * 로그인된 회원이 체크된 리뷰 삭제
 * @author HeeRak
 * Servlet implementation class ReviewDeleteController
 */
@WebServlet("/delete.rv")
public class ReviewDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Integer> deleteList = new ArrayList<>();
		
			
		for(int i=1; i<=3; i++) {
			
			if(request.getParameter("deleteCheck" + i) != null) {
				deleteList.add((Integer)Integer.parseInt(request.getParameter("deleteCheck" + i)));
			}
		}
		
		int result = new ReviewService().deleteReviewUser(deleteList);
		
		if(result > 0) {
			
			request.getSession().setAttribute("alertMsg", "요리후기 삭제 성공");
			response.sendRedirect(request.getContextPath() + "/review.me?currentPage=1");
			
		}else {
			
			request.setAttribute("errorTitle", "요리후기 삭제 실패");
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
