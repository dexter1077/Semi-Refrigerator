package com.refrigerator.event.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.refrigerator.common.MyFileRenamePolicy;
import com.refrigerator.event.model.service.EventService;
import com.refrigerator.event.model.vo.AdmEvent;


/**
 * 관리자단에서 이벤트 삭제 
 * @author seong
 * @date 6/1 
 */



/**
 * Servlet implementation class AdminDeleteController
 */
@WebServlet("/deleteEvent.admin")
public class AdminDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		


		int eventNo = Integer.parseInt(request.getParameter("deleteEventNo"));
	
		int result = new EventService().adminDeleteEvent(eventNo);
		
		if(result>0) {
			
			request.getSession().setAttribute("alertMsg", "이벤트 삭제 성공!");
			response.sendRedirect(request.getContextPath()+"/selectEvent.admin?currentPage=1");
		}else {
			
			request.getSession().setAttribute("errorMsg", "삭제가 실패되었습니다.");
			request.getRequestDispatcher("views/common/user/errorPage.jsp").forward(request, response);
			
			
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
