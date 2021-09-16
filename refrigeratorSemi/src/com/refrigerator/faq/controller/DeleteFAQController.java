package com.refrigerator.faq.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.faq.model.service.FaqService;

/**
 * @author HeeRak
 * Servlet implementation class DeleteFAQController
 */
@WebServlet("/delete.faq")
public class DeleteFAQController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteFAQController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int faqNo = Integer.parseInt(request.getParameter("faqNo"));
		
		int result = new FaqService().deleteFaq(faqNo);
		
		if(result > 0) {
			
			request.getSession().setAttribute("alertMsg", "FAQ 삭제 성공");
			response.sendRedirect(request.getContextPath() + "/adList.faq?currentPage=1");
			
		}else {
			
			request.setAttribute("errorTitleMsg", "faq 삭제 실패");
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
