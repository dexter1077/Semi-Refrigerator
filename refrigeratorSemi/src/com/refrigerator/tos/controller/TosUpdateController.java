package com.refrigerator.tos.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.tos.model.service.TosService;
import com.refrigerator.tos.model.vo.Tos;

/** @author Jaewon */

/**
 * Servlet implementation class TosModifyController
 */
@WebServlet("/update.tos")
public class TosUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TosUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 인코딩 set 먼저 post니까
		request.setCharacterEncoding("UTF-8");

		int tosNo = Integer.parseInt(request.getParameter("tosNo"));
		String TosTitle = request.getParameter("tosTitle");
		String TosCategory = request.getParameter("tosCategory");
		String tosPage = request.getParameter("tosPage");
		String tosContent = request.getParameter("tosContent");
		String tosNote = request.getParameter("tosNote");
		
		Tos t = new Tos(tosNo, TosCategory, tosPage, tosNote, TosTitle, tosContent);
				
		int result = new TosService().updateTos(t);
		
		if(result > 0 ) {  
			request.getSession().setAttribute("alertMsg", "성공적으로 이용약관을 수정했습니다.");
			response.sendRedirect(request.getContextPath() + "/list.tos?currentPage=1");
			
		}else { 
			request.setAttribute("errorTitleMsg", "이용약관 수정 실패");
			request.setAttribute("errorMsg", "비정상적인 접근입니다. 사용될 페이지 영역이 중복되는지 확인해주세요 <br> 또는 너무긴 제목 혹은 비고란을 작성하여 발생한 문제일수 있습니다. <br> 조금 줄여서작성해주세요  ");
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
