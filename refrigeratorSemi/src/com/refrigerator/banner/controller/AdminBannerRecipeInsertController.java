package com.refrigerator.banner.controller;

import java.io.IOException;
import java.sql.Date;

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
 * Servlet implementation class AdminBannerRecipeController
 */
/*관리자페이지 - 배너 레시피 관리 페이지로 이동*/
@WebServlet("/adRecipeInsert.banner")
public class AdminBannerRecipeInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBannerRecipeInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// 1.전송용량제한
			int maxSize = 10*1024*1024;
			
			// 1-2.저장할 폴더의 물리적인 경로
			String savePath = request.getSession().getServletContext().getRealPath("/resources/banner_upfiles/");
			
			// 2.파일명 수정후 서버에 업로드
			MultipartRequest multiRequest = new MultipartRequest(request,savePath,maxSize,"UTF-8",new MyFileRenamePolicy());
			
			// 3. db전달값 뽑기
			//int bannerNo = Integer.parseInt(multiRequest.getParameter("bannerNo"));
			String bannerCategory = multiRequest.getParameter("bannerCategory");
			String bannerName = multiRequest.getParameter("bannerName");
			String companyName = multiRequest.getParameter("companyName");
			String bannerStatus = multiRequest.getParameter("bannerStatus");
			String startDate = multiRequest.getParameter("startDate");
			String endDate = multiRequest.getParameter("endDate");
			String bannerImg = multiRequest.getParameter("bannerImg");
			
			Banner ba = new Banner();
			//ba.setBannerNo(bannerNo);
			ba.setBannerCategory(bannerCategory);
			ba.setBannerName(bannerName);
			ba.setCompanyName(companyName);
			ba.setBannerStatus(bannerStatus);
			ba.setStartDate(startDate);
			ba.setEndDate(endDate);
			ba.setBannerImg("resources/board_upfiles/"+bannerImg);
			
			// 4.서비스요청
			int result = new BannerService().insertBannerRecipe(ba);
			
			// 5.결과값
			if( result > 0 ) { // 조회결과 있음 
				
				request.getSession().setAttribute("alert", "메인 배너에 레시피가 성공적으로 등록되었습니다.");
				response.sendRedirect(request.getContextPath() + "/adRecipeList.banner?currentPage=1");  // url재요청
			
			}else { // 조회결과 없음
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
