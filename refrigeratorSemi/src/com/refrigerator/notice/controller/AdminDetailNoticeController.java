package com.refrigerator.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.notice.model.service.NoticeService;
import com.refrigerator.notice.model.vo.Notice;

/**
 * @author HeeRak
 * Servlet implementation class InsertNoticeController
 */
@WebServlet("/adminDetail.no")
public class AdminDetailNoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDetailNoticeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String title = request.getParameter("title");
		
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		
		if(title.equals("수정") && noticeNo != 0) {
			
			Notice n = new NoticeService().selectNotice(noticeNo);
			
			request.setAttribute("title", title);
			request.setAttribute("noticeNo", noticeNo);
			request.setAttribute("n", n);
			request.getRequestDispatcher("views/notice/adminNoticeDetailView.jsp").forward(request, response);
			
		}else if(title.equals("조회") && noticeNo != 0) {
			
			Notice n = new NoticeService().selectNotice(noticeNo);
			
			request.setAttribute("title", title);
			request.setAttribute("noticeNo", noticeNo);
			request.setAttribute("n", n);
			request.getRequestDispatcher("views/notice/adminNoticeDetailView.jsp").forward(request, response);
			
		}else {
			
			request.setAttribute("title", title);
			request.setAttribute("noticeNo", noticeNo);
			request.getRequestDispatcher("views/notice/adminNoticeDetailView.jsp").forward(request, response);
			
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
