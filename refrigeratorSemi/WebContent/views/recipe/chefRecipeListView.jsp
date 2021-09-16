<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- @author leeyeji -->
<%@ page import="java.util.ArrayList, com.refrigerator.recipe.model.vo.Recipe
				 , com.refrigerator.common.model.vo.PageInfo" %>
<%
	ArrayList<Recipe> pageList = (ArrayList<Recipe>)request.getAttribute("pageList");
	Member userInfo = (Member)request.getAttribute("userInfo");	

	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    }
    .user-content {
        width: 950px;
        height: 170px;
        background: rgba(211, 211, 211, 0.13);
        margin: auto;
    }
    .user-img{
        float: left;
        width: 40%;
        height: 90%;
        margin-top: 9px;
    }
    #img-area{
        width: 150px;
        height: 150px;
        border: 1px solid;
        margin: auto;
    }
    .user-information{
        float: left;
        width: 60%;
        height: 90%;
        margin-top: 9px;
    }
    #user-info-area{
        width: 100%;
        height: 70%;
        padding-top: 25px;
    }
    #user-info-area>strong{
        font-size: 20px;
        padding-top: 120px;
    }
    .fol-btn{
        background: rgb(0, 120, 51);
        color: white;
        margin-left: 490px;
    }
    .fol-btn:hover{
        background: white;
        border: 1px solid rgb(0, 120, 51);
        color: rgb(0, 120, 51);
        font-weight: bold;
    }
    .thumb-list-area {
        width: 1000px;
        margin: auto;
        margin: 20px 0 0 30px;
    }
    .thumbnail {
        border: 1px solid white;
        width: 205px;
        display: inline-block;
        margin: 14px;
    }
    .thumbnail:hover {
        cursor: pointer;
        opacity: 0.8;
        /*border: 1px solid rgb(0, 120, 51);*/
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

            <div class="user-content">

                <div class="user-img">
                    <div id="img-area" align="right">
                        <img src="../../resources/img/dog.jpeg" style="width: 150px; height: 150px;">
                    </div>
                </div>

                <div class="user-information">

                    <div id="user-info-area">
                        <strong>마법의 소라고동</strong>
                        <p>먹기위해 삽니다.</p>
                    </div>
                    <div id="follow-area">
                        <button type="submit" class="btn fol-btn" align="right">팔로우</button>
                    </div>

                </div>

            </div>


            <div class="thumb-list-area">

				<%for(Recipe r : pageList) {%>
	                <div class="thumbnail" align="center">
	                    <input type="hidden" value="<%=r.getRecipeNo()%>">
	                    <div id="recipe-img">
	                        <img src="<%=contextPath %>/<%=r.getMainImg() %>" width="200" height="150">
	                    </div>
	
	                    <p style="margin-top: 5px;">
	                        <span id="recipe-title" style="height:50"><b><%=r.getRecipeTitle() %></b></span><br>
	                        별점 : <%=r.getAvrgStarPoint() %>(5.0) &nbsp;|&nbsp; 조회수 : <%=r.getCount() %>
	                    </p>
	
	                </div>
                <%} %>
                
            </div>

        </section>
        <br>
        
        <!-- 페이징 -->
        <div align="center" class="paging-area">
		        
			<% if(currentPage != 1) { %>
				<button onclick="location.href='<%= contextPath%>/userRecipe.recipe?currentPage=<%=currentPage-1%>';"> &lt; </button>
			<% } %>
						
				<% for(int p=startPage; p<=endPage; p++) {%>
			            	
					<% if(p != currentPage){ %>
						<button onclick="location.href='<%= contextPath%>/userRecipe.recipe?currentPage=<%=p%>';"><%= p %></button>
					<% }else{ %>
						<button disabled><%= p %></button>
					<%} %>
			            	
				<% } %>
			
			<% if(currentPage != maxPage) { %>
				<button onclick="location.href='<%= contextPath%>/userRecipe.recipe?currentPage=<%=currentPage+1%>'"> &gt; </button>
			<% } %>
					
		</div>
        <br><br>
    </div>
    <script>

        $(function () {

            $(".thumbnail").click(function () {

                location.href = "<%=contextPath%>/detail.th?bno=" + $(this).children().eq(0).val();
            })

        })

    </script>

</body>
</html>