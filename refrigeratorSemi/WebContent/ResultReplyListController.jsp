<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    


								<!-- @author seong 5/30 -->

    
<%@ 
	page import = "com.refrigerator.member.model.vo.Member
				, com.refrigerator.reply.model.vo.*
				,  java.util.ArrayList
				, com.refrigerator.common.model.vo.PageInfo " 
	
%>

<% 	

	Member loginUser = (Member)session.getAttribute("loginUser"); 
	ArrayList<AdmReply>list = (ArrayList<AdmReply>)request.getAttribute("list");
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
<title>Insert title here</title>




<!--메뉴바가 들어갈 영역 -->

<!-- 검색된 회원이 조회될 영역 
 

-->



<style>
    .total_outer{
        color: black;
        width: 1200px;
        margin: auto;
    }


    .select-list>a{
        text-decoration: none;
        color: black;
    }
    .search-container button{
        background-color: rgb(0, 120, 51);
        color: white;
    }
    .member-btn a{
        background: rgb(0, 120, 51);
    }

    .checked-delete>tr:hover{

        cursor: pointer;
        background-color: rgb(248, 248, 248);
        opacity: 0.7;
        
    }

    .thead{
        background-color: rgb(224, 224, 224);
    }

    .reply-table{
        font-size: 13px;
    }

</style>

</head>
<body>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


	

	<div class="total_outer">

        <%@ include file="../common/admin/adminTopNavView.jsp" %>
        
		<div>
			<%@ include file="../common/admin/adminSideBarView.jsp" %>
		

        <div class="select-list"  align="right" style="width: 350px;">
            <a href="">홈</a> >
            <a href="">게시판 관리</a> >
            <a href="">댓글</a>
        </div>
        <br>

        <div class="search-container" align="right" style="width:1000px">

            <!--아이디 검색기능-->
           
                <span id="" >회원 아이디</span>
                <input type="text" placeholder="아이디" name="userId">
                <button type="submit" class="btn btn-sm " id="searchBtn">조회</button>
            
            

        </div>
        
        <script>
        
        	$(function(){
        		
        		$("#searchBtn").click(function(){
        			var userId = $(this).siblings("input[name=userId]").val();
        			location.href = "<%=request.getContextPath()%>/searchList.reply?currentPage=1&userId=" + userId;
        		})
        		
        	})
        	
        
        </script>
        

        <br><br>

        
        <!--댓글 삭제 기능-->
        <form action="<%=request.getContextPath()%>/deleteReply.admin" id="admin-delete-reply" >

            <div class="btn" align="right" style="width: 440px">

                <a class="btn btn-sm btn-danger" data-toggle="modal" data-target="#reply-Delete-Modal" style="margin-left: -160px;" >삭제</a>
                <br>

                  <!-- The Modal -->
                <div class="modal" id="reply-Delete-Modal">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                    
                            <!-- Modal Header -->
                            <div class="modal-header">
                            <h4 class="modal-title">댓글 삭제</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                        
                            <!-- Modal body -->
                            <div class="modal-body">
					                            댓글 삭제는 복구가 불가능합니다.   <br>
					                            댓글을 삭제하시겠습니까?
					                            </div>
                            
                        
                            <!-- Modal footer -->
                            <div class="modal-footer">
                            <button type="submit" class="btn btn-danger btn-sm">삭제하기</button>
                            
                    
                        </div>
                    </div>
                </div>

            </div>
            <br>

            
            <div class="member-list" >

                <table border="1" align="center" style="border: 1px sold black; width: 800px; margin-left: 100px;" class="reply-table"> 

                    <thead class="thead">
                        <tr align="center">
                            <th width="100">확인</th>
                            <th width="300">회원 아이디</th>
                            <th width="300">신고사유</th>
                            <th width="500">레시피 제목</th>
                            <th width="1000">댓글 내용</th>
                            <th width="200">작성일</th>
                            <th width="200">신고여부</th>
                        </tr>

                    </thead>
                
                    <tbody class="checked-delete">
                        
                        <%if(list.isEmpty()){ %>
                        	
                        	<tr>
                        		<td colspan="7">댓글 조회 결과가 없습니다.</td>
                        	</tr>
                        	
                        
                        <%} else { %>
                   
                   			<%for(AdmReply a : list) { %>
                        
	                        <tr align="center" id="test" >
	                        	
	                            <td width="50"><input type="checkbox" name="replyNo" value=<%=a.getReplyNo()%>></td>
	                            <td><%=a.getUserId() %></td>
	                            <td><%=a.getReportContent() %></td>
	                            <td><%=a.getRecipeTitle() %></td>
	                            <td><%=a.getReplyContent() %></td>
	                            <td><%=a.getEnrollDate() %></td>
	                            <td><%=a.getStatus() %></td>
	                        </tr>
	                        
	                        <%} %>
                        <%} %>
	

                    </tbody>

                </table>

            </div>

        
       </form>
        
       </div>
        
    </div>
    
    
   		 <div class="paging-area" align="center">

			<% if(currentPage != 1) { %>
            <button onclick="location.href='<%=request.getContextPath()%>/rlist.admin?currentPage=<%=currentPage-1%>';">&lt;</button>
			<% } %>
			
			<% for(int p=startPage; p<=endPage;p++) {%>
		
				<% if(p != currentPage) {%>
				<button onclick="location.href='<%=request.getContextPath()%>/rlist.admin?currentPage=<%=p%>';"><%=p%></button>
				<%} else { %>
				<button disabled><%= p %></button>
				<%} %>
			
			<%} %>
			
			<%if(currentPage != maxPage) {%>
            <button onclick="location.href='<%=request.getContextPath()%>/rlist.admin?currentPage=<%=currentPage+1%>';">&gt;</button>
			<%} %>
			
			
        	</div>
        
    
    

    <script>

        /*
        
        작업 중인 코드입니다.
  
        function checked(){
            
            $("input[type=checkbox]").each(function(){
                consloe.log($(this).children().eq(0).attr("checked",true));   	
            });
            
       
        }
	                        
        */


    </script>




</body>
</html>