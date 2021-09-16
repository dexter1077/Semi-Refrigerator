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
 * YunHeeRak 05.27
 * 
 * Servlet implementation class AdminInquiryListController
 */
//?unSolCurrentPage=1&solCurrentPage=1 값 넣어서 요청할것!!
@WebServlet("/adList.inq")
public class AdminInquiryListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminInquiryListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int unSolvedListCount;
		int solvedListCount;
		
		int unSolCurrentPage;
		int solCurrentPage;
		
		int pageLimit;
		int boardLimit;
		
		int maxSolPage;
		int maxunSolPage;
		
		int unSolStartPage;
		int solStartPage;
		
		int unSolEndPage;
		int solEndPage;
		
		// *listCount = 총 게시글 수
		unSolvedListCount = new InquiryService().selectUnsolvedListCount();
		solvedListCount = new InquiryService().selectSolvedListCount();
		
		// * currentpage : 현재페이지  (사용자가 요청한 페이지)
		unSolCurrentPage = Integer.parseInt(request.getParameter("unSolCurrentPage"));
		solCurrentPage = Integer.parseInt(request.getParameter("solCurrentPage"));
		
		// * pageLimit : 한 페이지 내의 "페이지 최대 개수"
		pageLimit = 5;
		
		// * boardLimit : 한 페이지 내의 "문의 최대 개수"
		boardLimit = 5;
		
		// * maxPage : 총 페이지수
		maxunSolPage = (int)Math.ceil((double)unSolvedListCount/boardLimit);
		maxSolPage = (int)Math.ceil((double)solvedListCount/boardLimit);
		
		// * startPage : 페이지 하단에 보여질 페이징바의 시작수
		unSolStartPage = (unSolCurrentPage - 1) / pageLimit * pageLimit + 1;
		solStartPage = (solCurrentPage - 1) / pageLimit * pageLimit + 1;
		
		// * endPage : 페이지 하단에 보여질 페이징바의 끝 수
		unSolEndPage = unSolStartPage + pageLimit - 1;
		solEndPage = solStartPage + pageLimit - 1;
		
		if(unSolEndPage > maxunSolPage) {
			unSolEndPage = maxunSolPage;
		}
		
		if(solEndPage > maxSolPage) {
			solEndPage = maxSolPage;
		}
		
		PageInfo unSolvedListpi = new PageInfo(unSolvedListCount, unSolCurrentPage, pageLimit, boardLimit, maxunSolPage, unSolStartPage, unSolEndPage);
		PageInfo solvedListpi = new PageInfo(solvedListCount, solCurrentPage, pageLimit, boardLimit, maxSolPage, solStartPage, solEndPage);
		
		// [미해결]문의글 전체 조회 
		ArrayList<Inquiry> unSolvedList = new InquiryService().selectUnSolvedList(unSolvedListpi);
		// [해결]문의글 전체 조회 
		ArrayList<Inquiry> solvedList = new InquiryService().selectSolvedList(solvedListpi);
		
		request.setAttribute("unSolvedListpi", unSolvedListpi);
		request.setAttribute("solvedListpi", solvedListpi);
		
		request.setAttribute("unSolvedList", unSolvedList);
		request.setAttribute("solvedList", solvedList);
		
		request.getRequestDispatcher("views/inquiry/adminInquiryListView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
