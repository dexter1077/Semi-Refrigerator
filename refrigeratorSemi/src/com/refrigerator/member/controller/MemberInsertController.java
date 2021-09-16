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
 * Servlet implementation class MemberInsertController
 */
@WebServlet("/insert.member")
public class MemberInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1) post방식으로 넘기는데, 한글이 있어서 반드시 인코딩 작업하기!
		request.setCharacterEncoding("UTF-8");
		
		// 2) 요청시 전달값 뽑아서 변수 및 객체에 기록하기 
		// 아이디, 비밀번호, 이름, 생년월일(yyyy/mm/dd), 성별, 이메일
		String userId = request.getParameter("userId");
		String nickname = request.getParameter("nickname");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String birthYear = request.getParameter("birthYear");
		String birthMonth = request.getParameter("birthMonth");
		String birthDay = request.getParameter("birthDay");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String profileImg = request.getParameter("profileImg");
		
		String birthday = birthYear + birthMonth + birthDay;
		
		// 3) 매개변수 생성자 이용해서 Member객체에 새로 담기
		Member m = new Member(userId, nickname, userPwd, userName, birthday, gender, email, profileImg);
		
		// System.out.println(gender); 여기서는 제대로 담기는데..?
		
		// 4) 서비스 메소드 호출 & 결과받기 (처리된 행수)
		int result = new MemberService().insertMember(m);
		
		// 5) 처리 결과를 가지고 사용자가 보게될 응답뷰 결정
		if(result > 0) { // 성공 => url재요청 + index페이지
			
			response.sendRedirect(request.getContextPath());
			
		}else { // 실패
			request.setAttribute("errorPage", "회원가입 에러페이지");
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
