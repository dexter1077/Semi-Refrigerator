package com.refrigerator.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.refrigerator.member.model.service.MemberService;
import com.refrigerator.member.model.vo.Member;

/**
 * Servlet implementation class LoginController
 */

// 로그인 페이지에서 로그인 요청하는 서블릿
@WebServlet("/login.me")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
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
		
		Member loginUser = new MemberService().loginMember(userId, userPwd);
		
		if(loginUser == null) { // 로그인 실패 => error페이지 응답
			
			// 에러페이지 메세지 전달은 기술안함
			request.setAttribute("errorTitleMsg", "로그인에 실패하였습니다.");
			request.setAttribute("errorMsg", "아이디 혹은 비밀번호를 다시 입력해주세요.");
			request.getRequestDispatcher("views/common/user/errorPage.jsp").forward(request, response);;
			
		}else if(loginUser.getUserNo() == 1) {
			request.getSession().setAttribute("confirmMsg", "어드민 페이지로 이동하시고자 하면 확인을 클릭하세요");
			//이제 url 재요청
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			response.sendRedirect(request.getContextPath());
		
		}else { // 로그인 성공 => index페이지 응답 history.back();
			
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			
			response.sendRedirect(request.getContextPath()+ "/main");
			
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
