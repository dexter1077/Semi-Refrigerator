package com.refrigerator.event.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
 * 관리자단 이벤트 등록
 * @author seong
 * @date 6/1
 */


/**
 * Servlet implementation class InsertEventController
 */
@WebServlet("/insertEvent.admin")
public class AdminInsertEventController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminInsertEventController() {
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
			

			String eventTitle = multiRequest.getParameter("eventTitle");
			String eventCategory = multiRequest.getParameter("eventCategory");
			
			String startDate = multiRequest.getParameter("startDate");
			startDate = startDate.replace("-", "/");

			
			String endDate = multiRequest.getParameter("endDate");
			endDate = endDate.replace("-", "/");
			
			String eventImg = multiRequest.getParameter("eventUpfile");
			
		
			AdmEvent adEvent = new AdmEvent();
			adEvent.setEventTitle(eventTitle);
			adEvent.setEventCategory(eventCategory);
			adEvent.setStartDate(startDate);
			adEvent.setEndDate(endDate);
			adEvent.setEventImg("resources/event_upfiles/" + eventImg);
			
			
			int result = new EventService().adminInsertEvent(adEvent);
			
			if(result>0) {
				
				request.getSession().setAttribute("alertMsg", "이벤트 등록 성공! ");
				response.sendRedirect(request.getContextPath()+"/selectEvent.admin?currentPage=1");
				
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
