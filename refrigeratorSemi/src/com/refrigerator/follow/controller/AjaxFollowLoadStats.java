package com.refrigerator.follow.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.refrigerator.follow.model.service.FollowService;
import com.refrigerator.follow.model.vo.FollowStats;

/**
 * 마이페이지 -팔로잉관리 - 화면 로드시 [1.작성한 레시피 수(총합) 2.작성한 총 레시피 별점 평균]
 * @author HeeRak
 * Servlet implementation class AjaxFollowLoadStats
 */
@WebServlet("/jqAjaxFollowLoadStats.fol")
public class AjaxFollowLoadStats extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxFollowLoadStats() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userNo = Integer.parseInt(request.getParameter("followingUserNo"));
		
		FollowStats fs = new FollowService().selectFollowStatsListCount(userNo);
		
		response.setContentType("application/json; charset=utf-8");
		
		new Gson().toJson(fs, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
