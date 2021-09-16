package com.refrigerator.nav_menu.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.nav_menu.model.service.NavMenuService;
import com.refrigerator.nav_menu.model.vo.NavMenu;

/** @author Jaewon */

/**
 * Servlet implementation class AdminNavMenuListController
 */
@WebServlet("/menuList.nav")
public class AdminNavMenuListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNavMenuListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ArrayList<NavMenu> list = new NavMenuService().seletNavMenuList();
		
		request.setAttribute("navlist", list);

		request.getRequestDispatcher("/views/nav_menu/adminNavbarChangePage.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
