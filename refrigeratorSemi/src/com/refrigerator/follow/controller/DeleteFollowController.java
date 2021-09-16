package com.refrigerator.follow.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.follow.model.service.FollowService;
import com.refrigerator.member.model.vo.Member;

/**
 * 마이페이지_ 언팔로우 기능
 * @author HeeRak
 * Servlet implementation class DeleteFollowController
 */
@WebServlet("/delete.fol")
public class DeleteFollowController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteFollowController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int followUserNo = Integer.parseInt(request.getParameter("followUserNo"));
		
		int followingUserNo = Integer.parseInt(request.getParameter("followingUserNo"));
		
		int result = new FollowService().deleteFollowRelation(followUserNo, followingUserNo);
		
		
		if(result > 0) {
			
			response.sendRedirect(request.getContextPath() + "/deleteForm.fol?currentPage=1");
			
		}else {
			
			request.setAttribute("errorTitle", "언팔로우 실패");
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
