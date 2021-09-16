package com.refrigerator.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.refrigerator.common.MyFileRenamePolicy;
import com.refrigerator.member.model.service.MemberService;
import com.refrigerator.member.model.vo.Member;

/**
 * @author HeeRak
 * Servlet implementation class UpdateProfileController
 */
@WebServlet("/update.pro")
public class ProfileUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10*1024*1024;
			
			// 업로드 된 파일 저장
			String savePath = request.getSession().getServletContext().getRealPath("/resources/profile_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			int userNo = Integer.parseInt(multiRequest.getParameter("userNo"));
			String nickname = multiRequest.getParameter("nickName");
			String intro = multiRequest.getParameter("intro");
			String profileImg = "";
			
			if(multiRequest.getOriginalFileName("file1") != null) {
				
				// contextPath + /경로 +  수정된 파일명 
				profileImg = request.getContextPath() + "/resources/profile_upfiles/" + multiRequest.getFilesystemName("file1");
				
			}
			
			
			Member m = new Member();
			m.setUserNo(userNo);
			m.setNickname(nickname);
			m.setIntro(intro);
			m.setProfileImg(profileImg);
			
			int reulst = new MemberService().updateProfile(m);
			
			if(reulst > 0) {
				
				request.getSession().setAttribute("alertMsg", "프로필 수정 성공");
				response.sendRedirect(request.getContextPath() + "/updateForm.pro");
				
			}else {
				
				request.setAttribute("errorTitle", "프로필 수정 실패");
				request.getRequestDispatcher("views/common/user/errorPage.jsp").forward(request, response);
				
			}
			
			
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
