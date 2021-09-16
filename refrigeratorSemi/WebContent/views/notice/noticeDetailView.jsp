<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- @author yeji -->

<%@ page import="com.refrigerator.notice.model.vo.Notice" %>
<%
	Notice n = (Notice)request.getAttribute("n");
	// 작성자 아이디, 글제목, 글내용, 등록일, 수정일, 조회수
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
    #detail-area{
        width: 1000px;
        border: 1px solid white;
        border-top: 2px solid rgb(0, 120, 51);
        border-bottom: 2px solid rgb(0, 120, 51);
    }
    #detail-area tr{
        border-bottom: 1px solid rgba(211, 211, 211, 0.5); 
    }
    .outer table th{
        text-align: center;
        background: rgba(0, 120, 52, 0.2);
    }
    #btn{
        background: rgb(0, 120, 51);
        
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
    }
</style>
</head>
<body>

	<%@ include file="../common/user/menubar.jsp" %>

	<div class="outer">
        <br><h2 align="center">공지사항 조회</h2><br>

        <div class="notice-detail">
            <table id="detail-area" align="center" border="1px">
                
                <tr>
                    <th width="100" height="50" >제목</th>
                    <td width="80" colspan="3"><%=n.getNoticeTitle() %></td>
                </tr>
                <tr>
                    <th width="100" height="50">작성일</th>
                    <td width="170"><%=n.getModifyDate() %></td>
                    <th width="100">조회수</th>
                    <td><%=n.getCount() %></td>
                </tr>
                <tr>
                    <th height="50">작성자</th>
                    <td><%=n.getUserNo() %></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="3">
                        <p style="height: 500px;"><br><%=n.getNoticeContent() %></p>
                    </td>
                </tr>
            </table>
            <br>
        </div>

        <div align="right" style="width: 1100px;">
            <a href="<%=contextPath%>/list.no?currentPage=1" class="btn btn-secondary btn-sm">목록</a>
        </div>

        <br>

        <div class="pageBtn">

            <table id="pageBtn-area" >
                <tr>
                    <th>이전글</th>
                    <td><a href="">이전글</a></td>
                </tr>
                <tr>
                    <th>다음글</th>
                    <td><a href="">다음글</a></td>
                </tr>
            </table>

        </div>

        <br><br>

    </div>

</body>
</html>