<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.refrigerator.common.model.vo.PageInfo, java.util.ArrayList , com.refrigerator.recipe.model.vo.Recipe"%>    

<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Recipe> list = (ArrayList<Recipe>)request.getAttribute("myRecipeList");
	String alertMsg = (String)session.getAttribute("alertMsg"); 
	// 아래는 현재 페이지에서 필요한 페이징 변수들이다. 
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();	
	
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="jaewon.s">
<!-- Author : Jaewon  -->

<title>마이페이지 내가 쓴 레시피</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">

<style>
	.outer{
		width: 800px;
		margin-right: 70px;
		margin-top: 20px;
		margin-bottom: 20px;
	}

	.outer > p {
        color: rgb(0,102,51);
		font-weight: 900;
		font-size: 24px;
	}

	.division-line{
		width: 800px;
		border: 1px solid rgb(0,102,51);
		margin-top: 35px;
		height: 0px;
		background-color: rgb(0,102,51);
	}

	.recipe-list-table {
		width: 100%;
		border-top: none;
		text-align: center;
	}

	.recipe-list-table th{
		padding: 12px;
	}

	.recipe-list-table td{
		text-align: center;
		padding: 8px;
	}

	.recipe-list-table>tbody>tr{
		border-bottom: 1px solid #dee2e6;
		border-top: 1px solid #dee2e6;
		vertical-align: middle;
	}

	.list-box{
		display: flex;
		cursor: pointer;
	}

	.list-box img{
		margin-top:2px;
		object-fit: cover;
	}


	.list-box div:last-child{
		padding-left: 10px ;
		text-align: left;
	}
	
	.list-box:hover{
		background-color: rgba(180,0,0,0.03);
		border: 1px solid orange;
		transform: scale(1.01);
	}

	.recipe-list-table td a{
		color: black;
	}

	.recipe-list-table span{
		width: 80px;
		display: inline-block;
		text-align: center;
		height: 25px;
	}

    .paging-area{
   		text-align: center;
    }

	.paging-area button{
		width:40px;
		height:40px;
        margin: 5px;	
		margin-top: 30px ;
		justify-content: center;
		border-radius: 5px;
    	background-color: rgb(244,244,244);
		color: rgb(127,127,127);
    	font-size:16px;
    	font-weight: bold;		
	}    
    
    #dis-btn{
    	background-color: rgb(52,152,219);
    	color:white;
    }
/* ----------------------- 삭제 모달 영역 css시작 ---------------------------------- */
	.recipe-list-table button{
		background-color: white;
		border: none;
	}

	.delete-box{
		text-align: center;
		margin-top: 250px;
	}

	.modal-title{
		text-overflow:ellipsis;
		white-space:nowrap; 
		overflow:hidden;
		font-weight: bold;
	}

	.modal-footer button{
		width: 45%;
		margin: 0px;		
	}
/* ----------------------- 삭제 모달 영역 css끝 ---------------------------------- */
</style>

</head>
<body>
	<%@ include file="../common/user/menubar.jsp" %>
	<%@ include file="../common/user/myPageVerticalNav.jsp" %>
		<div class="outer">
			<p>내가 쓴 레시피</p> 
            <div class="division-line"></div>
			<table class="recipe-list-table" >
				<thead>
					<tr>
						<th>작성일</th>
						<th>내용</th>
						<th>작성자</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<% if(list.isEmpty()){%>
						<tr>
							<td colspan="5" style="width:100%; padding:100px; text-align:center; font-size: 25px; font-weight:bold; color:tomato;"> 
								내가 쓴 레시피가 없습니다 ! <br> 냉장고에 뭐있지?와 함께 레시피를 작성해봐요! <br>레시피를 작성해주시면 많은 분께 도움이 됩니다!   
							</td>
						</tr>				
					<% }else{ %>
						<% if(list.size()<5){ %>
						<!-- 5보다 작으면 일단 가지고 있는것을 출력하고 안되면 나머지 값은 빈 tr로 넣어줘야한다. -->
							<% for(Recipe r : list){ %>	
							<tr>
								<td  width="100"><%= r.getRecipeEnrollDate().substring(2, 10) %></td>
								<td  class="list-box" onclick="location.href='<%= request.getContextPath() %>/detail.recipe?rno='+ <%= r.getRecipeNo() %>">
									<div>
										<img src="<%= r.getMainImg() %>" width="110" height="110">
									</div>
									<div>
										<p style="font-weight:bold;"><%= r.getRecipeTitle() %></p>
										<span>스크랩</span> <%= r.getScrapCount() %>  <br>
										<span>평균별점</span> 
											<% 	Double avgStar = Math.round(r.getAvrgStarPoint()*10)/10.0;
											if(avgStar < 0.3){ %>
												<i class="far fa-star fa-sm"></i><i class="far fa-star fa-sm"></i><i class="far fa-star fa-sm"></i><i class="far fa-star fa-sm"></i><i class="far fa-star fa-sm"></i>									
											<%}else if(avgStar < 0.8){%>
												<i class="fas fa-star-half-alt fa-sm"></i><i class="far fa-star fa-sm"></i><i class="far fa-star fa-sm"></i><i class="far fa-star fa-sm"></i><i class="far fa-star fa-sm"></i>									
											<%}else if(avgStar < 1.3){%>
												<i class="fas fa-star fa-sm"></i><i class="far fa-star fa-sm"></i><i class="far fa-star fa-sm"></i><i class="far fa-star fa-sm"></i><i class="far fa-star fa-sm"></i> 							
											<%}else if(avgStar < 1.8){%>
												<i class="fas fa-star fa-sm"></i><i class="fas fa-star-half-alt fa-sm"></i><i class="far fa-star fa-sm"></i><i class="far fa-star fa-sm"></i><i class="far fa-star fa-sm"></i>								
											<%}else if(avgStar < 2.3){%>
											    <i class="fas fa-star fa-sm"></i><i class="fas fa-star fa-sm"></i><i class="far fa-star fa-sm"></i><i class="far fa-star fa-sm"></i><i class="far fa-star fa-sm"></i>
											<%}else if(avgStar < 2.8){%>
											    <i class="fas fa-star fa-sm"></i><i class="fas fa-star fa-sm"></i><i class="fas fa-star-half-alt fa-sm"></i><i class="far fa-star fa-sm"></i><i class="far fa-star fa-sm"></i>
											<%}else if(avgStar < 3.3){%>
											    <i class="fas fa-star fa-sm"></i><i class="fas fa-star fa-sm"></i><i class="fas fa-star fa-sm"></i><i class="far fa-star fa-sm"></i><i class="far fa-star fa-sm"></i>
											<%}else if(avgStar < 3.8){%>
											    <i class="fas fa-star fa-sm"></i><i class="fas fa-star fa-sm"></i><i class="fas fa-star fa-sm"></i><i class="fas fa-star-half-alt fa-sm"></i><i class="far fa-star fa-sm"></i>
											<%}else if(avgStar < 4.3){%>
											    <i class="fas fa-star fa-sm"></i><i class="fas fa-star fa-sm"></i><i class="fas fa-star fa-sm"></i><i class="fas fa-star fa-sm"></i><i class="far fa-star fa-sm"></i>
											<%}else if(avgStar < 4.8){%>
											    <i class="fas fa-star fa-sm"></i><i class="fas fa-star fa-sm"></i><i class="fas fa-star fa-sm"></i><i class="fas fa-star fa-sm"></i><i class="fas fa-star-half-alt fa-sm"></i>
											<%}else{%>
												<i class="fas fa-star fa-sm"></i><i class="fas fa-star fa-sm"></i><i class="fas fa-star fa-sm"></i><i class="fas fa-star fa-sm"></i><i class="fas fa-star fa-sm"></i> 
											<%} %>	
										<br>
										<span>조회수</span> <%= r.getCount() %> <br>
									</div>
								</td>
								<td width="90"><%= r.getRecipeWriter() %></td>
								<td width="60">
									<form action="updateMyRecipe.rcp" method="post">
										<input type="hidden" name="userNo" value="<%=loginUser.getUserNo()%>">
										<input type="hidden" name="recipeNo" value="<%=r.getRecipeNo()%>">									
										<button type="submit"><i class="fas fa-edit"></i></button>
									</form>
								</td>
								<td><button type="button" onclick="passNumber(this);" data-toggle="modal" data-target="#recipe-del-modal"><i class="fas fa-trash-alt"></i></button></td>
							</tr>
							<% } %>
							<% for(int i=0; i<5-list.size();i++){ %>
								<tr >
									<td colspan="5" style="width:100%; padding:10px 100px; text-align:center; font-size:14px; font-weight:bold; color:rgb(0,151,100);">
										더 작성하신 레시피가 없습니다 ! <br> 냉장고에 뭐있지?와 함께 추가적으로 레시피를 작성해봐요! <br>레시피를 작성해주시면 많은 분께 도움이 됩니다!   
									</td>
								</tr>
							<%} %>						
						<%}else{ %>						
							<% for(Recipe r : list){ %>	
							<tr>
								<td width="100"><%= r.getRecipeEnrollDate().substring(2, 10) %></td>
								<td  class="list-box" onclick="location.href='<%= request.getContextPath() %>/detail.recipe?rno='+ <%= r.getRecipeNo() %>">
									<div>
										<img src="<%= r.getMainImg() %>" width="110" height="110">
									</div>
									<div>
										<p style="font-weight:bold;"><%= r.getRecipeTitle() %></p>
										<span>스크랩</span> <%= r.getScrapCount() %>  <br>
										<span>평균별점</span> 
											<% 	Double avgStar = Math.round(r.getAvrgStarPoint()*10)/10.0;
											if(avgStar < 0.3){ %>
												<i class="far fa-star fa-sm"></i><i class="far fa-star fa-sm"></i><i class="far fa-star fa-sm"></i><i class="far fa-star fa-sm"></i><i class="far fa-star fa-sm"></i>									
											<%}else if(avgStar < 0.8){%>
												<i class="fas fa-star-half-alt fa-sm"></i><i class="far fa-star fa-sm"></i><i class="far fa-star fa-sm"></i><i class="far fa-star fa-sm"></i><i class="far fa-star fa-sm"></i>									
											<%}else if(avgStar < 1.3){%>
												<i class="fas fa-star fa-sm"></i><i class="far fa-star fa-sm"></i><i class="far fa-star fa-sm"></i><i class="far fa-star fa-sm"></i><i class="far fa-star fa-sm"></i> 							
											<%}else if(avgStar < 1.8){%>
												<i class="fas fa-star fa-sm"></i><i class="fas fa-star-half-alt fa-sm"></i><i class="far fa-star fa-sm"></i><i class="far fa-star fa-sm"></i><i class="far fa-star fa-sm"></i>								
											<%}else if(avgStar < 2.3){%>
											    <i class="fas fa-star fa-sm"></i><i class="fas fa-star fa-sm"></i><i class="far fa-star fa-sm"></i><i class="far fa-star fa-sm"></i><i class="far fa-star fa-sm"></i>
											<%}else if(avgStar < 2.8){%>
											    <i class="fas fa-star fa-sm"></i><i class="fas fa-star fa-sm"></i><i class="fas fa-star-half-alt fa-sm"></i><i class="far fa-star fa-sm"></i><i class="far fa-star fa-sm"></i>
											<%}else if(avgStar < 3.3){%>
											    <i class="fas fa-star fa-sm"></i><i class="fas fa-star fa-sm"></i><i class="fas fa-star fa-sm"></i><i class="far fa-star fa-sm"></i><i class="far fa-star fa-sm"></i>
											<%}else if(avgStar < 3.8){%>
											    <i class="fas fa-star fa-sm"></i><i class="fas fa-star fa-sm"></i><i class="fas fa-star fa-sm"></i><i class="fas fa-star-half-alt fa-sm"></i><i class="far fa-star fa-sm"></i>
											<%}else if(avgStar < 4.3){%>
											    <i class="fas fa-star fa-sm"></i><i class="fas fa-star fa-sm"></i><i class="fas fa-star fa-sm"></i><i class="fas fa-star fa-sm"></i><i class="far fa-star fa-sm"></i>
											<%}else if(avgStar < 4.8){%>
											    <i class="fas fa-star fa-sm"></i><i class="fas fa-star fa-sm"></i><i class="fas fa-star fa-sm"></i><i class="fas fa-star fa-sm"></i><i class="fas fa-star-half-alt fa-sm"></i>
											<%}else{%>
												<i class="fas fa-star fa-sm"></i><i class="fas fa-star fa-sm"></i><i class="fas fa-star fa-sm"></i><i class="fas fa-star fa-sm"></i><i class="fas fa-star fa-sm"></i> 
											<%} %>	
										<br>
										<span>조회수</span> <%= r.getCount() %> <br>
									</div>
								</td>
								<td width="90"><%= r.getRecipeWriter() %></td>
								<td width="60">
									<form action="updateMyRecipe.rcp" method="post">
										<input type="hidden" name="userNo" value="<%=loginUser.getUserNo()%>">
										<input type="hidden" name="recipeNo" value="<%=r.getRecipeNo()%>">									
										<button type="submit"><i class="fas fa-edit"></i></button>
									</form>
								</td>
								<td><button type="button" onclick="passNumber(this);" data-toggle="modal" data-target="#recipe-del-modal"><i class="fas fa-trash-alt"></i></button></td>
							</tr>
							<% } %>
						<%} %>
					<%} %>
				</tbody>
			</table>
			<script>
				function passNumber(btnLoc){
					var userNum = $(btnLoc).parent().prev().find("input[name='userNo']").val();
					var recipeNumber = $(btnLoc).parent().prev().find("input[name='recipeNo']").val();
					$("#delTitle").text($(btnLoc).parent().parent().find("p").text());
					$("#delUserNo").val(userNum);
					$("#delRecipeNo").val(recipeNumber);
				}			
			</script>
<%------------------------------------- 페이징바 영역 ---------------------------------------------------------%>
			<%if(!list.isEmpty()){ %>
		        <div align="center" class="paging-area">
		
					<!-- 현재 보고있는 페이지가 1일 떄 버튼 안보이게 하려면 아래와같이 -->
					<% if(currentPage != 1){ %>
		            	<button onclick="location.href='<%= request.getContextPath() %>/mylist.rcp?currentPage=<%= currentPage-1 %>';">&lt;</button>
		            <%} %>
		            
		            <% for(int p=startPage; p<=endPage; p++){ %>
		            	<% if(p != currentPage) {%>	
		            		<button onclick="location.href='<%= request.getContextPath()%>/mylist.rcp?currentPage=<%= p %>';"><%= p %></button>
		            	<%}else{ %>
		         	    	<button id="dis-btn" disabled><%= p %></button>
		            	<%}%>
		            <%}%>
			
					<% if(currentPage != maxPage){ %>                        
		            	<button onclick="location.href='<%= request.getContextPath() %>/mylist.rcp?currentPage=<%= currentPage+1 %>';">&gt;</button>
		            <%} %>
		        </div>
			<%} %>

           </div>

	</div>

<%------------------------------ 삭제모달 영역임  --------------------------------------------------------------------------------------------------------------%>
	<!-- The Modal -->
	<div class="modal fade" id="recipe-del-modal">
		<div class=" modal-dialog modal-sm">
			<div class="delete-box modal-content" style="width:500px">
		
				<!-- Modal Header -->
				<div class="modal-header">
					<h5 class="modal-title">레시피 : <span id="delTitle"></span></h5>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<form action="delMyRecipe.rcp" method="post">	
					<!-- Modal body -->
					<div class="modal-body" style="color: red;">
						<input type="hidden" id="delUserNo" name="userNo">
						<input type="hidden" id="delRecipeNo" name="recipeNo">
						작성한 레시피를 삭제하시겠습니까?
					</div>
					
					<!-- Modal footer -->
					<div class="modal-footer" style="justify-content: space-around; border-top: none;">
						<button type="button" class="btn btn-light btn-bg" data-dismiss="modal" style="background-color: #BEBEBE; color: white;">취소</button>
						<button type="submit" class="btn btn-danger btn-bg">삭제</button>
					</div>
				</form>
			</div>
		</div>
	</div>
<%------------------------------ 삭제모달 영역임  --------------------------------------------------------------------------------------------------------------%>
	<%@ include file="../common/user/footer.jsp" %>
	        	<!-- Jaewon.s -->
	<script>
	 	var msg = "<%= alertMsg %>"; 
	 	if(msg != "null"){
		 	alert(msg);	 
			<% session.removeAttribute("alertMsg"); %>
	 	}
	</script>
	
</body>
</html>