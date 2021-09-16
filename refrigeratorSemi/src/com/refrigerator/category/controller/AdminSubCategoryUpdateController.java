package com.refrigerator.category.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.category.model.service.SubCategoryService;
import com.refrigerator.category.model.vo.SubCategory;



/**
 * 관리자단에서 카테고리 소분류 수정
 * @author seong
 * @date 6/2
 * 
 */


/**
 * Servlet implementation class AdminSubCategoryUpdateController
 */
@WebServlet("/subCatModify.cat")
public class AdminSubCategoryUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSubCategoryUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
		int categoryNo = Integer.parseInt(request.getParameter("selectMainCat"));
		int subCatNo = Integer.parseInt(request.getParameter("modifySubCatNo"));
		String subCatName = request.getParameter("modifySubCatName");
		
		SubCategory sub = new SubCategory();
		sub.setCategoryMainNo(categoryNo);
		sub.setCategorySubNo(subCatNo);
		sub.setIngredientName(subCatName);
		
		
		int result = new SubCategoryService().updateSubCategory(sub);
				
		if(result>0) {
			
			request.getSession().setAttribute("alertMsg", "성공적으로 소분류 카테고리가 수정되었습니다.");
			response.sendRedirect(request.getContextPath() + "/list.cat");
			
		}else {
			
			request.setAttribute("errorTitleMsg", "db에 수정 실패");
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
