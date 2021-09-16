package com.refrigerator.banner.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.banner.model.service.BannerService;

/**
 * Servlet implementation class AdminBannerRecipeDeleteController
 */
@WebServlet("/adRecipeDelete.banner")
public class AdminBannerRecipeDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBannerRecipeDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bannerNo = Integer.parseInt(request.getParameter("deleteBannerNo"));
		
		int result = new BannerService().deleteBannerRecipe(bannerNo);	
		
		if(result > 0) { // 성공 => 리스트 페이지 보여주기 
			request.getSession().setAttribute("alert", "메인 배너에 레시피가 성공적으로 삭제되었습니다.");
			response.sendRedirect(request.getContextPath() + "/adRecipeList.banner?currentPage=1");  // url재요청
			
		}else { // 실패 => 에러페이지 보여지도록 에러문구 담아서 전달
			request.setAttribute("errorMsg", "삭제에 실패했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
