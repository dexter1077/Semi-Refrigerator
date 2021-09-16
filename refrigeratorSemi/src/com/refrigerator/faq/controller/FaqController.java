package com.refrigerator.faq.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.common.model.vo.PageInfo;
import com.refrigerator.faq.model.service.FaqService;
import com.refrigerator.faq.model.vo.Faq;

/**
 * @author leeyeji
 * Servlet implementation class FaqController
 */
@WebServlet("/list.faq")
public class FaqController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 페이징
		int listCount; 		
		int currentPage;	
		int pageLimit;		
		int boardLimit;		
				
		int maxPage;		
		int startPage;		
		int endPage;		
				
		listCount = new FaqService().selectListCount();
				
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
				
		pageLimit = 10;
				
		boardLimit = 10;
				
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
				
		startPage = (currentPage -1) / pageLimit * pageLimit + 1;
				
		
		endPage = startPage + pageLimit - 1;
				
		if(endPage > maxPage) {
			endPage = maxPage;
		}
				
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Faq> pageList = new FaqService().selectFaqList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("pageList", pageList);
		request.getRequestDispatcher("views/faq/faqView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}