package com.refrigerator.common.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.refrigerator.category.model.service.MainCategoryService;
import com.refrigerator.category.model.service.SubCategoryService;
import com.refrigerator.category.model.vo.MainCategory;
import com.refrigerator.category.model.vo.SubCategory;

/** @author Jaewon */

/**
 * Servlet implementation class BringCategoryToMenubarController
 */
@WebServlet("/bringCat.cat")
public class AjaxBringCategoryToMenubarController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxBringCategoryToMenubarController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<MainCategory> mainList = new MainCategoryService().selectMainList(); 
		ArrayList<SubCategory> subList = new SubCategoryService().selectSubList(); 
		/*
		request.getSession().setAttribute("mainList", mainList);
		request.getSession().setAttribute("subList", subList);
		*/
		HashMap<String, ArrayList> map = new HashMap<>();
		map.put("main", mainList);
		map.put("sub", subList);
		
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(map, response.getWriter());

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
