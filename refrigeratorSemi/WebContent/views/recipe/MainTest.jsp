<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.refrigerator.common.model.vo.PageInfo, 
				 java.util.ArrayList, 
				 com.refrigerator.recipe.model.vo.Recipe,
				 com.refrigerator.member.model.vo.Member"%>
   
<%
	//String contextPath = request.getContextPath();
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Recipe> list = (ArrayList<Recipe>)request.getAttribute("list");
	int listCount = (int)request.getAttribute("listCount");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<style>
    .outer {
        /*width: 1200px;*/
        margin: auto;
    }
    .thumb-list-sec {
        width: 1000px;
        margin: auto;
        margin-top: 20px
    }
    .search-content {
        width: 950px;
        height: 100px;
        margin: auto;
    }
    .search-info{
        float: left;
        box-sizing: border-box;
        width: 380px;
        height: 100px;
    }
    .search-info>p{margin: 15px 0px 0px 10px;}
    #search-title{
        font-weight: bold; 
        font-size: 17px;
        color: rgb(0, 120, 52);
    }
    #search-num{
        font-size: 23px;
        font-weight: bold;
    }
    .search-btn{
        display: inline-block;
        width: 560px;
        height: 100px;
        padding-top: 30px;
    }
    .search-btn>a{
        border: 1px solid darkgray;
        font-weight: bold;
    }
    .search-btn>a:hover{
        color: white;
        background: rgb(0, 120, 52, 0.7);
    }
    .thumb-list-area {
        width: 1000px;
        margin: auto;
        margin: 30px 0 0 30px;
    }
    .thumbnail {
        border: 1px solid white;
        width: 205px;
        display: inline-block;
        margin: 14px;
    }
    .thumbnail:hover {
        cursor: pointer;
        opacity: 0.7;
        /*border: 1px solid rgb(0, 120, 51);*/
        /*background: rgba(0, 120, 52, 0.1);*/
    }
    #recipe-img img{
        box-sizing: border-box;
        border-radius: 20px;
    }
    #recipe-title{
    	height: 50px;
    	display: inline-block;
    	overflow: hidden; 
    	text-overflow: ellipsis;
    }
</style>

<body>

    <div class="outer">
    
    <%@include file="../common/user/menubar.jsp" %>

        <section class="thumb-list-sec">

            <div class="search-content">

                <div class="search-info">
                    <p>"<span id="search-title">조회수 높은 레시피</span>"에 대한 검색결과</p>
                    <p>
                        총 
                        <span id="search-num"><%=listCount %></span>
                        개의 맛있는 레시피가 있습니다.
                    </p>
                </div>

                <div class="search-btn" align="right">
                   <a href="<%=contextPath %>/latestList.recipe?currentPage=1" class="btn enroll-btn">최신순</a>
                   <a href="<%=contextPath %>/starRtng.recipe?currentPage=1" class="btn star-btn">별점순</a>
                   <a href="<%=contextPath %>/recipeView.main?currentPage=1" class="btn count-btn">조회순</a>
                </div>

            </div>


            <div class="thumb-list-area">

                <% if(list.isEmpty()){ %>
            		<tr>
            			<td colspan="6">조회된 리스트가 없습니다..</td>
            		</tr>
            	<% }else { %>
            		<% for(Recipe rc : list){ %>
            			<div class="thumbnail" align="center">
                            <!-- input value에 각 레시피 번호-->
                            <input type="hidden" value="<%= rc.getRecipeNo()%>">
                            <div id="recipe-img">
                                <img src="<%= rc.getMainImg()%>" width="200" height="150">
                            </div>
        
                            <p style="margin-top: 5px;">
                                <span id="recipe-title" style="height:50"><b><%=rc.getRecipeTitle() %></b></span><br>
                                <span style="font-size:14px">별점 : 3.5(5.0) &nbsp;|&nbsp; 조회수 : <%= rc.getCount()%></span> 
                            </p>
        
                        </div>
            		<% }%>
            	<% }%>

            </div>

        </section>
    </div>
    <script>

        $(function () {

            $(".thumbnail").click(function () {

                location.href = "<%=contextPath%>/detail.recipe?rno=" + $(this).children().eq(0).val();
            })

        })

    </script>

    <br><br>

    <div align="center" class="paging-area">
        
        
        <% if(currentPage != 1){ %>
            <button onclick="location.href='<%=contextPath%>/recipeView.main?currentPage=<%= currentPage-1 %>'"> &lt;</button>
        <% } %>
        
        <% for(int p=startPage; p<=endPage; p++){ %>
            
            <% if(p != currentPage){ %>
                <!-- 클릭했을 때의 페이지 번호 p값을 넘겨주기 == 버튼 클릭시 url요청하기 ? 몇번 페이지 요청하는지 페이지 정보도 넘겨주기 -->
                <button onclick="location.href='<%=contextPath%>/recipeView.main?currentPage=<%= p %>';"><%= p %></button>
            <% }else { %>	
                <!-- 현재페이지와 같다면 클릭이 불가능하게 만들기 -->
                <button disabled><%= p %></button>
            <% } %>
            
        <% } %>
        <!-- 제일 마지막 페이지를 보고있다면? 다음으로 가는 버튼 보여지지 않게, 마지막페이지 아닐 때만 보여지게 조건처리하기! -->
        <% if(currentPage != maxPage){ %>
                                                                    <!-- 현재 보고있는 페이지 +1 넘기기 -->
            <button onclick="location.href='<%=contextPath%>/recipeView.main?currentPage=<%=currentPage+1%>';"> &gt; </button>
        <% } %>

    </div>

</body>

</html>