package com.refrigerator.reply.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.reply.model.service.ReplyService;

/** @author Jaewon */

/**
 * Servlet implementation class MypageMyReplyUpdateController
 */
@WebServlet("/myReplyUpdate.rpl")
public class MypageMyReplyUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageMyReplyUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		int replyNo = Integer.parseInt(request.getParameter("replyNo")); 
		String replyContent = request.getParameter("replyContent");

		int result = new ReplyService().updateMyReply(replyNo, replyContent);
		
		if(result > 0 ) { 
			request.getSession().setAttribute("alertMsg", "성공적으로 댓글을 수정했습니다.");
			response.sendRedirect(request.getContextPath() + "/mylist.rpl?currentPage=1");
			
		}else { 
			request.setAttribute("errorTitleMsg", "댓글 수정 실패");
			request.setAttribute("errorMsg", "뭔가 잘못됬것지? 잘찾아보시게나 ~");
			request.getRequestDispatcher("views/common/user/errorPage.jsp").forward(request, response);
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
