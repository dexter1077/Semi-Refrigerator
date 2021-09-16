<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- @author leeyeji -->
<%
	//String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
    .sideNav{float:left;}
    #userSideNav-area{
        border: 1px solid lightgray;
        width: 200px;
        height: 150px;
        text-align: center;
        margin-top: 50px;
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
</style>
</head>
<body>

	 <div class="outer">

        <table id="userSideNav-area" align="left" border="1px">

            <tr>
                <th><a href="<%=request.getContextPath()%>/list.no?currentPage=1">공지사항</a></th>
            </tr>
            <tr>
                <th><a href="<%=request.getContextPath()%>/list.faq?currentPage=1">FAQ</a></th>
            </tr>
            <tr>
                <th><a href="<%=request.getContextPath()%>/list.inq?currentPage=1">1:1문의</a></th>
            </tr>

        </table>

    </div>

</body>
</html>