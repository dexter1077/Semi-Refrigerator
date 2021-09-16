package com.refrigerator.inquiry.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.refrigerator.inquiry.model.service.InquiryService;
import com.refrigerator.inquiry.model.vo.Inquiry;

/**
 * HeeRak 05-28 해결문의 관리자 문의답변Content 가져오기
 * Servlet implementation class JqAjaxAdminSolModalController
 */
@WebServlet("/JqAjaxAdminSolModal.inq")
public class JqAjaxAdminSolModalController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JqAjaxAdminSolModalController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int inqNo = Integer.parseInt(request.getParameter("inqNo"));
		
		Inquiry inq = new InquiryService().selectSolvedInquiry(inqNo);
		
		response.setContentType("application/json; charset=utf-8");
		
		new Gson().toJson(inq, response.getWriter());
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
