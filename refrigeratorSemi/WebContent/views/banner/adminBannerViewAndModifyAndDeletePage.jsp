<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.refrigerator.common.model.vo.PageInfo, java.util.ArrayList , com.refrigerator.banner.model.vo.Banner"%>    
<%-- paging 처리와 값을 뽑아올 공간 --%>    
    
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Banner> list1 = (ArrayList<Banner>)request.getAttribute("list1");
	ArrayList<Banner> list2 = (ArrayList<Banner>)request.getAttribute("list2");

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
<!-- Author : Jaewon  -->

<title>관리자 배너 페이지</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
<%-- --------------------------------------------------------------------------------------------------- --%>
<style>
    #for-height{height: 920px;} 
    div{box-sizing: border-box;}
    .wrap{margin: auto; width: 1200px; height: 750px;}
    .outer{width: 1000px; height: 920px; margin-right: 25px;}

    .paging-bar{
		text-align: center;
    }

	.pagination{
		margin-top: 20px ;
		justify-content: center;
	}

    .pagination li{
        margin: 5px;
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
        margin-bottom: 15px;
    }

    .outer-body button{
        float: right;
        margin-right: 35px;
        margin-bottom: 15px;
        background-color: rgb(22,160,133) ;
        border-radius: 5px;
        border: none;
        color: white;
        width: 120px;
    }

    .outer-table{
        width: 960px;
        height: 642px;
        margin-left: 20px;
    }

    .outer-table td{
        padding-bottom: 10px;
        height: 320px;
    }
    .outer-table .card-box{
        width: 280px;
        height: 100%;
        border: 1px solid rgb(153,153,153);
        margin: auto;
    }

    .card-box:hover{
        cursor: pointer;
        transform: scale(1.02);
        border: 2px solid tomato;
    }

    .tumbnail-box{
        height: 200px;
        position: relative;
    }

    .tumbnail-box > img{
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .tumbnail-box > div{
        position: absolute;
        bottom: 0%;
        width: 100%;
        height: 40px;
        color: white;
        font-weight: bold;
        text-align: center;
        background-color: rgba(0, 0, 0, 0.4);
    }
    
    .inner-table{
        width: 100%;
        font-size: 15px;
        margin-top: 1px;
    } 

    .inner-table th:nth-child(1){
        text-align: center;
    }

    .inner-table th:nth-child(2), .inner-table th:nth-child(5) {
        text-align: center;
        color: rgb(22,160,133);
    }

    .inner-table td{
        height: 7px;
        padding: 2px;
    }
    
/* --------------------------------------------페이징 영역 시작 -------------------------------------------- */       
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
/* --------------------------------------------공통 모달 css영역 시작 -------------------------------------------- */    
    .modal-header{
        border-bottom: none;
    }

    .modal-footer{
        border-top: none;
    }
    
    .modal-content{
        width: 600px;
        height: 580px;
        margin-top: 150px;
        background-color: rgb(250,250,250);
    }
    
    .modal-header, .modal-body{
        padding-left: 45px;
    }

    .modal-header>h2{
        font-weight: bold;
        color: rgb(22,160,133);
    }

    .modal-header>button{
        font-size: 40px;
        padding-top: 10px;
    }

    .modal-content table{
        width: 500px;
        height: 390px;
    }

    .modal-content table th{
        width: 130px;
    }

    .modal-content table th>div{
        height: 35px;
        background-color: rgb(0,153,102);
        border-radius: 4px;
        color: white;
        line-height: 35px;
        padding-left: 10px;
        font-size: 15px;
    }

    .modal-content table td{
        padding-left: 10px;
    }

    .modal-content table td input{
        width: 100%;
        height: 35px;
        border-radius: 4px;
        line-height: 35px;
        padding-left: 10px;
        font-size: 15px;
        border: 1px solid lightgray;
    }

    .modal-content table td select{
        width: 100%;
        height: 35px;
        border-radius: 4px;
        line-height: 35px;
        padding-left: 10px;
        font-size: 15px;
        border: 1px solid lightgray;
    }

    .text-box{
        color: red;
        font-size: 14px;
        font-weight: bold;
    }
/* --------------------------------------------공통 모달 css영역 끝   ------------------------------------------- */
/* --------------------------------------------등록 모달 css영역 시작   ------------------------------------------- */
    #banner-enroll-Modal .modal-footer{
        height: 75px;
        width: 100%;
        display: flex;
        justify-content: space-between;
        padding: 0px;
        margin-top: 2px;
    }

    #banner-enroll-Modal .modal-footer button{
        width: 50%;
        height: 100%;
        border-radius: 0px;
        border: 1px solid lightgray;
        margin: 0px;
        font-size: 24px;
        font-weight: bolder;
        line-height: 100%;
    }

    #banner-enroll-Modal .modal-footer button:nth-child(1){
        background-color: rgb(250,250,250);
        color: rgb(190,190,190);
    }

    #banner-enroll-Modal .modal-footer button:nth-child(2){
        background-color: rgb(0,102,51);
        color: white;
        border: none;
    }
/* --------------------------------------------등록 모달 css영역 끝   ------------------------------------------- */
/* --------------------------------------------수정 삭제 모달 css영역 시작 -------------------------------------- */
    #banner-modify-Modal .modal-footer{
        height: 75px;
        width: 100%;
        padding: 0px;
        margin-top: 2px;
        position: relative;
    }

    #banner-modify-Modal .modal-footer button{
        border-radius: 5px;
        font-size: 20px;
        font-weight: bolder;
        line-height: 100%;
        border: none;
    }

    #banner-modify-Modal .modal-footer button:nth-child(1){
        position: absolute;
        left: 50%;
        transform: translateX(-55%);
        width: 220px;
        height: 55px;
        background-color: rgb(0,102,51);
    }

    #banner-modify-Modal .modal-footer button:nth-child(2){
        position: absolute;
        right: 10px;
        width: 100px;
        height: 35px;
        background-color: rgb(231,76,60);
    }
/* --------------------------------------------수정 삭제 모달 css영역 끝   -------------------------------------- */
    </style>
</head>
<body>
    <div class="wrap">
    <%@ include file="../common/admin/adminTopNavView.jsp" %>
        <div id="content">
       	<%@ include file="../common/admin/adminSideBarView.jsp" %>
            <div class="outer" style="float:right;">
                <div class="top-box">
                    <a href="">홈</a> >
                    <a href="">싸이트관리</a> >
                    <a href="">배너관리</a>
                </div>
                <div class="outer-body">
                    <h2><b>배너관리</b></h2>
                    <button type="button" data-toggle="modal" data-target="#banner-enroll-Modal">배너 등록</button>
                    <br clear="both">
                    <table class="outer-table">
                        <tr>
							<%for(Banner brow1 : list1){%>                        
	                            <td>
	                                <div class="card-box" onclick="deliverInfo(this);"  data-toggle="modal" data-target="#banner-modify-Modal">
	                                	<input type="hidden" value="<%= brow1.getBannerNo() %>">
	                                    <div class="tumbnail-box" >
	                                        <img src="<%= brow1.getBannerImg() %>">
	                                        <div class="title-box"><%= brow1.getBannerName() %></div>
	                                        <table class="inner-table">
	                                            <tr>
	                                                <th><i class="fas fa-clipboard-list fa-lg"></i></th>
	                                                <th>분류</th>
	                                                <td><%= brow1.getBannerCategory() %></td>
	                                                <th><i class="far fa-check-circle fa-lg"></i></th>
	                                                <th>상태</th>
	                                                <td><%= brow1.getBannerStatus().equals("Y")? "게시중" : "보류중" %></td>
	                                            </tr>
	                                            <tr>
	                                                <th><i class="far fa-calendar-alt fa-lg"></i></th>
	                                                <th>시작일</th>
	                                                <td colspan="4"><%= brow1.getStartDate() == null? "미정" : brow1.getStartDate()%></td>
	                                            </tr>
	                                            <tr>
	                                                <th><i class="far fa-calendar-check fa-lg"></i></th>
	                                                <th>종료일</th>
	                                                <td colspan="4"><%= brow1.getEndDate() == null? "미정" : brow1.getEndDate()%></td>
	                                            </tr>
	                                            <tr>
	                                                <th><i class="fas fa-city"></i></th>
	                                                <th>담당업체</th>
	                                                <td colspan="4"><%= brow1.getCompanyName() %></td>
	                                            </tr>
	                                        </table>
	                                    </div>
	                                </div>
	                            </td>
                    		<%} %>                        
                        </tr>
                        <tr>
                			<%for(Banner brow2 : list2){%>                        
	                            <td>
	                                <div class="card-box" onclick="deliverInfo(this);" data-toggle="modal" data-target="#banner-modify-Modal">
                                       	<input type="hidden" value="<%= brow2.getBannerNo() %>">	                                
	                                    <div class="tumbnail-box" >
	                                        <img src="<%= brow2.getBannerImg() %>">
	                                        <div class="title-box"><%= brow2.getBannerName() %></div>
	                                        <table class="inner-table">
	                                            <tr>
	                                                <th><i class="fas fa-clipboard-list fa-lg"></i></th>
	                                                <th>분류</th>
	                                                <td><%= brow2.getBannerCategory() %></td>
	                                                <th><i class="far fa-check-circle fa-lg"></i></th>
	                                                <th>상태</th>
	                                                <td><%= brow2.getBannerStatus().equals("Y")? "게시중" : "보류중" %></td>
	                                            </tr>
	                                            <tr>
	                                                <th><i class="far fa-calendar-alt fa-lg"></i></th>
	                                                <th>시작일</th>
	                                                <td colspan="4"><%= brow2.getStartDate() == null? "미정" : brow2.getStartDate()%></td>
	                                            </tr>
	                                            <tr>
	                                                <th><i class="far fa-calendar-check fa-lg"></i></th>
	                                                <th>종료일</th>
	                                                <td colspan="4"><%= brow2.getEndDate() == null? "미정" : brow2.getEndDate()%></td>
	                                            </tr>
	                                            <tr>
	                                                <th><i class="fas fa-city"></i></th>
	                                                <th>담당업체</th>
	                                                <td colspan="4"><%= brow2.getCompanyName() %></td>
	                                            </tr>
	                                        </table>
	                                    </div>
	                                </div>
	                            </td>
                    		<%} %>                               
                        </tr>
                    </table>
                </div>

<%------------------------------------- 페이징바 영역 --------------------------------------------------------%>
		        <div align="center" class="paging-area">
		
					<% if(currentPage != 1){ %>
		            	<button onclick="location.href='<%= request.getContextPath() %>/adlist.ba?currentPage=<%= currentPage-1 %>';">&lt;</button>
		            <%} %>
		            
		            <% for(int p=startPage; p<=endPage; p++){ %>
		            	<% if(p != currentPage) {%>	
		            		<button onclick="location.href='<%= request.getContextPath()%>/adlist.ba?currentPage=<%= p %>';"><%= p %></button>
		            	<%}else{ %>
		         	    	<button id="dis-btn" disabled><%= p %></button>
		            	<%}%>
		            <%}%>
			
					<% if(currentPage != maxPage){ %>                        
		            	<button onclick="location.href='<%= request.getContextPath() %>/adlist.ba?currentPage=<%= currentPage+1 %>';">&gt;</button>
		            <%} %>
		        </div>


            </div>
<%-----------------------------------------  등록 모달 영역임 --------------------------------------------------%>            
            <!-- The Modal -->
            <div class="modal fade" id="banner-enroll-Modal">
                <div class="modal-dialog">
                    <div class="modal-content" style="width:540px" >

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h2 class="modal-title">배너등록</h2>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <form action="adInsert.ba" method="post" enctype="multipart/form-data">
                            <!-- Modal body -->
                            <div class="modal-body">
                                <table>
                                    <tr>
                                        <th>
                                            <div>배너명</div>
                                        </th>
                                        <td>
                                            <input type="text" name="bannerName" required>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <div>담당 업체명</div>
                                        </th>
                                        <td>
                                            <input type="text" name="companyName" required>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <div>분류</div>
                                        </th>
                                        <td>
                                            <select name="bannerCategory" required>
                                                <option value="이벤트">이벤트</option>
                                                <option value="공모전">공모전</option>
                                                <option value="광고">광고</option>
                                                <option value="레시피배너">레시피배너</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <div>배너 위치</div>
                                        </th>
										<td>
											<select name="bannerStatus">
												<option value="N" selected>보류중</option>
											</select>
										</td>                                    
                                    </tr>
                                    <tr>
                                        <th>
                                            <div>배너 위치</div>
                                        </th>
                                        <td>
                                            <select name="page" required>
                                                <option value="none">선택안함</option>
                                                <option value="banner1">배너1</option>
                                                <option value="banner2">배너2</option>
                                                <option value="banner3">배너3 </option>
                                                <option value="main1">레시피배너1</option>
                                                <option value="main2">레시피배너2</option>
                                                <option value="main3">레시피배너3</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <div>시작일</div>
                                        </th>
                                        <td>
                                            <input type="date" name="startDate">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <div>종료일</div>
                                        </th>
                                        <td>
                                            <input type="date" name="endDate">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-box" colspan="2">※ 이미지 비율은 배너사이즈에 맞는 이미지를 첨부하세요</td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <div>이미지 첨부파일</div>
                                        </th>
                                        <td>
                                            <input type="file" name="bannerImg" id="" required>
                                        </td>
                                    </tr>
                                </table>
                            </div>

                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="button" data-dismiss="modal">취소</button>
                                <button type="submit">등록</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
<%---------------------------------------- 등록 모달 영역임 -------------- -------------------------------------%>
<%-----------------------------------------  수정 모달 영역임 --------------------------------------------------%>
			<script>
				var bno;
			
				function deliverInfo(bannerParent){	
					var bannerNo = $(bannerParent).children('input').val();
					$("input[name='bannerNo']").val(bannerNo) ;
					bno=bannerNo;
					$.ajax({ 
						url : "selectBanner.ba",
						data : {bannerNo: bno},
						type:"post", 
						success: function(result){ 
							
							$("#detailBanner input[name='bannerName']").val(result.bannerName);
							$("#detailBanner input[name='companyName']").val(result.companyName);
							$("#detailBanner select[name='bannerCategory']").val(result.bannerCategory).prop("selected", true);
							$("#detailBanner select[name='bannerStatus']").val(result.bannerStatus).prop("selected", true);
							$("#detailBanner select[name='page']").val(result.page).prop("selected", true);
							
						    if(result.startDate != null){
								var splitStart = result.startDate.split("/");
								$("#detailBanner input[name='startDate']").val(splitStart[0]+"-"+splitStart[1]+"-"+splitStart[2]);						    	
						    }

						    if(result.endDate != null){
								var splitEnd = result.endDate.split("/");
								$("#detailBanner input[name='endDate']").val(splitEnd[0]+"-"+splitEnd[1]+"-"+splitEnd[2]);						    
						    }

							$("#fileName").html(result.bannerImg.replace("resources/banner_upfiles/",""));
							
							$("#detailBanner input[name='deleteFile']").val(result.bannerImg.replace("resources/banner_upfiles/",""));
						},
						error:function(){
							console.log("ajax통신실패");
							alert("예상치 못한 오류로 인해 조회가 불가합니다 개발자에게 문의하세요")
						}
					})
				};
				
            	function deleteBanner(){
    				
    				$.ajax({ 
    					url : "adDelete.ba",
    					data : {bannerNo: bno},
    					
    					type:"get", 
    					success: function(result){  
							alert(result);
    					},
    					complete:function(){
    						location.href="<%= request.getContextPath() %>/adlist.ba?currentPage=1";
    					}
	    				});        		
           		}
			</script>

            <!-- The Modal -->
            <div class="modal fade" id="banner-modify-Modal">
                <div class="modal-dialog">
                    <div class="modal-content" style="width:540px">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h2 class="modal-title">배너 수정 및 삭제</h2>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <form action="adUpdate.ba" id="detailBanner" method="post" enctype="multipart/form-data">
                            <!-- Modal body -->
                            <div class="modal-body">
                                <table>
                                	<input type="hidden" name="bannerNo" required>
                                    <tr>
                                        <th>
                                            <div>배너명</div>
                                        </th>
                                        <td>
                                            <input type="text" name="bannerName" required>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <div>담당 업체명</div>
                                        </th>
                                        <td>
                                            <input type="text" name="companyName" required>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <div>분류</div>
                                        </th>
                                        <td>
                                            <select name="bannerCategory" required>
                                                <option value="이벤트">이벤트</option>
                                                <option value="공모전">공모전</option>
                                                <option value="광고">광고</option>
                                                <option value="레시피배너">레시피배너</option>
                                            </select>
                                        </td>
                                    </tr>
		                            <tr>
                                        <th>
                                            <div>배너 위치</div>
                                        </th>
										<td>
											<select name="bannerStatus" required>
												<option value="N" >보류중</option>
												<option value="Y" >게시중</option>												
											</select>
										</td>                                    
                                    </tr>
                                    <tr>
                                        <th>
                                            <div>배너 위치</div>
                                        </th>
                                        <td>
                                            <select name="page" required>
                                                <option value="none">선택안함</option>
                                                <option value="banner1">배너1</option>
                                                <option value="banner2">배너2</option>
                                                <option value="banner3">배너3 </option>
                                                <option value="main1">레시피배너1</option>
                                                <option value="main2">레시피배너2</option>
                                                <option value="main3">레시피배너3</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <div>시작일</div>
                                        </th>
                                        <td>
                                            <input type="date" name="startDate">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <div>종료일</div>
                                        </th>
                                        <td>
                                            <input type="date" name="endDate" id="">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-box" colspan="2">※ 이미지 비율은 배너사이즈에 맞는 이미지를 첨부하세요</td>
                                    </tr>
                                    <tr>
                                        <td class="text-box" colspan="2" style="color:blue;">기존에 업로드한 수정된 파일명 : <span id="fileName"></span></td>
                                    </tr>
                                    
                                    <tr>
                                        <th>
                                            <div>이미지 첨부파일</div>
                                        </th>
                                        <td>
                                        	<input type="hidden" name="deleteFile"> 
                                            <input type="file" name="bannerImg">
                                        </td>
                                    </tr>
                                </table>
                            </div>

                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-danger">수정</button>
                                <button type="button" onclick="deleteBanner();" class="btn btn-danger">삭제</button>
                            </div>
                                                        
                        </form>
                    </div>
                </div>
            </div>
           
<%----------------------------------------- 수정 모달 영역임 ---------------------------------------------------%>
        </div>
    </div>
</body>
</html>