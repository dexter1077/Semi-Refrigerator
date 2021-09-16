<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.refrigerator.notice.model.vo.Notice,
				 com.refrigerator.common.model.vo.PageInfo,
				 java.util.ArrayList" %>    
    <!--윤희락 05.26 작성-->

<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
	
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int endPage = pi.getEndPage();
	int startPage = pi.getStartPage();
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자_공지사항 목록</title>
    <style>
    
    	#wrap{/* 사이드 바 포함 div*/
    		margin:auto;
    		width:1200px;
    	}
    	
    	#for-height{height:750px;}
    
        .outer{
            width: 900px;
            margin:40px 40px;
        }
        #notice-form{
            width: 900px;
            border: 2px solid rgb(188, 188, 188);
        }


        .head-area>h2{
            padding-bottom:20px;
            width: 900px;
            border-bottom:4px solid rgb(0, 102, 51);
        }

        button{border:none;}
        #enroll-btn{
            background: rgb(0, 102, 51);
            color: white;
            font-weight: 550;
            width:60px;
        }
        
        #delete-btn, #update-btn{
            color: white;
            font-weight:500;
            width:20px;
            height:20px;
        }
        
        #delete-btn{background: rgb(231, 76, 60);}
        #update-btn{background: rgb(52, 152, 219);}
        
        #enroll-btn:hover, #delete-btn:hover, #update-btn{
            opacity:0.85;
        }
        
        #btn-area{
            width:890px;
            text-align:right;
            margin:6px;
        }
        #btn-area a{
            margin-right:8px;
        }


        .notice-list-form{border:1px solid rgb(188, 188, 188);}
        .notice-list-form tr {
            height: 35px;
            text-align:center;
        }
        .notice-list-form>thead {
            background-color: rgb(222, 222, 222);
        }


        .path-area{
            font-size:16px;
            color:rgb(155, 155, 155);  
        }
        .path-area>span{
            text-decoration: underline;  
            font-weight:550;
            color: black;  
        }

        .current-page{
            background-color:rgb(0, 102, 51);
            color: white;
        }

    </style>
</head>
<body>

<%@ include file="../common/admin/adminTopNavView.jsp" %>

<div id="wrap">
	
	
	<%@ include file="../common/admin/adminSideBarView.jsp" %>

 	<div class="outer">

	    <div class="path-area">
	        홈 > 공지사항 > <span class="current-menu">공지사항</span> 
	    </div>
	    
	    <br>
	    <div class="head-area">
	        <h2>공지사항</h2>
	    </div>
	    <br>
	    
	
	        <div id="notice-form">
	            <div id="btn-area">
	                <a href="<%=contextPath%>/adminDetail.no?title=등록&noticeNo=0" id="enroll-btn" class="btn btn-secondary btn-sm">등록</a>
	            </div>
	            
	            <!-- The Modal -->
	            <div class="modal fade" id="delete">
	                <div class="modal-dialog">
	                    <div class="modal-content">
	            
	                        <!-- Modal Header -->
	                        <div align="right">
	                            <button type="button" class="close" data-dismiss="modal">&times;</button>
	                        </div>
	                        
	                        <!-- Modal body -->
	                        <div class="modal-body" style="margin:auto">
	                            <p><span style="color:red"><span class="delete-no"></span>공지사항을 삭제</span>하시겠습니까?</p>
	                        </div>
	                        
	                        <div class="modal-btn">
	                            <a href="" class="btn btn-secondary btn-sm">취소</a>
	                            <a href="" class="btn btn-danger btn-sm" id="modalDelete-btn">삭제</a>
	                        </div>
	  
	                    </div>                  
	                </div>
	            </div>
	            
	            <table class="notice-list-form" border="1" width="100%">
	                <thead>
	                    <tr>
	                        <th width="50">번호</th>
	                        <th width="350">제목</th>
	                        <th width="50"></th>
	                        <th width="60">작성자</th>
	                        <th width="60">작성일</th>
	                    </tr>
	                </thead>
	                <tbody>
	                
	                <%if(list.isEmpty()) {%>
	                	<tr>
	                		<td colspan="5">요청하신 페이지 결과가 없습니다.</td>
	                	</tr>
	                <%} else {%>
	                	<%for(Notice n : list) { %>
		                    <tr>
		                        <td><%=n.getNoticeNo()%></td>
		                        <td><a href="<%=contextPath%>/adminDetail.no?title=조회&noticeNo=<%=n.getNoticeNo()%>" id="notice-title"><%=n.getNoticeTitle()%></a></td>
		                        <th>
		                        	<a href="<%=contextPath%>/adminDetail.no?title=수정&noticeNo=<%=n.getNoticeNo()%>" id="update-btn" class="btn btn-secondary btn-sm">U</a>
		                        	<a href="" id="delete-btn" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#delete" onclick="deleteNo(<%=n.getNoticeNo()%>);">D</a>
		                        </th>
		                        <td><%=n.getUserNo()%></td>
		                        <td><%=n.getModifyDate()%></td>
		                    </tr>
	                    <%} %>
	                <%} %>
	                
	                </tbody>
	            </table>
	    
	            <br>
	
	        </div>
	      
	        <br>
	         <br>
	         <div align="center" class="paging-area">
	        	<%if(currentPage != 1) {%>
	            <button onclick="location.href='<%=contextPath%>/adList.no?currentPage=<%=currentPage-1%>';">&lt;</button>
	            <%} %>
	            <%for(int p=startPage; p<=endPage; p++) {%>
	            	<%if(p != currentPage) { %>
	            		<button onclick="location.href='<%=contextPath%>/adList.no?currentPage=<%= p%>';"><%=p %></button>
	            	<%}else { %>
	            		<button class="cp" disabled><%=p%></button>
	            	<%} %>
	            <%}  %>
	            <%if(currentPage != maxPage) { %>
	            <button onclick="location.href='<%=contextPath%>/adList.no?currentPage=<%=currentPage+1%>';">&gt;</button>
	            <%} %>
	        </div>
	        
	        <br>
	        <br>
      
    </div>
</div>
	
	<script>
		function deleteNo(no){
			var href = "<%=contextPath%>/delete.no?nno=" + no;
			console.log(href);
			$(".delete-no").text(no + "번 ");
			$("#modalDelete-btn").prop("href", href);
		}
	</script>
</body>
<style>
	
        /*--모달 영역 */
        .modal-content{ /*모달창 위치*/
            margin:350px 20px;
        }
        .modal-btn{
            text-align:center;
            margin:25px 35px;
        }
        .modal-btn>a{
            width:100px;
            height:35px;
            font-size:16px;
            margin:0px 25px 0px 25px;
        }
        .btn-secondary{
            background:rgb(222, 222, 222);
            color: black;
            border:none;
        }
        .close{
            border: 1px solid black;
            font-size:40px;
        }
</style>
</html>