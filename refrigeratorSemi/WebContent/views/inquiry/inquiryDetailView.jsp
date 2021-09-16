<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.refrigerator.inquiry.model.vo.Inquiry" %>
<!-- @author leeyeji -->
<%
	Inquiry i = (Inquiry)request.getAttribute("i");
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
        color: black;
        width: 1200px;
        margin: auto;
        margin-top: 50px;
    }
    .detail-area{
        width: 1000px;
        border: 1px solid white;
        border-top: 2px solid rgb(0, 120, 51);
        border-bottom: 2px solid rgb(0, 120, 51);
    }
    .detail-area tr{
        border-bottom: 1px solid rgba(211, 211, 211, 0.5); 
    }
    .inqry-detail table th{
        text-align: center;
        background: rgba(0, 120, 52, 0.2);
    }
    #answer-title> th{
        background: white;
        border-top: 1px solid darkgray;
        text-align: left;
        padding-left: 20px;
        font-size: 17px;
    }
    #answer-area> td, #non-answer> td{
    	font-weight: bold;
        background: white;
        border-top: 1px solid white;
        text-align: left;
        padding: 10px 0px 10px 20px;
        font-size: 17px;

    }
    #btn-list{
        width: 1100px;
    }
    #pageBtn-area{
        width: 1000px;
        margin: auto;
        border: 1px solid white;
        border-top: 1px solid lightgray;
        border-bottom: 1px solid lightgray;
    }
    #pageBtn-area th {
        background: white;
        width: 100px;
        height: 30px;
        border-right: 1px dashed lightgray;
    }
    #pageBtn-area td {
        background: white;
        border-bottom: 1px dashed lightgray;
        padding-left: 20px;
    }
    #pageBtn-area a{
        color: black;
    }
    #pageBtn-area a:hover{
        text-decoration: none;
        font-weight: bold;
        color: rgb(0, 120, 51);
    }
    
</style>
</head>
<body>

	<%@ include file="../common/user/menubar.jsp" %>

    <div class="outer">
        <br><h2 align="center">1:1문의 조회</h2><br>

        <div class="inqry-detail">
            <table class="detail-area" align="center" border="1px">
                
                <tr>
                    <th width="100" height="50" >제목</th>
                    <td colspan="2"><%=i.getInqryTitle() %></td>
                </tr>
                <tr>
                    <th width="100" height="50">작성일</th>
                    <td><%=i.getModifyDate() %></td>
                </tr>
                <tr>
                    <th height="50">작성자</th>
                    <td><%=i.getInqryWriter() %></td>
                </tr>
                <tr id="ques-area">
                    <td colspan="3">
                        <p style="height: 500px; padding-left: 20px;"><br>
							<%=i.getInqryContent() %>
						</p>
                    </td>
                </tr>
                
                <tr id="answer-title">
                    <th height="50" colspan="2">문의 답변</th>
                </tr>
                <%if(i.getInqryAnswer() == null) {%>
                	<tr id="non-answer">
                		<td height="50" colspan="2">문의 답변이 등록되지 않았습니다.</td>
                	</tr>
                <%} else{ %>
	                <tr id="answer-area">
	                    <td height="50" colspan="2"><%=i.getInqryAnswer() %></td>
	                </tr>
				<% } %>
				
            </table>
        </div>
        <br>

        <!-- 목록 버튼-->
        <div align="right" id="btn-list">
            <a href="<%=contextPath %>/list.inq?currentPage=1" class="btn btn-secondary btn-sm">목록</a>
        </div>

		<br>
		
		
    </div>

</body>
</html>