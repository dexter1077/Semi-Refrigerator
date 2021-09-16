package com.refrigerator.recipe.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.refrigerator.common.MyFileRenamePolicy;
import com.refrigerator.ingre.model.service.IngreService;
import com.refrigerator.ingre.model.vo.Ingre;
import com.refrigerator.ingre_search.model.service.IngreSearchService;
import com.refrigerator.ingre_search.model.vo.IngreSearch;
import com.refrigerator.recipe.model.service.RecipeService;
import com.refrigerator.recipe.model.vo.Recipe;
import com.refrigerator.reicpe_order.model.service.RecipeOrderService;
import com.refrigerator.reicpe_order.model.vo.RecipeOrder;

/**
 * 레시피 등록 페이지 (레시피+순서+검색버튼+재료)테이블
 * @author HeeRak
 * Servlet implementation class RecipeEnrollController
 */
@WebServlet("/insert.rcp")
public class RecipeinsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeinsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10 * 1024 * 1024;
			
			String recipeSavePath = request.getSession().getServletContext().getRealPath("/resources/recipe_upfiles/");
			String orderSavePath = request.getSession().getServletContext().getRealPath("/resources/recipe_order_upfiles/");
			
			// 일단 저장경로는 orderSavePath로 한다. (나중에 대표사진 + 재료사진 2개는 renameTo 메소드를 통해 이동할것!)
			MultipartRequest multiRequest = new MultipartRequest(request, orderSavePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 유저번호 뽑기
			int userNo = Integer.parseInt(multiRequest.getParameter("userNo"));
			
			// 1) 레시피 insert할 값 뽑기 [평균별점 0 sql로 넣어줄것!]
			String recipeTitle = multiRequest.getParameter("title");
			String recipeIntro = multiRequest.getParameter("intro");
			int servings = Integer.parseInt(multiRequest.getParameter("servings"));
			int time = Integer.parseInt(multiRequest.getParameter("time"));
			
			// file11 == 대표사진  |  file12 == 재료사진                  !![수정된 파일명 뽑기]
			String mainImg = "";
			String ingreImg = "";
			
			for(int i=11; i<=12; i++) {
				
				String key = "file" + i;
				
				if(multiRequest.getOriginalFileName(key) != null) {
					
					if(key.equals("file11")) {
						mainImg = multiRequest.getFilesystemName(key);
					}else {
						ingreImg = multiRequest.getFilesystemName(key);
					}
					
				}
			}
			
			// Caution!!) 대표사진 객체 저장(경로 +수정명) contextPath 붙이면 못찾는다. [jsp src와는 다른거 같다.]
			
			// 1) file = new File("경로+파일명")  경로에 해당하는 파일명을 찾는다.
			File file = new File(orderSavePath + mainImg);// 경로 + 파일명
			
			// 2) fileNew = new File ("경로+파일명")  경로에 해당하는 파일명을 찾는다. [다만, 없는 파일경로 이지만 오류는 안남]
			File fileNew = new File(recipeSavePath + mainImg);
			
			// 3) file객체가 존재한다면(찾았다면) 그파일 이름변경renameTo(+경로변경 <=fileNew객체 넣어서)하기
			// fileNew의 경로와     file의 경로가 다르다면  저장된 file은 fileNew로 이동된다.
			// 경로와 이름이 다르다면 ? => 위치도 fileNew에 맞게 이동되고 이름도 바뀐다.
			if(file.exists())file.renameTo(fileNew);
			
			// 4) 재료사진도 변수를 바꿔서 동일한 방식으로 진행한다. 
			File file2 = new File(orderSavePath + ingreImg);
			File fileNew2 = new File(recipeSavePath + ingreImg);
			if(file2.exists())file2.renameTo(fileNew2);
			
			// 5) contextPath + 파일 경로 + 수정된파일명 변수저장
			
			mainImg = request.getContextPath() + "/resources/recipe_upfiles/" + mainImg;
			ingreImg = request.getContextPath() + "/resources/recipe_upfiles/" + ingreImg;
			
			
			Recipe inRecipe = new Recipe(userNo,
										 recipeTitle,
										 recipeIntro,
										 servings,
										 time,
										 mainImg,
										 ingreImg
										); 
			
			
			// 2) 검색버튼 insert할 값 뽑기
			// -검색버튼 개수
			int sbCount = sbCount = Integer.parseInt(multiRequest.getParameter("sbCount"));				
			
			ArrayList<IngreSearch> sbList = new ArrayList<>(); 
			
			// 2번째 레시피번호는 currval로 얻을것!
			for(int i=0; i<sbCount; i++) {
				int j = i + 1;
				sbList.add(new IngreSearch(j,
										   Integer.parseInt(multiRequest.getParameter("btnSubCat"+(j)))
										   ));
			}
			//int resultSb = new IngreSearchService().insertIngreSearch(sbList);
			
			// 3) 재료 insert할 값 뽑기
			// - 필수재료 입력개수
			int ingCount = Integer.parseInt(multiRequest.getParameter("ingCount"));
			// - 부가재료 입력개수
			int addCount = Integer.parseInt(multiRequest.getParameter("addCount"));
			
			ArrayList<Ingre> ingList = new ArrayList<>();
			ArrayList<Ingre> addList = new ArrayList<>();
			
			for(int i=0; i<ingCount; i++) {
				int j = i + 1;
				ingList.add(new Ingre(Integer.parseInt(multiRequest.getParameter("ingSubCat" + j)),
									  Integer.parseInt(multiRequest.getParameter("ingAmount" + j)),
									  multiRequest.getParameter("ingUnit" + j),
									  "필수"
									  ));
			}
			
			for(int i=0; i<addCount; i++) {
				int j = i + 1;
				ingList.add(new Ingre(Integer.parseInt(multiRequest.getParameter("addSubCat" + j)),
									  Integer.parseInt(multiRequest.getParameter("addAmount" + j)),
									  multiRequest.getParameter("addUnit" + j),
									  "부가"
									  ));
			}
			
			//int resultIng = new IngreService().insertIngreList(ingList, addList);
			
			// 4) 레시피 insert할 값 뽑기
			// - 요리순서 입력개수
			int orderCount = Integer.parseInt(multiRequest.getParameter("orderCount"));
			
			ArrayList<RecipeOrder> ordList = new ArrayList<>();
			
			for(int i=0; i<orderCount; i++) {
				int j = i + 1;
				ordList.add(new RecipeOrder());
				ordList.get(i).setRecipeOrder(j);
				ordList.get(i).setRecipeExpln(multiRequest.getParameter("expln" + j));
				
				if(multiRequest.getOriginalFileName("orderImg" + j) != null) {
					ordList.get(i).setRecipeImg(request.getContextPath() 
												+ "/resources/recipe_order_upfiles/" 
												+ multiRequest.getFilesystemName("orderImg" + j));
				}
				
			}
			
			//int resultOrd = new RecipeOrderService().insertRecipeOrderList(ordList);
			
			int result = new RecipeService().insertRecipe(inRecipe, sbList, ingList, addList, ordList);
			
			if(result > 0) {
				
				request.getSession().setAttribute("alertMsg", "레시피 등록 성공");
				response.sendRedirect(request.getContextPath() + "/mylist.rcp?currentPage=1");
				
			}else {
				
				request.setAttribute("errorTitleMsg", "레시피 등록 실패");
				request.getRequestDispatcher("views/member/login.jsp").forward(request, response);
				
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
