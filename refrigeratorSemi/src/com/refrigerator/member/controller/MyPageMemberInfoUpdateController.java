package com.refrigerator.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.member.model.service.MemberService;
import com.refrigerator.member.model.vo.Member;

/** @author Jaewon */

/**
 * Servlet implementation class myPageMemberInfoUpdateController
 */
@WebServlet("/updateInfo.me")
public class MyPageMemberInfoUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageMemberInfoUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String userName = request.getParameter("userName");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String phoneBefore = request.getParameter("phone");
		String phone = phoneBefore.replace("-", "");
		
		Member memInfo = new Member(userNo, userName, gender, email, phone);

		int result = new MemberService().updateMemberInfo(memInfo);
		
		if(result>0) {
			request.getSession().invalidate();
			request.getSession().setAttribute("alertMsg", "성공적으로 " + userName + "님의 정보가 수정되었습니다. 재로그인 해주세요~");
			response.sendRedirect(request.getContextPath());
		}else {
			
			request.setAttribute("errorTitleMsg", "회원정보 수정 실패");
			request.setAttribute("errorMsg", "error 발생");
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
