<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList,
				 com.refrigerator.common.model.vo.PageInfo,
			     com.refrigerator.banner.model.vo.Banner"
%>

<%
	ArrayList<Banner> list = (ArrayList<Banner>)request.getAttribute("list");
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<style>
    @import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
    body { font-family: 'Noto Sans KR', sans-serif; }
    .total_outer{
        color: black;
        width: 1200px;
        margin: auto;
    }
    .table-warp{
        width: 1000px;
        height: 100px;
        font-size: 16px;
        margin: 0 10px;
    }

    .select-list>a{
        text-decoration: none;
        color: black;
    }
    .search-container button{
        background-color: #28a745;
        color: white;
    }
    .member-btn a{
        background: #28a745;
    }


    .checked-bannerList>tr:hover{
        cursor: pointer;
        background-color: rgb(248, 248, 248);
        opacity: 0.7;
    }

    .thead{
        background-color: rgb(224, 224, 224);
    }
    
    /*모달창내부 : 제목*/
    .modal-body-content div{
        width: 120px;
        height: 30px;
        background-color: #28a745;
        border-radius: 5px;
        color:white;
        text-align: center;
        margin:10px 20px;  
        font-size: 14px;
        line-height: 30px;
    }

    .paging-area{
        margin: 40px 0 50px 0;
    }
    

    /* 모달 */
    .modal-dialog.modal-80size {
    width: 100%;
    height: 100%;
    margin: 100px 0;
    padding: 0;
    }
    .modal-content.modal-80size {
    height: auto;
    min-height: 80%;
    }
    .modal.modal-center {
    text-align: center;
    }
    .modal-dialog.modal-center {
    display: inline-block;
    text-align: center;
    vertical-align: middle;
    }
    #myModalLabel{
        text-align: center;
        font-weight: bold;
    }
    .modal-content-wrap{
        margin: auto;
    }
    .modal-body-content input , .modal-body-content select{ /*모달창내부 input*/
        width: 400px;
    }
    .btn-submit{ /*닫기버튼*/
        background-color: #28a745;
        border-radius: 5px;
        color:white;
        text-align: center;
    }

</style>

</head>
<body>

    <%@ include file="../common/admin/adminTopNavView.jsp" %>

    <div class="total_outer">

        <%@ include file="../common/admin/adminSideBarView.jsp" %> 
        
        <!-- 본문 내용 area -->
        <div class="outer">

            <div class="select-list"  align="right" style="width: 450px;" >
                <a href="">홈</a> >
                <a href="">사이트 관리</a> >
                <a href="">배너</a>
            </div>
            <br>


            <br><br>

            <!-------------------------------------------------- 테이블 -------------------------------------------------->

            <div class="btn" align="right" style="width: 300px;">

                <a class="btn btn-sm btn-success" data-toggle="modal" data-target="#my80sizeCenterModal">등록</a>
                    
            </div>  

            <!--레시피 목록 영역-->
            <table class="table-warp" border="1" align="center">

                <thead class="thead">
                    <tr align="center" >
                        <th width="50">분류</th> 
                        <th colspan="2" width="90">레시피 제목</th>
                        <th width="60">작성자</th> 
                        <th width="30">상태</th>
                        <th width="90">배너 등록일</th>
                        <th width="90">배너 수정일</th>
                        <th width="90">배너 종료일</th>
                        <th width="50">레시피 이미지</th>
                        <th colspan="2" width="30" >수정/삭제</th>    
                    </tr>

                </thead>

                <tbody class="checked-bannerList">
                    <%if(list.isEmpty()) { %>
                            
                        <tr>
                            <td colspan="11" style="text-align: center;">등록된 배너 레시피가 없습니다.</td>
                        </tr>
                            
                        <% } else {%>
                        
                            <% for(Banner ba : list) { %>
                                
                                <tr align="center">
                                    
                                    <input type="hidden" name="bannerNo" value = <%=ba.getBannerNo()%> >
                                    <th width="30"><%=ba.getBannerCategory() %></th> 
                                    <th colspan="2" width="200"><%=ba.getBannerName() %></th>
                                    <th width="40"><%=ba.getCompanyName() %></th> 
                                    <th width="30"><%=ba.getBannerStatus() %></th>
                                    <th width="60"><%=ba.getEnrollDate() %></th>
                                    <th width="60"><%=ba.getModifyDate() %></th>
                                    <th width="60"><%=ba.getEndDate() %></th>
                                    <th width="30"><%=ba.getBannerImg() %></th>
                                    <td><button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#banner_modify_Modal" onclick="modifyBanner(this);">수정</button></td>
                                    <td><a class="btn btn-sm btn-danger" data-toggle="modal" data-target="#banner_delete_Modal" onclick="deleteBanner();">삭제</a></td>
                                </tr>

                        <%} %>

                    <%} %>
                </tbody>

                                        
            </table>
            
            <!-------------------------------------------------- 모달 -------------------------------------------------->

            <!---------------------------------------------- 1. 등록 모달 ---------------------------------------------->
                <div class="modal modal-center fade" id="my80sizeCenterModal" tabindex="-1" role="dialog" aria-labelledby="my80sizeCenterModalLabel">
                    <div class="modal-dialog modal-80size modal-center" role="document">

                        <!-- 모달 창 영역 -->
                        <div class="modal-content modal-80size" style="width: 800px;">
                            <div class="modal-content-wrap">
                                <!-- header -->
                                <div class="modal-header">
                                    <h4 class="modal-title" id="myModalLabel">배너 등록</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                </div>

                                <!-- body+footer영역 감싸는 form -->
                                <form action="<%=contextPath%>/adRecipeInsert.banner" method="post" enctype="multipart/form-data">
                                    <!-- body -->
                                    <div class="modal-body">
                                        <div class="modal-body-content">
                                                        
                                            <table>
                                                <!--배너번호 hidden-->
                                                <tr>
                                                    <td><input type="hidden" name="bannerNo" id="bannerNo" value=""></td>
                                                </tr>
                                                <tr>
                                                    <td><div class="modal-Banner-category">분류</div></td>
                                                    <td>
                                                        <select id="enrollBannerCategory" name="bannerCategory" >
                                                            <option value="이벤트">이벤트</option>
                                                            <option value="공모전">공모전</option>
                                                            <option value="광고">광고</option>
                                                            <option value="레시피 배너">레시피 배너</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><div class="modal-recipe-title">레시피 제목</div></td>
                                                    <td><input type="text" id="enrollBannerTitle"  name="bannerName" placeholder="제목을 입력해주세요"></td>
                                                </tr>
                                                <tr>
                                                    <td><div class="modal-recipe-nickname">작성자</div></td>
                                                    <td><input type="text" id="enrollCompanyName"  name="companyName" placeholder="작성자의 닉네임을 입력해주세요"></td>
                                                </tr>
                                                <tr>
                                                    <td><div>상태</div></td>
                                                    <td>
                                                        <select id="bannerStatus"  name="bannerStatus" >
                                                            <option value="Y">게시중</option>
                                                            <option value="N">게시안함</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><div>배너 시작일</div></td>
                                                    <td><input type="date" id="enrollStartDate" name="startDate"></td>
                                                </tr>
                                                <tr>
                                                    <td><div>배너 종료일</div></td>
                                                    <td><input type="date" id="enrollEndDate" name="endDate"></td>
                                                </tr>
                                                <tr>
                                                    <td><div>레시피 대표이미지</div></td>
                                                    <td><input type="file"  id="enrollBannerUpfile" name="bannerImg"></td> 
                                                </tr>
            
                                            </table>
            
                                        </div>
                                    </div>
                                    <!-- footer -->
                                    <div class="modal-footer">
                                        <input type="submit" class="btn btn-success" value="등록"></input>
                                    </div>
                                </form> 


                            </div>
                        </div>
                    </div>
                </div>


            <!---------------------------------------------- 2. 수정 모달 ---------------------------------------------->
            
            <form action="<%=contextPath%>/adRecipeUpdate.banner" id="modify-modal_form" method="post" enctype="multipart/form-data">
            <div class="modal modal-center fade" id="banner_modify_Modal" tabindex="-1" role="dialog" aria-labelledby="my80sizeCenterModalLabel">
                <div class="modal-dialog modal-80size modal-center" role="document">

                    <!-- 모달 창 영역 -->
                    <div class="modal-content modal-80size" style="width: 800px;">
                        <div class="modal-content-wrap">
                            <!-- header -->
                            <div class="modal-header">
                                <h4 class="modal-title" id="myModalLabel">배너 등록</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            </div>

                            <!-- body -->
                            <div class="modal-body">
                                <div class="modal-body-content">
                                                    
                                    <table>
                                        <!--배너번호 hidden-->
                                        <tr>															<!-- value값이 여기서 안들어감 -->
                                            <td><input type="hidden" name="updateNo" id="passedUpdateNo" value=""></td>
                                        </tr>
                                        <tr>
                                            <td><div class="modal-Banner-category">분류</div></td>
                                            <td>
                                                    <select id="updateBannerCategory" name="updateBannerCategory" value="">
                                                        <option value="이벤트">이벤트</option>
                                                        <option value="공모전">공모전</option>
                                                        <option value="광고">광고</option>
                                                        <option value="레시피 배너">레시피 배너</option>
                                                    </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><div class="modal-recipe-title">레시피 제목</div></td>
                                            <td><input type="text" id="updateBannerName"  name="updateBannerName" value="" placeholder="제목을 입력해주세요"></td>
                                        </tr>
                                        <tr>
                                            <td><div class="modal-recipe-nickname">작성자</div></td>
                                            <td><input type="text" id="updateCompanyName"  name="updateCompanyName" value="" placeholder="작성자의 닉네임을 입력해주세요"></td>
                                        </tr>
                                        <tr>
                                            <td><div>상태</div></td>
                                            <td>
                                                    <select id="updateBannerStatus" name="updateBannerStatus" value="">
                                                        <option value="Y">게시중</option>
                                                        <option value="N">게시안함</option>
                                                    </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><div>배너 시작일</div></td>
                                            <td><input type="date" id="updateStartDate" name="updateStartDate" value=""></td>
                                        </tr>
                                        <tr>
                                            <td><div>배너 종료일</div></td>
                                            <td><input type="date" id="updateEndDate" name="updateEndDate" value=""></td>
                                        </tr>
                                        <tr>
                                            <td><div>레시피 대표이미지</div></td>
                                            <td><input type="file"  id="updateBannerImg" name="updateBannerImg" value=""></td> 
                                        </tr>
        
                                    </table>
        
                                </div>
                            </div>
                            <!-- footer -->
                            <div class="modal-footer">
                                <input type="submit" class="btn btn-success" value="등록"></input>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
            </form>

            <!---------------------------------------------- 3. 삭제 모달 ---------------------------------------------->
            <form action="<%=contextPath%>/adRecipeDelete.banner" id="delete-modal_form" >
                
                <div class="modal" id="banner_delete_Modal">
                <div class="modal-dialog modal-dialog-centered">
                <!-- 모달 전체 -->
                <div class="modal-content">
                
                    <!-- 모달 헤더영역 -->
                    <div class="modal-header">
                        <h4 class="modal-title"><b>배너 삭제</b></h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                                
                    <!-- 모달 관리자작성영역 -->
                    <input type="hidden" name="deleteBannerNo" id="deleteBannerNo">
                    <div class="modal-body">
                        메인에서 해당 배너 레시피를 삭제하시겠습니까?
                    </div>
                                
                    <!-- 모달 푸터 -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">취소</button>
                        <button type="submit" class="btn btn-danger btn-sm">삭제</button>
                    </div>
                            
                </div>
                </div>
                </div>
                        
            </form>

            

            
            
            
            <!-------------------------------------------------- paging -------------------------------------------------->
                
            <div class="paging-area" align="center">

                    <% if(currentPage != 1) { %>
                        <button onclick="location.href='<%=contextPath%>/adRecipeList.banner?currentPage=<%=currentPage-1%>';">&lt;</button>
                    <% } %>
                        
                    <% for(int p=startPage; p<=endPage;p++) {%>
                    
                            <% if(p != currentPage) {%>
                                <button onclick="location.href='<%=contextPath%>/adRecipeList.banner?currentPage=<%=p%>';"><%=p%></button>
                            <%} else { %>
                                <button disabled><%= p %></button>
                            <%} %>
                        
                    <%} %>
                        
                    <%if(currentPage != maxPage) {%>
                        <button onclick="location.href='<%=contextPath%>/adRecipeList.banner?currentPage=<%=currentPage+1%>';">&gt;</button>
                    <%} %>
                        
            </div>
                
            
            


        </div>    
    </div>


    <script> 

        /* 수정하기 버튼 클릭시, 이벤트 번호를 모달로 전달 */
        function modifyBanner(passedBtn){

        	var bannerNo = $(passedBtn).parent().parent().children("input[type='hidden']").val();

        	$("#passedUpdateNo").val(bannerNo);

            //$("#updateNo").val(bannerNo);
            
            <% for(Banner ba : list) { %>
                        
            
                if(bannerNo == <%=ba.getBannerNo()%>){
                	
                	$("#updateBannerCategory").val("<%=ba.getBannerCategory()%>");
                	$("#updateBannerName").val("<%=ba.getBannerName()%>");
                	$("#updateCompanyName").val("<%=ba.getCompanyName()%>");
                	$("#updateBannerStatus").val("<%=ba.getBannerStatus()%>");
                    
                    $("#updateStartDate").val("<%=ba.getStartDate()%>");
                    $("#UpdateEndDate").val("<%=ba.getEndDate()%>");
                }
                
                  
            <%}%>
            
            
        }
        
        /* 삭제하기 버튼 클릭시, 이벤트 번호를 모달로 전달 */
        function deleteBanner(){
        
            $("#deleteBannerNo").val($(event.target).parent().siblings("input[type=hidden]").val());

        }
  
    </script>

    


</body>
</html>