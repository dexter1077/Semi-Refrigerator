package com.refrigerator.recipe.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.refrigerator.common.MyFileRenamePolicy;
import com.refrigerator.recipe.model.service.RecipeService;
import com.refrigerator.review.model.vo.Review;

/**
 * @author seong
 * @date 0528
 * Servlet implementation class ReviewInsertController
 */

@WebServlet("/insertReview.recipe")
public class ReviewInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewInsertController() {
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
			MultipartRequest multiRequest = new MultipartRequest(request,savePath,maxSize,"UTF-8",new MyFileRenamePolicy());
			
			String reivewWriter = multiRequest.getParameter("userNo");
			int recipeNo = Integer.parseInt(multiRequest.getParameter("recipeNo"));
			String reviewContent = multiRequest.getParameter("content");
			Double star = Double.parseDouble(multiRequest.getParameter("starCount"));
			String reviewImg = multiRequest.getFilesystemName("reviewUpfile");
			
			
			Review rv = new Review();
			
			rv.setReviewWriter(reivewWriter);
			rv.setRecipeNo(recipeNo);
			rv.setReviewContent(reviewContent);
			rv.setStar(star);								
			rv.setReviewImg( "resources/review_upfiles/" + reviewImg);
			
			
			
			int result = new RecipeService().insertReview(rv);
			
			// 요리 후기 작성시 별점 변경
			int avgStar = new RecipeService().avgStarUpdate(recipeNo);
			
			if(result>0) {
				
				request.getSession().setAttribute("alertMsg", "요리후기 작성 성공 ! ");
				response.sendRedirect(request.getContextPath()+"/detail.recipe?rno=" + recipeNo);
				
			}else {
				
				// 에러 페이지가 들어갈 예정입니다.
				
				
				
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
