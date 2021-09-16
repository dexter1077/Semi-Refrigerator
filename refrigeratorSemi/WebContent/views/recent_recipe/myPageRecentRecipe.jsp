<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList , com.refrigerator.recent_recipe.model.vo.RecentRecipe"%>    
    
<%
	ArrayList<RecentRecipe> firstRow = (ArrayList<RecentRecipe>)request.getAttribute("firstRow");
	ArrayList<RecentRecipe> secondRow = (ArrayList<RecentRecipe>)request.getAttribute("secondRow");
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="jaewon.s">
<!-- Author : Jaewon  -->
<title>마이페이지 최근본레시피</title>
<!-- font awesome CDN -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">

<style>
	.outer{
		width: 850px;
		margin-right: 55px;
		margin-top: 20px;
		padding-top: 60px;
		margin-bottom: 20px;
	}

	.outer > p {
		color: rgb(0,102,51);
		font-weight: 900;
		padding-left: 30px;
		font-size: 18px;
    }


	.division-line{
		width: 820px;
		border: 1px solid rgb(207,207,207);
		margin-bottom: 20px;
	}

	#mypage-thumbnail-table{
		width: 820px;
	}
	
	#mypage-thumbnail-table tr{
		display: flex;
		justify-content: flex-start;
		margin-bottom: 20px;
	}

	#mypage-thumbnail-table td{
		width: 240px;
	}

	#mypage-thumbnail-table td:nth-child(2), #mypage-thumbnail-table td:nth-child(3){
		margin-left: 50px;
	}

	.thumbnail-box {
		height: 380px;
		width: 100%;
		text-align: center;
		margin: auto;
		box-sizing: border-box;
		border: 1px solid rgb(224,224,224);
		cursor: pointer;
	}

	.thumbnail-box:hover{
		background-color: rgba(180,0,0,0.03);
		border: 1px solid orange;
		transform: scale(1.02);
	}
	
	.thumbnail-box img:nth-child(1){
		width: 235px;
		height: 225px;
		object-fit: cover;
	}

	.thumbnail-box img:nth-child(3){
		width: 75px;
		height: 75px;
		margin-top: -60px;
		border-radius: 50%;
	}

	.thumbnail-box span{
		font-weight: 700;
	}

	.thumbnail-box p{
		font-size: 14px;
		text-align: center;
		margin: auto;
		width:220px; 
		white-space:nowrap; 
		overflow:hidden;
		text-overflow: ellipsis;
		margin-top: 10px;
	}

	.star-box{
		margin-top: 15px;
		height: 30px;
	}
	.bottom-box-parent{
		display: flex;
		justify-content: space-between;
	}

	.bottom-box{
		width: 50%;
		box-sizing: border-box;
		display: inline-block;
		border: 2px solid gray;
		height: 30px;
		margin: 0px;
	}
	.bottom-box i{
		float: left;
		line-height: 25px;
		margin-left: 3px;
	}
</style>

</head>
<body>

	<%@ include file="../common/user/menubar.jsp" %>
	<%@ include file="../common/user/myPageVerticalNav.jsp" %>
		<!-- 마이페이지 작업영역  시작-->
		<div class="outer">
			<p>최근본레시피</p> 
            <div class="division-line"></div>
			<table id="mypage-thumbnail-table">
				<tr>
					<% if(firstRow.isEmpty()){%>
						<td style="width:100%; padding:100px; text-align:center; font-size: 30px; font-weight:bold; color:tomato;"> 
							최근 본 레시피가 없습니다 ! <br> 냉장고에 뭐있지?에는 좋은 레시피가 많아요! <br>레시피를 봐주세요^^ 
						</td>				
					<% }else{ %>					
						<% for(RecentRecipe rr : firstRow){ %>
							<td>
								<div class="thumbnail-box" onclick="location.href='<%= request.getContextPath() %>/detail.recipe?rno='+ <%= rr.getRecipeNo() %>">
									<img src="<%= rr.getMainImg() %>"> <br>
									<img src="<%= rr.getProfileImg() %>"><br>
									<span><%= rr.getNickName() %></span>
									<p><%= rr.getRecipeTitle() %></p>
									<div class="star-box">
										<% 	Double avgStar = Math.round(rr.getAvgStar()*10)/10.0;
										if(avgStar < 0.3){ %>
											<i class="far fa-star fa-lg"></i><i class="far fa-star fa-lg"></i><i class="far fa-star fa-lg"></i><i class="far fa-star fa-lg"></i><i class="far fa-star fa-lg"></i>									
										<%}else if(avgStar < 0.8){%>
											<i class="fas fa-star-half-alt fa-lg"></i><i class="far fa-star fa-lg"></i><i class="far fa-star fa-lg"></i><i class="far fa-star fa-lg"></i><i class="far fa-star fa-lg"></i>									
										<%}else if(avgStar < 1.3){%>
											<i class="fas fa-star fa-lg"></i><i class="far fa-star fa-lg"></i><i class="far fa-star fa-lg"></i><i class="far fa-star fa-lg"></i><i class="far fa-star fa-lg"></i> 							
										<%}else if(avgStar < 1.8){%>
											<i class="fas fa-star fa-lg"></i><i class="fas fa-star-half-alt fa-lg"></i><i class="far fa-star fa-lg"></i><i class="far fa-star fa-lg"></i><i class="far fa-star fa-lg"></i>								
										<%}else if(avgStar < 2.3){%>
										    <i class="fas fa-star fa-lg"></i><i class="fas fa-star fa-lg"></i><i class="far fa-star fa-lg"></i><i class="far fa-star fa-lg"></i><i class="far fa-star fa-lg"></i>
										<%}else if(avgStar < 2.8){%>
										    <i class="fas fa-star fa-lg"></i><i class="fas fa-star fa-lg"></i><i class="fas fa-star-half-alt fa-lg"></i><i class="far fa-star fa-lg"></i><i class="far fa-star fa-lg"></i>
										<%}else if(avgStar < 3.3){%>
										    <i class="fas fa-star fa-lg"></i><i class="fas fa-star fa-lg"></i><i class="fas fa-star fa-lg"></i><i class="far fa-star fa-lg"></i><i class="far fa-star fa-lg"></i>
										<%}else if(avgStar < 3.8){%>
										    <i class="fas fa-star fa-lg"></i><i class="fas fa-star fa-lg"></i><i class="fas fa-star fa-lg"></i><i class="fas fa-star-half-alt fa-lg"></i><i class="far fa-star fa-lg"></i>
										<%}else if(avgStar < 4.3){%>
										    <i class="fas fa-star fa-lg"></i><i class="fas fa-star fa-lg"></i><i class="fas fa-star fa-lg"></i><i class="fas fa-star fa-lg"></i><i class="far fa-star fa-lg"></i>
										<%}else if(avgStar < 4.8){%>
										    <i class="fas fa-star fa-lg"></i><i class="fas fa-star fa-lg"></i><i class="fas fa-star fa-lg"></i><i class="fas fa-star fa-lg"></i><i class="fas fa-star-half-alt fa-lg"></i>
										<%}else{%>
											<i class="fas fa-star fa-lg"></i><i class="fas fa-star fa-lg"></i><i class="fas fa-star fa-lg"></i><i class="fas fa-star fa-lg"></i><i class="fas fa-star fa-lg"></i> 
										<%} %>	
									</div>
									<div class="bottom-box-parent">
										<div class="bottom-box">
											<i class="far fa-clock"></i>
											<span><%= rr.getCookingTime() %></span>
										</div>
										<div class="bottom-box">
											<i class="fas fa-thumbs-up"></i>
											<span><%= rr.getLikeCount() %></span>
										</div>
									</div>
								</div>
							</td>
						<%} %>
					<%} %>
					
				</tr>
				<tr>
					<% for(RecentRecipe rr : secondRow){ %>
						<td>
							<div class="thumbnail-box" onclick="location.href='<%= request.getContextPath() %>/detail.recipe?rno='+ <%= rr.getRecipeNo() %>">
								<img src="<%= rr.getMainImg() %>"> <br>
								<img src="<%= rr.getProfileImg() %>"><br>
								<span><%= rr.getNickName() %></span>
								<p><%= rr.getRecipeTitle() %></p>
								<div class="star-box">
									<% 	Double avgStar = Math.round(rr.getAvgStar()*10)/10.0;
									if(avgStar < 0.3){ %>
										<i class="far fa-star fa-lg"></i><i class="far fa-star fa-lg"></i><i class="far fa-star fa-lg"></i><i class="far fa-star fa-lg"></i><i class="far fa-star fa-lg"></i>									
									<%}else if(avgStar < 0.8){%>
										<i class="fas fa-star-half-alt fa-lg"></i><i class="far fa-star fa-lg"></i><i class="far fa-star fa-lg"></i><i class="far fa-star fa-lg"></i><i class="far fa-star fa-lg"></i>									
									<%}else if(avgStar < 1.3){%>
										<i class="fas fa-star fa-lg"></i><i class="far fa-star fa-lg"></i><i class="far fa-star fa-lg"></i><i class="far fa-star fa-lg"></i><i class="far fa-star fa-lg"></i> 							
									<%}else if(avgStar < 1.8){%>
										<i class="fas fa-star fa-lg"></i><i class="fas fa-star-half-alt fa-lg"></i><i class="far fa-star fa-lg"></i><i class="far fa-star fa-lg"></i><i class="far fa-star fa-lg"></i>								
									<%}else if(avgStar < 2.3){%>
									    <i class="fas fa-star fa-lg"></i><i class="fas fa-star fa-lg"></i><i class="far fa-star fa-lg"></i><i class="far fa-star fa-lg"></i><i class="far fa-star fa-lg"></i>
									<%}else if(avgStar < 2.8){%>
									    <i class="fas fa-star fa-lg"></i><i class="fas fa-star fa-lg"></i><i class="fas fa-star-half-alt fa-lg"></i><i class="far fa-star fa-lg"></i><i class="far fa-star fa-lg"></i>
									<%}else if(avgStar < 3.3){%>
									    <i class="fas fa-star fa-lg"></i><i class="fas fa-star fa-lg"></i><i class="fas fa-star fa-lg"></i><i class="far fa-star fa-lg"></i><i class="far fa-star fa-lg"></i>
									<%}else if(avgStar < 3.8){%>
									    <i class="fas fa-star fa-lg"></i><i class="fas fa-star fa-lg"></i><i class="fas fa-star fa-lg"></i><i class="fas fa-star-half-alt fa-lg"></i><i class="far fa-star fa-lg"></i>
									<%}else if(avgStar < 4.3){%>
									    <i class="fas fa-star fa-lg"></i><i class="fas fa-star fa-lg"></i><i class="fas fa-star fa-lg"></i><i class="fas fa-star fa-lg"></i><i class="far fa-star fa-lg"></i>
									<%}else if(avgStar < 4.8){%>
									    <i class="fas fa-star fa-lg"></i><i class="fas fa-star fa-lg"></i><i class="fas fa-star fa-lg"></i><i class="fas fa-star fa-lg"></i><i class="fas fa-star-half-alt fa-lg"></i>
									<%}else{%>
										<i class="fas fa-star fa-lg"></i><i class="fas fa-star fa-lg"></i><i class="fas fa-star fa-lg"></i><i class="fas fa-star fa-lg"></i><i class="fas fa-star fa-lg"></i> 
									<%} %>	
								</div>
								<div class="bottom-box-parent">
									<div class="bottom-box">
										<i class="far fa-clock"></i>
										<span><%= rr.getCookingTime() %></span>
									</div>
									<div class="bottom-box">
										<i class="fas fa-thumbs-up"></i>
										<span><%= rr.getLikeCount() %></span>
									</div>
								</div>
							</div>
						</td>
					<%} %>				
				</tr>
			</table>
		</div>
		
	</div>
	<%@ include file="../common/user/footer.jsp" %>

</body>
</html>