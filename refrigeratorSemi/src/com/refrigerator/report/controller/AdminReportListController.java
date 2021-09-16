package com.refrigerator.report.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.common.model.vo.PageInfo;
import com.refrigerator.report.model.service.ReportService;
import com.refrigerator.report.model.vo.Report;

/**
 * @author leeyeji
 * 
 * Servlet implementation class AdminReportListController
 */
@WebServlet("/adList.repo")
public class AdminReportListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminReportListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 페이징처리 셋팅
		int listCount; 	
		int currentPage;
		int pageLimit;	
		int boardLimit;	
				
		int maxPage;
		int startPage;
		int endPage;
				
		// 총 갯수
		listCount = new ReportService().selectListCount();
				
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
				
		ArrayList<Report> pageList = new ReportService().selectList(pi);
				
		request.setAttribute("pi", pi);
		request.setAttribute("pageList", pageList);
				
				
		request.getRequestDispatcher("views/report/adminReportListView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
