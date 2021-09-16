package com.refrigerator.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.refrigerator.common.MyFileRenamePolicy;
import com.refrigerator.review.model.service.ReviewService;
import com.refrigerator.review.model.vo.Review;

/**
 * Servlet implementation class ReviewUpdateController
 */
@WebServlet("/update.rv")
public class ReviewUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10*1024*1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/review_upfiles/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			int reviewNo = Integer.parseInt(multiRequest.getParameter("reviewNo"));
			String reviewContent = multiRequest.getParameter("reviewContent");
			double star = Double.parseDouble(multiRequest.getParameter("starPoint"));
			String loadImg = "";
			
			if(multiRequest.getOriginalFileName("reviewImg") != null) {
				
				loadImg = "resources/review_upfiles/" + multiRequest.getFilesystemName("reviewImg");
				
			}
			Review rv = new Review(reviewNo, reviewContent, star, loadImg);
			
			int result = new ReviewService().updateReview(rv);
			
			if(result > 0) { // 요리후기 수정 정상처리
				
				request.getSession().setAttribute("alertMsg", "요리후기 수정 성공");
				response.sendRedirect(request.getContextPath() + "/review.me?currentPage=1");
				
			}else {
				
				request.setAttribute("errorTitle", "요리후기 수정 성공");
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
