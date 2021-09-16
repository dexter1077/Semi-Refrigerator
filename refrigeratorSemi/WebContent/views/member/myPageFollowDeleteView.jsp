<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.refrigerator.common.model.vo.PageInfo,
				 com.refrigerator.follow.model.vo.FollowStats,
				 java.util.ArrayList" %>
<%
	String alertMsg = (String)session.getAttribute("alertMsg");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<FollowStats> list = (ArrayList<FollowStats>)request.getAttribute("list");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지_팔로우관리</title>
<style>
        div, img{box-sizing: border-box;}
        .user-img{
            border:1px solid wheat;
        }

        /*공통*/
        .outer{
            width:780px;
            margin:20px 120px 0px 20px;
        }
        label{
            margin-bottom:0px;
        }

        /* 페이지 최상단 path*/
        .menu-path>label{
            text-decoration: underline;
        }
        /*팔로우 조회 박스 상단 css*/
        .menu-title{
        	width:100%;
            border-bottom: 5px solid rgb(0, 102, 51);
        }

        .menu-title>span{
            color: gold;
        }

        .menu-title>label{
            font-weight: 600;
            color: rgb(0, 102, 51);
        }

        /* 팔로우 박스 왼쪽, 오른쪽 영역잡기*/
        .following-box{
            width:100%;
            height:230px;
            border-bottom: 2px solid rgb(150,150, 150);
        }

        .following-box>div{
            float:left;
            height:100%;
        }
        
        .left-content{
            width:25%;
        }
        .right-content{
            width:75%;
        }

        /* 왼쪽 박스 유저 이미지+ 닉네임 + 버튼*/
        .user-img{
            width:120px;
            height:120px;
            margin:auto;
            margin-top:28px;
            margin-bottom:10px;
            border-radius:60px;
        }
        
        .user-img>img{
        	width:100%;
        	height:100%;
        	border-radius:60px;
        }
        
        .nickname-area{
            font-size: 14px;
        }

        .ufBtn-area>form>button{
            width:80px;
            height:26px;
            font-size:12px;
            color: white;
            background: rgb(0, 102, 51);
            border:none;
            border-radius:3px;
        }
        .ufBtn-area>form>button:hover{
            opacity: 0.92;
        }

        .stats-area{
            margin-top:28px;
            margin-bottom:20px;
        }
        .stats-area>span{
            font-size:85%;
        }

        .right-content img{
            border: 1px solid wheat;
            width:110px;
            height:110px;
            margin-right:10px;
        }
        
        .loadImg-area{
        	border:1px solid wheat;
            width:110px;
            height:110px;
            margin-right:10px;
            float:left;
        }
        .loadImg-area>img{
        	
        	width:110px;
        	height:110px;
        }

		button{
			border:none;
		}
		
		.page-area{
			margin-top: 20px;
		}

</style>
</head>
<body>

<%@ include file="../common/user/menubar.jsp" %>
<%@ include file="../common/user/myPageVerticalNav.jsp" %>

	 <script>
		//alertMsg
		var msg = "<%=alertMsg%>";
		if(msg != "null"){
			alert(msg);
			<% session.removeAttribute("alertMsg"); %>
		}
	</script>
	
	<div class="outer">

    <div class="menu-path" style="font-size:12px;">
        마이페이지 > <label>후기&별점관리</label> 
    </div>
    
    <br>
    
    <div class="menu-title">
        <label>팔로우 중</label><span> <%=pi.getListCount()%></span>
    </div>

    <div class="follow-content">
        <!-- 한 행 단위-->
        <%if(list.isEmpty()) {%>
        <div class="following-box">
        
        	<h2>팔로잉 한 유저가 없습니다.</h2>
        	
        </div>
        
        <%}else{ %>
        <%for(int i=0; i<list.size(); i++) {%>
        <div class="following-box">
            <input type="hidden" class="followUserNo<%=i+1%>" value="<%=list.get(i).getFollowingUserNo()%>">

            <div class="left-content">

                <div class="user-img">
                    <img src="<%=list.get(i).getProfileImg()%>">
                </div>
                
                <div class="nickname-area" align="center">
                    <%=list.get(i).getNickname()%>
                </div>
                
                <div class="ufBtn-area" align="center">
                	<form action="<%=contextPath%>/delete.fol">
                		<input type="hidden" name="followUserNo" value="<%=loginUser.getUserNo() %>"> 
                		<input type="hidden" name="followingUserNo" value="<%=list.get(i).getFollowingUserNo()%>">
	                    <button type="submit">- 언팔로우</button>
                	</form>
                </div>

            </div>

            <div class="right-content<%=i%>">

                <div class="stats-area">
                    <b>레시피</b>&nbsp;<span id="recipeCount"></span>&nbsp;&nbsp;&nbsp;<b>찜하기</b>&nbsp;<span><%=list.get(i).getScrapCount()%></span>&nbsp;&nbsp;&nbsp;
                    <b>팔로워</b><span><%=list.get(i).getFolCount()%></span>&nbsp;&nbsp;&nbsp;<b>평균별점</b>&nbsp;<span id="count"></span>
                </div>

                <div class="recipeImg-area<%=i%>">
                	<div class="loadImg-area"><img src="" class="recipeImg0"></div>
                	<div class="loadImg-area"><img src="" class="recipeImg1"></div>
                	<div class="loadImg-area"><img src="" class="recipeImg2"></div>
                	<div class="loadImg-area"><img src="" class="recipeImg3"></div>
                </div>
            </div>    
        </div>
        
        <%} %>
        <%} %>
        
		<script>
		
			// 마이페이지_팔로우 관리 페이지 로드 시 데이터 가져오는 반복문
			$(function(){
				for(var i=1; i<=<%=list.size()%>; i++){
					var $followUserNo = $(".followUserNo" + i);
					loadImg($followUserNo);
					loadStats($followUserNo);
				}
			})
			
			// 팔로우한 대표이미지 4장 가져오기 (최신순) 
			function loadImg(uNo){
				$.ajax({
					url:"jqAjaxFollowLoadImg.fol",
					data:{followingUserNo:uNo.val()},
					success:function(img){
						for(var k=0; k<img.length; k++){
							uNo.siblings("div[class^=right-content]").find(".recipeImg" + k).attr("src",img[k]);
						}
					}
				})
			}
			
			// 레시피 총 작성수 + 평균별점 데이터 
			function loadStats(uNo){
				$.ajax({
					url:"jqAjaxFollowLoadStats.fol",
					data:{followingUserNo:uNo.val()},
					success:function(stats){
							
						uNo.siblings("div[class^=right-content]").find("#recipeCount").html(stats.userRecipeCount);
						uNo.siblings("div[class^=right-content]").find("#count").html(stats.userAvgStar);
							
					}
				})
			}
			
		</script>
       

      <div align="center" class="page-area">
        	<%if(currentPage != 1) {%>
            <button onclick="location.href='<%=contextPath%>/deleteForm.fol?currentPage=<%=currentPage-1%>';">&lt;</button>
            <%} %>
            <%for(int p=startPage; p<=endPage; p++) {%>
            	<%if(p != currentPage) { %>
            		<button onclick="location.href='<%=contextPath%>/deleteForm.fol?currentPage=<%= p%>';"><%=p %></button>
            	<%}else { %>
            		<button class="cp" disabled><%=p%></button>
            	<%} %>
            <%}  %>
            <%if(currentPage != maxPage) { %>
            <button onclick="location.href='<%=contextPath%>/deleteForm.fol?currentPage=<%=currentPage+1%>';">&gt;</button>
            <%} %>
        </div>
    <br>
    </div>
    
    </div>
    

    <br>
    
    
    <%@ include file="../common/user/footer.jsp" %>

</body>
</html>