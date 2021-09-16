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
 * 관리자단에서 이벤트 수정
 * @author seong
 * @date 6/1
 */


/**
 * Servlet implementation class AdminEventUpdateController
 */
@WebServlet("/updateEvent.admin")
public class AdminEventUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminEventUpdateController() {
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
			String savePath = request.getSession().getServletContext().getRealPath("/resources/event_upfiles/");
			MultipartRequest multiRequest = new MultipartRequest(request,savePath,maxSize,"UTF-8",new MyFileRenamePolicy());
			
			String eventTitle = multiRequest.getParameter("upDateEventTitle");
			int eventNo = Integer.parseInt(multiRequest.getParameter("eventNo"));
			String eventCategory = multiRequest.getParameter("upDateEventCategory");
			
			String startDate = multiRequest.getParameter("UpdateStartDate");
			startDate = startDate.replace("-", "/");
			String endDate = multiRequest.getParameter("UpdateEndDate");
			endDate = endDate.replace("-", "/");
			String status = multiRequest.getParameter("status");
			
			String eventImg = "";
			
			if(multiRequest.getOriginalFileName("UpdateEventUpfile") != null) {
				
				// contextPath + /경로 +  수정된 파일명 
				eventImg = request.getContextPath() + "/resources/event_upfiles/" + multiRequest.getFilesystemName("UpdateEventUpfile");
				
			}

			AdmEvent adEvent = new AdmEvent();
			adEvent.setEventNo(eventNo);
			adEvent.setEventTitle(eventTitle);
			adEvent.setEventCategory(eventCategory);
			adEvent.setStartDate(startDate);
			adEvent.setEndDate(endDate);
			adEvent.setEventImg(eventImg);
			adEvent.setStatus(status);
			
			System.out.println(adEvent);
			
			int result = new EventService().adminUpdateEvent(adEvent);
			
			if(result>0) {
				
				request.getSession().setAttribute("alertMsg", "이벤트 수정 성공! ");
				response.sendRedirect(request.getContextPath()+"/selectEvent.admin?currentPage=1");
				
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
