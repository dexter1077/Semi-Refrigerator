package com.refrigerator.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.member.model.service.MemberService;

/** @author Jaewon */

/**
 * Servlet implementation class MyPageMemberPWDUpdateController
 */
@WebServlet("/pwdUpdate.me")
public class MyPageMemberPWDUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageMemberPWDUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String newPwd = request.getParameter("newPwd");
		
		int result = new MemberService().updatePWD(userId, userPwd, newPwd);
		
		if(result>0) {
			request.getSession().invalidate();
			request.getSession().setAttribute("alertMsg", "성공적으로  비밀번호를 수정하었습니다. 재 로그인 해주세요~");
			response.sendRedirect(request.getContextPath());
		}else {
			
			request.setAttribute("errorTitleMsg", "비밀번호 수정 실패");
			request.setAttribute("errorMsg", "현재 비밀번호가 일치하지 않아 비밀번호를 수정할수 없습니다.");
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
