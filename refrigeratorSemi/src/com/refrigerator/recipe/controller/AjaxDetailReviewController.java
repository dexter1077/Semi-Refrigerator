package com.refrigerator.recipe.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.refrigerator.recipe.model.service.RecipeService;
import com.refrigerator.review.model.vo.Review;


/**
 * @author seong
 * @date 0528
 * Servlet implementation class AjaxDetailReviewController
 */


@WebServlet("/list.review")
public class AjaxDetailReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxDetailReviewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int recipeNo = Integer.parseInt(request.getParameter("recipeNo"));
		ArrayList <Review> list = new RecipeService().selectReviewList(recipeNo);

		response.setContentType("application/json;charset=utf-8");
		request.setAttribute("list",list);
		new Gson().toJson(list,response.getWriter());
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
