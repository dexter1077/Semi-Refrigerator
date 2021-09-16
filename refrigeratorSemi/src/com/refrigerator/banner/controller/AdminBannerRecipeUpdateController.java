package com.refrigerator.banner.controller;

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

/**
 * Servlet implementation class AdminBannerRecipeUpdateController
 */
@WebServlet("/adRecipeUpdate.banner")
public class AdminBannerRecipeUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBannerRecipeUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// 1_1. 전송파일 용량제한 (int maxSize)
			int maxSize = 10 * 1024 * 1024;
			
			// 1_2. 전달된 파일을 저장시킬 서버의 폴더의 물리적인 경로 알아내기 (String savePath)
			String savePath = request.getSession().getServletContext().getRealPath("/resources/banner_upfiles/");
			
			// 2. 전달된 파일명 수정 작업 후, 서버에 업로드
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 3. 본격적으로 sql문 실행할 때 필요한 값 뽑기 == 요청시 전달값
			//    Banner테이블에 Update!!
			int bannerNo = Integer.parseInt(multiRequest.getParameter("updateNo"));
			String bannerCategory = multiRequest.getParameter("updateBannerCategory");
			String bannerName = multiRequest.getParameter("updateBannerName");
			String companyName = multiRequest.getParameter("updateCompanyName");
			String bannerStatus = multiRequest.getParameter("updateBannerStatus");
			String startDate = multiRequest.getParameter("updateStartDate");
			String endDate = multiRequest.getParameter("updateEndDate");
			String bannerImg = "";
			
			Banner ba = new Banner();
			ba.setBannerNo(bannerNo);
			ba.setBannerCategory(bannerCategory);
			ba.setBannerName(bannerName);
			ba.setCompanyName(companyName);
			ba.setBannerStatus(bannerStatus);
			ba.setStartDate(startDate);
			ba.setEndDate(endDate);
			
			// 기존의 첨부파일이 있고, 새로운 첨부파일이 있을 경우 => bannerImg -> updateBannerImg
			if(multiRequest.getOriginalFileName("updateBannerImg") != null) {

				ba.setBannerImg( multiRequest.getFilesystemName("updateBannerImg"));
							
			// 기존의 첨부파일이 있고, 새로운 첨부파일이 없을 경우 => bannerImg그대로
			}else {

				ba.setBannerImg("resources/board_upfiles/"+bannerImg);
			
			}
			
			
			// 4.서비스요청
			int result = new BannerService().updateBannerRecipe(ba);
						
			// 5.결과값
			if(result > 0) { // 수정 성공 => /adRecipeList.banner?bnno=xx  url재요청  => 상세조회 페이지
				request.getSession().setAttribute("alertMsg", "성공적으로 수정됐어용");
				response.sendRedirect(request.getContextPath() + "/adRecipeList.banner?currentPage=1");
				
			}else { // 수정 실패 => 에러페이지
				request.setAttribute("errorMsg", "조회결과가 없습니다. 다시 한번 입력사항을 확인해주세요.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
