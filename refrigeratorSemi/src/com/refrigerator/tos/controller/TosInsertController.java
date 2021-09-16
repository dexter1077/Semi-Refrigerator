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
 * Servlet implementation class TosInsertController
 */
@WebServlet("/insert.tos")
public class TosInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TosInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Author : Jaewon
		request.setCharacterEncoding("UTF-8");
		
		String tosTitle = request.getParameter("tosTitle"); 
		String tosCategory = request.getParameter("tosCategory"); 
		String tosPage = request.getParameter("tosPage");
		String tosContent = request.getParameter("tosContent");
		String tosNote = request.getParameter("tosNote");
		
		Tos t = new Tos();
		t.setTosTitle(tosTitle);
		t.setTosCategory(tosCategory);
		t.setTosPage(tosPage);
		t.setTosContent(tosContent);
		t.setTosNote(tosNote);
				
		int result = new TosService().insertTos(t);
		
		if(result > 0 ) { 
			request.getSession().setAttribute("alertMsg", "성공적으로 이용약관이 등록되었습니다.");
			response.sendRedirect(request.getContextPath() + "/list.tos?currentPage=1");
			
		}else { 
			request.setAttribute("errorTitleMsg", "db에 저장실패");
			request.setAttribute("errorMsg", "1. tosContent가 너무 길어서일수도 있고 다른 이유일수도 있다.");
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
