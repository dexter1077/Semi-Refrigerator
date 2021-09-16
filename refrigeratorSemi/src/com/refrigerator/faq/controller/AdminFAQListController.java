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
 * @author HeeRak
 * 관리자 FAQ 리스트 페이지 첫 요청
 * Servlet implementation class AdminFAQListController
 */
@WebServlet("/adList.faq")
public class AdminFAQListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminFAQListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;
		
		int maxPage;
		int startPage;
		int endPage;
		
		listCount = new FaqService().selectListCount();	
		
		currentPage = Integer.parseInt(request.getParameter("currentPage")); // 요청받은 currentPage
		
		pageLimit = 5; // 하단 페이지 버튼 개수
		boardLimit = 8;  // 한 페이지당 보여질 faq 개수
		
		maxPage = (int)Math.ceil((double)listCount/ boardLimit); // 페이지버튼 마지막 수
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1; // 페이지버튼 <,> 보여지는 수 1, 6, 11 ...
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Faq> faqList = new FaqService().adminSelectFaqList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("faqList", faqList);
		
		request.getRequestDispatcher("views/faq/adminFAQListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
