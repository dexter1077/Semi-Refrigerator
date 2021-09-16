package com.refrigerator.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.member.model.service.MemberService;
import com.refrigerator.member.model.vo.Member;

/** @author Jaewon */

/**
 * Servlet implementation class AjaxMypageMemberPhoneCheckController
 */
@WebServlet("/AjaxPhoneCheck.me")
public class AjaxMypageMemberPhoneCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxMypageMemberPhoneCheckController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	
		String newPhone = request.getParameter("newPhoneCheck");

		Member count = new MemberService().checkPhone(newPhone); 
		
		if(count != null) {
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print("true");
		}else {
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print("false");			
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
