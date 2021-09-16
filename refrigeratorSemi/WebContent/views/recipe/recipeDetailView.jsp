<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.refrigerator.recipe.model.vo.*"%>

<%@ page import =" java.util.ArrayList, com.refrigerator.recipe.model.vo.Review
				,com.refrigerator.category.model.vo.*
				,com.refrigerator.reicpe_order.model.vo.*
				,com.refrigerator.ingre.model.vo.*
				,com.refrigerator.ingre_search.model.vo.*
				,com.refrigerator.reply.model.vo.*
				,com.refrigerator.review.model.vo.*" %>
				
<%

	ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");
	ArrayList<RecipeOrder>list2 = (ArrayList<RecipeOrder>)request.getAttribute("list2");
	ArrayList <Ingre> ingre = (ArrayList<Ingre>)request.getAttribute("ingre");
	ArrayList <SubIngre> subIngre = (ArrayList<SubIngre>)request.getAttribute("subIngre");
	ArrayList <IngreSearch> ingreSearch = (ArrayList<IngreSearch>)request.getAttribute("IngreSeach");
	
	int recipeNo = (int)request.getAttribute("recipeNo");
	int reviewCount = (int)request.getAttribute("reviewCount");
	int replyCount = (int)request.getAttribute("replyCount");
	
	Recipe rc = (Recipe)request.getAttribute("rc");

	/*menubar.jsp로 가져갈 구문*/
	String alertMsg = (String)session.getAttribute("alertMsg"); 
%>



																						<!-- @author seong -->
																						<!-- @date 0528 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

	@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
        body { font-family: 'Noto Sans KR', sans-serif; }
        
    .total-outer{
        margin:auto;
        margin-top:50px;
        width: 1200px;

    }
    #main-img{
        margin: auto;
        width: 600px; 
        height:500px;
        box-sizing: border-box;
    }

    #main-img:hover{
        cursor: pointer;
        opacity:0.7;
    }


    * {margin:0;padding:0;}
    .bannner {position:relative;display:inline-block;}
    .bannner img {max-width:100%;}
    .bannner span.text {
        position:absolute;
        top:95%;
        left:5px;
        transform:translateY(-50%);
        display:none;
        width:100%;
        font-size:11px;
        color:#fff;
        font-weight:800;
        }


    .bannner::before, .bannner::after{content:'';position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);transition:all .8s;-webkit-transition:all .8s;}
    .bannner::before {width:97%;height:95%;border-top:2px solid #fff;border-bottom:2px solid #fff;width:0;} 
    .bannner::after {width:97%;height:95%;border-left:2px solid #fff;border-right:2px solid #fff;height:0;} 

    /* 마우스가 올라가면 반응하는 소스 */
    .bannner:hover span.text {display:block;}
    .bannner:hover::before {width:calc(97% + 4px);}
    .bannner:hover::after {height:calc(95% + 4px);} 
 


    /*레시피 소개 영역*/
    .recipe-main-info {

        text-align: center;
        margin-bottom: 10px;
        

    }

    .recipe-sub-info{
        background-color: rgb(248, 248, 248);
        border: 1px solid rgb(248, 248, 248);
        width: 600px;
        height: 60px;
        margin: auto;
        margin-top: 10px;
        text-align: center;
        font-size: 12px;
        line-height: 60px;
    }


    .icon,.recipe-sub-info>img{
        width: 30px;
    }

    /*이미지 슬라이드*/
    .slider {
        width: 700px;
        height: 550px;
        position: relative;
        margin: auto;
    }
    .slide {
        width: 600px;
        height: 600px;
        background-size: cover;
        border-radius: 10px;
        animation: fade 2s;
        display: none;
        margin: auto;
    }


    .cooking-order-img {
        width: 600px;
        height: 600px;
    }

        
    .prev,.next {
        cursor: pointer;
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        font-size: 2rem;
        transition: 0.6s ease;
        border-radius: 5px;
        color:rgb(0, 153, 102);
    }

    .next {
        right: 0;
    }
    .prev:hover,
    .next:hover {
        background-color: rgba(190, 190, 190, 0.5);
    }

    @keyframes fade {
        from {
            opacity: 0.4;
    }
        to {
            opacity: 1;
    }
    }

        

    .recipe-sub-info>div{
        display: inline-table;
    }

    .recipe-sub-info>div>span{
        color:rgb(0, 153, 102);
    }

    .report-user-btn, .reply-enroll-btn{
        color : rgb(190, 190, 190);
        text-decoration: none;
        font-size: 12px;
        padding-right: 200px;
    }

    .ingredients-info>div{
        text-align: center;
        font-size: 15px;
        margin-bottom: 20px;

    }

    /*재료 관련 영역*/
    .ingre-info-main, .ingre-info-add{
        display: inline-table;
    }
    
    .ingre-info-main , .ingre-info-add {
        font-size: 15px;
        margin-left: 30px;
    }

    .igre-calculator>div{
        padding: 10px;
        font-size: 12px;
        cursor: pointer;
    }



    .select-view>div{
        display:inline-table;
    }

    .select-view a{
        color : black;
        text-decoration: none;
        font-size: 11px;
    }



     /*재료 검색 버튼*/
    .ingredients-search{
        text-align: center;
        margin-top: 50px;
    }

    .ingredients-search>button{
        border-radius: 40px;
    }

     /*요리 후기 관련 영역*/

    #review-enroll-btn{
       font-size: 12px;
       margin-left: 650px;
    }

    
    .recipe-review-header>div{
        display: inline-table;

    }

    #review-detail:hover{
       cursor: pointer;
    }



    #review-modal-btn{
     top:50%; left:50%;
    width: 100px; height:100px; margin-top:-15px; margin-left:-60px;
    line-height:15px; cursor:pointer;
  
    }

    .reveiw-img-modal{
        width:100%; height:100%; background: rgba(224, 224, 224, 0.43); top:0; left:0; display:none;
    }

    .reveiw-img-modal-content{
        width:600px; height:500px;
        background:#fff;
        position:relative; top:50%; left:45%;
        margin-top:-100px; margin-left:-200px;
        text-align:center;
        box-sizing:border-box; padding:74px 0;
        line-height:23px; cursor:pointer;
    }



    /*댓글 관련 영역*/

        /*프로필*/
        
    .box {
        width: 40px;
        height: 40px; 
        border-radius: 70%;
        overflow: hidden;
    }
    .profile {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }
        
    .reply-detail{
        font-size: 12px;
    }

    .reply-deatil-content, #review-detail{
        font-size: 11px;
    }

    .area-header,.recipe-review-header{
		margin:auto;
        algin : center;
        width:800px;
    }
    
    /*신고하기 모달*/
    .report-mbody div{
        width: 300px;
        height: 30px;
        color: rgb(0, 120, 51);
        font-weight: bold;
        border-radius: 5px;
        text-align: center;
        margin: 10px;  
        font-size: 15px;
        line-height: 30px;
    }
    /*.modal-header, .modal-content, .modal-footer{border: 0px;}*/
</style>


<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>



</head>
<body>
	
	<!--menubar.jsp로 가져갈 구문-->
	<script>
	 	var msg = "<%= alertMsg %>"; 
	 	if(msg != "null"){
		 	alert(msg);	 
			<% session.removeAttribute("alertMsg"); %>
	 	};
	</script>
	
	<%@ include file="../common/user/menubar.jsp" %>


	  <!--전체 감싸는 div-->
    <div class="total-outer">
    
		<%@ include file="../common/user/recipeSideBar.jsp" %>

        
        <div align="center">
            <div class="bannner">
                <img src="<%=rc.getMainImg()%>" id="main-img">
                <span class="text" align="right" style="width: 580px;">
                    <span><img src="<%=contextPath%>/resources/image/icon-star.png" alt=""><%=rc.getAvrgStarPoint()%></span>
                    <span><img src="<%=contextPath%>/resources/image/icon-bookmark.png" alt=""><%=rc.getScrapCount()%></span>
                    <span></spn><img src="<%=contextPath%>/resources/image/icon-view.png" alt=""><%=rc.getCount() %></span>
                </span>
            </div>
        </div>



        <br><br>

        <div class="recipe-main-info">
            <div><h3><%=rc.getRecipeTitle()%></h3></div>
            <br>
            <div><%=rc.getRecipeIntro() %></div>
        </div>
        <br>
        <div class="recipe-sub-info">
            <img src="<%=contextPath%>/resources/image/icon-servings.png">
            <div> 
                <span class="recipe-sub-info-servings"><b><%=rc.getSeveralServings() %></b></span>명이서 먹을 수 있어요 
            </div>

            <img src="<%=contextPath%>/resources/image/icon-cooking-time.png">
            <div>
                <span class="recipe-sub-info-cooking-time"><b><%=rc.getCookingTime() %></b></span>분정도 걸려요 
            </div>
        </div>
		<!-- 레시피 찜하기 -->
		<%if(loginUser != null) { %>
			<form action="<%=contextPath%>/insert.scrap">
		        <div class="recipe-scrape" align="center" onclick="scrapInsert();">
		            <br><br>
		            <input type="hidden" name="userNo" value="<%=loginUser.getUserNo()%>">
		            <input type="hidden" name="recipeNo" value="<%=rc.getRecipeNo()%>">
		            <button type="submit" class="btn btn-outline-success btn-sm">이 레시피를 찜할래요</button>
		        </div>
			</form>
		<% }else{ %>
			
		<% } %>
	
        <br>
        
		<!-- 신고하기 -->
		<form action="<%=contextPath %>/insertRecipe.repo"> 
			<% if(loginUser != null) { %>
		        <div align="right" class="report-user">
		            <!--로그인한 사용자만 신고할 수 있도록-->
		            <a href="" class="report-user-btn" data-toggle="modal" data-target="#recipe-report">신고하기</a>
		            
		            
		            <!-- The Modal -->
	                    <div class="modal" id="recipe-report" >
	                    <div class="modal-dialog modal-dialog-centered ">
	                    <div class="modal-content report-modal" >
	                
	                        <!-- Modal Header -->
	                        <div class="modal-header">
	                        <div>
					        	<input type="hidden" name="userNo" value="<%=loginUser.getUserNo()%>">
					            <input type="hidden" name="recipeNo" value="<%=rc.getRecipeNo()%>">
	                            <span style="text-align: center;"><b>레시피</b> 신고</span>
	                        </div>
	                        <button type="button" class="close" data-dismiss="modal">&times;</button>
	                        </div>
	                        
	                        <!-- Modal body -->
	                        <div class="modal-body">
	                            <div class="modal-body-list report-mbody">
	                                
	                                <table>
	                                    <tr>
	                                        <th>
	                                            신고 사유
	                                        </th>
	                                        <td>
	                                        	<input type="text" name="report-re" id="report-re" placeholder="신고사유를 적어주세요">
	                                        </td>
	                                    </tr>
	                                    
	                                </table>
	                            </div>
	  
	                        </div>
	                
	                        <!-- Modal footer -->
	                        <div class="modal-footer">
	                        <button type="submit" class="btn btn-success">신고하기</button>
	                        </div>
	                
	                    </div>
	                    </div>
	                    </div>
		        </div>
			<% } %>
		</form>
		<!-- 신고하기 끝 -->

        <br>
        <hr class="area-header">

        <br><br>

        <div class="ingredients-info"  align="center">

            <!--필수 재료 -->
            <div class="ingre-info-main" >
                	준비해주세요

                <table class="ingredients-detail">
				
					 <hr width="100px">
						
						<script>
							var ingArr = [];
							var subArr = [];
						</script>
					
						<!-- 필수 재료 출력되는 구문 -->
						<% for(int i=0; i<ingre.size();i++) { %>
		                    <tr>
		                        <th><%=ingre.get(i).getIngreName()%></th>
		                        <td id="ing<%=i%>"><%=ingre.get(i).getIngreAmount() / rc.getSeveralServings()%></td>
		                        <td><%=ingre.get(i).getIngreUnit() %></td>
								
		                    </tr>
		                    <script>
		                    ingArr.push(<%=ingre.get(i).getIngreAmount() / rc.getSeveralServings()%>);
							</script>
						<%} %>
				
                </table>
            
            </div>

            <!--부가재료 영역-->
            <div class="ingre-info-add">
                	있으면 좋아요
                <hr width="100px">
                <table align="center">
                
						<!-- 부가재료 출력되는 구문 -->
						<%for(int i=0; i<subIngre.size();i++) {%>
		                  
		                    <tr>
		                        <th><%=subIngre.get(i).getSubIngreName()%></th>
		                        <td id="sub<%=i%>"><%=subIngre.get(i).getSubIngreAmount() / rc.getSeveralServings()%></td>
		                        <td><%=subIngre.get(i).getSubIngreUnit() %></td>
		                    </tr>
		                    
		                    <script>
		                    subArr.push(<%=subIngre.get(i).getSubIngreAmount() / rc.getSeveralServings()%>);
							</script>
		                    
						<%} %>

                </table>

            </div>

        
            <br><br>
            <!--재료 계산기 클릭시 모달창 출력-->
            <div class="igre-calculator">
                <div align="right" style="width: 900px">
                    <b>1</b>인 기준 | 
                    <a data-toggle="tooltip" title=" 재료 계산해드릴게요 !">
                        <img src="<%=contextPath%>/resources/image/icon-cal.png" class="icon"  data-toggle="modal" data-target="#calculatorModal" >
                    </a>
                    <script>
                        $(document).ready(function(){
                          $('[data-toggle="tooltip"]').tooltip();
                        });
                    </script>
                </div>
     
            </div>

            <!--모달창-->
            <!-- The Modal -->
            
                <div class="modal" id="calculatorModal">
                    <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                
                        <!-- Modal Header -->
                        <div class="modal-header" >
                            <h6 class="modal-title" style="text-align: center;">
                                <br>
                                이 요리는 몇 명이 먹나요?
                            </h6>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                
                        <!-- Modal body -->
                        <div class="modal-body">
                            <select name="servings" id="select-servings">

                                <option value="1" selected>1명</option>
                                <option value="2">2명</option>
                                <option value="3">3명</option>
                                <option value="4">4명</option>
                                <option value="5">5명</option>
                            
                            </select>

                            <button type="button" id="calculator" data-dismiss="modal" class="btn btn-success btn-sm" onclick="calculator();" >확인</button>
                            
                          
                            <script>
	                            
	                            function calculator(){
	                            	
	                                var servings = $("#select-servings").children("option:selected").val();
	                                
	                                for(var i=0; i<<%=ingre.size()%>;i++) {
	                                   //var ing = $("#ing" + i).text();	                                   

	                                   $("#ing" + i).text(ingArr[i]*servings);
	                                   
	                                }
	                                
                                   for(var i=0;i<<%=subIngre.size()%>;i++){
	                                	//var sub = $("#sub" + i).text();
	                                	$("#sub" + i).text(subArr[i]*servings);
	                                }
	                                
	                                
	                            }

                            </script>

                        </div>
                    </div>
                </div>
            </div>
            <br>
            <hr class="area-header">
			<br>
        </div>



            
            <div class="cooking-order" align="center">
                
                <br>
                <h3>만들어 볼까요</h3>
                <br><br>
                
                <!--이미지 크게보기 | 텍스트 크게 보기 -->
                <div class="select-view">

                    <div class="select-view-img">
                        
                        <a href="" class="selectView"><img src="<%=contextPath%>/resources/image/icon-select-photo.png"  class="icon"><br>사진 크게보기</a> 
                    </div>

                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                    <div class="select-view-text" >
                        
                   
                    <a href="" class="selectView"><img src="<%=contextPath%>/resources/image/icon-grid.png" class="icon" ><br>텍스트 크게보기</a>

                    </div>
  
                </div>
                    

                    
                </div>
                
                <br><br>
         

            </div>

                   <!--이미지 슬라이드 -->

                   <div class="slider">
                        <div class="slide" style="background-image: url(./1.jpg);">
                            <img src="<%=rc.getIngreImg() %>" class="cooking-order-img">
                            <br><br>
                            <p>재료 이미지입니다</p>
                        </div>
                        
                            <!-- 반복문으로  -->
                        	<% for(RecipeOrder ro : list2) {%>
		                        <div class="slide" >
		                            <img src="<%=ro.getRecipeImg()%>" class="cooking-order-img">
		                            <br><br>
		                            <div class="cooking-order-text">
		                               <h6><%=ro.getRecipeExpln()%></h6>
		                            </div>
		                        </div>
                   			<% }  %>
                   		
                   		
                    <a class="prev" onclick="button_click(-1)">&#10094</a>
                    <a class="next" onclick="button_click(1)">&#10095</a>
                  </div>

              
               <script>
               let currSlide = 1;
               showSlide(currSlide);
               
               function button_click(num){
                   showSlide((currSlide += num));
               }
               function showSlide(num){
                   const slides = document.querySelectorAll(".slide");
                   if(num>slides.length){
                   currSlide =1;
                   }if(num<1){
                   currSlide = slides.length;
                   }
                   for(let i=0; i<slides.length; i++){
                   slides[i].style.display="none";
                   }slides[currSlide -1].style.display="block";
               }
               </script>


                    <br><br><br><Br>
           
	            <div class="ingredients-search">
	            	<%for(IngreSearch in : ingreSearch) {%>
	                <a href="<%=contextPath%>/saerchCat.cat?currentPage=1&sno=<%=in.getCategorySno()%>" type="button" class="btn btn-sm btn-success"><%=in.getIngreName()%></a>
	                <%} %>
	            </div>

            <br><br>

           
            <div align="center">
                <div style="background-color: rgb(0, 102, 51); color: white; width: 300px; border-radius: 10px;">이 레시피는 저에게</div> <br><br>
                <button type="button" class="btn btn-outline-success btn-sm">도움이 됐어요</button>
                <button type="button" class="btn btn-outline-dark btn-sm">잘모르겠어요</button>
            </div>
            <br><br>
            
            

            <!--요리 후기 영역 -->

            <div class="recipe-review-area">

                <div class="recipe-review-header">
                    <div><h5>요리 후기 <b><%=reviewCount%></b></h5></div>
                    
                    <!--로그인한 회원만 보여지는 버튼 ! -->
                   <% if( loginUser != null){ %>
	                    <div class="recipe-review-body" >
	                    	<form action="<%=contextPath%>/enrollForm.review">
		                    	<input type="hidden" name="userNo" value="<%=loginUser.getUserNo()%>">
		                    	<input type="hidden" name="recipeNo" value="<%=rc.getRecipeNo()%>">
		                    	<button type="submit"  id="review-enroll-btn" class="btn btn-sm"> 작성하기	</button>
	                        </form>
	                    </div>
                  <% } %>
                     <hr>
                </div>

               
                <br>
                
                
                <div id="review-detail"  align="center">
                    
                    <table style="width: 500px;">
                    
                    	<div id="image_container"> <!-- 이미지 마크업 생성 공간 --> </div>

                    
                    	<tbody id="review-detail-list">
                    	
                    	<!-- ajax로 받아온 리뷰 데이터가 데이터가 출력되는 곳 -->
                    	
                    	</tbody>
                     
						
                    </table>

                </div>


                <!--<button id="review-modal-btn">모달창</button>-->

                <div class="reveiw-img-modal" >
		                <div class="reveiw-img-modal-content" 
		                    title="클릭하면 창이 닫힙니다."  >
						                여기에 모달창 내용을 적어줍니다.<br>
						                이미지여도 좋고 글이어도 좋습니다.
		                </div>
                </div>

                <script>
                    $(function(){ 

                        $("#review-modal-btn").click(function(){
                        $(".reveiw-img-modal").fadeIn();
                        });
                        
                        $(".reveiw-img-modal-content").click(function(){
                        $(".reveiw-img-modal").fadeOut();
                        });
                        
                    });
                </script>
			
                


            </div>


            <br><br>
            <div class="reply-area" >

                <!--댓글 추가 및 삭제시 댓글 숫자 증감-->
                <div class="area-header"><h5>댓글 <b><%=replyCount %></b></h5>
                
                <hr> 
                </div>
                
				
                <br>
                
                <!--댓글 입력하는 영역-->
                
               <div align="center">
                       <table style="width: 500px;">
                           <tr>
                               <td rowspan="2">
                                   <!--프로필 사진이 들어오는 영역-->
                                   <div class="box" style="background: #BDBDBD;">
                                       <img class="profile" src="<%=contextPath%>/resources/image/icon-user-profile.png">
                                   </div>
                               </td>
                           </tr>
                           <tr>
                       		 <% if(loginUser != null) { %>
                       		 
                                <td style="width: 80%;">
                                    <div class="form-group">
                                    <label for="usr"></label>
                                    <input type="text" class="form-control" id="usr" placeholder="소중한 레시피에 쉐프님의 멋진 댓글을 남겨주세요 :) "  style="height: 30px;" name="<%=loginUser.getUserId()%>">
                                    </div>
                                </td>
                                
                                <td><button class="btn btn-sm btn-success" onclick="insertReply();">등록</button></td>
                               <%}  else {%>
                               	
                                 <td style="width: 80%;">
                                    <div class="form-group">
                                    <label for="usr"></label>
                                    <input type="text" class="form-control" id="usr" placeholder="댓글은 로그인 후에 작성할 수 있어요!"  style="height: 30px;" disabled>
                                    </div>
                                </td>
                                 
                                <td><button class="btn btn-sm btn-success" onclick="insertReply();" disabled>등록</button></td>
                              <%} %>
                               
                           </tr>
                       </table>
               	</div>
                

               <br>
                <!--댓글 조회하는 전체 영역-->

                <div id="reply-list-area">
                    <!--댓글 한개의 div 영역 -->
                    <div class="reply-detail" align="center" id="reply-content-area">
                        <table style="width: 500px;">
                            <tbody>
					             <tr>
                                    <td rowspan="3" style="width: 30px;">
                                        <div class="box" style="background: #BDBDBD;">
                                            <img class="profile" src="">
                                        </div>
                                    </td>
								</tr>
                            </tbody>
                        </table>
                    </div>
				 </div>
				 
             <script>

                    
                   /*요리 후기 조회*/ 
                   
                    function selectReviewList(){
                    	
                	   $.ajax({
                		    url: "list.review"
                           	,data : {recipeNo : <%=rc.getRecipeNo()%>}
                	   		,enctype:'multipart/form-data'
                          	,success : function(list){
                          			var result = "";
                          			for(var i in list){
                          				
                          				result += 
                          					"<br>" + 
                                            "<tr>" + 
                                                "<td rowspan='3'>" +
                                                    "<div class='box' style='background: #BDBDBD;''>" + 
                                                        "<img class='profile' src='"  + list[i].profileImg +  "'>" + 
                                                    "</div>" +
                                                "</td>" + 
                                                "<td>"+"<b>"+ list[i].reviewWriter+"</b>"+"</td>" +
                                                "<td>"+ list[i].enrollDate+"</td>" +
                                                "<td rowspan='3' >" + 
                                                    "<img src='" + "<%=contextPath%>" +"/"+list[i].reviewImg +"'"+"class='review-detail-img' id='review-modal-btn'>" +
                                                "</td>" + 
                                            "</tr>" + 
                                            "<tr>" +
                                                "<td colspan='2'>" +  list[i].reviewContent + "</td>" + 
                                            "</tr>" + 
                                            "<tr>" + 
                                                "<td colspan='2'>" + list[i].star + "</td>" + 
                                            "</tr>"
 											+ "<br>" 
                          			}
                          			$("#review-detail tbody").html(result);
                          		}
                	 		  })
                  	 }
                    

                   	
                       $(function(){
                       	selectReplyList();
                       	selectReviewList();
                           setInterval(selectReplylist,1000);
                       })
                       
                       /*댓글 작성*/
                       
                       <%if(loginUser!=null){%>   
             			
                       function insertReply(){
                       	$.ajax({
                       		url : "rinsert.recipe"
                       		,data : {
                        			content : $("#usr").val()
                        			,recipeNo : <%=rc.getRecipeNo()%>
                       				,userNo : <%=loginUser.getUserNo()%>
                        			}
                       		,type : "post"
                       		,success : function(result){
                       		
	                        		if(result>0){
	                        			selectReplyList();
	                        			$("#usr").val("");
	                        		}
                       		}
                        	
                        	})
                        }
                       <%}%>
                        
                        /*댓글 조회 */
                        /*레시피 숫자는 레시피 조회에서 숫자 받아오기*/
                        
                        
                        function selectReplyList(){
                        	
                        	$.ajax({
                        	 	url : "rlist.recipe",
                        	 	
                            	data : {recipeNo: "<%=rc.getRecipeNo()%>"},
                            	success : function(list){
                            		
                            		var result = "";
                            		
                            		for(var i in list){
                            			result += 
                               			"<br>"	+	
	                           				"<td>"+
	   	                                        "<div class='box' style='background: #BDBDBD;''>" + 
	   	                                       		 "<img class='profile' src='" + list[i].profileImg + "'>" + 
	   	                               			 "</div>" +
	                                		"</td>" + 	
  	                                        "<td>" + "<b>" + list[i].replyWriter + "</b>" + "</td>" +
   	                                        "<td>" + list[i].enrollDate + "</td>" + 
   	                                        "<td style='color: gray;'>" + "<a href='' class='report-user-btn'>" + "신고하기" + "</a>" + "</td>" + 
   		                                    "<br>" +
   		                                  	 "<tr class='reply-deatil-content'>" + 
   		                                        "<td colspan='3'>" + list[i].replyContent  + "</td>" + 
   		                                    "</tr>" +
   		                                "<br>"
                            		} 
									$("#reply-content-area tbody").html(result);	
                            	}
                        	})
                        }

                        
                        
               </script>

              

            </div>

            <br><br>


    </div>

    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	
	<!-- Jaewon recentRecipe 용 스크립트 -->
	<script>
		function setCookie(cookie_name, value, days) {
		  var exdate = new Date();
		  exdate.setDate(exdate.getDate() + days);
		  // 설정 일수만큼 현재시간에 만료값으로 지정

		  var cookie_value = escape(value) + ((days == null) ? '' : '; expires=' + exdate.toUTCString());
		  document.cookie = cookie_name + '=' + cookie_value;
		}
				
		// 최종 함수 실행하기위한 함수
		function getCookie(cookie_name) {
			  var x, y;
			  var val = document.cookie.split(';');

			  for (var i = 0; i < val.length; i++) {
			    x = val[i].substr(0, val[i].indexOf('='));
			    y = val[i].substr(val[i].indexOf('=') + 1);
			    x = x.replace(/^\s+|\s+$/g, ''); // 앞과 뒤의 공백 제거하기
			    if (x == cookie_name) {
			      return unescape(y); // unescape로 디코딩 후 값 리턴
			    }
			  }
		}
		
		function addCookie(id) {
			  var items = getCookie('recentRecipeNo'); // 이미 저장된 값을 쿠키에서 가져오기
			  var maxItemNum = 6; // 최대 저장 가능한 아이템개수
			  var expire = 7; // 쿠키값을 저장할 기간
			  if (items) {
			    var itemArray = items.split(',');
			    if (itemArray.indexOf(id) != -1) {
			      // 이미 존재하는 경우 종료
			      console.log('Already exists.');
			    }
			    else {
			      // 새로운 값 저장 및 최대 개수 유지하기
			      itemArray.unshift(id);
			      if (itemArray.length > maxItemNum ) itemArray.length = 5;
			      items = itemArray.join(',');
			      setCookie('recentRecipeNo', items, expire);
			    }
			  }
			  else {
			    // 신규 id값 저장하기
			    setCookie('recentRecipeNo', id, expire);
			  }
			}		
		
		addCookie('<%= request.getParameter("rno")%>');
	</script>

	

</body>




</html>