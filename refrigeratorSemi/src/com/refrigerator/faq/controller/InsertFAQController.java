package com.refrigerator.faq.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.faq.model.service.FaqService;
import com.refrigerator.faq.model.vo.Faq;

/**
 * @author HeeRak
 * Servlet implementation class InsertFAQController
 */
@WebServlet("/insert.faq")
public class InsertFAQController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertFAQController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String quesContent = request.getParameter("title");
		String answerContent = request.getParameter("content");
		
		Faq f = new Faq();
		f.setQuesContent(quesContent);
		f.setAnswerContent(answerContent);
		
		int result = new FaqService().insertFaq(f);
		
		if(result > 0) {
			
			request.getSession().setAttribute("alertMsg", "FAQ 등록 성공");
			response.sendRedirect(request.getContextPath() + "/adList.faq?currentPage=1");
			
			
		}else {
			
			request.setAttribute("errorTitleMsg", "faq 등록 실패");
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
