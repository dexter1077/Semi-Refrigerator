package com.refrigerator.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.member.model.service.MemberService;
import com.refrigerator.member.model.vo.Member;

/**
 * Servlet implementation class MemberDeleteController
 */
@WebServlet("/jqAjaxDelete.me")
public class AjaxDeleteMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxDeleteMember() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		Member m = (Member)request.getSession().getAttribute("loginUser");
		int userNo = m.getUserNo();
		
		
		String userPwd = request.getParameter("userPwd");
		
		int result = new MemberService().deleteUserMember(userNo, userPwd);
		
		if(result > 0) {
			
			request.getSession().setAttribute("alertMsg", "그 동안 냉뭐를 이용해 주셔서 감사합니다!");
			request.getSession().invalidate();
			response.setContentType("text/html; charset=utf-8");
			response.getWriter().print(result);
			
		}else {
			
			response.setContentType("text/html; charset=utf-8");
			response.getWriter().print(result);
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
