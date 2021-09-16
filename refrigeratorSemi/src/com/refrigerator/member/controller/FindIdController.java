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
 * Servlet implementation class FindIdController
 */
// 아이디 요청창에서 값을 입력후 결과값 보여주는 서블릿
@WebServlet("/findId.member")
public class FindIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindIdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		// 본인인증 입력값 : 이름, 휴대전화번호, 이메일
		String userName = request.getParameter("userName");
		String phone = request.getParameter("phone"); 
		String email = request.getParameter("email");
		
		Member findUser = new MemberService().findId(userName, phone, email);
		
		System.out.println(findUser);
		
		if(findUser == null) { // 조회 결과없음 => 
			request.setAttribute("errorMsg", "조회결과가 없습니다.");
			request.getRequestDispatcher("views/common/user/errorPage.jsp").forward(request, response);
			
		}else { // 조회결과 있음 => 아이디 알려주는 페이지로 이동
			
			// session에 데이터를 담아서 => jsp랑 servlet에서 꺼내쓰자
			HttpSession session = request.getSession();
			session.setAttribute("findUser", findUser);
			request.getRequestDispatcher("views/member/findIdAfter.jsp").forward(request, response);
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
