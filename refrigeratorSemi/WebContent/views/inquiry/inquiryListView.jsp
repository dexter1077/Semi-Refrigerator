<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.refrigerator.inquiry.model.vo.Inquiry,
				 com.refrigerator.common.model.vo.PageInfo" %>
<!-- @author leeyeji -->
<%
	ArrayList<Inquiry> pageList = (ArrayList<Inquiry>)request.getAttribute("pageList");
	
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
    #userSideNav-area{
        border: 1px solid lightgray;
        width: 200px;
        height: 100px;
        text-align: center;
        margin-top: 50px;
        margin-left: 20px;
    }
    #userSideNav-area a{
        display: block;
        height: 100%;
        line-height: 75px;
        color: black;
        font-size: 20px;
    }
    #userSideNav-area a:hover{
        text-decoration: none;
        background: rgba(211, 211, 211, 0.5);
        color: rgb(0, 120, 51);
    }
    .inquiry-list-area>thead>tr{
        border-bottom: 2px solid rgb(0, 120, 51);
        border-top: 2px solid rgb(0, 120, 51);
        font-weight: bold;
        text-align: center;
        height: 50px;
    }
    .inquiry-list-area>tbody>tr:hover{
        color: rgb(0, 120, 51);
        font-weight: bold;
        cursor: pointer;
    }
    .inquiry-list-area>tbody>tr{
        height: 45px;
        text-align: center;
        border-bottom: 1px solid darkgray;
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
        <h2 align="center" style="font-weight:bold;">1:1문의</h2>
        <br>

        <div class="user-side-nav">
            <%@ include file="../common/user/userSideBar.jsp" %>
        </div>
		
		<%if(loginUser != null) {%>
		    <div align="right" style="width: 1050px;">
		        <a href="<%=contextPath %>/enrollForm.inq" class="btn btn-sm" id="btn-noticeWrite">글작성</a>
		        <br><br>
		    </div>
		<%} %>
        <!-- 게시판 틀-->

        <div class="contact-list">
            <table class="inquiry-list-area" align="center">

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
	                		<td colspan="4"> 존재하는 FAQ가 없습니다.</td>
	                	</tr>
                    <%} else{%>
                    	<%for(Inquiry i : pageList) { %>
	                        <tr>
                                <td><%= i.getInqryNo() %></td>
                                <td><%= i.getInqryTitle() %></td>
                                <td><%= i.getInqryWriter() %></td>
                                <td><%= i.getModifyDate() %></td>
                            </tr>
                        <%} %>
                    <%} %>
                </tbody>
            </table>
        </div>
        <script>
        	$(function(){
        		$(".inquiry-list-area>tbody>tr").click(function(){
        			var ino = $(this).children().eq(0).text();
        			//console.log(nno);
        			location.href = '<%=contextPath%>/detail.inq?ino=' + ino;
        		})
        	})
        </script>
        <br>
	    <!-- 페이징 -->
	    <div align="center" class="paging-area">
	        
			<% if(currentPage != 1) { %>
				<button onclick="location.href='<%= contextPath%>/list.inq?currentPage=<%=currentPage-1%>';"> &lt; </button>
			<% } %>
					
			<% for(int p=startPage; p<=endPage; p++) {%>
		            	
				<% if(p != currentPage){ %>
					<button onclick="location.href='<%= contextPath%>/list.inq?currentPage=<%=p%>';"><%= p %></button>
				<% }else{ %>
					<button disabled><%= p %></button>
				<%} %>
		            	
			<% } %>
		
			<% if(currentPage != maxPage) { %>
				<button onclick="location.href='<%= contextPath%>/list.inq?currentPage=<%=currentPage+1%>'"> &gt; </button>
			<% } %>
				
		</div>
		<br><br>
    </div>
</body>
</html>