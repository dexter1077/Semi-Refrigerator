<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.refrigerator.report.model.vo.Report
				 , com.refrigerator.common.model.vo.PageInfo" %>
				 
<!-- @author leeyeji -->

<%
	//String contextPath = request.getContextPath();
	ArrayList<Report> pageList = (ArrayList<Report>)request.getAttribute("pageList");
	
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
    .total-outer{
        color: black;
        width: 1200px;
        margin: auto;
    }
    .select-list>a{
        text-decoration: none;
        color: black;
    }
    .select-list a:hover{
        color: rgb(0, 120, 51); 
        font-weight: bold;
    }
    .search-container button{
        background-color: rgb(0, 120, 51);
        color: white;
    }
    .delete-area{margin-left: 90px;}
    .report-btn a{
        background: rgb(0, 120, 51);
    }
    .checked-reportList>tr:hover{
        cursor: pointer;
        background-color: rgb(248, 248, 248);
        opacity: 0.7;
    }
    .thead{
        background-color: rgb(224, 224, 224);
    }
    .modal-body-list div{
        width: 200px;
        height: 30px;
        color: rgb(0, 120, 51);
        font-weight: bold;
        border-radius: 5px;
        text-align: center;
        margin: 10px;  
        font-size: 15px;
        line-height: 30px;
    }
    .modal-header, .modal-content, .modal-footer{border: 0px;}
</style>
</head>
<body>
    
    <div class="total-outer">
    
    <%@ include file="../common/admin/adminTopNavView.jsp" %>
    
    <div class="report-content">
    
    	<%@ include file="../common/admin/adminSideBarView.jsp" %>

	        <div class="select-list"  align="right" style="width: 300px;" >
	            <a href="">회원 관리</a> >
	            <a href="">신고</a>
	        </div>
	        <br>
	
	        <div class="search-container" align="right" style="width:1100px">
	
	            <form action="" >
	                <span id="" >회원 검색</span>
	                <input type="text" placeholder="아이디" name="">
	                <button type="submit" class="btn btn-sm">조회</button>
	            </form>
	
	        </div>
	
	        <br><br>
	
			<!-- 회원 탈퇴 처리 모달 -->
	        <form action="<%=contextPath%>/adDelete.repo" method="GET">
	
	            <div class="btn" align="right" style="width: 270px;">
	
	                <div class="delete-area" align="left" width="1000px">
	                    <!-- <a class="btn btn-sm btn-danger" data-toggle="modal" data-target="#report-delete-Modal">관리</a> -->
	                </div>
	
	                     <!-- The Modal -->
	                    <div class="modal" id="report-delete-Modal">
	                    <div class="modal-dialog modal-dialog-centered">
	                    <div class="modal-content">
	                
	                		<!-- Modal Header -->
	                        <div class="modal-header">
	                        	<input type="hidden" name="userNo" id="userNo-delete">
	                        	<button type="button" class="close" data-dismiss="modal">&times;</button>
	                        </div>
	                		
	                        <!-- Modal body -->
	                        <div class="modal-body">
	                        	<Strong id="userId">user10</Strong> 회원을 <b style="color:rgb(0, 120, 51);">탈퇴 처리</b> 하시겠습니까?
	                        </div>
	                
	                        <!-- Modal footer -->
	                        <div class="modal-footer"align="center">
	                            <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">취소</button>
	                            <button type="submit" class="btn btn-danger btn-sm">확인</button>
	                        </div>
	                
	                    </div>
	                    </div>
	                    </div>
	
	            </div>
	            <br>
	
	            <div class="report-list">
	
	                <table border="1" align="center">
	
	                    <thead class="thead">
	                        <tr align="center">
	                            <th width="50">번호</th> 
	                            <th colspan="2" width="250">신고시간</th>
	                            <th width="350">신고내용</th>
	                            <th width="130">아이디</th>
	                            <th width="100">신고유형</th> 
	                           	<th width="50"></th>
	                        </tr>
	
	                    </thead>
	                
	                    <tbody class="checked-reportList">
	                    	<%for(Report r : pageList) {%>
		                        <tr align="center">
		                        	<input type="hidden" value="<%= r.getUserNo() %>">
		                            <td><%=r.getReportNo() %></td>
		                            <td colspan="2"><%=r.getReportDate() %></td>
		                            <td><%=r.getReportContent() %></td>
		                            <td><%=r.getUserId() %></td>
		                            <%if(r.getReportType() == 1) {%>
			                            <td>댓글</td>
			                        <%}else{ %>
			                        	<td>레시피</td>
			                        <%} %>
		                            <td><a class="btn btn-sm btn-danger" data-toggle="modal" data-target="#report-delete-Modal"  onclick="deleteMember();">관리</a></td>
		                        </tr>
							<%} %>
	
	                    </tbody>
	
	                </table>
	
	            </div>
	
	        </form>
			
			<script>
					
				function deleteMember(){
					$("#userNo-delete").val($(event.target).parent().siblings("input[type=hidden]").val());
				}
	                   		
			</script>
	        
	        <br>
	        <!-- 페이징바 영역 -->
			<div align="center" class="paging-area">
		        
			<% if(currentPage != 1) { %>
				<button onclick="location.href='<%= contextPath%>/adList.repo?currentPage=<%=currentPage-1%>';"> &lt; </button>
			<% } %>
						
				<% for(int p=startPage; p<=endPage; p++) {%>
			            	
					<% if(p != currentPage){ %>
						<button onclick="location.href='<%= contextPath%>/adList.repo?currentPage=<%=p%>';"><%= p %></button>
					<% }else{ %>
						<button disabled><%= p %></button>
					<%} %>
			            	
				<% } %>
			
			<% if(currentPage != maxPage) { %>
				<button onclick="location.href='<%= contextPath%>/adList.repo?currentPage=<%=currentPage+1%>'"> &gt; </button>
			<% } %>
					
			</div>
			
		
		</div>
		<!-- content -->
        
    </div>
    <!-- total outer -->
    
</body>
</html>