package com.refrigerator.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.member.model.service.MemberService;
import com.refrigerator.member.model.vo.Member;

/**
 * Servlet implementation class AdminMemberUpdateController
 */
@WebServlet("/adUpdate.me")
public class AdminMemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String nickname = request.getParameter("exstnNickname");
		String email = request.getParameter("exstnEmail");
		//String userPwd = request.getParameter("password");
		String phone = request.getParameter("exstnPhone");
		String gender = request.getParameter("gender");
		String grade = request.getParameter("grade");
		
		Member m = new Member();
		m.setUserNo(userNo);
		m.setNickname(nickname);
		m.setEmail(email);
		//m.setUserPwd(userPwd);
		m.setPhone(phone);
		m.setGender(gender);
		m.setGrade(grade);
		
		
		int result = new MemberService().updateMember(m);
		
		if(result>0) {
            
            request.getSession().setAttribute("alertMsg", "성공적으로 수정했습니다.");
            response.sendRedirect(request.getContextPath()+"/adList.me?currentPage=1");
            
         }else {
			
			request.setAttribute("errorMsg", "회원 수정에 실패했습니다."); 
			request.getRequestDispatcher("views/common/user/errerPage.jsp").forward(request, response);
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
