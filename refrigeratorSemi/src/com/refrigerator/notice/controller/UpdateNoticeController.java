package com.refrigerator.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.notice.model.dao.NoticeDao;
import com.refrigerator.notice.model.service.NoticeService;
import com.refrigerator.notice.model.vo.Notice;

/**
 * [관리자] 공지사항 수정사항 입력받아 수정처리
 * @author HeeRak
 * Servlet implementation class UpdateNoticeController
 */
@WebServlet("/update.no")
public class UpdateNoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateNoticeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		String noticeTitle = request.getParameter("title");
		String noticeContent = request.getParameter("content");
		
		Notice n = new Notice();
		n.setNoticeNo(noticeNo);
		n.setNoticeTitle(noticeTitle);
		n.setNoticeContent(noticeContent);
		
		int result = new NoticeService().updateNotice(n);
		
		if(result > 0) {
			
			request.getSession().setAttribute("alertMsg", "공지사항 수정 성공");
			response.sendRedirect(request.getContextPath() + "/adList.no?currentPage=1");
			
		}else {
			
			request.setAttribute("errorTitleMsg", "공지사항 수정 실패");
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
