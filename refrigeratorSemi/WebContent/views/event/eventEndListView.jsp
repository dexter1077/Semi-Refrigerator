<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.refrigerator.event.model.vo.AdmEvent,com.refrigerator.common.model.vo.PageInfo "%>
    
<%


ArrayList<AdmEvent>list = (ArrayList<AdmEvent>)request.getAttribute("list");

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
<title>이벤트 페이지</title>

 <style>

    .outer{

        margin:auto;
        margin-top:50px;
        width: 1200px;

    }

    .event-img{
        display: inline-table;
        margin: 30px;
    }

    .select-event{  
        text-decoration: none;
        color: black;
    }

    .event-info>label{
        display: block;
    }

    .event-img:hover{
        cursor: pointer;
        opacity: 0.7;
    }
    </style>

</head>


<body>


    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<%@include file="../common/user/menubar.jsp" %>

    <div class="outer" style="border: 1px solid black;">

        <br><br><br><br>

        <div class="select-event" style="width: 500px;" align="right">
           <a href="<%=contextPath%>/list.event?currentPage=1" style="color:rgba(190, 190, 190, 0.5);" >진행중인 이벤트</a> &nbsp; &nbsp; &nbsp; | &nbsp; &nbsp; &nbsp; 
            <a href="<%=contextPath%>/endlist.event?currentPage=1" style="color:rgb(0, 153, 102);" >종료된 이벤트</a>
        </div>


        
        <div class="event-img-list"  align="center">

            <hr width="800px">
            
            <%for(AdmEvent adm : list) { %>
	            <div class="event-img">
	                <img src="<%=adm.getEventImg()%>" alt="" width="330px" height="550px">
	
	                <br><br>

					
					 <div class="event-info" align="left">
	                    <label>
	                        <h3><%=adm.getEventCategory()%></h3>
	                    </label>
	
	                    <ladel><%=adm.getEventTitle()%></ladel>
	                    
	                    <label style="color: rgba(190, 190, 190, 0.5);">
	                        <%=adm.getStartDate() %> ~ <%=adm.getEndDate() %>
	                    </label>
	                 </div>

	            </div>
            <%} %>

        </div>
        
        
        <!--페이징바   -->

         <div class="paging-area" align="center">

            <% if(currentPage != 1) { %>
            <button onclick="location.href='<%=contextPath%>/endlist.event?currentPage=<%=currentPage-1%>';">&lt;</button>
            <% } %>
            
            <% for(int p=startPage; p<=endPage;p++) {%>
        
                <% if(p != currentPage) {%>
                <button onclick="location.href='<%=contextPath%>/endlist.event?currentPage=<%=p%>';"><%=p%></button>
                <%} else { %>
                <button disabled><%= p %></button>
                <%} %>
            
            <%} %>
            
            <%if(currentPage != maxPage) {%>
            <button onclick="location.href='<%=contextPath%>/endlist.event?currentPage=<%=currentPage+1%>';">&gt;</button>
            <%} %>
            
            
        </div>
	
		<br><br><br><br><br><br><br><br><br><br><br><br>
       


       

 





    </div>







</body>
</html>