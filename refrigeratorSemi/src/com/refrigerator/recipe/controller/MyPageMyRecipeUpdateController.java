package com.refrigerator.recipe.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.refrigerator.common.MyFileRenamePolicy;
import com.refrigerator.ingre.model.vo.Ingre;
import com.refrigerator.ingre_search.model.vo.IngreSearch;
import com.refrigerator.recipe.model.service.RecipeService;
import com.refrigerator.recipe.model.vo.Recipe;
import com.refrigerator.reicpe_order.model.vo.RecipeOrder;

/** @author Jaewon */

/**
 * Servlet implementation class MyPageMyRecipeUpdateController
 */
@WebServlet("/modify.rcp")
public class MyPageMyRecipeUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageMyRecipeUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int result;
			int maxSize = 10 * 1024 * 1024;
			
			String recipeSavePath = request.getSession().getServletContext().getRealPath("/resources/recipe_upfiles/");
			String orderSavePath = request.getSession().getServletContext().getRealPath("/resources/recipe_order_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, orderSavePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			int recipeNo = Integer.parseInt(multiRequest.getParameter("recipeNo"));
			int userNo = Integer.parseInt(multiRequest.getParameter("userNo"));
			
			
			String recipeTitle = multiRequest.getParameter("title");
			String recipeIntro = multiRequest.getParameter("intro");
			int servings = Integer.parseInt(multiRequest.getParameter("servings"));
			int time = Integer.parseInt(multiRequest.getParameter("time"));
			
			String mainImg = "";
			
			for(int i=11; i<=12; i++) {				
				String key = "file" + i;
				if(multiRequest.getOriginalFileName(key) != null) {
					
					if(key.equals("file11")) {
						mainImg = multiRequest.getFilesystemName(key);
					}
				}
			}
						
			File file = new File(orderSavePath + mainImg);
			
			File fileNew = new File(recipeSavePath + mainImg);
			
			if(file.exists())file.renameTo(fileNew);
			
			mainImg = request.getContextPath() + "/resources/recipe_upfiles/" + mainImg;
			
			result = new RecipeService().updateRecipe(recipeNo, userNo, recipeTitle, recipeIntro, servings, time, mainImg); 	
			
			if(result > 0) {
				response.sendRedirect(request.getContextPath()+"/mylist.rcp?currentPage=1");
			}else {
				request.setAttribute("errorTitleMsg", "레시피 수정 실패");
				request.setAttribute("errorMsg", "수정이 불가합니다 ! <br> 개발자에게 문의해주세요");
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
