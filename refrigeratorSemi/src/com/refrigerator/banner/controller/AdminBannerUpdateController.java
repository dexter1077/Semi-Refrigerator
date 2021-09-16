package com.refrigerator.banner.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.refrigerator.banner.model.service.BannerService;
import com.refrigerator.banner.model.vo.Banner;
import com.refrigerator.common.MyFileRenamePolicy;

/** @author Jaewon */

/**
 * Servlet implementation class AdminBannerUpdateController
 */
@WebServlet("/adUpdate.ba")
public class AdminBannerUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBannerUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");

		if(ServletFileUpload.isMultipartContent(request)) {			
			int maxSize = 10 * 1024 * 1024; 
			String savePath = request.getSession().getServletContext().getRealPath("/resources/banner_upfiles/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String deleteFile = multiRequest.getParameter("deleteFile");
			String newFile = multiRequest.getFilesystemName("bannerImg");
			
			String bannerImg ;
			if(newFile == null) { 
				bannerImg = "resources/banner_upfiles/" + deleteFile; 
				newFile = deleteFile;
			}else {
				bannerImg = "resources/banner_upfiles/" + multiRequest.getFilesystemName("bannerImg");
			}
			
			int bannerNo = Integer.parseInt(multiRequest.getParameter("bannerNo"));
			String bannerName = multiRequest.getParameter("bannerName");
			String companyName = multiRequest.getParameter("companyName");
			String bannerCategory = multiRequest.getParameter("bannerCategory");
			String bannerStatus = multiRequest.getParameter("bannerStatus");			
			String startDate = multiRequest.getParameter("startDate");
			startDate = startDate.replace("-", "/");
			String endDate = multiRequest.getParameter("endDate");
			endDate = endDate.replace("-", "/");
			String page = multiRequest.getParameter("page");
						
			Banner ba = new Banner(bannerNo, bannerName, companyName, bannerCategory, bannerStatus, startDate, endDate, bannerImg, page);
			
			int result = new BannerService().updateBanner(ba);


			if(result > 0 ) { 
				
				if(!deleteFile.equals(newFile)) {
					new File(savePath + deleteFile).delete();
				}
				
				request.getSession().setAttribute("alertMsg", "성공적으로 배너가 수정되었습니다.");
				response.sendRedirect(request.getContextPath() + "/adlist.ba?currentPage=1");
				
			}else { 
				request.setAttribute("errorTitleMsg", "배너 수정 실패");
				request.setAttribute("errorMsg", "error 발생");
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
