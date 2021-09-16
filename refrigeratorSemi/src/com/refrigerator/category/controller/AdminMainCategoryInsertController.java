package com.refrigerator.category.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.category.model.service.MainCategoryService;

/** @author Jaewon */

/**
 * Servlet implementation class AdminMainCategoryEnrollController
 */
@WebServlet("/mainCatEnroll.cat")
public class AdminMainCategoryInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMainCategoryInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String mainCatName = request.getParameter("mainCatName");
	
		int result = new MainCategoryService().insertMainCategory(mainCatName);
		
		if(result > 0 ) { 
			request.getSession().setAttribute("alertMsg", "성공적으로 대분류 카테고리가 등록되었습니다.");
			response.sendRedirect(request.getContextPath() + "/list.cat");
			
		}else { 
			request.setAttribute("errorTitleMsg", "db에 저장실패");
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
