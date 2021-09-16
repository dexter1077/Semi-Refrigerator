package com.refrigerator.reply.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.reply.model.service.ReplyService;


/**
 * @author seong 
 */


/**
 * Servlet implementation class AdminDeleteReplyController
 */
@WebServlet("/deleteReply.admin")
public class AdminDeleteReplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDeleteReplyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	

		
		int replyNo = Integer.parseInt(request.getParameter("replyNo")) ;
		
		int result = new ReplyService().adminDeleteReply(replyNo);
		
		if(result>0) {
			
			request.setAttribute("alertMsg", "댓글 삭제 성공 !");
			response.sendRedirect(request.getContextPath() + "/rlist.admin?currentPage=1");
			
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
