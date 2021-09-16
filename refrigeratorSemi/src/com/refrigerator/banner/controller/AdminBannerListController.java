package com.refrigerator.banner.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.banner.model.service.BannerService;
import com.refrigerator.banner.model.vo.Banner;
import com.refrigerator.common.model.vo.PageInfo;
import com.refrigerator.tos.model.service.TosService;

/** @author Jaewon */

/**
 * Servlet implementation class AdminBannerListController
 */
@WebServlet("/adlist.ba")
public class AdminBannerListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBannerListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int listCount;    
		int currentPage; 
		int pageLimit;   
		int boardLimit;  
		int maxPage;     
		int startPage;   
		int endPage;     
		
		listCount = new BannerService().selectListCount(); 
		
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		pageLimit = 10; 
		
		boardLimit = 6;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Banner> list = new BannerService().selectList(pi); 
		
		ArrayList<Banner> list1 = new ArrayList();
		ArrayList<Banner> list2 = new ArrayList();
		
		if(list.size()<4) {
			list1= list;			
		}else {
			for(int i=0; i<3; i++){
				list1.add(list.get(i));
			}
			for(int i=3; i<list.size(); i++) {
				list2.add(list.get(i));
			}
		}
		
		request.setAttribute("pi", pi);
		request.setAttribute("list1", list1);
		request.setAttribute("list2", list2);
		
		request.getRequestDispatcher("views/banner/adminBannerViewAndModifyAndDeletePage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
