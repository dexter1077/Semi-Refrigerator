<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Jaewon.s -->    
<%
	String alertMsg = (String)session.getAttribute("alertMsg"); 
%>    
    
<!-- @author leeyeji -->
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
    .top-nav {
        background-color: white;
        width: 1200px;
        height: 50px;
        margin: auto;
        display: block;
    }
    .logo{
        float: left;
        height: 50px;
    }
    .logo img{
        width: 50px;
        height: 50px;
        object-fit: cover;
        background: black;
    }
    .home-btn{
        float: left;
    }
    .home-btn a {
        display: block;
        color: rgb(0, 120, 51);
        font-weight: bold;
        text-align: center;
        text-decoration: none;
        line-height: 50px;
        font-size: 20px;
        margin-left: 5px;
    }
    .home-btn a:hover {
        color: black;
        font-weight: bold;
    }
    .top-nav .search-container {
        float: right;
        margin-top: 10px;
        text-align: center;
    }
    .top-nav input {
        border: 1px solid darkgray;
    }
    .top-nav .search-container button {
        color: white;
        background: rgb(0, 120, 51);
        border: none;
        cursor: pointer;
    }
    .top-nav .search-container button:hover {
        background: white;
        border: 1px solid rgb(0, 120, 51);
    }
    .admin-check{
        float: right;
        width: 100px;
        height: 50px;
        text-align: center;
        line-height: 50px;
        margin-left: 20px;
    }
    .admin-check #admin-name{
        color: rgb(0, 120, 51);
        font-weight: bold;
    }
</style>
</head>
<body>

	<div class="top-nav">

        <div class="logo" a> 
            <img src="<%=request.getContextPath() %>/resources/image/logo_pic.png" width="" align="left">
        </div>

        <div class="home-btn">
            <a class="nav-home" href="">Home</a>
        </div>

        <div class="admin-check">
            <span id="admin-name">관리자</span> &nbsp;님
        </div>

        <div class="search-container">
            <form action="">
                <input type="text" placeholder="검색" name="">
                <button type="submit" class="btn btn-sm">조회</button>
            </form>
        </div>

    </div>
    
    <!-- Jaewon.s -->
	<script>
	 	var msg = "<%= alertMsg %>"; 
	 	if(msg != "null"){
		 	alert(msg);	 
			<% session.removeAttribute("alertMsg"); %>
	 	}
	</script>

</body>
</html>