<%@page import="com.refrigerator.inquiry.model.vo.Inquiry"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.refrigerator.faq.model.vo.Faq, 
				 java.util.ArrayList, 
				 com.refrigerator.common.model.vo.PageInfo" %>
    <!--윤희락 05.26 작성-->
<%
	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Faq> faqList = (ArrayList<Faq>)request.getAttribute("faqList");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자_FAQ</title>
<style>
        /*include 포함*/
        #wrap{
        	margin:auto;
        	width:1200px;
        }
        
        #for-height{height:750px;}
        
        .outer{
            width:900px;
            margin: 40px 40px;
        }

        .table-label{
            margin-bottom: 7px;
            display: inline-block;
        }
        .enroll-btn{
            display: inline-block;
            width: 770px;
            text-align: right;
        }
        .enroll-btn>button{
            font-weight:550;
            width:60px;
            background-color: rgb(0, 153, 102);
        }

        table{
            border-top: 3px solid rgb(0, 102, 51);
        }
        .list-area{
            text-align: center;
        }
        .list-area tr{
            border-bottom: 1px solid rgb(222, 222, 222);
            height:40px;
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
    
        button{border:none;}
        #btn1, #btn2{
            background-color:rgb(222, 222, 222); 
            color: black;
            font-size:75%;
            border: none;
        }
        
       

    /*글 삭제 모달 영역*/
    
    #delete>div div{
        margin:100px 200px;   
    }
    .modal-btn{
        margin:25px 35px;
        text-align: center;
    }
    .modal-btn> button{
        width:100px;
        height:35px;
        font-size:16px;
        margin:0px 25px 0px 25px;
        text-align: center;
    }
    .btn-secondary{
        background:rgb(222, 222, 222);
        color: black;
        border:none;
    }
        


    /*--글 수정,등록 모달 영역*/
        #modify-form>div>div, #enroll-form>div>div{
            width:600px;
            height:600px;
        }
    
        .modal-header{
            border-bottom: 5px solid rgb(0, 153, 102);
            width: 450px;
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
            width:450px;
            height:380px;
            margin: 0px 74px 0px 74px;
        }
        .form-group{
            margin-bottom:40px;
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
        .form-btn>button{
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
        .count-area {
            color:orange;
        }
        .current-page{
                background-color:rgb(0, 102, 51);
                color: white;
        }
        .list-answer{display:none;}
</style>
</head>
<body>
	<%@ include file="../common/admin/adminTopNavView.jsp" %>
	
	<div id="wrap">
	<%@ include file="../common/admin/adminSideBarView.jsp" %>

	<div class="outer">
        <div class="path-area">
            홈 > 문의관리 > <span class="current-menu">FAQ</span> 
        </div>

        <br>
        <h2>FAQ</h2>
        <br>

        <div class="table-label">
            <span>FAQ 전체목록</span><span class="count-area"><%=pi.getListCount()%></span>
        </div>
        <div class="enroll-btn">
            <button class="btn btn-success btn-sm" data-toggle="modal" data-target="#enroll-form">등록</button>
        </div>
        

        <table class="list-area">
            <thead>
                <tr>
                    <th width="100">번호</th>
                    <th width="400">제목</th>
                    <th width="200">게시물관리</th>
                    <th width="100">등록일</th>
                    <th width="100">조회수</th>
                </tr>
            </thead>
            <tbody>
            <%if(faqList.isEmpty()) {%>
            	<tr>
            		<td colspan="5">조회된 결과가 없습니다.</td>
            	</tr>
            <%}else { %>
            
            	<%for(Faq f : faqList) {%>
	                <tr class="list-qus">
	                    <td><%=f.getFaqNo()%></td>
	                    <td><span class="list-qus"><%=f.getQuesContent()%></span></td>
	                    <td>
	                        <button class="btn btn-secondary btn-sm" onclick="modify(<%=f.getFaqNo()%>);" data-toggle="modal" data-target="#modify-form" id="btn1">글수정▶</button>
	                        <button class="btn btn-secondary btn-sm" onclick="deleteFaq(<%=f.getFaqNo()%>);" data-toggle="modal" data-target="#delete-form" id="btn2">글삭제▶</button>
	                    </td>
	                    <td><%=f.getModifyDate()%></td>
	                    <td><%=f.getCount()%></td>
	                </tr>
	                <tr class="list-answer">
	                	<td></td>
	                    <td colspan="3"><%=f.getAnswerContent()%></td>
	                    <td></td>
	                </tr>
            	<%} %>
            	
            <%} %>
            
            </tbody>
        </table>

        <script>
            $(function(){
                $(".list-qus").click(function(){
                    var $tr = $(this).next();

                    if($tr.css("display") == "none"){

                        $(this).siblings(".list-answer").slideUp(500);

                        // 보여주게끔
                        $tr.slideDown(500);
                    }else{
                        $tr.slideUp(500);
                    }
                })
            })
        </script>

        <!-- 글 "삭제" 모달 -->
        
        <div class="modal fade" id="delete-form">
            <div class="modal-dialog">
                <div class="modal-content">
        
                    <!-- Modal Header -->
                    <div align="right">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    
                    <!-- Modal body -->
                    <div class="modal-body" style="margin:auto">
                        <p><span style="color:red; font-size:20px;"><span id="deleteNo"></span>FAQ를 삭제</span>하시겠습니까?</p>
                    </div>
                    
                    <div class="modal-btn">
                    	<form action="delete.faq">
                    		<input type="hidden" id="deleteFaqNo" name="faqNo">
	                        <button type="button" data-dismiss="modal" class="btn btn-secondary btn-sm">취소</button>
	                        <button class="btn btn-danger btn-sm">삭제</button>
                    	</form>
                    </div>

                </div>                  
            </div>
        </div>

        <!-- 글 수정 모달 -->
        <div class="modal fade" id="modify-form">
            <div class="modal-dialog">
                <div class="modal-content">
        
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">관리자_FAQ 수정</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    
                    <!-- Modal body -->
                    <div class="answer-form">
                        <form action="<%=contextPath %>/update.faq" method="POST">
                        	<input type="hidden" name="faqNo" id="updateNo">
                            <div class="form-group">
                                <label for="qus">Q. 질문</label>
                                <input type="text" name="quesContent" class="form-control" id="qus" value="레시피를 어디서 써야하는지 모르겠어요" required>
                            </div>
                            <div class="form-group">
                                <label for="answer">A. 답변</label>
                                <textarea name="answerContent" class="form-control" id="answer" style="resize:none;" placeholder="답변을입력해주세요" required>레시피등록은...</textarea>
                            </div>
                            <div class="form-btn">
                                <button type="button" data-dismiss="modal" class="btn btn-secondary ">취소</a>
                                <button type="submit" id="btn-s" class="btn btn-success">게시</a>
                            </div>
                        </form>
                    </div>
						
                </div>                  
            </div>
        </div>

        <!-- 글 등록모달 -->
        <div class="modal fade" id="enroll-form">
            <div class="modal-dialog">
                <div class="modal-content">
        
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">관리자_FAQ 등록</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    
                    <!-- Modal body -->
                    <div class="answer-form">
                        <form action="<%=contextPath %>/insert.faq" method="POST">
                            <div class="form-group">
                                <label for="qus">Q. 질문</label>
                                <input type="text" class="form-control" id="qus" name="title" placeholder="FAQ 질문을 입력해주세요" required>
                            </div>
                            <div class="form-group">
                                <label for="answer">A. 답변</label>
                                <textarea name="content" class="form-control" name="content" id="answer" style="resize:none;" placeholder="FAQ답변을입력해주세요" required></textarea>
                            </div>
                            <div class="form-btn">
                                <button data-dismiss="modal" class="btn btn-secondary ">취소</a>
                                <button type="submit" id="btn-s" class="btn btn-success">게시</button>
                            </div>
                        </form>
                    </div>

                </div>                  
            </div>
        </div>
        
        
        <br>
         <div align="center" class="paging-area">
        	<%if(currentPage != 1) {%>
            <button onclick="location.href='<%=contextPath%>/adList.faq?currentPage=<%=currentPage-1%>';">&lt;</button>
            <%} %>
            <%for(int p=startPage; p<=endPage; p++) {%>
            	<%if(p != currentPage) { %>
            		<button onclick="location.href='<%=contextPath%>/adList.faq?currentPage=<%= p%>';"><%=p %></button>
            	<%}else { %>
            		<button class="cp" disabled><%=p%></button>
            	<%} %>
            <%}  %>
            <%if(currentPage != maxPage) { %>
            <button onclick="location.href='<%=contextPath%>/adList.faq?currentPage=<%=currentPage+1%>';">&gt;</button>
            <%} %>
        </div>
        
        <br>
        
       
    </div>
    
	    <script>
	    	// 글수정 버튼 클릭시 해당 글번호 받아 faq내용 수정모달창에 반환
	    	function modify(no){
	    		
	    		$.ajax({
	    			url:"jqAjaxSelect.faq",
	    			data:{faqNo:no},
	    			success:function(faq){
	    				
	    				$("#updateNo").val(faq.faqNo);
	    				$("#qus").val(faq.quesContent);
	    				$("#answer").val(faq.answerContent);
	    				
	    			},error:function(){
	    				
	    			}
	    		})
	    	}
	    	
	    	function deleteFaq(no){
		    	$("#deleteNo").text(no + "번 ");
		    	$("#deleteFaqNo").val(no);
	    	}
	    </script>
	    
	</div>

</body>
<style>

	.modal-content{ /*모달창 위치*/
            margin:150px 20px;
        }
	  /*글 삭제 모달 영역*/
    
    #delete>div div{
        margin:100px 200px;   
    }
    .modal-btn{
        margin:25px 35px;
        text-align: center;
    }
    .modal-btn>form>button{
        width:100px;
        height:35px;
        font-size:16px;
        margin:0px 25px 0px 25px;
        text-align: center;
    }
    .btn-secondary{
        background:rgb(222, 222, 222);
        color: black;
        border:none;
    }
        


    /*--글 수정,등록 모달 영역*/
        #modify-form>div>div, #enroll-form>div>div{
            width:600px;
            height:600px;
        }
    
        .modal-header{
            border-bottom: 5px solid rgb(0, 153, 102);
            width: 450px;
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
            width:450px;
            height:380px;
            margin: 0px 74px 0px 74px;
        }
        .form-group{
            margin-bottom:40px;
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
        .form-btn>button{
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
        .count-area {
            color:orange;
        }
        .current-page{
                background-color:rgb(0, 102, 51);
                color: white;
        }
        .list-answer{display:none;}
        
        #for-height:{
        	height:720px;
        }
      
</style>
</html>