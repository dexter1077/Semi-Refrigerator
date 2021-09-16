package com.refrigerator.reply.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.common.model.vo.PageInfo;
import com.refrigerator.member.model.vo.Member;
import com.refrigerator.reply.model.service.ReplyService;
import com.refrigerator.reply.model.vo.AdmReply;
import com.refrigerator.reply.model.vo.Reply;
import com.refrigerator.tos.model.service.TosService;
import com.refrigerator.tos.model.vo.Tos;

/** @author Jaewon */

/**
 * Servlet implementation class MypageMyReplyListController
 */
@WebServlet("/mylist.rpl")
public class MypageMyReplyListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageMyReplyListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");

		int userNo;
		if(loginUser != null) {
			userNo = loginUser.getUserNo();
		}else {
			userNo = 0;
		}
				
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;
		int maxPage;
		int startPage;
		int endPage;
						
		listCount = new ReplyService().selectMyReplyListCount(userNo); 
		
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		pageLimit = 10;
		
		boardLimit = 5;
		
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		
		startPage = (currentPage-1)/pageLimit * pageLimit+1;
		
		endPage = startPage + pageLimit -1;
		if(endPage>maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount,currentPage,pageLimit,boardLimit,maxPage,startPage,endPage);
		
		ArrayList<Reply> list = new ReplyService().selectMyReplyList(pi, userNo);		
		
		if(loginUser == null) {
			request.getRequestDispatcher("views/member/login.jsp").forward(request, response);
		}else { 
			request.setAttribute("myPageNo", 5);
			request.setAttribute("pi", pi);
			request.setAttribute("replyList", list);
			request.getRequestDispatcher("views/reply/myPageReplyPageWithModal.jsp").forward(request, response);
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
