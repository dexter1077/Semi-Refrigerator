package com.refrigerator.inquiry.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.inquiry.model.service.InquiryService;
import com.refrigerator.inquiry.model.vo.Inquiry;

/**
 * 모달창의 폼으로 부터 데이터 받아서 뿌려줄 Servlet  (errorpage 완성되면 구현할것!)
 * HeeRak 05-28
 * Servlet implementation class AdminUpdateInquiryController
 */
@WebServlet("/adminUpdate.inq")
public class AdminUpdateInquiryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUpdateInquiryController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int inqryNo = Integer.parseInt(request.getParameter("inqNo"));
		String inqryContent = request.getParameter("inqContent");
		
		Inquiry inq = new Inquiry();
		inq.setInqryNo(inqryNo);
		inq.setInqryAnswer(inqryContent);
		
		int result = new InquiryService().updateInquiryAnswer(inq);
		
		if(result > 0) {
			
			request.getSession().setAttribute("alertMsg", "문의 답변 성공");
			response.sendRedirect(request.getContextPath() + "/adList.inq?unSolCurrentPage=1&solCurrentPage=1");
			
		}else {
			
			request.setAttribute("errorTitleMsg", "문의 답변 실패");
			request.getRequestDispatcher("views/member/login.jsp").forward(request, response);
			
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
