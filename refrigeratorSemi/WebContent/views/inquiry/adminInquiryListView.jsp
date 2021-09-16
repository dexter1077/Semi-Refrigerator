<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--윤희락 05.26 작성-->
<%@ page import="com.refrigerator.common.model.vo.PageInfo, java.util.ArrayList, com.refrigerator.inquiry.model.vo.Inquiry" %>
<%


	PageInfo unSolvedListpi = (PageInfo)request.getAttribute("unSolvedListpi");
	PageInfo solvedListpi = (PageInfo)request.getAttribute("solvedListpi");
	
	ArrayList<Inquiry> unSolvedList = (ArrayList<Inquiry>)request.getAttribute("unSolvedList");
	ArrayList<Inquiry> solvedList = (ArrayList<Inquiry>)request.getAttribute("solvedList");
	
	int unSolCurrentPage = unSolvedListpi.getCurrentPage();
	int unSolStartPage = unSolvedListpi.getStartPage();
	int unSolEndPage = unSolvedListpi.getEndPage();
	int unSolMaxPage = unSolvedListpi.getMaxPage();
	
	int solCurrentPage = solvedListpi.getCurrentPage();
	int solStartPage = solvedListpi.getStartPage();
	int solEndPage = solvedListpi.getEndPage();
	int solMaxPage = solvedListpi.getMaxPage();
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자_문의/답변</title>

    <style>
        #wrap{
        	margin:auto;
        	width:1200px;
        }
        
        #for-height{height:750px;}
        
        .outer{
            width: 900px;
            font-size: 16px;
            margin: 40px 40px;
        }
        
        
        
        button{
            border: none;
        }
        tr>td>button{
            border-radius:5px;
            font-size: 14px;
            font-weight: 600;
            color: rgb(100, 100, 100);
        }

        .path-area{
            font-size:16px;
            
            color:rgb(155, 155, 155);  
        }
        .path-area>span{
            text-decoration: underline;  
            font-weight:500;
            color: black;  
        }

        table{
            border-top: 3px solid rgb(0, 102, 51);
            border-bottom: 3px solid rgb(211, 211, 211);
        }
        .table-label{
            margin-bottom: 3px;
        }
        table tr{
            height:35px;
            border-bottom: 1px solid rgb(211, 211, 211);
            text-align: center;
        }
    </style>

</head>
<body>

	<%@ include file="../common/admin/adminTopNavView.jsp" %>
<div id="wrap">
	<%@ include file="../common/admin/adminSideBarView.jsp" %>

    <div class="outer">
        <div class="path-area">
            홈 > 문의관리 > <span class="current-menu">문의/답변</span> 
        </div>

        <br>
        <h2>문의/답변</h2>
        <br>

        <div class="table-label">
            <span><b>미해결 문의</b></span> <span class="count-area"><%=unSolvedListpi.getListCount() %></span>
        </div>
        <table class="unsolQ">
            <thead>
                    <tr>
                        <th width="100">문의번호</th>
                        <th width="500">문의내용</th>
                        <th width="100">문의자ID</th>
                        <th width="100">등록일</th>
                        <th width="100"></th>
                    </tr>
            </thead>
            <tbody>
            <%if(unSolvedList.isEmpty()) {%>
            	<tr>
            		<td colspan="5">조회된 문의가 없습니다.</td>
            	</tr>
            <%}else{ %>
            	
            	<% for(Inquiry i : unSolvedList) {%>
                <tr>
                    <td><span id="inqNo"><%=i.getInqryNo()%></span></td>
                    <td><%=i.getInqryTitle()%></td>
                    <td><%=i.getInqryWriter()%></td>
                    <td><%=i.getModifyDate()%></td>
                    <td><button class="answer-btn" type="button" data-toggle="modal" data-target="#answer-modal" onclick="answer(<%=i.getInqryNo()%>);">답변하기</button></td>
                </tr>
            	<%} %>
            <%} %>
            </tbody>
        </table>


        <br>
       <br>
         <div align="center" class="page-area">
        	<%if(unSolCurrentPage != 1) {%>
            <button onclick="location.href='<%=contextPath%>/adList.inq?unSolCurrentPage=<%=unSolCurrentPage-1%>&solCurrentPage=<%=solCurrentPage%>';">&lt;</button>
            <%} %>
            <%for(int p=unSolStartPage; p<=unSolEndPage; p++) {%>
            	<%if(p != unSolCurrentPage) { %>
            		<button onclick="location.href='<%=contextPath%>/adList.inq?unSolCurrentPage=<%= p%>&solCurrentPage=<%=solCurrentPage%>';"><%=p %></button>
            	<%}else { %>
            		<button class="cp" disabled><%=p%></button>
            	<%} %>
            <%}  %>
            <%if(unSolCurrentPage != unSolMaxPage) { %>
            <button onclick="location.href='<%=contextPath%>/adList.inq?unSolCurrentPage=<%=unSolCurrentPage+1%>&solCurrentPage=<%=solCurrentPage%>';">&gt;</button>
            <%} %>
        </div>
        <br>

        <div class="table-label">
            <span><b>해결문의내역</b></span>
        </div>
        <table class="solQ">
            <thead>
                <tr>
                    <th width="100">문의번호</th>
                    <th width="450">문의내용</th>
                    <th width="150">문의자ID</th>
                    <th width="150">등록일</th>
                    <th width="150">답변일</th>
                </tr>
            </thead>
            <tbody>
            <%if(solvedList.isEmpty()) {%>
            	<tr>
            		<td colspan="5">조회된 문의가 없습니다.</td>
            	</tr>
            <%}else{ %>
            	
            	<% for(Inquiry i : solvedList) {%>
                <tr>
                    <td><%=i.getInqryNo()%></td>
                    <td><a class="solved-title" data-toggle="modal" data-target="#answer-modal" onclick="viewSolvedList(<%=i.getInqryNo()%>);"><%=i.getInqryTitle()%></a></td>
                    <td><%=i.getInqryWriter()%></td>
                    <td><%=i.getModifyDate()%></td>
                    <td><%=i.getAnswerDate()%></td>
                </tr>
            	<%} %>
            <%} %>
            </tbody>
        </table>

        <br>
         <div align="center" class="page-area">
        	<%if(solCurrentPage != 1) {%>
            <button onclick="location.href='<%=contextPath%>/adList.inq?unSolCurrentPage=<%=unSolCurrentPage%>&solCurrentPage=<%=solCurrentPage-1%>';">&lt;</button>
            <%} %>
            <%for(int p=solStartPage; p<=solEndPage; p++) {%>
            	<%if(p != solCurrentPage) { %>
            		<button onclick="location.href='<%=contextPath%>/adList.inq?unSolCurrentPage=<%=unSolCurrentPage%>&solCurrentPage=<%= p%>';"><%=p %></button>
            	<%}else { %>
            		<button class="cp" disabled><%=p%></button>
            	<%} %>
            <%}  %>
            <%if(solCurrentPage != solMaxPage) { %>
            <button onclick="location.href='<%=contextPath%>/adList.inq?unSolCurrentPage=<%=unSolCurrentPage%>&solCurrentPage=<%=solCurrentPage+1%>';">&gt;</button>
            <%} %>
        </div>
        
       
        <!-- 미해결 문의 답변하기 | 해결 문의 답변 수정 Modal -->
        
        <div class="modal fade" id="answer-modal">
            <div class="modal-dialog">
                <div class="modal-content">
        
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">관리자_답변</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    
                    <!-- Modal body -->
                    <div class="answer-form">
                        <form action="<%=contextPath %>/adminUpdate.inq" method="POST">
                        <input type="hidden" id="answerInqNo" name="inqNo">
                        
                            <div class="form-group">
                                <label for="qus">Q. 질문_제목</label>
                                <input type="text" class="form-control" id="inqTitle" value="질문들어올자리" readonly>
                            </div>
                            
                             <div class="form-group">
                                <label for="qus">Q. 질문_내용</label>
                                <textarea name="qusTitle" class="form-control" id="inqContent" readonly style="resize:none"></textarea>
                            </div>
                            
	                            <div class="form-group">
	                                <label for="answer">A. 답변</label>
	                                <textarea name="inqContent" class="form-control" id="answerContent" style="resize:none;" placeholder="답변을입력해주세요" required></textarea>
	                            </div>
	                            
	                            <div class="form-btn">
	                                <button type="button" data-dismiss="modal" class="btn btn-secondary">취소</a>
	                                <button type="submit" id="btn-s" class="btn btn-success">등록</a>
                            	</div>
                            
                        </form>
                    </div>

                </div>                  
            </div>
        </div>
    </div>	
</div>
    
    <script>
    	// 해결 문의글 목록 중 '글제목' 클릭 시  해당 글의 번호를 가지고 데이터 요청
    	function viewSolvedList(no){
    		
    		$.ajax({
    			url:"JqAjaxAdminSolModal.inq",
    			data:{inqNo: no},
    			success:function(result){
    				
    				$("#answerInqNo").val(result.inqryNo);
    				$("#inqTitle").val(result.inqryTitle);
    				$("#inqContent").val(result.inqryContent);
    				$("#answerContent").val(result.inqryAnswer);
    				
    			},error:function(){
    				
    			}
    		})
    		
    	}
    
    
    	// 미해결 문의글 목록중 '답변하기' 클릭 시 해당 글의 번호를 가지고 데이터 요청 (게시글 만들때 모달창도 여러개 만들면 되지만 무거워질것 같아서 이 방법으로..)
    	function answer(no){
    		
    		$("#answerContent").val("");
    		
    		$.ajax({
    			url:"JqAjaxAdminModal.inq",
    			data:{inqNo: no},
    			success:function(result){
    				$("#answerInqNo").val(result.inqryNo);
    				$("#inqTitle").val(result.inqryTitle);
    				$("#inqContent").val(result.inqryContent);
    			},error:function(){
    				
    			}
    		})
    		
    	}
    	
    	
    	
    </script>
</body>
<style>
		.modal-content{ /*모달창 위치*/
            margin:20px -100px;
        }
        
        /*답변하기 모달 영역*/
        .modal-content{
            width: 1000px;
            height: 800px;
        }
        .modal-header{
            border-bottom: 5px solid rgb(0, 153, 102);
            width: 800px;
            margin-top: 0;
            margin: 35px 74px 35px 74px;
            padding: 2px;
        }
        .modal-title{
            color:rgb(0, 153, 102);
            font-weight: 550;
            font-size: 36px;
        }
        .close{
            font-size: 40px;
            color: black;
        }
        .answer-form{
            width:800px;
            height:380px;
            margin: 0px 74px 0px 74px;
        }
        .form-group{
            margin-bottom:20px;
        }
        .form-group>label{
            color:rgb(0, 153, 102);
            font-weight: 500;
        }
        .form-group>textarea{
            height: 200px;
        }
        .form-btn{
            height:60px;
        }
        .form-btn button{
            box-sizing: border-box;
            width:46%;
            height:100%;
            margin: 0% 2% 0% 2%;
            display:block;
            float: left;
            text-align: center;
            font-size:24px;
            text-decoration: none;
            line-height:50px;
            font-weight:500;
        }
        
        #btn-s{
            background: rgb(0, 153, 102);
            opacity:0.85;
        }
        #btn-s:hover{
            background: rgb(0, 153, 102);
            opacity:1;
        }
        
        /* 해결문의내역 제목내역 css*/
        .solved-title{
        	color:black;
        }
        .solved-title:hover{
        	cursor:pointer;
        }

        .current-page{
            background-color:rgb(0, 102, 51);
            color: white;
        }
        .count-area{
            color: orange;
        }
</style>
</html>