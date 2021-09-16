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
 * Servlet implementation class TosUserPageController
 */
@WebServlet("/tos.tos")
public class TosUserPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TosUserPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* Author : Jaewon */

		String page = request.getParameter("page");
	
		switch(page) {
		case "service" : page= "FOOTER_1"; break;
		case "pesonal" : page= "FOOTER_2";  break;
		case "memservice" : page= "MEMBER_ENROLL_1";  break;
		case "mempersonal" : page= "MEMBER_ENROLL_2";  break;
		}
				
		Tos t = new TosService().selectUsableTos(page); 
		
		if(t != null) { 
			request.setAttribute("tos", t);	
			request.getRequestDispatcher("views/common/user/tosPage.jsp").forward(request, response);
		
		}else { 			
			request.setAttribute("tosTitleMsg", "준비중"); 
			request.setAttribute("tosMsg", "<p style='text-align:center; font-size:20px; font-weight:bold;'>이용약관을 준비중 입니다 가까운 시일 내로 공지하겠습니다. <br> 감사합니다.</p>");
			request.getRequestDispatcher("views/common/user/tosPage.jsp").forward(request, response);
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
