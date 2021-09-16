package com.refrigerator.category.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.refrigerator.category.model.service.SubCategoryService;
import com.refrigerator.category.model.vo.SubCategory;

/**
 * 메인카테고리 번호 받아 sub카테고리 목록 반환
 * @author HeeRak
 * Servlet implementation class AjaxSubCatgoryListController
 */
@WebServlet("/jqAjaxSbCatList.rcp")
public class AjaxSubCatgoryListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxSubCatgoryListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int mcNo = Integer.parseInt(request.getParameter("mcNo"));
		
		ArrayList<SubCategory> Bannerlist = new SubCategoryService().selectSubListByMainCategory(mcNo);
		
		response.setContentType("application/json; charset=utf-8");
		
		new Gson().toJson(Bannerlist, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
