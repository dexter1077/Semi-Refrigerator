<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="jaewon.s">
<!-- Author : Jaewon  -->

<title>냉뭐? footer</title>
    <style>
        footer{width: 1200px; margin: auto; height: 150px; box-sizing: border-box; padding-top: 22px; clear: both;}
        footer > div{margin-top: 30px;}
        footer a {text-decoration: none; color: black; padding: 2px; letter-spacing: -1.2px; font-weight: 500;}
        footer p{font-size: 10px;}
    </style>
</head>
<body>
    <footer align="center">

        <div>
            <a href="<%= request.getContextPath() %>/tos.tos?page=service">이용약관</a> |
            <a href="<%= request.getContextPath() %>/tos.tos?page=personal">개인정보취급방침</a> |
            <a href="<%= request.getContextPath() %>/enrollForm.inq">문의하기</a> 
            <%-- 1대1문의시에 로그인하지 않은 사람은 로그인페이지로 이동하게 inquiry쪽에 작성  --%>  
        </div>
        <p>Copyright 2021 What's in my refrigerator All rights reserved</p>
    </footer>
</body>
</html>