<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ page import="com.refrigerator.tos.model.vo.Tos"%>  

<%
	Tos t = (Tos)request.getAttribute("tos");
	String tosTitle ="";
	String tosMsg = "";
	if(t == null){
		// 아래에는 준비중이라는 문구가 담겨있는것
		tosTitle = (String)request.getAttribute("tosTitleMsg");
		tosMsg = (String)request.getAttribute("tosMsg");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="jaewon.s">
<!-- Author : Jaewon -->

<title>냉뭐? Terms Of Service Page</title>
<style>
    .outer {width: 900px; margin: auto;}
    .outer > p{width: 900px; font-size: 42px; font-weight: bolder; text-align: center; margin: auto; padding-top: 10px; padding-bottom: 15px; border-bottom: 1px solid black;}
    .outer > pre{width: 850px; margin: auto; padding-bottom: 20px; overflow:auto;  padding-top: 20px; position: relative;
        /* 일단은 한글을 단어 기준 줄바꿈 */
        white-space:pre-line; 
		text-overflow:clip;
		word-break:keep-all;}
</style>
</head>
<body>
	<%@ include file="../../common/user/menubar.jsp" %>
    <div class="outer">
        <p><%if(t != null){%><%= t.getTosTitle() %><%}else{%><%= tosTitle %><%} %></p>
        <pre><%if(t != null){%><%= t.getTosContent() %><%}else{%><%= tosMsg %><%} %></pre>
    </div>
	<%@ include file="../../common/user/footer.jsp" %>

</body>
</html>