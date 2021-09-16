<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	String errorTitleMsg = (String)request.getAttribute("errorTitleMsg");
	String errorMsg = (String)request.getAttribute("errorMsg"); 
%>   
<%-- errorMsg는 innerHTML개념으로 들어가겠끔 설정 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="jaewon.s">
<!-- Author : Jaewon  -->

<title>냉뭐? Error Page</title>
    <style>
        #logo-area{width: 800px; height: 180px; margin: auto; text-align: center;}
        #logo-area > img{width: 180px; padding-top: 25px;}
        #err-info-area{width: 800px; height: 350px; margin: auto;}
        #err-info-area > table{width: 100%; height: 100%;}
        #err-info-area th{font-size: 42px; text-align: left; padding-left: 2px;}
        tr:nth-child(2){font-size: 17px; border-bottom: 2px solid darkgray;}
        tr:nth-child(2) > td{line-height: 25px; padding-top: 22px; padding-bottom: 12px;}
        button{width: 190px; height: 60px; border: none; border-radius: 3px; color: white; font-size: 21px; font-weight: bolder; line-height: 22px; margin-left: 105px; cursor: pointer; background-color: rgb(46,204,113);}
        button:hover{transform: scale(1.05); border: 1px solid orange;}
    </style>
</head>
<body>
    <div id="logo-area"><img src="<%= request.getContextPath() %>/resources/image/logo.png"></div>
    <div id="err-info-area">
        <table align="center">
            <tr>
                <td rowspan="3" width=220><img src="<%= request.getContextPath() %>/resources/image/exclamationmark.png" width="215"><br><br><br><br><br><br> </td>
                <th height=70><%= errorTitleMsg %></th>
            </tr>
            <tr> 
                <td height=100><%= errorMsg %></td>
            </tr>
            <tr>
                <td><button onclick="history.back()">이전 페이지로</button></td> 
            </tr>
        </table>
    </div>

</body>
</html>