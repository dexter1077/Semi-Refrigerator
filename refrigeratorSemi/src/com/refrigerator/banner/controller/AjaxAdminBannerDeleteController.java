package com.refrigerator.banner.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.refrigerator.banner.model.service.BannerService;
import com.refrigerator.banner.model.vo.Banner;
import com.refrigerator.common.MyFileRenamePolicy;

/** @author Jaewon */

/**
 * Servlet implementation class AdminBannerDeleteController
 */
@WebServlet("/adDelete.ba")
public class AjaxAdminBannerDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxAdminBannerDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int bannerNo = Integer.parseInt(request.getParameter("bannerNo"));

		Banner bannerInfo = new BannerService().selectBanner(bannerNo);
		
		String bannerName = bannerInfo.getBannerName();
		String savePath = request.getSession().getServletContext().getRealPath("/resources/banner_upfiles/");
		String forAbsolutePath = bannerInfo.getBannerImg().replace("resources/banner_upfiles/","" );
		int result = new BannerService().deleteBanner(bannerNo); 

		if(result>0) {
			new File(savePath + forAbsolutePath).delete();
			
			response.setContentType("text/html; charset=UTF-8");
			bannerName += " 배너 삭제에 성공하였습니다.";
			response.getWriter().print(bannerName);
		}else {
			response.setContentType("text/html; charset=UTF-8");
			bannerName += " 배너 삭제에 실패하였습니다.";
			response.getWriter().print(bannerName);			
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
