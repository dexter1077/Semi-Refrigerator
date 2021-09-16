package com.refrigerator.inquiry.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.member.model.vo.Member;

/**
 * @author leeyeji
 * Servlet implementation class InquiryEnrollFormController
 */
@WebServlet("/enrollForm.inq")
public class InquiryEnrollFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryEnrollFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// Jaewon 로그인을 안했을시 오류나는 문제 해결 
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
			
		
		// Jaewon session에 로그인 정보 남아있지 않으면 로그인 페이지로 이동 (오류 막기)
		if(loginUser == null) {// 로그인 페이지로 이동 
			request.getRequestDispatcher("views/member/login.jsp").forward(request, response);
		}else {// 로그인 정보 담겨있으면 ! inquiry페이지로  이동 
			request.getRequestDispatcher("views/inquiry/inquiryEnrollForm.jsp").forward(request, response);
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
