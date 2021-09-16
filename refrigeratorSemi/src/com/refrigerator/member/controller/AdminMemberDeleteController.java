package com.refrigerator.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.member.model.service.MemberService;

/**
 * @author leeyeji
 * 
 * Servlet implementation class AdminMemberDeleteController
 */
@WebServlet("/adDelete.me")
public class AdminMemberDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		int result = new MemberService().deleteMember(userNo);
		
		if(result > 0) {
			
			request.getSession().setAttribute("alertMsg", "성공적으로 삭제했습니다.");
            response.sendRedirect(request.getContextPath()+"/adList.me?currentPage=1");
            
		}else {
		
			request.setAttribute("errorMsg", "회원 수정에 실패했습니다."); 
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
