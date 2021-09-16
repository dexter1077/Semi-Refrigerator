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
 * @author leeyeji
 * Servlet implementation class InquiryInsertController
 */
@WebServlet("/insert.inq")
public class InquiryInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String userNo = request.getParameter("userNo");
		String inqryTitle = request.getParameter("title");
		String inqryContent = request.getParameter("content");
		
		Inquiry i = new Inquiry();
		i.setInqryWriter(userNo);
		i.setInqryTitle(inqryTitle);
		i.setInqryContent(inqryContent);
		
		int result = new InquiryService().insertInquiry(i);
		
		if(result > 0) {
			
			request.getSession().setAttribute("alertMsg", "문의 작성에 성공하였습니다.");
			response.sendRedirect(request.getContextPath() + "/list.inq?currentPage=1");
			
		}else {
			request.setAttribute("errorMsg", "게시글 작성 실패에 실패했습니다.");
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
