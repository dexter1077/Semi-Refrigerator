package com.refrigerator.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.notice.model.service.NoticeService;

/**
 * 공지사항 관리자_ 삭제 1행
 * @author HeeRak
 * Servlet implementation class DeleteNoticeController
 */
@WebServlet("/delete.no")
public class DeleteNoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteNoticeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int noticeNo = Integer.parseInt(request.getParameter("nno"));
		
		int result = new NoticeService().deleteNotice(noticeNo);
		
		if(result > 0) {
			
			request.getSession().setAttribute("alertMsg", "공지사항 삭제 성공");
			response.sendRedirect(request.getContextPath() + "/adList.no?currentPage=1");
			
		}else {
			
			request.setAttribute("errorTitleMsg", "공지사항 삭제 실패");
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
