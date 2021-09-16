<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.refrigerator.common.model.vo.PageInfo, java.util.ArrayList , com.refrigerator.tos.model.vo.Tos"%>    
<%-- paging 처리와 값을 뽑아올 공간 --%>    

<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Tos> list = (ArrayList<Tos>)request.getAttribute("list");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>        
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="jaewon.s">
<!-- Author : Jaewon -->

<title>관리자 이용약관 조회페이지</title>
<%-- font-awesome CND --%>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
<style>
    #for-height{height: 720px;} 
    div{box-sizing: border-box;}
    .wrap{margin: auto; width: 1200px; height: 750px;}
    .outer{width: 1000px; height: 700px; float: right; margin-right: 25px;}

/*-------------------------페이징바 영역 ----------------------------------------------------------------------*/
    .paging-area{
    text-align: center;
    }

	.paging-area button{
		width:40px;
		height:40px;
        margin: 5px;	
		margin-top: 30px ;
		justify-content: center;
		border-radius: 5px;
    	background-color: rgb(244,244,244);
		color: rgb(127,127,127);
    	font-size:16px;
    	font-weight: bold;		
	}    
    
    #dis-btn{
    	background-color: rgb(52,152,219);
    	color:white;
    }
/* ----------------------------------------------------------------------------------------------------------- */
    .top-box a{
        color: gray;
    }

    .top-box{
    padding: 20px;
    margin-bottom: 25px;
    }

    .outer-body h2{
        padding-left: 20px;
        font-size: 36px;
        margin-bottom: 40px;
    }

    .outer-body button{
        float: right;
        margin-right: 10px;
        margin-bottom: 15px;
        background-color: rgb(22,160,133) ;
        border-radius: 5px;
        border: none;
        color: white;
        width: 120px;
    }

    .outer-body table{
        width: 99%;
        height: 385px;
        text-align: center;
    }

    .outer-body tbody tr{
        height: 35px;
    }

    .outer-body thead>tr{
        background-color:rgb(234,234,234) ;        
        height: 42px;
    }

    .outer-body table tbody .exist-row:hover{
        background-color: rgba(186,238,208,0.2);
        color:tomato;
        border:1px solid orange;
    }
    
/* ------------------------------------------------------------------------------------------------------------ */
    </style>
</head>
<body>
    <%@ include file="../common/admin/adminTopNavView.jsp" %>
    <div class="wrap">
	<%@ include file="../common/admin/adminSideBarView.jsp" %>
        <div id="content">     
        	<%-- include된곳에서 이미 css를 지정하여 inline스타일로 우선순위를 높임 --%>
            <div class="outer" style="float:right;">
                <div class="top-box">
                    <span>홈</span> >
                    <%-- ANCHOR태그 안달아도 된다 --%>
                    <span>싸이트관리</span> >
                    <span><b>이용약관관리</b></span>
                </div>
                <div class="outer-body">
                    <h2><b>이용약관 관리</b></h2>
                    <span style="color:red;">※ 해당 이용약관 클릭시 이용약관 수정 삭제페이지로 이동합니다.</span>
                    <%-- 전제 조건이 어드민 페이지는 로그인이 되어있어야지만 들어올수가 있어서 따로 등록버튼은 안보이게 할필요가 없다!!!  --%>
                    <%-- 등록페이지로 이동하는 메소드를 설정 --%>
                    <button type="button" onclick="moveEnroll();">이용약관 등록</button>
                    <br style="clear: both;">
                    <table border="1" style="border: rgb(204,204,204);">
                        <thead>
                            <tr>
                                <th width="60">상태</th>
                                <th>이용약관명</th>
                                <th width="150">사용될 페이지 영역</th>
                                <th width="110">게시등록일</th>
                                <th width="110">수정일자</th>
                                <th width="110">작성자</th>
                                <th width="120">비고</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%-- db에서 이용약관 관련하여 값을 가져와 동적으로 뿌려줌  --%>
    	                   	<%if(list.isEmpty()){ %>
			            		<tr>
			            			<td colspan="7">조회된 리스트가 없습니다. </td>
			            		</tr>
			            	<% } else {%> 
			            		<% if(list.size() <=10){ %>
					                <% for(Tos t : list){ %>
						                <tr class="exist-row" style="cursor: pointer;">
						                	<input type="hidden" value="<%= t.getTosNo() %>">
						                    <td><%= t.getTosCategory() %></td>
						                    <td><%= t.getTosTitle() %></td>
						                    
						                    <!-- 나중에 시간 남으면 switch문으로 처리해줘 -->
						                    <td><%= t.getTosPage() %></td>
						                    <td><% if(t.getUploadDate() !=null){%>
						                    		<%= t.getUploadDate() %>
						                    	<% }else{ %>
						                    		게시전
						                    	<% } %>
						                    </td>						                    
						                    <td><%= t.getModifyDate() %></td>
						                    <td>보람있조</td>
                						    <td><% if(t.getTosNote() !=null){%>
						                    		<%= t.getTosNote() %>
						                    	<% }else{ %>
						                    	<% } %>
						                    </td>
						                </tr>
					                <% } %>	
					                <%-- 최대행은 10중이나 혹여나 비어있다면 빈 이용약관이 들어갈수있게 해주는 장치  --%>
					                <% for(int i=0; i<(pi.getBoardLimit()-list.size()); i++){ %>
					                	<tr >
					                		<td></td>
					                		<td></td>
					                		<td></td>
					                		<td></td>
					                		<td></td>
					                		<td></td>
					                		<td></td>					                		
					                	</tr>
					                <% } %>
					                		            		
			            		<% }else{ %>
					                <% for(Tos t : list){ %>
						                <tr class="exist-row" style="cursor: pointer;">
   						                	<input type="hidden" value="<%= t.getTosNo() %>">				                
						                    <td><%= t.getTosCategory() %></td>
						                    <td><%= t.getTosTitle() %></td>
						                    <td><%= t.getTosPage() %></td>
						                    <td><% if(t.getUploadDate() !=null){%>
						                    		<%= t.getUploadDate() %>
						                    	<% }else{ %>
						                    		게시전
						                    	<% } %>
						                    </td>		
						                    <td><%= t.getModifyDate() %></td>
						                    <td>보람있조</td>
                						    <td><% if(t.getTosNote() !=null){%>
						                    		<%= t.getTosNote() %>
						                    	<% }else{ %>
						                    	<% } %>
						                    </td>
						                </tr>
					                <% } %>			            				            		
			            		<% }%>
				            <%} %>    				            
	                    	<script>
	                    		// 이용약관 등록페이지로 넘어가는 servlet요청
	                    		function moveEnroll(){
	                    			$(this).click(function(){
					          	        location.href="<%= request.getContextPath() %>/enrollForm.tos"	                    				
	                    			})
	                    		};
	                    	
	                    		//detail 쪽 servlet으로 넘어가는 servlet 이때 ! 해당 이용약관 번호 넘김 
					          	$(function(){
					          	      $(".outer-body tbody>tr").click(function(){
					          	          location.href="<%= request.getContextPath() %>/detail.tos?bno=" + $(this).children().eq(0).val()
					          	      })
					          	});
					            // url에 해당 이용약관 번호 값이 잘넘어간다! 
					       </script>    
                        </tbody>
                    </table>
                </div>

<%------------------------------------- 페이징바 영역 ---------------------------------------------------------%>

		        <div align="center" class="paging-area">
		
					<!-- 현재 보고있는 페이지가 1일 떄 버튼 안보이게 하려면 아래와같이 -->
					<% if(currentPage != 1){ %>
		            	<button onclick="location.href='<%= request.getContextPath() %>/list.tos?currentPage=<%= currentPage-1 %>';">&lt;</button>
		            <%} %>
		            
		            <% for(int p=startPage; p<=endPage; p++){ %>
		            	<% if(p != currentPage) {%>	
		            		<button onclick="location.href='<%= request.getContextPath()%>/list.tos?currentPage=<%= p %>';"><%= p %></button>
		            	<%}else{ %>
		         	    	<button id="dis-btn" disabled><%= p %></button>
		    	    	    <!-- 현제 페이지수는 다시 클릭이 불가능하게 만들어주자! -->
		            	<%}%>
		            <%}%>
			
					<!-- 현재 보고있는 페이지가 마지막페이지일 떄 버튼 안보이게 하려면 아래와같이 -->
					<% if(currentPage != maxPage){ %>                        
		            	<button onclick="location.href='<%= request.getContextPath() %>/list.tos?currentPage=<%= currentPage+1 %>';">&gt;</button>
		            <%} %>
		        </div>
				

            </div>
<%-------------------------------------------------------------------------------------------------------------%>            
        </div>
    </div>
</body>
</html>