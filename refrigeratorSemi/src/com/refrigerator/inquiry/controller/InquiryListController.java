package com.refrigerator.inquiry.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.common.model.vo.PageInfo;
import com.refrigerator.inquiry.model.service.InquiryService;
import com.refrigerator.inquiry.model.vo.Inquiry;

/**
 * Servlet implementation class InquiryListController
 */
@WebServlet("/list.inq")
public class InquiryListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryListController() {
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
				
		listCount = new InquiryService().selectListCount();
				
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
		
		
		ArrayList<Inquiry> pageList = new InquiryService().selectList(pi);
		
		request.setAttribute("pageList", pageList);
		request.setAttribute("pi", pi);
		
		request.getRequestDispatcher("views/inquiry/inquiryListView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
