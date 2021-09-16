package com.refrigerator.recipe.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.recipe.model.service.RecipeService;
import com.refrigerator.reply.model.vo.Reply;

/**
 * Servlet implementation class AjaxReplyInsertController
 */

/**@author seong
 * @date 0528
 * @see HttpServlet#HttpServlet()
 */

@WebServlet("/rinsert.recipe")
public class AjaxReplyInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public AjaxReplyInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String replyContent = request.getParameter("content");
		int recipeNo = Integer.parseInt(request.getParameter("recipeNo"));
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		Reply r = new Reply();
		r.setReplyWriter(String.valueOf(userNo));
		r.setRecipeNo(recipeNo);
		r.setReplyContent(replyContent);
		
		int result = new RecipeService().insertReply(r);
		
		response.getWriter().print(result);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
