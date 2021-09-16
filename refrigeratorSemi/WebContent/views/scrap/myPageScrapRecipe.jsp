<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList , com.refrigerator.scrap.model.vo.Scrap"%>    
    
<%
	ArrayList<Scrap> list = (ArrayList<Scrap>)request.getAttribute("scrapList");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="jaewon.s">
<!-- Author : Jaewon -->

<title>마이페이지 찜하기 관리</title>
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
		width: 880px;
		display: flex;
		justify-content: flex-start;
		/* justify-content: space-around; 나중에 2개의 데이터 조회되었을시에   */
		flex-wrap: wrap;
	}

	#mypage-thumbnail-table div{
		width: 240px;
	}

	.mini-box{
		display: inline-block;
		overflow:visible;
		margin-bottom: 20px;
		margin-right: 50px;
	}

	.thumbnail-box {
		height: 380px;
		width: 235px;
		text-align: center;
		margin: auto;
		box-sizing: border-box;
		border: 1px solid rgb(224,224,224);
		cursor: pointer;
		display: in;
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

	.button-area{
		margin-top: 10px;
		width: 100%;
		text-align: center;
	}

	.button-area > a{
		width: 110px;
		height: 28px;
		line-height: 18px;
	}

	.button-area > a:hover{
		transform: scale(1.02);
	}
	
	#none-area{
		margin: auto;
		font-size: 25px;
		width: 600px;
		font-weight:bolder;
		margin-top: 100px;
		text-align:center;
		margin-right : 350px;
		color:tomato;
	}

</style>
<!--  이미 float right은 들어가있는상태이다 나머지는기호에따라 조금씩 움직여주면된다. -->

</head>
<body>
	<%@ include file="../common/user/menubar.jsp" %>
	<%@ include file="../common/user/myPageVerticalNav.jsp" %>
		<!-- 마이페이지 작업영역  시작-->
		<!-- ★ 우선 ajax로 페이지로딩이 끝나는 시점에서 한번 조회와서 뿌리고 
			그다음  -->

		<div class="outer">
			<p>찜한레시피</p> 
            <div class="division-line"></div>
			<div id="mypage-thumbnail-table">
				<% if(list.isEmpty()){ %>
					<div id="none-area">찜한 레시피가 <br>없습니다!</div>
				<% }; %>
							
				<% for(Scrap s : list) {%>
					<div class="mini-box">
						<div class="thumbnail-box" onclick="location.href='<%= request.getContextPath() %>/detail.recipe?rno='+ <%= s.getRecipeNo() %>">
							<img src="<%= s.getMainImg() %>"> <br>
							<img src="<%= s.getProfileImg() %>"><br>
							<span><%= s.getNickName() %></span>
							<p><%= s.getRecipeTitle() %></p>
							<div class="star-box">
								<!-- 여기도 반복문 돌려야한다! 조건문과 같이 -->
								<% 	
									//switch문은 double형을 쓸수가없다. 
									Double avgStar = Math.round(s.getAvgStar()*10)/10.0;
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
									<span><%= s.getCookingTime() %></span>
								</div>
								<div class="bottom-box">
									<i class="fas fa-thumbs-up"></i>
									<span><%= s.getLikeCount() %></span>
								</div>
							</div>
						</div>
						<div class="button-area">
							<button type="button" onclick="deleteScrap(this);" class="btn btn-danger btn-sm">찜하기 취소</button>
							<input type="hidden" value="<%= s.getRecipeNo() %>">
						</div>
					</div>
				<% } %>	
				<script>// 반복문 돌면서 스크립트 만들어지지 않게 밖으로 뺌 
					function deleteScrap(recipeNoObj){
						$.ajax({ 
							url : "delete.scr",
							data : {userNo: <%= loginUser.getUserNo() %>
								  , recipeNo : $(recipeNoObj).next().val()
							},
							type:"post", 
							success: function(result){ 
								alert(result);
								location.reload(); // 아이고 애초에 화면 불러오는것도 ajax로 만들어야했다. 이게 최선
							},
							error:function(){
								alert("예상치 못한 오류로 인해 조회가 불가합니다 개발자에게 문의하세요");
							}
						})
					}				
				</script>
			</div>
		</div>
		<!-- 마이페이지 작업영역  끝-->
	</div>
	<%@ include file="../common/user/footer.jsp" %>

</body>
</html>