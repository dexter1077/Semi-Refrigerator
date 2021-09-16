<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList , com.refrigerator.nav_menu.model.vo.NavMenu"%>    

<%
	ArrayList<NavMenu> navList = (ArrayList<NavMenu>)request.getAttribute("navlist");	
	NavMenu homeMenu = navList.get(0);
	NavMenu categoryMenu = navList.get(1);
	NavMenu eventMenu = navList.get(2);
	NavMenu recipeMenu = navList.get(3);
	NavMenu csMenu = navList.get(4);
	
	String confirmMsg = (String)session.getAttribute("confirmMsg"); 
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="jaewon.s">
<!-- Author : Jaewon -->

<title>네비게이션바 관리 페이지</title>
<!--  font awesome CDN -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
<style>
    #for-height{height: 720px;} 
    div{box-sizing: border-box;}
    .wrap{margin: auto; width: 1200px; height: 750px;}
    .outer{ width: 1000px; float: right; margin-right: 25px;}
/* ------------------------------------------------------------------------------ */
    .top-box a{
        color: gray;
    }

    .top-box{
        margin-top: 10px;
        padding: 20px;
        margin-bottom: 20px;
        padding-left: 25px;
    }

    .outer-body h2{
        font-size: 36px;
        margin-bottom: 10px;
    }

    .outer-body{
        padding-left: 25px;
    }

    .sub-title{
        border: 1px solid rgb(46,204,113);
        width: 245px;
        font-weight: bold;
    }
    #present-list-box{
        width: 890px;
        height: 135px;
        background-color: rgb(207,243,222) ;
        display: flex;
        justify-content: space-around;
        align-items: center;
        margin-bottom: 50px;
    }

    .small-white-box{
        width: 110px;
        height: 100px;
        background-color: white;
        border: 1px solid gray;
        text-align: center;
        color: tomato;
        padding-top: 10px;
    }

    #top-div{
        width: 640px;
        height: 45px;
        margin-right:20px ;
        background-color: white;
        margin-bottom: 20px;
        display: flex;
        justify-content: space-around;
        box-sizing: border-box;
        border: 1px solid rgb(0,102,51);
    }

    #top-div>div{
        width: 100px;
        height: 45px;
        text-align: center;
        display: flex;
        flex-direction: column;
        align-items: center;
        position: relative;
        padding-top: 10px;
        font-size: 18px;
        font-weight: bold;
    }

	#top-div>div:nth-child(1){order:<%= homeMenu.getMenuOrder() %>}
	#top-div>div:nth-child(2){order:<%= categoryMenu.getMenuOrder() %>}
	#top-div>div:nth-child(3){order:<%= eventMenu.getMenuOrder() %>}
	#top-div>div:nth-child(4){order:<%= recipeMenu.getMenuOrder() %>}
	#top-div>div:nth-child(5){order:<%= csMenu.getMenuOrder() %>}


    .circle-box{
        width: 30px;
        height: 30px;
        border-radius: 50%;
        background-color: rgb(0,102,51);
        color: white;
        position: absolute;
        top: 50px;
        line-height: 30px;
    }

    #buttom-div{
        width: 890px;
        height: 235px;
        background-color: rgb(224,224,224);
        padding: 18px;
        padding-left: 50px;

    }

    .inner-top-box{
        width: 800px;
        height: 60px;
        display: flex;
        justify-content: space-between;
    }

    .inner-top-box > div{
        width: 150px;
        height: 60px;
        background-color: #E49992;
        display: flex;
        justify-content: center;
    }

    .big-circle-box{
        width: 70px;
        height: 55px;
        border-radius: 55px;
        background-color: #FB1C1B;
        color: white;
        font-weight: bold;
        font-size: 16px;
        text-align: center;
        line-height: 55px;
        margin-top: 2.5px;
    }

    .inner-bottom-box{
        width: 800px;
        height: 90px;
        display: flex;
        justify-content: space-between;
        background-color: white;
        padding: 10px;
    }

    .inner-bottom-box input{
        width: 130px;
        height: 40px;
        margin-top: 20px;
        text-align:center;
        font-weight:bolder;
    }
    
    .caution{color:red; font-weight:bold; text-align:center; width:890px;}

    .btn-area{
        width: 800px;
        display: flex;
        justify-content: center;
    }

    .btn-area button{
        width: 100px;
        height: 40px;
        border-radius: 5px;
        margin: 10px;
        color: white;
        font-weight: bold;
        border: none;
    }

    .btn-area button:nth-child(1){
        background-color: rgb(230,106,93);
    }

    .btn-area button:nth-child(2){
        background-color: rgb(124,212,161);
    }
/* --------------------------------------------------------------------------------------------------------- */
    </style>
</head>
<body>
    <script>
	 	var msg = "<%= confirmMsg %>"; 
	 	
	 	if(msg != "null"){
	 		if(confirm(msg)){
				location.href = "<%= request.getContextPath() %>";		
	 		}	 		
			<% session.removeAttribute("confirmMsg"); %>
	 	}
	 </script>

    <%@ include file="../common/admin/adminTopNavView.jsp" %>
    <div class="wrap">
	<%@ include file="../common/admin/adminSideBarView.jsp" %>
        <div id="content">
            <div class="outer" style="float:right">
                <div class="top-box">
                    <a href="">홈</a> >
                    <a href="">싸이트관리</a> >
                    <a href="">네비게이션바 순서변경</a>
                </div>
                <div class="outer-body">
                    <h2><b>네비게이션 바 순서변경</b></h2>
                    
                    <div class="sub-title">현재 Navigation 목록 순서</div>
                    <div id="present-list-box">
                        <div class="small-white-box">현재 <br> 네비게이션 <br> 순서</div>
                        <div id="top-div">
                             <div>홈<div class="circle-box"><%= homeMenu.getMenuOrder() %></div></div>
                             <div>카테고리<div class="circle-box"><%= categoryMenu.getMenuOrder() %></div></div>
                             <div>이벤트<div class="circle-box"><%= eventMenu.getMenuOrder() %></div></div>
                             <div>레시피<div class="circle-box"><%= recipeMenu.getMenuOrder() %></div></div>
                             <div>고객센터<div class="circle-box"><%= csMenu.getMenuOrder() %></div></div>
                        </div>
                    </div>

                    <%-- 아래 영역 --%>
                    <div class="sub-title">Navigation 목록 변경역역</div>
                    <div class="caution">
                    	※ 순서 입력란에는 ! 꼭 중복되지 않는 순서를 입력해주세요! 
                    </div>
                    <div id="buttom-div">
                        <div class="inner-top-box">
                            <div>
                                <div class="big-circle-box">홈</div>
                            </div>
                            <div>
                                <div class="big-circle-box">카테고리</div>
                            </div>
                            <div>
                                <div class="big-circle-box">이벤트</div>
                            </div>
                            <div>
                                <div class="big-circle-box">레시피</div>
                            </div>
                            <div>
                                <div class="big-circle-box">고객센터</div>
                            </div>
                        </div>                    
                        
                        <form action="modifyNav.nav" method="POST">
                            <div class="inner-bottom-box">
     							<input type="text" name="home" placeholder="순서입력" required maxlength="1" pattern="1|2|3|4|5{1}" title="1~5값만 입력하세요 중복된숫자는 들어올수없습니다." oninput="this.value = this.value.replace(/[^1-5.]/g, '').replace(/(\..*)\./g, '$1');">
     							<input type="text" name="category" placeholder="순서입력" maxlength="1" pattern="1|2|3|4|5{1}" title="1~5값만 입력하세요 중복된숫자는 들어올수없습니다." required oninput="this.value = this.value.replace(/[^1-5.]/g, '').replace(/(\..*)\./g, '$1');" readonly>
     							<input type="text" name="event" placeholder="순서입력" maxlength="1" pattern="1|2|3|4|5{1}" title="1~5값만 입력하세요 중복된숫자는 들어올수없습니다." required oninput="this.value = this.value.replace(/[^1-5.]/g, '').replace(/(\..*)\./g, '$1');" readonly>
     							<input type="text" name="recipe" placeholder="순서입력" maxlength="1" pattern="1|2|3|4|5{1}" title="1~5값만 입력하세요 중복된숫자는 들어올수없습니다." required oninput="this.value = this.value.replace(/[^1-5.]/g, '').replace(/(\..*)\./g, '$1');" readonly>
     							<input type="text" name="cs" placeholder="순서입력" maxlength="1" pattern="1|2|3|4|5{1}" title="1~5값만 입력하세요 중복된숫자는 들어올수없습니다." required oninput="this.value = this.value.replace(/[^1-5.]/g, '').replace(/(\..*)\./g, '$1');" readonly>
                            </div>
							
							<script>
								$(function(){
									// ★ 유효성 검사만 총 3단계를 거친다.
									// 1단계 db단에서 한번거치고
									// 2단계 스크립트활용  regularExpression 정규표현식으로 한번 
									// 3단계 스크립트활용  조건문으로 막아버리기 
									// ※ 단!!!! 2, 3단계를 완벽하게 통합시킬수가없다. (더 간결하게 짤수있었던것이지만)
									// 현재로서는 이게 최선이다. 
									
									// 그래 만들어보자 error나서 뻑나면 안되니까 
									// 와.... 몇시간을 썻냐.. 그래도 원하는데로 만들었다!!!! 오류나기전에 무조건 검사해줄것이다! 
									var homeInp = $("input[name='home']");
									var categoryInp = $("input[name='category']");
									var eventInp = $("input[name='event']");
									var recipeInp = $("input[name='recipe']");
									var csInp = $("input[name='cs']");
									
									//얘로 구워삶아먹어야한당
									var regExp = "0|1|2|3|4|5";
									
									//첫 인풋
									homeInp.focusout(function(){
										if(homeInp.val() != ""){
											regExp = regExp.replace("|" + homeInp.val(),""); 										
											homeInp.attr('readonly' , true);
											categoryInp.attr('readonly' , false);										
											categoryInp.attr('pattern', regExp);							
											console.log(homeInp.val());
										}
									});
									
									//2번째 인풋
									categoryInp.focusout(function(){										
										if(homeInp.val() == categoryInp.val()){
											categoryInp.val("");	
											categoryInp.attr("placeholder", "다시입력");
										}

										if(categoryInp.val() != ""){	
											regExp = regExp.replace("|" + categoryInp.val(),""); 
											categoryInp.attr('readonly' , true);
											eventInp.attr('readonly' , false);										
											eventInp.attr('pattern', regExp);									
										}										
									});

									//세번쨰 인풋
									eventInp.focusout(function(){		
										if(homeInp.val() == eventInp.val() || categoryInp.val() == eventInp.val()){
											eventInp.val("");	
											 eventInp.attr("placeholder", "다시입력");
										}
										
										if(eventInp.val() != ""){										
											regExp = regExp.replace("|" + eventInp.val(),""); 
											eventInp.attr('readonly' , true);
											recipeInp.attr('readonly' , false);										
											recipeInp.attr('pattern', regExp);									
										}
									});
								
									//네번째 인풋 
									recipeInp.focusout(function(){
										if(homeInp.val()  == recipeInp.val()|| categoryInp.val() == recipeInp.val() || eventInp.val() == recipeInp.val()){
											recipeInp.val("");	
										}

										if(recipeInp.val() != ""){
											regExp = regExp.replace("|" + recipeInp.val(),""); 										
											recipeInp.attr('readonly' , true);
											csInp.attr('readonly' , false);										
											csInp.attr('pattern', regExp);									
										}
									});
									
								})
							</script>
							
                            <div class="btn-area">
                                <button type="submit">수정하기</button>
                                <button type="button" onclick="window.location.reload()">초기화</button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>