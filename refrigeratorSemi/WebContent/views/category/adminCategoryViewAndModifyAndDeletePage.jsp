<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ArrayList , com.refrigerator.category.model.vo.*"%>    
   
<%
	ArrayList<MainCategory> mainList = (ArrayList<MainCategory>)request.getAttribute("mainList");
	ArrayList<SubCategory> subList = (ArrayList<SubCategory>)request.getAttribute("subList");	
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="jaewon.s">
<!-- Author : Jaewon -->

<title>관리자 카테고리 페이지</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
<style>
    #for-height{height: 700px;} 
    div{box-sizing: border-box;}
    .wrap{margin: auto; width: 1200px; height: 750px;}
    .outer{ width: 1000px; height: 700px; margin-right: 5px;}
/* ----------------------------------------------------------------------------------------------------------- */
    .outer{
        margin-right: 10px;
    }
    
    .top-box a{
        color: gray;
    }

    .top-box{
    padding: 25px;
    margin-top: 20px;
    margin-bottom: 10px;
    }

    .outer-body h2{
        padding-left: 20px;
        font-size: 36px;
        margin-bottom: 20px;
    }

    .for-seperate{
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        padding: 10px;
    }

    .class-box{
        height: 420px;
        overflow-y: scroll;
    }


    .for-seperate table{
        width: 450px;
    }

    .for-seperate table tr{
        height: 30px;
    }
    
    .for-seperate table thead tr:nth-child(1){
        height: 50px;
    }

    .for-seperate button{
        border: none ;
        border-radius: 5px ;
        height: 32px;
        padding: 0px 15px 0px 15px;
        color: white;
        font-weight: bold;
    }

   /* .for-seperate button:nth-child(1){
        background-color: rgb(231,76,60);
    }*/

    .for-seperate button:nth-child(1){
        margin-left: 5px;
        background-color: rgb(52,152,219);
        margin-right: 170px;
    }
    .for-seperate button:nth-child(2){
        background-color: rgb(0,153,102);
    }
	

    .majorclass-box{
        border: 3px solid tomato;
    }

    .minorclass-box{
        border: 3px solid turquoise;
    }
    
    .majorclass-box tbody td, minorclass-box tbody td{
		padding :0px;
    	height:33px;
    }

    .for-seperate label{
        width: 100%;
        height: 100%;
        line-height:30px;
        margin:0px;
    }

    .for-seperate td, .for-seperate th{
        text-align: center;
    }

    .custom-check{
        display: none;   
    }    
    
/* ----------------------- 삭제 모달 영역임 -------------------------------------------------------------------- */

	.modal-title{
		text-overflow:ellipsis;
		white-space:nowrap; 
		overflow:hidden;
		font-weight: bold;
	}

	.modal-footer button{
		width: 45%;
		margin: 0px;		
	}
/* ----------------------- 삭제 모달 영역임 --------------------------------------------------------------------- */
/* ----------------------- 수정 모달 영역임 --------------------------------------------------------------------- */
    #major-modify-modal, #minor-modify-modal{
		width: 100%;  
	}

	#major-modify-modal>div, #minor-modify-modal>div{
		width: 500px;  
		position: absolute; 
		top: 50%; 
		left: 50%; 
		transform: translate(-50%,-50%); 
	}

	#major-modify-modal h2 , #minor-modify-modal h2{
		color: rgb(22,160,133);
	}

	#major-modify-modal .modal-header, #minor-modify-modal .modal-header{
		margin-left: 5px;
		padding-bottom: 10px;
	}

	#major-modify-modal .modal-body span, #minor-modify-modal .modal-body span, #selectMainCatSpan{
		margin-bottom: 10px;
		color: rgb(22,160,133);
        margin-right: 10px ;
        font-size: 18px;
	}	
	
	#selectMainCatSpan{
		margin-left:15px
	}

	#major-modify-modal .modal-body input, #minor-modify-modal .modal-body input, #selectMainCat{
        width: 65%;
        border: 2px solid gray;
        font-size: 18px;
	}
	
	#selectMainCat{
		width: 60%;
        font-size: 18px;
	}

	#major-modify-modal .modal-footer, #minor-modify-modal .modal-footer{
		display: flex;
		justify-content: space-between;
		padding: 0px;
		height: 60px;
	}

	#major-modify-modal .modal-footer button, #minor-modify-modal .modal-footer button{
		width: 50%;
		height: 100%;
		border-radius:0px ;
		border: 1px solid white;
		font-size: 18px;
		font-weight: 900;
	}

	#major-modify-modal .modal-footer button:nth-child(1), #minor-modify-modal .modal-footer button:nth-child(1){
		background-color: #BEBEBE;
	}

	#major-modify-modal .modal-footer button:nth-child(2), #minor-modify-modal .modal-footer button:nth-child(2){
		background-color: rgb(0,102,51);
	}
/* ----------------------- 수정 모달 영역임 ----------------------------------------------------------------------------- */
/* ----------------------- 등록 모달 영역임 ----------------------------------------------------------------------------- */
    #major-enroll, #minor-enroll-modal{
		width: 100%;  
	}

	#major-enroll-modal>div, #minor-enroll-modal>div{
		width: 500px;  
		position: absolute; 
		top: 50%; 
		left: 50%; 
		transform: translate(-50%,-50%); 
	}

	#major-enroll-modal h2 , #minor-enroll-modal h2{
		color: rgb(22,160,133);
	}

	#major-enroll-modal .modal-header, #minor-enroll-modal .modal-header{
		margin-left: 5px;
		padding-bottom: 10px;
	}

	#major-enroll-modal table , #minor-enroll-modal table{
        width: 400px;
        margin: 20px;
	}

    #major-enroll-modal table tr, #minor-enroll-modal table tr{
        margin: 10px;
    }
    
  	#enrollrefMainCatSpan{
  		font-weight : bold;
		margin-left : 35px; 		
  	}
  	
    #enrollrefMainCat{
      	width :270px;
      	margin-left : 25px;
    	padding-left: 10px;  
    	border : 1px solid black;
    }
    
 	#major-enroll-modal table th, #minor-enroll-modal table th{
        text-align: center;
    }
    #major-enroll-modal table td, #minor-enroll-modal table td{
        padding-left: 15px;
    }

	#major-enroll-modal input, #minor-enroll-modal input{
        width: 100%;
        border: 2px solid gray;
        box-sizing: border-box;
	}

	#major-enroll-modal .modal-footer, #minor-enroll-modal .modal-footer{
		display: flex;
		justify-content: space-between;
		padding: 0px;
		height: 60px;
	}

	#major-enroll-modal .modal-footer button, #minor-enroll-modal .modal-footer button{
		width: 50%;
		height: 100%;
		border-radius:0px ;
		border: 1px solid white;
		font-size: 18px;
		font-weight: 900;
	}

	#major-enroll-modal .modal-footer button:nth-child(1), #minor-enroll-modal .modal-footer button:nth-child(1){
		background-color: #BEBEBE;
	}

	#major-enroll-modal .modal-footer button:nth-child(2), #minor-enroll-modal .modal-footer button:nth-child(2){
		background-color: rgb(0,102,51);
	}
/* ----------------------- 등록 모달 영역임 ----------------------------------------------------------------------------- */

    </style>
</head>
<body>
    <div class="wrap">
    <%@ include file="../common/admin/adminTopNavView.jsp" %>
        <div id="content">
       	<%@ include file="../common/admin/adminSideBarView.jsp" %>
        
            <script>
                $(document).ready(function() {
                    //라디오 요소처럼 동작시킬 체크박스 그룹 셀렉터
                    $('input[type="checkbox"][name="categoryMainNo"]').click(function(){
                        //클릭 이벤트 발생한 요소가 체크 상태인 경우
                        if ($(this).prop('checked')) {
                            //체크박스 그룹의 요소 전체를 체크 해제후 클릭한 요소 체크 상태지정
                            $('input[type="checkbox"][name="categoryMainNo"]').prop('checked', false);
                            $(this).prop('checked', true);
                        }
                    });
                    $('input[type="checkbox"][name="categorySubNo"]').click(function(){
                        //클릭 이벤트 발생한 요소가 체크 상태인 경우
                        if ($(this).prop('checked')) {
                            //체크박스 그룹의 요소 전체를 체크 해제후 클릭한 요소 체크 상태지정
                            $('input[type="checkbox"][name="categorySubNo"]').prop('checked', false);
                            $(this).prop('checked', true);
                        }
                    });
                });
            </script>
<!---------------------------------------------------------------------------------------------------------------------->            
            <div class="outer" style="float: right;">
                <div class="top-box">
                    <a href="">홈</a> >
                    <a href="">싸이트관리</a> >
                    <a href="">카테고리 관리</a>s
                </div>
                <div class="outer-body">
                    <h2><b>카테고리 관리(<span style="color: tomato;">대분류</span>/<span style="color: turquoise;">소분류</span>)</b></h2>
                    <br style="clear: both;">
                    <div class="for-seperate">
                        <div class="majorclass-box class-box">
                            <table border="1" id="majorClass-table" style="border: rgb(204,204,204);">
                                <thead>
                                    <tr>
                                        <td colspan="3">
                                            <!--  <button onclick="mainDelExamination();">삭제</button> -->
                                            <button onclick="mainModifyExamination();">수정</button>
                                            <button  data-toggle="modal" data-target="#major-enroll-modal"> 대분류 카테고리 등록</button>
                                        </td>
                                    </tr>
                                   <tr>
	                                   	<th>선택</th>
	                                   	<th  width="160">대분류 카테고리 번호</th>
	              			          	<th>대분류 카테고리명</th>
                                   </tr>
                               </thead>
                               <tbody>
                               <%if(mainList.isEmpty()){ %>
			            			<tr>
			            				<td colspan="3">조회된 리스트가 없습니다. </td>
			            			</tr>
			            		<% } else {%> 
	                               	<% if(mainList.size() <=10){ %>
						                <% for(MainCategory m : mainList){ %>
	                                           <tr>
		                                        <td><input type="checkbox" name="categoryMainNo" id="majorClass<%= m.getCategoryMainNo() %>" value="<%= m.getCategoryMainNo() %>"><span ></span></td>
		                                        <td>
		                                            <label for="majorClass<%= m.getCategoryMainNo() %>"><%= m.getCategoryMainNo() %></label>
		                                        </td>   
		                                        <td>
		                                            <label for="majorClass<%= m.getCategoryMainNo() %>"><%= m.getCategoryName() %></label>
		                                        </td>   
		                                    </tr>								                
						                <% } %>	
						                <% for(int i=0; i<(10 - mainList.size()); i++){ %>
						                	<tr >
						                		<td></td>
						                		<td></td>
						                		<td></td>
						                	</tr>
						                <% } %>						                		            		
				            		<% }else{ %>
						                <% for(MainCategory m : mainList){ %>
	                                           <tr>
		                                        <td><input type="checkbox" name="categoryMainNo" id="majorClass<%= m.getCategoryMainNo() %>" value="<%= m.getCategoryMainNo() %>"><span ></span></td>
		                                        <td>
		                                            <label for="majorClass<%= m.getCategoryMainNo() %>"><%= m.getCategoryMainNo() %></label>
		                                        </td>   
		                                        <td>
		                                            <label for="majorClass<%= m.getCategoryMainNo() %>"><%= m.getCategoryName() %></label>
		                                        </td>   
		                                    </tr>				
                              		    <% } %>			            				            		
				            		<% }%>
				            	<%} %>    				                                            	
                                </tbody>
                            </table>
                        </div>
                        <!-- 아래는 소분류 -->
                        <div class="minorclass-box class-box">
                            <table border="1" id="minorClass-table" style="border: rgb(204,204,204);">
                                <thead>
                                    <tr>
                                        <td colspan="6">
                                            <!-- <button  onclick="subDelExamination();">삭제</button>  -->
                                            <button  onclick="subModifyExamination()">수정</button>
                                            <button  data-toggle="modal" data-target="#minor-enroll-modal"> 소분류 카테고리 등록</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>선택</th>
                                        <th width="160">소분류 카테고리 번호</th>
                                        <th>소분류 카테고리명</th>
                                    </tr>
                                </thead>
                                <tbody>                                
                                <%if(subList.isEmpty()){ %>
			            			<tr>
			            				<td colspan="3">조회된 리스트가 없습니다. </td>
			            			</tr>
			            		<% } else {%> 
	                               	<% if(subList.size() <=10){ %>
						                <% for(SubCategory s : subList){  %>
	                                           <tr>
	                                           	<input type="hidden" name="categorySubNo" value="<%= s.getCategoryMainNo() %>">
		                                        <td><input type="checkbox" name="categorySubNo" id="minorClass<%= s.getCategorySubNo() %>" value="<%= s.getCategorySubNo() %>"><span ></span></td>
		                                        <td>
		                                            <label for="minorClass<%= s.getCategorySubNo() %>"><%= s.getCategorySubNo() %></label>
		                                        </td>   
		                                        <td>
		                                            <label for="minorClass<%= s.getCategorySubNo() %>"><%= s.getIngredientName() %></label>
		                                        </td>   
		                                    </tr>								                
						                <% } %>	
						                <% for(int i=0; i<(10 - subList.size()); i++){ %>
						                	<tr >
						                		<td></td>
						                		<td></td>
						                		<td></td>
						                	</tr>
						                <% } %>						                		            		
				            		<% }else{ %>
						                <% for(SubCategory s : subList){  %>
	                                           <tr>
	                                           	<input type="hidden" name="categorySubNo" value="<%= s.getCategoryMainNo() %>">
		                                        <td><input type="checkbox" name="categorySubNo" id="minorClass<%= s.getCategorySubNo() %>" value="<%= s.getCategorySubNo() %>"><span ></span></td>
		                                        <td>
		                                            <label for="minorClass<%= s.getCategorySubNo() %>"><%= s.getCategorySubNo() %></label>
		                                        </td>   
		                                        <td>
		                                            <label for="minorClass<%= s.getCategorySubNo() %>"><%= s.getIngredientName() %></label>
		                                        </td>   
		                                    </tr>								                
						                <% } %>		            				            		
				            		<% }%>
				            	<%} %>    
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
<%------------------------------대분류 삭제모달 영역임  ---------------------------------------------------------%>
			<script>
                function mainDelExamination(){
                   var mainCheck = $('input[type="checkbox"][name="categoryMainNo"]:checked');
                   if(mainCheck.length == 0){
                      alert("삭제하고자 하는 대분류 카테고리를 선택하고 눌러주세요");
                      return false;
                   }else{
                         $("#major-del-modal").modal();                         
                   };
                   
                   if(mainCheck.length != 0){
                         var mainCatNo = mainCheck.parent().next().children().text();
                         var mainCatName = mainCheck.parent().next().next().children().text();
                                       
                         $("test1").val(mainCatNo);
                         $("#delmainCatName").text(mainCatName);
                   }
                };
             </script>   

			<!-- The Modal -->
			<div class="modal fade" id="major-del-modal" style="background-color:rgba(0,0,0,0.8);">
				<div class=" modal-dialog modal-sm">
					<div class="delete-box modal-content" style="text-align: center; margin-top: 350px; width: 400px;">
				
						<!-- Modal Header -->
						<div class="modal-header">
							<h5 class="modal-title">대분류 카테고리</h5>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>					
						
						<!-- 메소드는 편하신거 쓰셔도 될거같아요 ~  넘겨야될 메인카테고리번호 input의  id는 일단 test1으로 부여했습니다 바꾸시면되요~  
							값은 넣어두웠습니다. 
						-->
						<!-- Modal body -->
						<form action="" method="">
							<input type="hidden" name="" id="test1" value="">
						
							<div class="modal-body" style="color: red;">
								선택하신 "<span id="delmainCatName"></span>" <br>대분류 카테고리를 삭제하시겠습니까?
							</div>
							
							<!-- Modal footer -->
							<div class="modal-footer" style="justify-content: space-around; border-top: none;">
								<button type="button" class="btn btn-light btn-bg" data-dismiss="modal" style="background-color: #BEBEBE; color: white;">취소</button>
								<button type="submit" class="btn btn-danger btn-bg" data-dismiss="modal">삭제</button>
							</div>
						</form>
					
					</div>
				</div>
			</div>
<%-----------------------------대분류 삭제모달 영역임  ---------------------------------------------------------%>
<%-----------------------------소분류 삭제모달 영역임  ---------------------------------------------------------%>
             <script>  
                function subDelExamination(){
                   var subCheck = $('input[type="checkbox"][name="categorySubNo"]:checked');

	               if(subCheck.length == 0){
	                  alert("삭제하고자 하는 소분류 카테고리를 선택하고 눌러주세요");
	                  return false;
	               }else{
	                     $("#minor-del-modal").modal();             
	               };
	               
                   if(subCheck.length != 0){
                       var subCatNo = subCheck.parent().next().children().text();
                       var subCatName = subCheck.parent().next().next().children().text();
                       
                       $("test2").val(subCatNo);
                       $("#delsubCatName").text(subCatName);
                   };
	            }
            </script>
			<!-- The Modal -->
			<div class="modal fade" id="minor-del-modal">
				<div class=" modal-dialog modal-sm">
					<div class="delete-box modal-content" style="text-align: center; margin-top: 350px; width: 400px;">
				
						<!-- Modal Header -->
						<div class="modal-header">
						
							<h5 class="modal-title">소분류 카테고리</h5>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						
						<!-- 메소드는 편하신거 쓰셔도 될거같아요 ~  넘겨야될 메인카테고리번호 input의  id는 일단 test2으로 부여했습니다 바꾸시면되요~  
							값은 넣어두웠습니다. 
						-->
						
						<!-- Modal body -->
						<form action="" method="">
							<input type="hidden" name="" id="test2" value="">
						
							<div class="modal-body" style="color: red;">
	                        		선택하신 "<span id="delsubCatName"></span>" <br>소분류 카테고리를 삭제하시겠습니까?
							</div>
							
							<!-- Modal footer -->
							<div class="modal-footer" style="justify-content: space-around; border-top: none;">
								<button type="button" class="btn btn-light btn-bg" data-dismiss="modal" style="background-color: #BEBEBE; color: white;">취소</button>
								<button type="submit" class="btn btn-danger btn-bg" data-dismiss="modal">삭제</button>
							</div>
						</form>
					</div>
				</div>
			</div>
<%-----------------------------소분류 삭제모달 영역임  --------------------------------------------------------------%>
<%------------------------------대분류 수정모달 영역임  --------------------------------------------------------------%>
			<script>
                function mainModifyExamination(){
                   var mainCheck = $('input[type="checkbox"][name="categoryMainNo"]:checked');
                   if(mainCheck.length == 0){
                      alert("수정하고자하는 대분류 카테고리를 선택하고 눌러주세요");
                      return false;
                   }else{
                         $("#major-modify-modal").modal();                         
                   };
                   
                   if(mainCheck.length != 0){
                         var mainCatNo = mainCheck.parent().next().children().text();
                         var mainCatName = mainCheck.parent().next().next().children().text();
                         
                         $("#modifyMainCatNo").val(mainCatNo);
                         $("#modifyMainCatName").val(mainCatName);
                   }
                };
             </script>   
			<!-- The Modal -->
			<div class="modal fade" id="major-modify-modal">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
					
						<!-- Modal Header -->
						<div class="modal-header" style="border-bottom: none;">
							<h2 class="modal-title">대분류 카테고리 수정</h2>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
                            
						</div>
                         <form action="<%=contextPath%>/mainCatModify.cat" method="POST">
                            <!-- Modal body -->
                            <div class="modal-body" > 
                            	<input type="hidden" name="modifyMainCatNo" id="modifyMainCatNo" >
                                <span>카테고리명 : </span>
                                <input type="text" name="modifyMainCatName" id="modifyMainCatName"> 
                            </div>
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                                <button type="submit" class="btn btn-secondary">수정</button>
                            </div>
                        </form>
					</div>
				</div>
			</div>
<%------------------------------대분류 수정모달 영역 끝  -------------------------------------------------------------------%>
<%------------------------------소분류 수정모달 영역임  --------------------------------------------------------------------%>
			<!-- The Modal -->
			<script>
               
			function subModifyExamination(){
                var subCheck = $('input[type="checkbox"][name="categorySubNo"]:checked');

                if(subCheck.length == 0){
                   alert("수정하고자하는 대분류 카테고리를 선택하고 눌러주세요");
                   return false;
                }else{
                      $("#minor-modify-modal").modal();                         
                };
                
                
                if(subCheck.length != 0){
                	
                      var subCatNo = subCheck.parent().next().children().text();
                      var subCatName = subCheck.parent().next().next().children().text();
                      var mainCatNo = subCheck.parent().parent().children().eq(0).val();
                      
                      $("#modifySubCatNo").val(subCatNo);
                      $("#modifySubCatName").val(subCatName);
                   	  $("#selectMainCat").val(mainCatNo);
                     

                }
                
            };
             </script>   
             
             
             
			<div class="modal fade" id="minor-modify-modal">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
					
						<!-- Modal Header -->
						<div class="modal-header" style="border-bottom: none;">
							<h2 class="modal-title">소분류 카테고리 수정</h2>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
                            
						</div>
                        <form action="<%=contextPath%>/subCatModify.cat" method="POST">
                            <!-- Modal body -->
                            <span id="selectMainCatSpan" >대분류 :</span>
                            <!-- 성은님 위해서 막음  -->
                            <select name="selectMainCat" id="selectMainCat" onFocus="this.initialSelect = this.selectedIndex;" onChange="this.selectedIndex = this.initialSelect;">
				                <% for(MainCategory m : mainList){ %>
	                            	<option value="<%= m.getCategoryMainNo() %>"><%= m.getCategoryName() %></option>							
								<%} %>
                            </select>
                            <div class="modal-body" >
                            	<input type="hidden" name="modifySubCatNo" id="modifySubCatNo"> 
                                <span>카테고리명 : </span>
                                <input type="text" name="modifySubCatName" id="modifySubCatName"> 
                            </div>
                         
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                                <button type="submit" class="btn btn-secondary">수정</button>
                            </div>
                        </form>
                    </div>
				</div>
			</div>
<%----------------------------- 소분류 수정모달 영역 끝  -----------------------------------------------------------------------%>
<%-- ----------------------------대분류 카테고리 등록 영역 시작---------------------------------------------------------------- --%>
			<!-- The Modal -->
			<div class="modal fade" id="major-enroll-modal">
				<div class="modal-dialog modal-lg">
					<div class="modal-content cat-enroll-box">
					
						<!-- Modal Header -->
						<div class="modal-header" style="border-bottom: none;">
							<h2 class="modal-title">대분류 카테고리 등록하기</h2>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
                            
						</div>
                        <form action="mainCatEnroll.cat" method="post">
                            <!-- Modal body -->
                            <table>
                                <tr>
                                    <th>분류</th>
                                    <td><span style="color: tomato;"><b>대분류 카테고리</b></span></td>
                                </tr>
                                <tr>
                                    <th>카테고리명</th>
                                    <td><input type="text" name="mainCatName" value="" placeholder="카테고리명을 입력하세요"></td>
                                </tr>
                            </table>
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                                <button type="submit" class="btn btn-secondary">등록</button>
                            </div>
                        </form>
                    </div>
				</div>
			</div>
<%-- ----------------------------대분류 카테고리 등록 영역 끝------------------------------------------------------------------- --%>
<%-- ----------------------------소분류 카테고리 등록 영역 시작----------------------------------------------------------------- --%>
			<!-- The Modal -->
			<div class="modal fade" id="minor-enroll-modal">
				<div class="modal-dialog modal-lg">
					<div class="modal-content cat-enroll-box">
					
						<!-- Modal Header -->
						<div class="modal-header" style="border-bottom: none;">
							<h2 class="modal-title">소분류 카테고리 등록하기</h2>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
                        <form action="subCatEnroll.cat" method="POST">	
                            <span id="enrollrefMainCatSpan" >대분류 선택 </span>
                            <select name="refMainCatNo" id="enrollrefMainCat">
				                <% for(MainCategory m : mainList){ %>
	                            	<option value="<%= m.getCategoryMainNo() %>"><%= m.getCategoryName() %></option>							
								<%} %>
                            </select>
                            <!-- Modal body -->
                            <table>
                                <tr>
                                    <th>분류</th>
                                    <td><span style="color: turquoise;"><b>소분류 카테고리</b></span></td>
                                </tr>
                                <tr>
                                    <th>카테고리명</th>
                                    <td><input type="text" name="subCatName" value="" placeholder="카테고리명을 입력하세요"></td>
                                </tr>
                            </table>
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                                <button type="submit" class="btn btn-secondary">등록</button>
                            </div>
                        </form>
                    </div>
				</div>
			</div>			
<%-- ----------------------------소분류 카테고리 등록 영역 끝---------------------------------------------------------------------- --%>
        </div>
    </div>
</body>
</html>