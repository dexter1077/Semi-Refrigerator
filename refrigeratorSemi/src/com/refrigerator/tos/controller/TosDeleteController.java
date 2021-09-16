package com.refrigerator.tos.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.tos.model.service.TosService;

/** @author Jaewon */

/**
 * Servlet implementation class TosDeleteController
 */
@WebServlet("/delete.tos")
public class TosDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TosDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Author : Jaewon
		int tosNo = Integer.parseInt(request.getParameter("bno"));
		int result = new TosService().deleteTos(tosNo);
		
		if(result > 0 ) { 
			request.getSession().setAttribute("alertMsg", "성공적으로 이용약관을 삭제했습니다.");
			response.sendRedirect(request.getContextPath() + "/list.tos?currentPage=1");
			
		}else { 
			request.setAttribute("errorTitleMsg", "이용약관 삭제 실패");
			request.setAttribute("errorMsg", "비정상적인 접근입니다. 이미 없는 항목일수도 있습니다. <br> 또는 인위적으로 url을 조작했을수도 있습니다. <br> 공격하지마세요~");
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
