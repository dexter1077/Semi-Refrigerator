<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, 
				 com.refrigerator.recipe.model.vo.Recipe,
				 com.refrigerator.member.model.vo.Member"%>

<%
	String alertMsg = (String)request.getParameter("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .home-section{
            margin: 30px;
        }
        .home-chefs-list-wrap{
            position: relative;
            margin: 100px 0;
        }
        .home-chef-wrap {text-align: center;}
        .home-chef li {display: inline-block;}
        
        /*전체영역*/
        .home-outer{
            position: absolute;
            left: 50%;
            top: 25%;
            margin-left:-600px;
        }
        .join{
        position: relative;
        width:100%;
        height:100%;
        width:1200px;
        }
    
        /*타이틀*/
        .home-section_header-title{
            font-size: 25px;
            text-align: center;
            padding: 20px 0;
            margin: 20px 0;
        }
        .home-section_header-content{
            font-size: 15px;
            text-align: center;
        }
        .navigation-search_content{
            font-size: 16px;
        }
        .login-area{
            font-size: 15px;  
        }

        /************************오늘의 레시피/************************/
        .home-viewRecipes_content{ /*레시피전체*/
            text-align: center;
        }
        .home-viewRecipe{ /*개별레시피전체영역*/
            display: inline-block;
            padding: 10px;
            margin: 20px 5px;
            height: 300px;
        }
        .home-viewRecipe_image{
            width: 340px;
            height: 200px;
        }
        .home-viewRecipe_link{
            display: inline-block;
            width: 340px;
            height: 270px;
            text-decoration: none;
            color: #000;
            margin: 10px 0;
        }
        .home-viewRecipe_content-title, .home-viewRecipe_content-user{
            font-size: 15px;
            padding: 2px 0;
        }
        .home-section_more a{
            display: block;
            text-align: right;
            text-decoration: none;
            color: #009764;
            font-size: 18px;
            font-weight: 900;
            margin: 20px 45px;
        }
        .home-section_more{
            display: inline-block;
            width: 100%;
            margin: auto;
        }
        .home-viewRecipe_link:hover, .home-section_more-btn:hover{
            text-decoration: none;
            color: #009764;
        }

        /************************배너영역************************/
        .home-header{ /*배너전체영역*/
            width: 100%;
            margin: auto;
        }
        .banner{
            display: -webkit-flex;
            display: flex;
        }
        .home-header_recipe{ /*레시피 item*/
            -webkit-flex: none;
            flex: none;
            width: 900px;
            margin: 0 10px;
        }
        .main-recipe-link{
            position: relative;
            width: 900px;
            margin: 0 10px;
            cursor: pointer;
        }
        .main-recipe_image, .main-event_image{ 
            position: relative;
            z-index: 1;
            height: 500px;
            background-color: transparent;
            border: none;
            border-radius: 10px;
        }
        
        .main-recipe_image{
            position: absolute;
            width: 900px;
            height: 500px;
        }
        .main-event_image{
            position: absolute;
            width: 300px;
            height: 500px;
        }
        .main-recipe_content-warp{
            position: relative; 
            z-index: 1;
            text-align: center;
            padding: 50px 10px 0 10px;
            height: 100px;
        }
        
        .main-recipe_content-profile{
            margin: 10px 0;
        }
        .main-recipe_content-more{
            display: inline-block;
            border: 1px solid #fff ;
            color: #fff;
            width: 150px;
            height: 50px;
            line-height: 50px;
            border-radius: 9px;
            font-size: 15px;
            position: relative;
        }
        .main-recipe_content-more:hover{
            background-color:#009764;
            border: none;
            color: #fff;
            font-weight: bold;
        }
        .main-recipe_content-title{
            text-decoration: none;
            font-size: 29px;
            font-weight: bold;
            color: #fff;
        }
        .main-recipe_content-profile_nickname{
            font-size: 15px;
            color: #fff;
        }

        /************************ 이벤트 배너 item********************/
        .home-header_banner-wrap{ 
            -webkit-flex: 1;
            flex: 1;
            margin: 0 10px;
        }
        .main-event_content-warp{
            position: relative; 
            top: 100px;
            left: 5px;
            z-index: 1;
            text-align: center;
            padding: 30px 0;
            height: 100px;
            width: 300px;
        }
        .main-event-link:hover{
            text-decoration: none;
        }
        .main-event_content-category, .main-event_content-title{
            margin: 20px 10px;
            color: #fff;
        }
        .main-event_content-category:hover, .main-event_content-title:hover{
            text-decoration: none;
            color: #fff;
        }
        .main-event_content-category_name{
            padding: 5px;
            border:1px solid #fff;
            border-radius: 4px;
        }
        .main-event_content-title{
            font-size: 25px;
        }

        /************************재료카테고리************************/
        /*가진재료 전체*/
        .home-category{         
            position: relative;
            display: inline-block;
            top: 50px;
        }
        .home-category ul{
            display: flex;
            margin: 60px 0 100px;
            padding: 0;
        }
        .home-category-item-wrap{ /*카테고리 개별요소*/
            display: inline-block;
            margin: 0 20px;
        }
        .home-category-item{ /*아이콘감싸는배경*/
            position: relative; 
            border: none;
            background-color: rgb(236, 236, 236);
            width: 80px;
            height: 80px;
            border-radius: 35px;
            text-align: center;
        }
        .home-category-item_title{ /*재료카테고리명*/
            display: block;
            margin: 6px 0 7px;
            font-size: 14px;
            text-align: center;
            font-weight: 500;
        }
        .home-category-item_image{
            position: relative; 
            z-index: 1;
            width: 50px;
            height: 50px;
            top: 15px;
        }
        .item_link{
            color: #000;
        }
        .item_link:hover{
            color: #000;
            text-decoration: none;
        }

        /************************오늘의 레시피************************/
        .home-view-recipe{
            position: relative;
            display: inline-block;
        }

        /************************쉐프가 선택한 레시피************************/
        .home-star-recipe{
            position: relative;
            display: inline-block;
            width: 100%;
            margin: 100px 0;
        }
        .home-starRecipes_content{ /*레시피목록영역*/
            display: flex;
            width: 900px;
            height: 420px;
            margin: auto;
            margin-top: 80px;
        }
        .home-starRecipe{ /*개별레시피영역*/
            -webkit-flex: 1;
            flex: 1;
            width: 400px;
            height: 430px;
            background-color: #fff2bf;
            margin: 10px;
            text-align: center;
            border-radius: 6px;
        }
        .home-starRecipe_link:hover, .home-starRecipe_content, .home-starRecipe-more_text{
            text-decoration: none;
            color: #000;
            margin: 40px 0 30px 0;
        }
        .home-starRecipe_image{
            position: relative;
            border: 1px solid #000;
            width: 350px;
            height: 250px;
        }
        .home-starRecipe-more{
            margin: 10px 0;
        }
        .home-starRecipe_content-title{
            font-size: 20px;
        }
        .home-starRecipe_content-user_name, .home-starRecipe-more_text{
            margin: 10px 0;
            font-size: 15px;
        }

        /************************오늘의 쉐프************************/
        .home-chefs{
            display: inline-block;
            position: relative;
            width: 100%;
        }


        /********************** 슬라이더 *******************************/
        .carousel-inner img {
            width: 100%;
            height: 100%;
        }
        .home-chefs-list-wrap{ /*배경*/
            margin: auto;
            border-top-left-radius: 50px ;
            border-top-right-radius: 50px;
            background-color: #e4dfce; 
            width: 1000px; 
            height: 400px;
        }
        .slide{
            width: 1000px;
        }
        .carousel-item{ /* 셰프모음페이지 */
            display: inline-block;
            width: 600px;
            height: 400px;
            left: 150px;
        }
        .carousel-item>ul>li{
            display: inline-block;
            width: 200px;
            height: 350px;
            margin: 0 10px;
            text-align: center;
            line-height: 170px;
        }
        .home-chef>li{
            text-align: center;
        }
        .home-chef>li>a{
            display: table-cell;
            width: 20px;
        }
        .home-chef_image{
            display: inline-block;
            margin: auto;
        }
        .carousel-item span{
            display: inline-block;
            padding: 0;
            margin: 0;
        }
        #chefFriend1{
            background-color: #009764;
            margin: 10px;
            padding: 20x;
            border-radius: 4px;
            font-size: 20px;
            color: #ffffff;
        }
        #chefFriend1:hover{
            text-decoration: none;
            cursor: pointer;
        }
        html {

        position: relative;
        min-height: 100%;
        margin: 0;
        }

        body {
        min-height: 100%;
        }

        
        /* Jaewon 슬라이드*/
	  #minibanner-box{
        margin-left: 10px;
	  }
	  
	  .miniBanner img {
	    width: 100%;
	    height: 500px;
	    object-fit:cover;
	    transform:translateX(-50%)
	  }
	  
	  .miniBanner{
        border-radius: 10px;
	  	overflow:hidden;
	    position:relative;
	    display:inline-block;
	  }
	  
	  .overray{
	  	width:100px;
	  	color:red;
	  	font-size:12px;
	  	font-weight:bold;
	  	text-align:center;
	  	border:1px solid orange;
	  	border-radius:5px;
	  	padding:2px;
	  	position:absolute;
	  	left:-53px;
	  	bottom:-50px;
	  	z-index:1000;
	  	background-color:rgba(255,255,255,0.6);
	  }
	  
	  footer{position:relative; width: 1200px; margin: auto; height: 150px; box-sizing: border-box; padding-top: 22px; clear: both; bottom:-3400px;}
        footer > div{margin-top: 30px;}
        footer a {text-decoration: none; color: black; padding: 2px; letter-spacing: -1.2px; font-weight: 500;}
        footer p{font-size: 10px;}
        
        
    </style>
</head>
<body>

	<%@ include file="menubar.jsp" %>
	
	<script>
		//alertMsg
		var msg = "<%=alertMsg%>";
		if(msg != "null"){
			alert(msg);
			<% session.removeAttribute("alertMsg"); %>
		}
	</script>
	
    
    <div class="home-outer">

        <div class="join">

            <!-- 1. 상위 배너 전체 영역 -->
            <div class="home-header">
                
                <!-- flex container-->
                <div class="banner">

                        <!-- (1) 레시피 배너 flex item_1-->
                    <div class="home-header_recipe">
                        
                        <article class="main-recipe-link_image">
                            <div class="main-recipe-link" onclick="location.href='';">
                                
                                <!-- * 메인 이미지-->
                                <div class="main-recipe_image-warp"> 
                                    <img class="main-recipe_image" src="<%=contextPath%>/resources/image/mainimage.png">
                                </div>

                                <!-- * 메인 내용(바로가기 버튼) -->
                                <div class="main-recipe_content-warp"> 

                                    <!--레시피 소개 텍스트 영역-->
                                    <div class="main-recipe_content"> 
                                        <!--레시피 제목 텍스트-->
                                        <div class="main-recipe_content-title"> 
                                            육즙가득 백선생 스테이크 굽는법
                                        </div>

                                        <!--작성자 프로필-->
                                        <div class="main-recipe_content-profile"> 
                                            <!-- 프로필 사진 -->
                                            <a class="main-recipe_content-profile_image" href="작성자 프로필 바로가기"></a>
                                            <!-- 프로필 닉네임 -->
                                            <span class="main-recipe_content-profile_nickname">닉네임입니당</span>
                                        </div>

                                    </div>

                                    <!-- 바로가기 버튼 -->
                                    <div class="main-recipe_content-more"> 
                                        레시피 보러가기
                                    </div>

                                </div>

                        </article>

                    </div>

                    <!-- (2) 이벤트/광고 슬라이드 배너 flex item_2    이미지 삽입은 가로 300px 세로 500px 짜리로 만들어서 삽입해야한다.--> 
                    <!-- 스크립트로 가져와서 해결해야한다. -->
                    <script>
					$.ajax({ 
						url : "bringBanner.ba",
						type : "post", 
						success: function(miniBanner){ 
							console.log(miniBanner);
							
							$("#firstBanner").attr("src", miniBanner[0].bannerImg);
							$("#secondBanner").attr("src", miniBanner[1].bannerImg);
							$("#thirdBanner").attr("src", miniBanner[2].bannerImg);

						},
						error:function(){
							console.log("ajax통신실패");
							alert("예상치 못한 오류로 인해 조회가 불가합니다 개발자에게 문의하세요")
						}
                    })	
                    </script>
                    
                    <div>
						<div id="minibanner-box" class="carousel slide" data-ride="carousel" style="width:300px; height:500px;">
						  <ul class="carousel-indicators">
						    <li data-target="#demo" data-slide-to="0" class="active"></li>
						    <li data-target="#demo" data-slide-to="1"></li>
						    <li data-target="#demo" data-slide-to="2"></li>
						  </ul>
						  <div class="carousel-inner miniBanner" style="overFlow:; width:300px; height:500px;">
						    <div class="carousel-item active">
							  <!--  <a href="www.naver.com" class="overray">이벤트로 이동 </a> -->						    
						      <img id="firstBanner" src="<%= request.getContextPath() %>/resources/banner_upfiles/standardbanner.png" width="300" height="500">
						      
						      <div class="carousel-caption">
						      </div>   
						    </div>
						    <div class="carousel-item">
   							  <!-- <a href="www.naver.com" class="overray">공모전으로 이동 </a>	 -->					    					    
						      <img id="secondBanner" src="<%= request.getContextPath() %>/resources/banner_upfiles/standardbanner.png" width="300" height="500">
						      <div class="carousel-caption">
						      </div>   
						    </div>
						    <div class="carousel-item">
    						  <!-- <a href="www.naver.com" class="overray">광고로 이동 </a>	-->
						      <img id="thirdBanner" src="<%= request.getContextPath() %>/resources/banner_upfiles/standardbanner.png" width="300" height="500">
						      <div class="carousel-caption">
						      </div>   
						    </div>
						  </div>
						  <a class="carousel-control-prev" href="#minibanner-box" data-slide="prev">
						    <span class="carousel-control-prev-icon"></span>
						  </a>
						  <a class="carousel-control-next" href="#minibanner-box" data-slide="next">
						    <span class="carousel-control-next-icon"></span>
						  </a>
						</div>
					</div>
				<!-- Jaewon 영역 끝 -->
                </div>
                
                

            </div> 
            
            
        

                

            <!-- 2. 재료 카테고리 -->
            <nav class="home-section home-category"> 

                <header class="home-section_header">
                    <h2 class="home-section_header-title">제가 가진 재료는 이런 것이에요!</h2>
                    <div class="home-section_header-content">재료를 선택해서 레시피를 검색해보세요.</div>
                </header>

                <ul class="home-category-list-warp"> 

                    <li class="home-category-item-wrap">
                        <a href="<%=contextPath%>/saerchCat.cat?currentPage=1&sno=1" class="item_link">
                            <!-- 재료 이미지 -->
                            <div class="home-category-item"> <img class="home-category-item_image" src="<%=contextPath%>/resources/css/meat.png"></img></div>
                            <!-- 재료 텍스트 -->
                            <div class="home-category-item_title">고기</div>
                        </a>
                        
                    </li>

                    <li class="home-category-item-wrap">
                        <a href="<%=contextPath%>/saerchCat.cat?currentPage=1&sno=5" class="item_link">
                            <!-- 재료 이미지 -->
                            <div class="home-category-item"> <img class="home-category-item_image" src="<%=contextPath%>/resources/css/spinach.png"></img></div>
                            <!-- 재료 텍스트 -->
                            <div class="home-category-item_title">채소</div>
                        </a>
                        
                    </li>

                    <li class="home-category-item-wrap">
                        <a href="<%=contextPath%>/saerchCat.cat?currentPage=1&sno=7" class="item_link">
                            <!-- 재료 이미지 -->
                            <div class="home-category-item"> <img class="home-category-item_image" src="<%=contextPath%>/resources/css/fish.png"></img></div>
                            <!-- 재료 텍스트 -->
                            <div class="home-category-item_title">해물</div>
                        </a>
                        
                    </li>

                    <li class="home-category-item-wrap">
                        <a href="<%=contextPath%>/saerchCat.cat?currentPage=1&sno=10" class="item_link">
                            <!-- 재료 이미지 -->
                            <div class="home-category-item"> <img class="home-category-item_image" src="<%=contextPath%>/resources/css/egg.png"></img></div>
                            <!-- 재료 텍스트 -->
                            <div class="home-category-item_title">달걀/유제품</div>
                        </a>
                        
                    </li>

                    <li class="home-category-item-wrap">
                        <a href="<%=contextPath%>/saerchCat.cat?currentPage=1&sno=14" class="item_link">
                            <!-- 재료 이미지 -->
                            <div class="home-category-item"> <img class="home-category-item_image" src="<%=contextPath%>/resources/css/wheat-sack.png"></img></div>
                            <!-- 재료 텍스트 -->
                            <div class="home-category-item_title">쌀/밀가루</div>
                        </a>
                        
                    </li>

                    <li class="home-category-item-wrap">
                        <a href="<%=contextPath%>/saerchCat.cat?currentPage=1&sno=19" class="item_link">
                            <!-- 재료 이미지 -->
                            <div class="home-category-item"> <img class="home-category-item_image" src="<%=contextPath%>/resources/css/soybean.png"></img></div>
                            <!-- 재료 텍스트 -->
                            <div class="home-category-item_title">콩/두부</div>
                        </a>
                        
                    </li>

                    <li class="home-category-item-wrap">
                        <a href="<%=contextPath%>/saerchCat.cat?currentPage=1&sno=28" class="item_link">
                            <!-- 재료 이미지 -->
                            <div class="home-category-item"> <img class="home-category-item_image" src="<%=contextPath%>/resources/css/healthy-food.png"></img></div>
                            <!-- 재료 텍스트 -->
                            <div class="home-category-item_title">과일</div>
                        </a>
                        
                    </li>

                    <li class="home-category-item-wrap">
                        <a href="<%=contextPath%>/saerchCat.cat?currentPage=1&sno=13" class="item_link">
                            <!-- 재료 이미지 -->
                            <div class="home-category-item"> <img class="home-category-item_image" src="<%=contextPath%>/resources/css/canned-food.png"></img></div>
                            <!-- 재료 텍스트 -->
                            <div class="home-category-item_title">가공식품</div>
                        </a>
                        
                    </li>

                    <li class="home-category-item-wrap">
                        <a href="<%=contextPath%>/saerchCat.cat?currentPage=1&sno=23" class="item_link">
                            <!-- 재료 이미지 -->
                            <div class="home-category-item"> <img class="home-category-item_image" src="<%=contextPath%>/resources/css/mushroom.png"></img></div>
                            <!-- 재료 텍스트 -->
                            <div class="home-category-item_title">버섯</div></a>
                        
                    </li>

                    <li class="home-category-item-wrap">
                        <a href="<%=contextPath%>/saerchCat.cat?currentPage=1&sno=31" class="item_link">
                            <!-- 재료 이미지 -->
                            <div class="home-category-item"> <img class="home-category-item_image" src="<%=contextPath%>/resources/css/kimchi.png"></img></div>
                            <!-- 재료 텍스트 -->
                            <div class="home-category-item_title">김치</div></a>
                        
                    </li>
                </ul>
            </nav>

            <script>

                $(function() {       
        
                    $(".home-viewRecipe").click(function() {
        
                        location.href = "<%=contextPath%>/detail.recipe?rno=" + $(this).children().eq(0).val();
                    })
        
                })
                
                
                $.ajax({
    			url:"today.recipe",
    			method: "post",
    			dataType: "json",
    			contentType : "application/json; charset:UTF-8",
    			enctype:'multipart/form-data',
    			success:function(list){
    				
    	            var result = "";
    	            
    	            for(var i in list){
    	            	
    	            	result +=
    	            		
    	            		" <input type='hidden' name='recipeNo' value=' " + list[i].recipeNo + " '> " +
                        " <a class='home-viewRecipe_link' href= " + "<%= contextPath%>/detail.recipe?rno="  + list[i].recipeNo + " '> "  
                        +    "<div>" + "<img class='home-viewRecipe_image' src='" + list[i].mainImg + "'>"
                        + "<div class='home-viewRecipe_content'>" + "<div class='home-viewRecipe_content-title' id='today-1'> " + list[i].recipeTitle + "</div>" 
                        + "<div class='home-viewRecipe_content-user'>"
                        + "<span class='home-viewRecipe_content-user_name'> " +  list[i].recipeWriter  + "</span></div></div></div></a>"
    	            	
    	            }
    	            
    	            $("#home-viewRecipe").html(result);
    				
    			},error:function(){
    				console.log("오늘의 레시피 등록 ajax 통신실패");
    			}
    		});
                
             // 쉐프가 선택한 레시피(좋아요순) 조회용 스크립트
                
                $.ajax({
       			url:"chef.recipe",
       			method: "post",
       			dataType: "json",
       			contentType : "application/json; charset:UTF-8",
       			enctype:'multipart/form-data',
       			success:function(list){
       				
       	            
       	            var result = "";
       	            
       	            for(var i in list){
       	            	
       	            	result +=
                
                
                					"<a class='home-starRecipe_link' href=' " + "<%= contextPath%>/detail.recipe?rno="  + list[i].recipeNo + "'>" 
                					+ "<div><div class='home-starRecipe_content'><div class='home-starRecipe_content-title'>" 
                               	+ list[i].recipeTitle 
                               	+ "</div><div class='home-starRecipe_content-user'>" 
                                   + "<span class='home-starRecipe_content-user_name'>"           
                                   + list[i].recipeWriter
                                   + "</span></div></div>"            
                                   + "<img class='home-starRecipe_image' src='"    
                                   + list[i].mainImg
                                   + "'>" 
                                   + "<div class='home-starRecipe-more'>" 
                                   + "<span class='home-starRecipe-more_text'>See more</span></div></div></a>"    
   						
       	            	}
       	            
       	            $("#home-starRecipe").html(result);
       				
       			},error:function(){
       				console.log("오늘의 레시피 등록 ajax 통신실패");
       			}
       		});
                

        
            </script>
            
            

            <!-- 3. 오늘의 레시피 == 조회수 높은 레시피 -->
            <section class="home-section home-view-recipe"> 
                <header class="home-section_header">
                    <h2 class="home-section_header-title">오늘의 레시피</h2>
                    <div class="home-section_header-content">냉장고에 뭐 있지? 에서 많은 셰프가 이런 레시피를 봤어요.</div>
                </header>
                
                <div>

                    <div class="home-section_more"> <!-- 더보기 버튼-->
                        <a class="home-section_more-btn" href="<%=contextPath%>/recipeView.main?currentPage=1">더보기</a>
                    </div>

                    <!-- 레시피 전체 목록 -->
                    <div class="home-viewRecipes_content"> 

                        <!-- 개별 레시피 (1) -->
                        <div class="home-viewRecipe" id="home-viewRecipe"> 
                            <!-- ajax출력되는 div영역 -->
                        </div>

                    </div>
                </div>
            </section>



            <!-- 4. 쉐프가 선택한 레시피 == 별점 높은 레시피 -->
            <section class="home-section home-star-recipe"> 
                <header class="home-section_header">
                    <h2 class="home-section_header-title">쉐프가 선택한 레시피</h2>
                    <div class="home-section_header-content">쉐프들의 마음을 사로잡은 레시피를 소개합니다.</div>
                </header>
                <div>
                    <div class="home-starRecipes_content"> <!-- 레시피 목록 -->

                        <div class="home-starRecipe" id="home-starRecipe"> <!-- 레시피 (1) -->
                           <!-- ajax출력되는 div영역 --> 
                        </div>

                    </div>
                </div>
            </section>
            
            
            
            <!-- 5. 오늘의 쉐프 == 팔로우수 많은 쉐프 -->
            <section class="home-section home-chefs"> 
                <header class="home-section_header">
                    <h2 class="home-section_header-title">오늘의 쉐프</h2>
                </header>
                <div class="home-chefs-list-wrap">

                    <div id="demo" class="carousel slide" data-ride="carousel" >

                        <!-- Indicators -->
                        <ul class="carousel-indicators">
                        <li data-target="#demo" data-slide-to="0" class="active"></li>
                        <li data-target="#demo" data-slide-to="1"></li>
                        </ul>
                        
                        <!-- The slideshow -->
                        <div class="carousel-inner" style="list-style-type:none;">
                            <div class="carousel-item active">

                                <!--쉐프모음페이지1-->
                                <ul class="home-chef-page">
                                    <li> <!-- 쉐프(1) -->
                                        <a class="home-chef_image" href="쉐프프로필페이지" style="display:table-cell;padding:30px 15px 0 15px;;" tabindex="0">
                                            <img src="<%=contextPath%>/resources/image/user.png" style="width:150px; height:150px;">
                                        </a>
                                        <span class="home-chef_userNicname" id="chefFriend1_name" style="width:auto;">
                                            쉐프 닉네임
                                        </span>
                                        <a href="" id="chefFriend1" class="home-chef_subBtn">
                                            구독
                                        </a>
                                    </li>
                                    <li> <!-- 쉐프(2) -->
                                        <a class="home-chef_image" href="쉐프프로필페이지" style="display:table-cell;padding:30px 15px 0 15px;;" tabindex="0">
                                            <img src="<%=contextPath%>/resources/image/user.png" style="width:150px; height:150px;">
                                        </a>
                                        <span class="home-chef_userNicname" id="chefFriend1_name" style="width:auto;">
                                            쉐프 닉네임
                                        </span>
                                        <a href="" id="chefFriend1" class="home-chef_subBtn">
                                            구독
                                        </a>
                                    </li>
                                    <li> <!-- 쉐프(3) -->
                                        <a class="home-chef_image" href="쉐프프로필페이지" style="display:table-cell;padding:30px 15px 0 15px;;" tabindex="0">
                                            <img src="<%=contextPath%>/resources/image/user.png" style="width:150px; height:150px;">
                                        </a>
                                        <span class="home-chef_userNicname" id="chefFriend1_name" style="width:auto;">
                                            쉐프 닉네임
                                        </span>
                                        <a href="" id="chefFriend1" class="home-chef_subBtn">
                                            구독
                                        </a>
                                    </li>
                                </ul>
                            </div>

                            <div class="carousel-item">

                                <!--쉐프모음페이지2-->
                                <ul class="home-chef-page">
                                    <li> <!-- 쉐프(4) -->
                                        <a class="home-chef_image" href="쉐프프로필페이지" style="display:table-cell;padding: 30px 15px 0 15px;" tabindex="0">
                                            <img src="<%=contextPath%>/resources/image/user.png" style="width:150px; height:150px;">
                                        </a>
                                        <span class="home-chef_userNicname" id="chefFriend1_name" style="width:auto;">
                                            쉐프 닉네임
                                        </span>
                                        <a href="" id="chefFriend1" class="home-chef_subBtn">
                                            구독
                                        </a>
                                    </li>
                                    <li> <!-- 쉐프(5) -->
                                        <a class="home-chef_image" href="쉐프프로필페이지" style="display:table-cell;padding:30px 15px 0 15px;;" tabindex="0">
                                            <img src="<%=contextPath%>/resources/image/user.png" style="width:150px; height:150px;">
                                        </a>
                                        <span class="home-chef_userNicname" id="chefFriend1_name" style="width:auto;">
                                            쉐프 닉네임
                                        </span>
                                        <a href="" id="chefFriend1" class="home-chef_subBtn">
                                            구독
                                        </a>
                                    </li>
                                    <li> <!-- 쉐프(6) -->
                                        <a class="home-chef_image" href="쉐프프로필페이지" style="display:table-cell;padding:30px 15px 0 15px;;" tabindex="0">
                                            <img src="<%=contextPath%>/resources/image/user.png" style="width:150px; height:150px;">
                                        </a>
                                        <span class="home-chef_userNicname" id="chefFriend1_name" style="width:auto;">
                                            쉐프 닉네임
                                        </span>
                                        <a href="" id="chefFriend1" class="home-chef_subBtn">
                                            구독
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        
                        <!-- Left and right controls -->
                        <a class="carousel-control-prev" href="#demo" data-slide="prev">
                        <span class="carousel-control-prev-icon"></span>
                        </a>
                        <a class="carousel-control-next" href="#demo" data-slide="next">
                        <span class="carousel-control-next-icon"></span>
                        </a>
                    </div>
                    
                </div>

            </section>
        </div>
    </div>
    
    <footer align="center">

        <div>
            <a href="<%= request.getContextPath() %>/tos.tos?page=service">이용약관</a> |
            <a href="<%= request.getContextPath() %>/tos.tos?page=personal">개인정보취급방침</a> |
            <a href="<%= request.getContextPath() %>/enrollForm.inq">문의하기</a> 
            <%-- 1대1문의시에 로그인하지 않은 사람은 로그인페이지로 이동하게 inquiry쪽에 작성  --%>  
        </div>
        <p>Copyright 2021 What's in my refrigerator All rights reserved</p>
    </footer>
    

</body>
</html>