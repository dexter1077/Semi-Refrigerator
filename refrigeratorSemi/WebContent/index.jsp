<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//Jaewon
	String contextPath = request.getContextPath();
	String alertMsg = (String)session.getAttribute("alertMsg"); 
	
	/* Jaewon 어드민 로그인시 해당 페이지에 있을지 어드민 페이지로 넘어갈지 */
	String confirmMsg = (String)session.getAttribute("confirmMsg"); 
	
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--Jaewon 어드민 로그인시 해당 페이지에 있을지 어드민 페이지로 넘어갈지 -->
	<!-- Jaewon 얘지우면 ㅜㅜ어드민 로그인시 창 않뜹니다. 메인페이 옮기실때 얘도 보존해주세요! -->
    <script>
	 	var msg = "<%= confirmMsg %>"; 
	 	
	 	if(msg != "null"){
	 		if(confirm(msg)){// 확인시 어드민 페이지로 넘어감 
				location.href = "<%= request.getContextPath() %>/adList.me?currentPage=1";		
	 		}	 		
			<% session.removeAttribute("confirmMsg"); %>
	 	}
	 </script>
	

	<!--Jaewon -->
	<script>
	 	var msg = "<%= alertMsg %>"; 
	 	if(msg != "null"){
		 	alert(msg);	 
			<% session.removeAttribute("alertMsg"); %>
	 	}
	</script>

	<h1>안녕하세요 테스트입니다.</h1>
	

	<!-- @author daeun -->
	<div><a href="<%=contextPath%>/main">메인</a></div>

	
	
</body>
</html>