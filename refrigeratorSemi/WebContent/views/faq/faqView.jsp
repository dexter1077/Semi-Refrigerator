<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.refrigerator.faq.model.vo.Faq,
				 com.refrigerator.common.model.vo.PageInfo" %>
<!-- @author leeyeji -->
<%
	ArrayList<Faq> pageList = (ArrayList<Faq>)request.getAttribute("pageList");
	
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
<style>
    .outer{
        background: white;
        color: black;
        width: 1200px;
        margin: auto;
        margin-top: 50px;
    }
    .FAQ-list-area>thead>tr{
        border-bottom: 2px solid rgb(0, 120, 51);
        border-top: 2px solid rgb(0, 120, 51);
        font-weight: bold;
        text-align: center;
        height: 50px;
    }
    .FAQ-list-area>tbody>.FAQ-question:hover{
        color: rgb(0, 120, 51);
        font-weight: bold;
        cursor: pointer;
    }
    .FAQ-list-area>tbody>tr{
        height: 45px;
        text-align: center;
        border-bottom: 1px solid darkgray;
    }
    .FAQ-answer{
        background: rgba(0, 120, 51, 0.1);
        font-weight: bold;
        display: none;
    }
    #btn-noticeWrite{
        background: rgb(0, 120, 51);
        color: white;
    }
    #btn-noticeWrite:hover{
        background: white;
        color: rgb(0, 120, 51);
        border: 1px solid rgb(0, 120, 51);
        font-weight: bold;
        cursor: pointer;
    }
</style>
</head>
<body>

	<%@ include file="../common/user/menubar.jsp" %>

	<div class="outer">

        <br>
        <h2 align="center" style="font-weight:bold;">FAQ</h2>
        <br>

        <%@ include file="../common/user/userSideBar.jsp" %>

		<% if(loginUser != null && loginUser.getUserId().equals("admin")){ %>
		    <div align="right" style="width: 1050px;">
		        <a href="" class="btn btn-sm" id="btn-noticeWrite">글작성</a>
		        <br><br>
		    </div>
		<%} %>

        <!-- 게시판 틀-->
        <div id="FAQ-list">
            <table class="FAQ-list-area" align="center">

                <thead>
                    <tr id="headline">
                        <th width="70">글번호</th>
                        <th width="450">글제목</th>
                        <th width="120">작성자</th>
                        <th width="150">작성일</th>
                    </tr>
                </thead>
                <tbody>
                    <%if(pageList.isEmpty()) {%>
                    	<tr>
	                		<td colspan="5"> 존재하는 FAQ가 없습니다.</td>
	                	</tr>
                    <%} else{%>
                    	<%for(Faq f : pageList) { %>
	                        <tr class="FAQ-question">
	                            <td><%=f.getFaqNo()%></td>
	                            <td><%=f.getQuesContent() %></td>
	                            <td>관리자</td>
	                            <td><%=f.getModifyDate() %></td>
	                        </tr>
	                        <tr class="FAQ-answer">
	                            <td colspan="5" align="left" style="padding: 20px;" width="700px">
	                            	<%=f.getAnswerContent() %>
	                            </td>
	                        </tr>
                        <%} %>
                    <%} %>
                </tbody>
            </table>
        </div>
    </div>

    <script>
        
    	$(function(){
    		$(".FAQ-question").click(function(){

                var $answer = $(this).next()

                if($answer.css("display") == ("none")){
                    $(this).siblings(".FAQ-answer").hide();
                    $answer.show();
                    
                    $(this).css("color", "black");
                }else{
                    $answer.hide();
                    $(this).css("background", "white");
                    $(this).css("color","black");
                }

    		})
    		
    	})
        
    </script>
    <br>
    <!-- 페이징 -->
    <div align="center" class="paging-area">
        
		<% if(currentPage != 1) { %>
			<button onclick="location.href='<%= contextPath%>/list.faq?currentPage=<%=currentPage-1%>';"> &lt; </button>
		<% } %>
				
		<% for(int p=startPage; p<=endPage; p++) {%>
	            	
			<% if(p != currentPage){ %>
				<button onclick="location.href='<%= contextPath%>/list.faq?currentPage=<%=p%>';"><%= p %></button>
			<% }else{ %>
				<button disabled><%= p %></button>
			<%} %>
	            	
		<% } %>
	
		<% if(currentPage != maxPage) { %>
			<button onclick="location.href='<%= contextPath%>/list.faq?currentPage=<%=currentPage+1%>'"> &gt; </button>
		<% } %>
			
	</div>
	<br><br>
    

</body>
</html>