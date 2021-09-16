<%@page import="com.refrigerator.category.model.vo.SubCategory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.refrigerator.category.model.vo.MainCategory,
				 com.refrigerator.category.model.vo.SubCategory,
				 java.util.ArrayList" %>
    
    <!--윤희락 05.26 작성-->
<%
	int userNo = (int)request.getAttribute("userNo");
	ArrayList<MainCategory> mList = (ArrayList<MainCategory>)request.getAttribute("mList");
	ArrayList<SubCategory> sList = (ArrayList<SubCategory>)request.getAttribute("sList");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>냉뭐 레시피등록</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .outer{
            width:1000px;
            padding-top:8px;
            margin:auto;
        }
        .outer>form>div{
            box-sizing: border-box;
            width:100%;
            margin-bottom:8px;
            border:2px solid rgb(200, 200, 200);
        }
        .enroll-form-title{
            height:60px;
            background-color: rgb(233, 233, 233);
            color: rgb(0, 102, 51);
            font-size:24px;
            line-height: 60px;
            font-weight: 900;
            
        }

        /*form 공통 영역*/
        div{box-sizing:border-box;}

        input, textarea, select{
            background-color: rgb(233, 233, 233);
            border:1px solid rgb(200, 200, 200);
            border-radius: 3px;
        }
        textarea{
            text-align: left;
        }
        select{
            width:140px;
            height:40px;
        }
        label{
            font-size:24px;
            font-weight:550;
        }
        .guide{
            font-size:12px;
            color: rgb(127, 127, 127);
        }
        .vital{
            color:rgb(0, 153, 102);
            font-size:20px;
        }
        .lightImg{
            width:30px;
            height:30px;
        }
        .clone-btn{
            border:none;
            background:white;
            font-weight: 550;
            color: rgb(0, 153, 102);
        }
        .clone-btn{
            border:none;
            background:white;
            font-weight: 550;
            color: rgb(0, 153, 102);
        }


        /*form1*/
        .enroll-form1{height:350px}
       
        table{width:100%; height:100%;}

        #enroll-content1{
            margin:2% 6%;
            width:88%;
            height:90%;
        }
       
        #enroll-content1>div{
            float:left;
            height:100%;
        }
        .form1-area1{width:70%;}
        .form1-area2{width:30%;}

        .fomr1-area2>div.lastchildren{
            color: red;
            width:600px;
        }

        

        .thumbnail-area{
            border-radius:3px;
            margin:auto;
            margin-top:20px;
            margin-bottom:10px;
            width:200px;
            height:200px;
        }

        .form1-area2 div:nth-child(2){
            width:255px;

        }
        
        /*2번째 form영역*/
        .enroll-form2{height:400px}
        .search-btn-area{
            width:880px;
            height:300px;
            margin:50px 60px;
        }

        .search-btn-area>div{
            height:100%;
            float:left;
        }

        .search-btn-img-area{
            width:450px;
        }

        .search-btn-menu-area{
            width:428px;
        }
        .ingre-img{
            width:300px;
            height:150px;
        }

        #serach-btn-input-area{
            width:330px;
            margin: 10px 60px;
        }

        #serach-btn-input-area{
            display:none;
        }


        /*3번째 영역 css*/

        .content-title{
            font-size:24px;
            font-weight:550;
        }

        .ingre-area, #add-area{
            width: 620px;
            margin:10px 60px;
        }

        #add-area{
            display:none;
        }

        .content-area2{
            margin:40px 60px;
            width:780px;
        }

        .amount{
            width:140px;
            height:40px;
        }

        /*4번째 요리순서 영역*/
        .enroll-content4{
            margin:50px 60px;
            width:880px;
        }

        .guide-area{
            margin-bottom:20px;
        }

        #order-area{
            margin-bottom:10px;
        }

        #order-area>table tr{
            height:150px;
        }
        .order-title, .order-no{
            font-weight: 600;
            color: rgb(0, 102, 51);
            font-size:28px;
        }
        .order-textarea{
            box-sizing:border-box;
            width:100%;
            height:150px;
            resize:none;
        }
        
        .order-img{
        	margin-bottom:5px;
        	margin-left:10px;
            width:150px;
            height:150px;
        }
        
        .order-img:hover{
        	cursor:pointer;
        }
        
        .order-area{
            width:860px;
        }

        /* 5) 버튼 영역 */
        .enroll-form5{
            height:60px;
        }
        #cancel-btn, #enroll-btn{
            width:300px;
            height:40px;
            margin-top:8px;
            margin-left: 40px;
            font-weight:500;
        }
        #enroll-btn{background:rgb(0, 102, 51)}
        #cancel-btn{
            background:rgb(224, 224, 224);
            color:black;
        }

        /*리모컨 버튼*/
        .up-btn{
        	margin:auto;
        	margin-left:1050px;
            width:50px;
            height:50px;
            position:fixed;
            top:430px;
            display:none;
        }

        .up-btn:hover{
            opacity: 0.9;
            cursor: pointer;
        }
        
        input[type=file]{
        	display:none;
        }
        
        .select-title, #hide-org{
        	display:none;
        }
    </style>
</head>
<body>

<%@ include file="../common/user/menubar.jsp" %>


    <div class="outer">
        <form action="<%=contextPath%>/insert.rcp" method="post" enctype="multipart/form-data">
        <!-- input type="hidden" 입력폼 개수 넘기기-->
        <input type="hidden" name="userNo" value="<%=userNo%>">
        <input type="hidden" id="sbCount" name="sbCount" value="0">
        <input type="hidden" id="ingCount" name="ingCount" value="1">
        <input type="hidden" id="addCount" name="addCount" value="0">
        <input type="hidden" id="orderCount" name="orderCount" value="1">

            <div class="enroll-form-title">
                &nbsp;&nbsp;&nbsp;레시피 등록
            </div>
            
            <div class="enroll-form1">
                
                
                <div id="enroll-content1">
                    
                    <div class="form1-area1">
                        <table>
                            
                            <tr>
                                <th width="180"><label for=""><span class="vital">*</span> 레시피 제목</label></th>
                                <td colspan="2"><input type="text" name="title" style="width:400px; height:50px;" placeholder="예) 소고기 미역국끓이기" required></td>
                            </tr>
                            
                            <tr>
                                <th><label for=""><span class="vital">*</span> 요리 소개</label></th>
                                <td>
                                    <textarea name="intro" cols="54" rows="5" placeholder="레시피의 탄생배경을 적어주세요." required style="resize: none;"></textarea>
                                </td>
                            </tr>
                            
                            <tr>
                                <th><label><span class="vital">*</span> 요리 정보</label></th>

                                <td colspan="2">
                                    &nbsp;&nbsp;&nbsp;
                                    인분
                                    <select name="servings" required>
                                        <option value="1">1인분</option>
                                        <option value="2">2인분</option>
                                        <option value="3">3인분</option>
                                        <option value="4">4인분</option>
                                        <option value="5">5인분</option>
                                        <option value="6">6인분 이상</option>
                                    </select>
                                    &nbsp;&nbsp;&nbsp;
                                    시간
                                    <select name="time" required>
                                        <option value="10">10분이하</option>
                                        <option value="20">20분이하</option>
                                        <option value="30">30분이하</option>
                                        <option value="40">40분이하</option>
                                        <option value="50">50분이하</option>
                                        <option value="60">60분이상</option>
                                    </select>
                                </td>
                                
                                
                            </tr>
                    
                        </table>
                        
                    </div>
                    
                    <div class="form1-area2" >
                        <div class="thumbnail-area" border="1"><img width="200" height="200" id="thumbnail-img"></div>
                        <div align="center"><span>*</span><button type="button" id="insertMainImg" class="btn btn-secondary btn-sm">대표이미지 등록</button></div>
                        <div><input type="file" id="file11" class="file" name="file11" required onchange="loadImg(this, 11);"></div>
                    </div>
                    
                </div>
            </div>
            
            
            
            <div class="enroll-form2">
                
                <div class="search-btn-area">
                    
                    <div class="search-btn-img-area">
                        <label for=""><span class="vital">*</span> 재료사진</label>
                        <div>
                            &nbsp;&nbsp;&nbsp;&nbsp;<img class="lightImg" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMSIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHhtbG5zOnN2Z2pzPSJodHRwOi8vc3ZnanMuY29tL3N2Z2pzIiB3aWR0aD0iNTEyIiBoZWlnaHQ9IjUxMiIgeD0iMCIgeT0iMCIgdmlld0JveD0iMCAwIDQ3OS43OTcgNDc5Ljc5NyIgc3R5bGU9ImVuYWJsZS1iYWNrZ3JvdW5kOm5ldyAwIDAgNTEyIDUxMiIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSIgY2xhc3M9IiI+PGc+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+Cgk8Zz4KCQk8cGF0aCBkPSJNMzgyLjc3NiwxMjYuMjM3QzM3NC40MSw2MC41MjQsMzIyLjQ0MSw4LjkxMSwyNTYuNjcyLDAuOTk3QzE3Ny42ODYtOC4yODEsMTA2LjEzNCw0OC4yMjgsOTYuODU1LDEyNy4yMTQgICAgYy0wLjY1Nyw1LjU5NC0wLjk4NSwxMS4yMjItMC45ODMsMTYuODU1Yy0wLjEzNiw0NC41MTMsMjAuNDM2LDg2LjU1OCw1NS42NjQsMTEzLjc2OGMxMC4xNTksNy41ODUsMTYuMiwxOS40NzQsMTYuMzM2LDMyLjE1MiAgICB2MTE4LjA4YzAuMDQ4LDEwLjI5OCw2LjY2LDE5LjQxNywxNi40MzIsMjIuNjY0YzMuODM0LDMwLjY4OSwzMS44MjEsNTIuNDYsNjIuNTEsNDguNjI1ICAgIGMyNS40MjQtMy4xNzYsNDUuNDQ5LTIzLjIwMiw0OC42MjYtNDguNjI1YzkuNzcyLTMuMjQ3LDE2LjM4NC0xMi4zNjYsMTYuNDMyLTIyLjY2NHYtMTE4LjA4ICAgIGMwLjEtMTIuNjA3LDYuMDQzLTI0LjQ1NCwxNi4wODgtMzIuMDcyQzM2OC4zMzgsMjI2Ljg4NywzODkuMjA3LDE3Ni43NTQsMzgyLjc3NiwxMjYuMjM3eiBNMjM5Ljg3Miw0NjQuMDY5ICAgIGMtMTkuMDAyLTAuMDIxLTM1LjM3NS0xMy4zODctMzkuMi0zMmg3OC40QzI3NS4yNDcsNDUwLjY4MiwyNTguODc0LDQ2NC4wNDgsMjM5Ljg3Miw0NjQuMDY5eiBNMjk1Ljg3MiwzMTIuMDY5aC01NiAgICBjLTQuNDE4LDAtOCwzLjU4Mi04LDhzMy41ODIsOCw4LDhoNTZ2OGgtNTZjLTQuNDE4LDAtOCwzLjU4Mi04LDhzMy41ODIsOCw4LDhoNTZ2OGgtNTZjLTQuNDE4LDAtOCwzLjU4Mi04LDhzMy41ODIsOCw4LDhoNTZ2OCAgICBoLTU2Yy00LjQxOCwwLTgsMy41ODItOCw4czMuNTgyLDgsOCw4aDU2djhjMCw0LjQxOC0zLjU4Miw4LTgsOGgtOTZjLTQuNDE4LDAtOC0zLjU4Mi04LTh2LTcuOTI4bDIzLjkyOCwwLjIzMmgwLjA3MiAgICBjNC40MTgsMC4wMiw4LjAxNi0zLjU0Niw4LjAzNi03Ljk2NHMtMy41NDYtOC4wMTYtNy45NjQtOC4wMzZsLTI0LjA3Mi0wLjIzMnYtOGwyMy45MjgsMC4yMzJoMC4wNzIgICAgYzQuNDE4LDAuMDIsOC4wMTYtMy41NDYsOC4wMzYtNy45NjRzLTMuNTQ2LTguMDE2LTcuOTY0LTguMDM2bC0yNC4wNzItMC4yMzJ2LThsMjMuOTI4LDAuMjMyaDAuMDcyICAgIGM0LjQxOCwwLjAyLDguMDE2LTMuNTQ2LDguMDM2LTcuOTY0cy0zLjU0Ni04LjAxNi03Ljk2NC04LjAzNmwtMjQuMDcyLTAuMjMydi04bDIzLjkyOCwwLjIzMmgwLjA3MiAgICBjNC40MTgsMC4wMiw4LjAxNi0zLjU0Niw4LjAzNi03Ljk2NHMtMy41NDYtOC4wMTYtNy45NjQtOC4wMzZsLTI0LjA3Mi0wLjIzMnYtMTYuMDcyaDExMlYzMTIuMDY5eiBNMzY2Ljk0LDE1OS4wODYgICAgYy00LjAzNCwzNC4xMTktMjEuNjE1LDY1LjE4NC00OC43ODgsODYuMjA3bDAuMDMyLTAuMDRjLTExLjE2Niw4LjU3Mi0xOC43NjQsMjAuOTc0LTIxLjMyOCwzNC44MTZIMTgyLjg3MiAgICBjLTIuNjExLTEzLjg4OC0xMC4yODItMjYuMzE0LTIxLjUyOC0zNC44NzJjLTU1Ljg1Mi00My40MjMtNjUuOTI3LTEyMy45LTIyLjUwNC0xNzkuNzUyYzQuNzU0LTYuMTE1LDEwLjA1My0xMS43ODYsMTUuODMyLTE2Ljk0NCAgICBjMjMuMzI1LTIwLjk3OCw1My42MTQtMzIuNTM3LDg0Ljk4NC0zMi40MzJjNS4wNzksMC4wMDMsMTAuMTU0LDAuMjk0LDE1LjIsMC44NzJDMzI1LjA1OSwyNS4yNDIsMzc1LjI0MSw4OC44ODIsMzY2Ljk0LDE1OS4wODZ6IiBmaWxsPSIjN2Y3ZjdmIiBkYXRhLW9yaWdpbmFsPSIjMDAwMDAwIiBzdHlsZT0iIiBjbGFzcz0iIj48L3BhdGg+Cgk8L2c+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPC9nPjwvc3ZnPg=="/>
                            <label class="guide">재료 사진을 보고 검색버튼을 통해 다른 유저가 재료를 </label>
                            <label class="guide">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                간편하게 찾을 수 있도록 재료사진 한 장과 검색버튼을 등록 해 주세요!
                            </label>
                        </div>
                        
                        <div align="center" style="padding-top:10px; padding-bottom:10px;">
                            <img src="" class="ingre-img">
                        </div>
                        
                    <div align="center">
                        <button type="button" id="insert-ingre-img" class="btn btn-secondary btn-sm">재료이미지 등록</button>
                        <input type="file" id="file12" class="file" name="file12" required onchange="loadImg(this, 12);">
                    </div>
                </div>
                <!--2)  검색버튼 영역 -->
                <div class="search-btn-menu-area">
                    
                    <label>검색버튼</label>
                    <div>
                        &nbsp;&nbsp;&nbsp;&nbsp;<img class="lightImg" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMSIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHhtbG5zOnN2Z2pzPSJodHRwOi8vc3ZnanMuY29tL3N2Z2pzIiB3aWR0aD0iNTEyIiBoZWlnaHQ9IjUxMiIgeD0iMCIgeT0iMCIgdmlld0JveD0iMCAwIDQ3OS43OTcgNDc5Ljc5NyIgc3R5bGU9ImVuYWJsZS1iYWNrZ3JvdW5kOm5ldyAwIDAgNTEyIDUxMiIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSIgY2xhc3M9IiI+PGc+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+Cgk8Zz4KCQk8cGF0aCBkPSJNMzgyLjc3NiwxMjYuMjM3QzM3NC40MSw2MC41MjQsMzIyLjQ0MSw4LjkxMSwyNTYuNjcyLDAuOTk3QzE3Ny42ODYtOC4yODEsMTA2LjEzNCw0OC4yMjgsOTYuODU1LDEyNy4yMTQgICAgYy0wLjY1Nyw1LjU5NC0wLjk4NSwxMS4yMjItMC45ODMsMTYuODU1Yy0wLjEzNiw0NC41MTMsMjAuNDM2LDg2LjU1OCw1NS42NjQsMTEzLjc2OGMxMC4xNTksNy41ODUsMTYuMiwxOS40NzQsMTYuMzM2LDMyLjE1MiAgICB2MTE4LjA4YzAuMDQ4LDEwLjI5OCw2LjY2LDE5LjQxNywxNi40MzIsMjIuNjY0YzMuODM0LDMwLjY4OSwzMS44MjEsNTIuNDYsNjIuNTEsNDguNjI1ICAgIGMyNS40MjQtMy4xNzYsNDUuNDQ5LTIzLjIwMiw0OC42MjYtNDguNjI1YzkuNzcyLTMuMjQ3LDE2LjM4NC0xMi4zNjYsMTYuNDMyLTIyLjY2NHYtMTE4LjA4ICAgIGMwLjEtMTIuNjA3LDYuMDQzLTI0LjQ1NCwxNi4wODgtMzIuMDcyQzM2OC4zMzgsMjI2Ljg4NywzODkuMjA3LDE3Ni43NTQsMzgyLjc3NiwxMjYuMjM3eiBNMjM5Ljg3Miw0NjQuMDY5ICAgIGMtMTkuMDAyLTAuMDIxLTM1LjM3NS0xMy4zODctMzkuMi0zMmg3OC40QzI3NS4yNDcsNDUwLjY4MiwyNTguODc0LDQ2NC4wNDgsMjM5Ljg3Miw0NjQuMDY5eiBNMjk1Ljg3MiwzMTIuMDY5aC01NiAgICBjLTQuNDE4LDAtOCwzLjU4Mi04LDhzMy41ODIsOCw4LDhoNTZ2OGgtNTZjLTQuNDE4LDAtOCwzLjU4Mi04LDhzMy41ODIsOCw4LDhoNTZ2OGgtNTZjLTQuNDE4LDAtOCwzLjU4Mi04LDhzMy41ODIsOCw4LDhoNTZ2OCAgICBoLTU2Yy00LjQxOCwwLTgsMy41ODItOCw4czMuNTgyLDgsOCw4aDU2djhjMCw0LjQxOC0zLjU4Miw4LTgsOGgtOTZjLTQuNDE4LDAtOC0zLjU4Mi04LTh2LTcuOTI4bDIzLjkyOCwwLjIzMmgwLjA3MiAgICBjNC40MTgsMC4wMiw4LjAxNi0zLjU0Niw4LjAzNi03Ljk2NHMtMy41NDYtOC4wMTYtNy45NjQtOC4wMzZsLTI0LjA3Mi0wLjIzMnYtOGwyMy45MjgsMC4yMzJoMC4wNzIgICAgYzQuNDE4LDAuMDIsOC4wMTYtMy41NDYsOC4wMzYtNy45NjRzLTMuNTQ2LTguMDE2LTcuOTY0LTguMDM2bC0yNC4wNzItMC4yMzJ2LThsMjMuOTI4LDAuMjMyaDAuMDcyICAgIGM0LjQxOCwwLjAyLDguMDE2LTMuNTQ2LDguMDM2LTcuOTY0cy0zLjU0Ni04LjAxNi03Ljk2NC04LjAzNmwtMjQuMDcyLTAuMjMydi04bDIzLjkyOCwwLjIzMmgwLjA3MiAgICBjNC40MTgsMC4wMiw4LjAxNi0zLjU0Niw4LjAzNi03Ljk2NHMtMy41NDYtOC4wMTYtNy45NjQtOC4wMzZsLTI0LjA3Mi0wLjIzMnYtMTYuMDcyaDExMlYzMTIuMDY5eiBNMzY2Ljk0LDE1OS4wODYgICAgYy00LjAzNCwzNC4xMTktMjEuNjE1LDY1LjE4NC00OC43ODgsODYuMjA3bDAuMDMyLTAuMDRjLTExLjE2Niw4LjU3Mi0xOC43NjQsMjAuOTc0LTIxLjMyOCwzNC44MTZIMTgyLjg3MiAgICBjLTIuNjExLTEzLjg4OC0xMC4yODItMjYuMzE0LTIxLjUyOC0zNC44NzJjLTU1Ljg1Mi00My40MjMtNjUuOTI3LTEyMy45LTIyLjUwNC0xNzkuNzUyYzQuNzU0LTYuMTE1LDEwLjA1My0xMS43ODYsMTUuODMyLTE2Ljk0NCAgICBjMjMuMzI1LTIwLjk3OCw1My42MTQtMzIuNTM3LDg0Ljk4NC0zMi40MzJjNS4wNzksMC4wMDMsMTAuMTU0LDAuMjk0LDE1LjIsMC44NzJDMzI1LjA1OSwyNS4yNDIsMzc1LjI0MSw4OC44ODIsMzY2Ljk0LDE1OS4wODZ6IiBmaWxsPSIjN2Y3ZjdmIiBkYXRhLW9yaWdpbmFsPSIjMDAwMDAwIiBzdHlsZT0iIiBjbGFzcz0iIj48L3BhdGg+Cgk8L2c+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPC9nPjwvc3ZnPg=="/>
                        <label class="guide">검색버튼은 최대 3개까지 생성 가능합니다.</label>
                    </div>
                    
                    <div id="serach-btn-input-area">
                        
                        <select class="mc" name="btnMainCat0">
                        	<% for(MainCategory mc : mList) {%>
	                            <option value="<%=mc.getCategoryMainNo()%>"><%=mc.getCategoryName()%></option>
                            <%} %>
                        </select>
                        
                        <!--mainCat 선택에 따라 subCat요소 반복문 넣기-->
                        <select name="btnSubCat0">
                        	<% for(SubCategory sc : sList) {%>
	                            <option value="<%=sc.getCategorySubNo()%>"><%=sc.getIngredientName()%></option>
                            <%} %>
                        </select>
                        
                        <span class="ct-close"><img width="30px" height="30px" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pg0KPCEtLSBHZW5lcmF0b3I6IEFkb2JlIElsbHVzdHJhdG9yIDE2LjAuMCwgU1ZHIEV4cG9ydCBQbHVnLUluIC4gU1ZHIFZlcnNpb246IDYuMDAgQnVpbGQgMCkgIC0tPg0KPCFET0NUWVBFIHN2ZyBQVUJMSUMgIi0vL1czQy8vRFREIFNWRyAxLjEvL0VOIiAiaHR0cDovL3d3dy53My5vcmcvR3JhcGhpY3MvU1ZHLzEuMS9EVEQvc3ZnMTEuZHRkIj4NCjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iQ2FwYV8xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgd2lkdGg9IjYxMi4wMDhweCIgaGVpZ2h0PSI2MTIuMDA4cHgiIHZpZXdCb3g9IjAgMCA2MTIuMDA4IDYxMi4wMDgiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDYxMi4wMDggNjEyLjAwODsiDQoJIHhtbDpzcGFjZT0icHJlc2VydmUiPg0KPGc+DQoJPGcgaWQ9Il94MzlfXzQxXyI+DQoJCTxnPg0KCQkJPHBhdGggZD0iTTUzNS40NCw5NS42NjZIMTkyLjI2N2MtNS4zNTQtMC4zMjUtMTAuODA0LDEuMzM4LTE0LjkxNiw1LjQxMkw1LjUxNSwyOTEuMTU2Yy00LjAzNSwzLjk5Ny01Ljc1Niw5LjMzMi01LjQ4OCwxNC41NzINCgkJCQljLTAuMjY4LDUuMjM5LDEuNDU0LDEwLjU1Niw1LjQ4OCwxNC41NzFsMTcxLjgzNiwxOTAuMDc5YzMuNzQ4LDMuNzA5LDguNjI0LDUuNTQ1LDEzLjUyLDUuNjAzdjAuNDAxaDM0NC41Nw0KCQkJCWM0Mi4yOCwwLDc2LjU2Ny0zNC4yNDgsNzYuNTY3LTc2LjQ5VjE3Mi4xNzVDNjEyLjAwOCwxMjkuOTE0LDU3Ny43MjEsOTUuNjY2LDUzNS40NCw5NS42NjZ6IE00MzMuMTU0LDM0OC45MDYNCgkJCQljNy40NzcsNy40NzcsNy40NzcsMTkuNTgyLDAsMjcuMDM5Yy03LjQ3OCw3LjQ3OC0xOS42MDEsNy40NzgtMjcuMDc4LDBsLTQyLjgxNS00Mi43NzdsLTQzLjM3LDQzLjMzMg0KCQkJCWMtNy41MzQsNy41MTYtMTkuNzUzLDcuNTE2LTI3LjI4OCwwYy03LjUzNS03LjUzNC03LjUzNS0xOS43MzQsMC0yNy4yNDlsNDMuMzctNDMuMzMzbC00Mi44MTUtNDIuNzc3DQoJCQkJYy03LjQ3Ny03LjQ3Ny03LjQ3Ny0xOS41ODIsMC0yNy4wNGM3LjQ3Ny03LjQ3NywxOS42MDEtNy40NzcsMjcuMDc4LDBsNDIuODE1LDQyLjc3N2w0My45ODEtNDMuOTI1DQoJCQkJYzcuNTM0LTcuNTM0LDE5Ljc1NC03LjUzNCwyNy4yODgsMHM3LjUzNCwxOS43MzQsMCwyNy4yNWwtNDMuOTgxLDQzLjkyNUw0MzMuMTU0LDM0OC45MDZ6Ii8+DQoJCTwvZz4NCgk8L2c+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8L3N2Zz4NCg==" /></span>
                    </div>
    
                    <div id="serach-btn-input-result">
                        
                    </div>
                    
                    <div align="center">
                        <button type="button" id="search-btn-clone" class="clone-btn">+ 추가</button>
                    </div>
                </div>
    
            </div>
            
        </div>
        
        <!--리모컨 버튼-->
        <img class="up-btn" width="50" height="50" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMSIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHhtbG5zOnN2Z2pzPSJodHRwOi8vc3ZnanMuY29tL3N2Z2pzIiB3aWR0aD0iNTEyIiBoZWlnaHQ9IjUxMiIgeD0iMCIgeT0iMCIgdmlld0JveD0iMCAwIDUzMi4xNjMgNTMyLjE2MiIgc3R5bGU9ImVuYWJsZS1iYWNrZ3JvdW5kOm5ldyAwIDAgNTEyIDUxMiIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSIgY2xhc3M9IiI+PGc+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+Cgk8Zz4KCQk8cGF0aCBkPSJNNzAuNjI1LDMwMS42OTVsMTk1LjQ2LTEyNC44ODRsMTk1LjQ2MSwxMjQuODg0YzcuNjU2LDQuODkxLDE2LjIxMiw3LjIyOSwyNC42NjksNy4yMjkgICAgYzE1LjE0MiwwLDI5Ljk2NC03LjQ5MSwzOC43MjItMjEuMTk0YzEzLjY0Ny0yMS4zNjUsNy4zOTMtNDkuNzQzLTEzLjk2Ni02My4zOTFMMjkwLjc5OSw4My42NjUgICAgYy0xNS4wNzQtOS42MjYtMzQuMzUzLTkuNjI2LTQ5LjQyNiwwTDIxLjE5NCwyMjQuMzMzYy0yMS4zNTksMTMuNjQ3LTI3LjYyLDQyLjAzMS0xMy45NjYsNjMuMzkxICAgIEMyMC44ODIsMzA5LjA5NSw0OS4yNjcsMzE1LjMzMSw3MC42MjUsMzAxLjY5NXoiIGZpbGw9IiMwMDY2MzMiIGRhdGEtb3JpZ2luYWw9IiMwMDAwMDAiIHN0eWxlPSIiIGNsYXNzPSIiPjwvcGF0aD4KCQk8cGF0aCBkPSJNNzAuNjI1LDQ0OC40OWwxOTUuNDYtMTI0Ljg4NUw0NjEuNTQ3LDQ0OC40OWM3LjY1Niw0Ljg5LDE2LjIxMiw3LjIyOCwyNC42NjksNy4yMjhjMTUuMTQyLDAsMjkuOTY0LTcuNDkxLDM4LjcyMi0yMS4xOTMgICAgYzEzLjY0Ny0yMS4zNjUsNy4zOTMtNDkuNzQzLTEzLjk2Ni02My4zOTJsLTIyMC4xNzMtMTQwLjY4Yy0xNS4wNzQtOS42MjYtMzQuMzUzLTkuNjI2LTQ5LjQyNiwwTDIxLjE5NCwzNzEuMTI3ICAgIGMtMjEuMzU5LDEzLjY0Ny0yNy42Miw0Mi4wMzItMTMuOTY2LDYzLjM5MUMyMC44ODIsNDU1Ljg4OSw0OS4yNjcsNDYyLjEyNSw3MC42MjUsNDQ4LjQ5eiIgZmlsbD0iIzAwNjYzMyIgZGF0YS1vcmlnaW5hbD0iIzAwMDAwMCIgc3R5bGU9IiIgY2xhc3M9IiI+PC9wYXRoPgoJPC9nPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjwvZz48L3N2Zz4=" />
        
        
        <!--3번째영역 필수재료 | 부가재료 -->
        <div class="enroll-form3">
            <div class="content-area2">
                
                <div>
                    <span class="vital">*</span><label class="content-title">필수재료</label>
                </div>
                
                <div>
                    &nbsp;&nbsp;&nbsp;&nbsp;<img class="lightImg" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMSIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHhtbG5zOnN2Z2pzPSJodHRwOi8vc3ZnanMuY29tL3N2Z2pzIiB3aWR0aD0iNTEyIiBoZWlnaHQ9IjUxMiIgeD0iMCIgeT0iMCIgdmlld0JveD0iMCAwIDQ3OS43OTcgNDc5Ljc5NyIgc3R5bGU9ImVuYWJsZS1iYWNrZ3JvdW5kOm5ldyAwIDAgNTEyIDUxMiIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSIgY2xhc3M9IiI+PGc+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+Cgk8Zz4KCQk8cGF0aCBkPSJNMzgyLjc3NiwxMjYuMjM3QzM3NC40MSw2MC41MjQsMzIyLjQ0MSw4LjkxMSwyNTYuNjcyLDAuOTk3QzE3Ny42ODYtOC4yODEsMTA2LjEzNCw0OC4yMjgsOTYuODU1LDEyNy4yMTQgICAgYy0wLjY1Nyw1LjU5NC0wLjk4NSwxMS4yMjItMC45ODMsMTYuODU1Yy0wLjEzNiw0NC41MTMsMjAuNDM2LDg2LjU1OCw1NS42NjQsMTEzLjc2OGMxMC4xNTksNy41ODUsMTYuMiwxOS40NzQsMTYuMzM2LDMyLjE1MiAgICB2MTE4LjA4YzAuMDQ4LDEwLjI5OCw2LjY2LDE5LjQxNywxNi40MzIsMjIuNjY0YzMuODM0LDMwLjY4OSwzMS44MjEsNTIuNDYsNjIuNTEsNDguNjI1ICAgIGMyNS40MjQtMy4xNzYsNDUuNDQ5LTIzLjIwMiw0OC42MjYtNDguNjI1YzkuNzcyLTMuMjQ3LDE2LjM4NC0xMi4zNjYsMTYuNDMyLTIyLjY2NHYtMTE4LjA4ICAgIGMwLjEtMTIuNjA3LDYuMDQzLTI0LjQ1NCwxNi4wODgtMzIuMDcyQzM2OC4zMzgsMjI2Ljg4NywzODkuMjA3LDE3Ni43NTQsMzgyLjc3NiwxMjYuMjM3eiBNMjM5Ljg3Miw0NjQuMDY5ICAgIGMtMTkuMDAyLTAuMDIxLTM1LjM3NS0xMy4zODctMzkuMi0zMmg3OC40QzI3NS4yNDcsNDUwLjY4MiwyNTguODc0LDQ2NC4wNDgsMjM5Ljg3Miw0NjQuMDY5eiBNMjk1Ljg3MiwzMTIuMDY5aC01NiAgICBjLTQuNDE4LDAtOCwzLjU4Mi04LDhzMy41ODIsOCw4LDhoNTZ2OGgtNTZjLTQuNDE4LDAtOCwzLjU4Mi04LDhzMy41ODIsOCw4LDhoNTZ2OGgtNTZjLTQuNDE4LDAtOCwzLjU4Mi04LDhzMy41ODIsOCw4LDhoNTZ2OCAgICBoLTU2Yy00LjQxOCwwLTgsMy41ODItOCw4czMuNTgyLDgsOCw4aDU2djhjMCw0LjQxOC0zLjU4Miw4LTgsOGgtOTZjLTQuNDE4LDAtOC0zLjU4Mi04LTh2LTcuOTI4bDIzLjkyOCwwLjIzMmgwLjA3MiAgICBjNC40MTgsMC4wMiw4LjAxNi0zLjU0Niw4LjAzNi03Ljk2NHMtMy41NDYtOC4wMTYtNy45NjQtOC4wMzZsLTI0LjA3Mi0wLjIzMnYtOGwyMy45MjgsMC4yMzJoMC4wNzIgICAgYzQuNDE4LDAuMDIsOC4wMTYtMy41NDYsOC4wMzYtNy45NjRzLTMuNTQ2LTguMDE2LTcuOTY0LTguMDM2bC0yNC4wNzItMC4yMzJ2LThsMjMuOTI4LDAuMjMyaDAuMDcyICAgIGM0LjQxOCwwLjAyLDguMDE2LTMuNTQ2LDguMDM2LTcuOTY0cy0zLjU0Ni04LjAxNi03Ljk2NC04LjAzNmwtMjQuMDcyLTAuMjMydi04bDIzLjkyOCwwLjIzMmgwLjA3MiAgICBjNC40MTgsMC4wMiw4LjAxNi0zLjU0Niw4LjAzNi03Ljk2NHMtMy41NDYtOC4wMTYtNy45NjQtOC4wMzZsLTI0LjA3Mi0wLjIzMnYtMTYuMDcyaDExMlYzMTIuMDY5eiBNMzY2Ljk0LDE1OS4wODYgICAgYy00LjAzNCwzNC4xMTktMjEuNjE1LDY1LjE4NC00OC43ODgsODYuMjA3bDAuMDMyLTAuMDRjLTExLjE2Niw4LjU3Mi0xOC43NjQsMjAuOTc0LTIxLjMyOCwzNC44MTZIMTgyLjg3MiAgICBjLTIuNjExLTEzLjg4OC0xMC4yODItMjYuMzE0LTIxLjUyOC0zNC44NzJjLTU1Ljg1Mi00My40MjMtNjUuOTI3LTEyMy45LTIyLjUwNC0xNzkuNzUyYzQuNzU0LTYuMTE1LDEwLjA1My0xMS43ODYsMTUuODMyLTE2Ljk0NCAgICBjMjMuMzI1LTIwLjk3OCw1My42MTQtMzIuNTM3LDg0Ljk4NC0zMi40MzJjNS4wNzksMC4wMDMsMTAuMTU0LDAuMjk0LDE1LjIsMC44NzJDMzI1LjA1OSwyNS4yNDIsMzc1LjI0MSw4OC44ODIsMzY2Ljk0LDE1OS4wODZ6IiBmaWxsPSIjN2Y3ZjdmIiBkYXRhLW9yaWdpbmFsPSIjMDAwMDAwIiBzdHlsZT0iIiBjbGFzcz0iIj48L3BhdGg+Cgk8L2c+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPC9nPjwvc3ZnPg=="/>
                    <span class="guide">재료가 남거나 부족하지 않도록 정확한 계량정보를 적어주세요</span>
                </div>
                
                <div id="hide-org" class="ingre-area">
                    
                    <select class="mc" name="ingMainCat0">
                    	<% for(MainCategory mc : mList) {%>
	                            <option value="<%=mc.getCategoryMainNo()%>"><%=mc.getCategoryName()%></option>
                            <%} %>
                    </select>
                    
                    <!--mainCat 선택에 따라 subCat요소 반복문 넣기-->
                    <select name="ingSubCat0">
                       <% for(SubCategory sc : sList) {%>
	                            <option value="<%=sc.getCategorySubNo()%>"><%=sc.getIngredientName()%></option>
                            <%} %>
                    </select>
                    
                    <input type="number" name="ingAmount0" class="amount" placeholder="예) 1~1000" min="0" max="1000">
                    
                    <select name="ingUnit0" required>
                        <option>g</option>
                        <option>Kg</option>
                        <option>근</option>
                        <option>개</option>
                        <option>대</option>
                        <option>컵</option>
                        <option>ml</option>
                        <option>L</option>
                        <option>t</option>
                        <option>T</option>
                    </select>
                    
                    <span class="ct-close"><img width="30px" height="30px" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pg0KPCEtLSBHZW5lcmF0b3I6IEFkb2JlIElsbHVzdHJhdG9yIDE2LjAuMCwgU1ZHIEV4cG9ydCBQbHVnLUluIC4gU1ZHIFZlcnNpb246IDYuMDAgQnVpbGQgMCkgIC0tPg0KPCFET0NUWVBFIHN2ZyBQVUJMSUMgIi0vL1czQy8vRFREIFNWRyAxLjEvL0VOIiAiaHR0cDovL3d3dy53My5vcmcvR3JhcGhpY3MvU1ZHLzEuMS9EVEQvc3ZnMTEuZHRkIj4NCjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iQ2FwYV8xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgd2lkdGg9IjYxMi4wMDhweCIgaGVpZ2h0PSI2MTIuMDA4cHgiIHZpZXdCb3g9IjAgMCA2MTIuMDA4IDYxMi4wMDgiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDYxMi4wMDggNjEyLjAwODsiDQoJIHhtbDpzcGFjZT0icHJlc2VydmUiPg0KPGc+DQoJPGcgaWQ9Il94MzlfXzQxXyI+DQoJCTxnPg0KCQkJPHBhdGggZD0iTTUzNS40NCw5NS42NjZIMTkyLjI2N2MtNS4zNTQtMC4zMjUtMTAuODA0LDEuMzM4LTE0LjkxNiw1LjQxMkw1LjUxNSwyOTEuMTU2Yy00LjAzNSwzLjk5Ny01Ljc1Niw5LjMzMi01LjQ4OCwxNC41NzINCgkJCQljLTAuMjY4LDUuMjM5LDEuNDU0LDEwLjU1Niw1LjQ4OCwxNC41NzFsMTcxLjgzNiwxOTAuMDc5YzMuNzQ4LDMuNzA5LDguNjI0LDUuNTQ1LDEzLjUyLDUuNjAzdjAuNDAxaDM0NC41Nw0KCQkJCWM0Mi4yOCwwLDc2LjU2Ny0zNC4yNDgsNzYuNTY3LTc2LjQ5VjE3Mi4xNzVDNjEyLjAwOCwxMjkuOTE0LDU3Ny43MjEsOTUuNjY2LDUzNS40NCw5NS42NjZ6IE00MzMuMTU0LDM0OC45MDYNCgkJCQljNy40NzcsNy40NzcsNy40NzcsMTkuNTgyLDAsMjcuMDM5Yy03LjQ3OCw3LjQ3OC0xOS42MDEsNy40NzgtMjcuMDc4LDBsLTQyLjgxNS00Mi43NzdsLTQzLjM3LDQzLjMzMg0KCQkJCWMtNy41MzQsNy41MTYtMTkuNzUzLDcuNTE2LTI3LjI4OCwwYy03LjUzNS03LjUzNC03LjUzNS0xOS43MzQsMC0yNy4yNDlsNDMuMzctNDMuMzMzbC00Mi44MTUtNDIuNzc3DQoJCQkJYy03LjQ3Ny03LjQ3Ny03LjQ3Ny0xOS41ODIsMC0yNy4wNGM3LjQ3Ny03LjQ3NywxOS42MDEtNy40NzcsMjcuMDc4LDBsNDIuODE1LDQyLjc3N2w0My45ODEtNDMuOTI1DQoJCQkJYzcuNTM0LTcuNTM0LDE5Ljc1NC03LjUzNCwyNy4yODgsMHM3LjUzNCwxOS43MzQsMCwyNy4yNWwtNDMuOTgxLDQzLjkyNUw0MzMuMTU0LDM0OC45MDZ6Ii8+DQoJCTwvZz4NCgk8L2c+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8L3N2Zz4NCg==" /></span>
                    
                </div>
                
                <div class="ingre-area">
                    
                    <select class="mc" name="ingMainCat1">
                    	<% for(MainCategory mc : mList) {%>
	                            <option value="<%=mc.getCategoryMainNo()%>"><%=mc.getCategoryName()%></option>
                            <%} %>
                    </select>
                    
                    <!--mainCat 선택에 따라 subCat요소 반복문 넣기-->
                    <select name="ingSubCat1">
                       <% for(SubCategory sc : sList) {%>
	                            <option value="<%=sc.getCategorySubNo()%>"><%=sc.getIngredientName()%></option>
                            <%} %>
                    </select>
                    
                    <input type="number" name="ingAmount1" class="amount" placeholder="예) 1~1000" min="0" max="1000" required>
                    
                    <select name="ingUnit1" required>
                        <option>g</option>
                        <option>Kg</option>
                        <option>근</option>
                        <option>개</option>
                        <option>대</option>
                        <option>컵</option>
                        <option>ml</option>
                        <option>L</option>
                        <option>t</option>
                        <option>T</option>
                    </select>
                    
                    <span class="ct-close"><img width="30px" height="30px" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pg0KPCEtLSBHZW5lcmF0b3I6IEFkb2JlIElsbHVzdHJhdG9yIDE2LjAuMCwgU1ZHIEV4cG9ydCBQbHVnLUluIC4gU1ZHIFZlcnNpb246IDYuMDAgQnVpbGQgMCkgIC0tPg0KPCFET0NUWVBFIHN2ZyBQVUJMSUMgIi0vL1czQy8vRFREIFNWRyAxLjEvL0VOIiAiaHR0cDovL3d3dy53My5vcmcvR3JhcGhpY3MvU1ZHLzEuMS9EVEQvc3ZnMTEuZHRkIj4NCjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iQ2FwYV8xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgd2lkdGg9IjYxMi4wMDhweCIgaGVpZ2h0PSI2MTIuMDA4cHgiIHZpZXdCb3g9IjAgMCA2MTIuMDA4IDYxMi4wMDgiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDYxMi4wMDggNjEyLjAwODsiDQoJIHhtbDpzcGFjZT0icHJlc2VydmUiPg0KPGc+DQoJPGcgaWQ9Il94MzlfXzQxXyI+DQoJCTxnPg0KCQkJPHBhdGggZD0iTTUzNS40NCw5NS42NjZIMTkyLjI2N2MtNS4zNTQtMC4zMjUtMTAuODA0LDEuMzM4LTE0LjkxNiw1LjQxMkw1LjUxNSwyOTEuMTU2Yy00LjAzNSwzLjk5Ny01Ljc1Niw5LjMzMi01LjQ4OCwxNC41NzINCgkJCQljLTAuMjY4LDUuMjM5LDEuNDU0LDEwLjU1Niw1LjQ4OCwxNC41NzFsMTcxLjgzNiwxOTAuMDc5YzMuNzQ4LDMuNzA5LDguNjI0LDUuNTQ1LDEzLjUyLDUuNjAzdjAuNDAxaDM0NC41Nw0KCQkJCWM0Mi4yOCwwLDc2LjU2Ny0zNC4yNDgsNzYuNTY3LTc2LjQ5VjE3Mi4xNzVDNjEyLjAwOCwxMjkuOTE0LDU3Ny43MjEsOTUuNjY2LDUzNS40NCw5NS42NjZ6IE00MzMuMTU0LDM0OC45MDYNCgkJCQljNy40NzcsNy40NzcsNy40NzcsMTkuNTgyLDAsMjcuMDM5Yy03LjQ3OCw3LjQ3OC0xOS42MDEsNy40NzgtMjcuMDc4LDBsLTQyLjgxNS00Mi43NzdsLTQzLjM3LDQzLjMzMg0KCQkJCWMtNy41MzQsNy41MTYtMTkuNzUzLDcuNTE2LTI3LjI4OCwwYy03LjUzNS03LjUzNC03LjUzNS0xOS43MzQsMC0yNy4yNDlsNDMuMzctNDMuMzMzbC00Mi44MTUtNDIuNzc3DQoJCQkJYy03LjQ3Ny03LjQ3Ny03LjQ3Ny0xOS41ODIsMC0yNy4wNGM3LjQ3Ny03LjQ3NywxOS42MDEtNy40NzcsMjcuMDc4LDBsNDIuODE1LDQyLjc3N2w0My45ODEtNDMuOTI1DQoJCQkJYzcuNTM0LTcuNTM0LDE5Ljc1NC03LjUzNCwyNy4yODgsMHM3LjUzNCwxOS43MzQsMCwyNy4yNWwtNDMuOTgxLDQzLjkyNUw0MzMuMTU0LDM0OC45MDZ6Ii8+DQoJCTwvZz4NCgk8L2c+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8L3N2Zz4NCg==" /></span>
                    
                </div>
                
                <div id="ingre-result">
    
                </div>
    
                <div align="center">
                    <button type="button" id="ingre-clone" class="clone-btn">+ 추가</button>
                </div>
                
                <!--부가재료영역-->
                
                <div>
                    <span class="vital">*</span><label class="content-title" for="">부가재료</label>
                </div>
                
                <div>
                    &nbsp;&nbsp;&nbsp;&nbsp;<img class="lightImg" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMSIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHhtbG5zOnN2Z2pzPSJodHRwOi8vc3ZnanMuY29tL3N2Z2pzIiB3aWR0aD0iNTEyIiBoZWlnaHQ9IjUxMiIgeD0iMCIgeT0iMCIgdmlld0JveD0iMCAwIDQ3OS43OTcgNDc5Ljc5NyIgc3R5bGU9ImVuYWJsZS1iYWNrZ3JvdW5kOm5ldyAwIDAgNTEyIDUxMiIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSIgY2xhc3M9IiI+PGc+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+Cgk8Zz4KCQk8cGF0aCBkPSJNMzgyLjc3NiwxMjYuMjM3QzM3NC40MSw2MC41MjQsMzIyLjQ0MSw4LjkxMSwyNTYuNjcyLDAuOTk3QzE3Ny42ODYtOC4yODEsMTA2LjEzNCw0OC4yMjgsOTYuODU1LDEyNy4yMTQgICAgYy0wLjY1Nyw1LjU5NC0wLjk4NSwxMS4yMjItMC45ODMsMTYuODU1Yy0wLjEzNiw0NC41MTMsMjAuNDM2LDg2LjU1OCw1NS42NjQsMTEzLjc2OGMxMC4xNTksNy41ODUsMTYuMiwxOS40NzQsMTYuMzM2LDMyLjE1MiAgICB2MTE4LjA4YzAuMDQ4LDEwLjI5OCw2LjY2LDE5LjQxNywxNi40MzIsMjIuNjY0YzMuODM0LDMwLjY4OSwzMS44MjEsNTIuNDYsNjIuNTEsNDguNjI1ICAgIGMyNS40MjQtMy4xNzYsNDUuNDQ5LTIzLjIwMiw0OC42MjYtNDguNjI1YzkuNzcyLTMuMjQ3LDE2LjM4NC0xMi4zNjYsMTYuNDMyLTIyLjY2NHYtMTE4LjA4ICAgIGMwLjEtMTIuNjA3LDYuMDQzLTI0LjQ1NCwxNi4wODgtMzIuMDcyQzM2OC4zMzgsMjI2Ljg4NywzODkuMjA3LDE3Ni43NTQsMzgyLjc3NiwxMjYuMjM3eiBNMjM5Ljg3Miw0NjQuMDY5ICAgIGMtMTkuMDAyLTAuMDIxLTM1LjM3NS0xMy4zODctMzkuMi0zMmg3OC40QzI3NS4yNDcsNDUwLjY4MiwyNTguODc0LDQ2NC4wNDgsMjM5Ljg3Miw0NjQuMDY5eiBNMjk1Ljg3MiwzMTIuMDY5aC01NiAgICBjLTQuNDE4LDAtOCwzLjU4Mi04LDhzMy41ODIsOCw4LDhoNTZ2OGgtNTZjLTQuNDE4LDAtOCwzLjU4Mi04LDhzMy41ODIsOCw4LDhoNTZ2OGgtNTZjLTQuNDE4LDAtOCwzLjU4Mi04LDhzMy41ODIsOCw4LDhoNTZ2OCAgICBoLTU2Yy00LjQxOCwwLTgsMy41ODItOCw4czMuNTgyLDgsOCw4aDU2djhjMCw0LjQxOC0zLjU4Miw4LTgsOGgtOTZjLTQuNDE4LDAtOC0zLjU4Mi04LTh2LTcuOTI4bDIzLjkyOCwwLjIzMmgwLjA3MiAgICBjNC40MTgsMC4wMiw4LjAxNi0zLjU0Niw4LjAzNi03Ljk2NHMtMy41NDYtOC4wMTYtNy45NjQtOC4wMzZsLTI0LjA3Mi0wLjIzMnYtOGwyMy45MjgsMC4yMzJoMC4wNzIgICAgYzQuNDE4LDAuMDIsOC4wMTYtMy41NDYsOC4wMzYtNy45NjRzLTMuNTQ2LTguMDE2LTcuOTY0LTguMDM2bC0yNC4wNzItMC4yMzJ2LThsMjMuOTI4LDAuMjMyaDAuMDcyICAgIGM0LjQxOCwwLjAyLDguMDE2LTMuNTQ2LDguMDM2LTcuOTY0cy0zLjU0Ni04LjAxNi03Ljk2NC04LjAzNmwtMjQuMDcyLTAuMjMydi04bDIzLjkyOCwwLjIzMmgwLjA3MiAgICBjNC40MTgsMC4wMiw4LjAxNi0zLjU0Niw4LjAzNi03Ljk2NHMtMy41NDYtOC4wMTYtNy45NjQtOC4wMzZsLTI0LjA3Mi0wLjIzMnYtMTYuMDcyaDExMlYzMTIuMDY5eiBNMzY2Ljk0LDE1OS4wODYgICAgYy00LjAzNCwzNC4xMTktMjEuNjE1LDY1LjE4NC00OC43ODgsODYuMjA3bDAuMDMyLTAuMDRjLTExLjE2Niw4LjU3Mi0xOC43NjQsMjAuOTc0LTIxLjMyOCwzNC44MTZIMTgyLjg3MiAgICBjLTIuNjExLTEzLjg4OC0xMC4yODItMjYuMzE0LTIxLjUyOC0zNC44NzJjLTU1Ljg1Mi00My40MjMtNjUuOTI3LTEyMy45LTIyLjUwNC0xNzkuNzUyYzQuNzU0LTYuMTE1LDEwLjA1My0xMS43ODYsMTUuODMyLTE2Ljk0NCAgICBjMjMuMzI1LTIwLjk3OCw1My42MTQtMzIuNTM3LDg0Ljk4NC0zMi40MzJjNS4wNzksMC4wMDMsMTAuMTU0LDAuMjk0LDE1LjIsMC44NzJDMzI1LjA1OSwyNS4yNDIsMzc1LjI0MSw4OC44ODIsMzY2Ljk0LDE1OS4wODZ6IiBmaWxsPSIjN2Y3ZjdmIiBkYXRhLW9yaWdpbmFsPSIjMDAwMDAwIiBzdHlsZT0iIiBjbGFzcz0iIj48L3BhdGg+Cgk8L2c+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPC9nPjwvc3ZnPg=="/>
                    <span class="guide">필수 재료가 아닌 부수적인 재료를 입력해주세요.</span>
                </div>
                
                <div id="add-area">
                    
                    <select class="mc" name="addMainCat1" placeholder="ddd">
                      <% for(MainCategory mc : mList) {%>
	                            <option value="<%=mc.getCategoryMainNo()%>"><%=mc.getCategoryName()%></option>
                      <%} %>
                    </select>
                    
                    <!--mainCat 선택에 따라 subCat요소 반복문 넣기-->
                    <select name="addSubCat1">
						<% for(SubCategory sc : sList) {%>
	                         <option value="<%=sc.getCategorySubNo()%>"><%=sc.getIngredientName()%></option>
                        <%} %>                        
                    </select>
                    
                    <input type="number" name="addAmount1" class="amount" class="addAmount1" placeholder="예) 1~1000" min="0" max="1000">
                    
                    <select name="addUnit1" required>
                        <option>g</option>
                        <option>Kg</option>
                        <option>근</option>
                        <option>개</option>
                        <option>대</option>
                        <option>컵</option>
                        <option>ml</option>
                        <option>L</option>
                        <option>t</option>
                        <option>T</option>
                    </select>
                    
                    <span class="ct-close"><img id="closeImg" width="30px" height="30px" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pg0KPCEtLSBHZW5lcmF0b3I6IEFkb2JlIElsbHVzdHJhdG9yIDE2LjAuMCwgU1ZHIEV4cG9ydCBQbHVnLUluIC4gU1ZHIFZlcnNpb246IDYuMDAgQnVpbGQgMCkgIC0tPg0KPCFET0NUWVBFIHN2ZyBQVUJMSUMgIi0vL1czQy8vRFREIFNWRyAxLjEvL0VOIiAiaHR0cDovL3d3dy53My5vcmcvR3JhcGhpY3MvU1ZHLzEuMS9EVEQvc3ZnMTEuZHRkIj4NCjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iQ2FwYV8xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgd2lkdGg9IjYxMi4wMDhweCIgaGVpZ2h0PSI2MTIuMDA4cHgiIHZpZXdCb3g9IjAgMCA2MTIuMDA4IDYxMi4wMDgiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDYxMi4wMDggNjEyLjAwODsiDQoJIHhtbDpzcGFjZT0icHJlc2VydmUiPg0KPGc+DQoJPGcgaWQ9Il94MzlfXzQxXyI+DQoJCTxnPg0KCQkJPHBhdGggZD0iTTUzNS40NCw5NS42NjZIMTkyLjI2N2MtNS4zNTQtMC4zMjUtMTAuODA0LDEuMzM4LTE0LjkxNiw1LjQxMkw1LjUxNSwyOTEuMTU2Yy00LjAzNSwzLjk5Ny01Ljc1Niw5LjMzMi01LjQ4OCwxNC41NzINCgkJCQljLTAuMjY4LDUuMjM5LDEuNDU0LDEwLjU1Niw1LjQ4OCwxNC41NzFsMTcxLjgzNiwxOTAuMDc5YzMuNzQ4LDMuNzA5LDguNjI0LDUuNTQ1LDEzLjUyLDUuNjAzdjAuNDAxaDM0NC41Nw0KCQkJCWM0Mi4yOCwwLDc2LjU2Ny0zNC4yNDgsNzYuNTY3LTc2LjQ5VjE3Mi4xNzVDNjEyLjAwOCwxMjkuOTE0LDU3Ny43MjEsOTUuNjY2LDUzNS40NCw5NS42NjZ6IE00MzMuMTU0LDM0OC45MDYNCgkJCQljNy40NzcsNy40NzcsNy40NzcsMTkuNTgyLDAsMjcuMDM5Yy03LjQ3OCw3LjQ3OC0xOS42MDEsNy40NzgtMjcuMDc4LDBsLTQyLjgxNS00Mi43NzdsLTQzLjM3LDQzLjMzMg0KCQkJCWMtNy41MzQsNy41MTYtMTkuNzUzLDcuNTE2LTI3LjI4OCwwYy03LjUzNS03LjUzNC03LjUzNS0xOS43MzQsMC0yNy4yNDlsNDMuMzctNDMuMzMzbC00Mi44MTUtNDIuNzc3DQoJCQkJYy03LjQ3Ny03LjQ3Ny03LjQ3Ny0xOS41ODIsMC0yNy4wNGM3LjQ3Ny03LjQ3NywxOS42MDEtNy40NzcsMjcuMDc4LDBsNDIuODE1LDQyLjc3N2w0My45ODEtNDMuOTI1DQoJCQkJYzcuNTM0LTcuNTM0LDE5Ljc1NC03LjUzNCwyNy4yODgsMHM3LjUzNCwxOS43MzQsMCwyNy4yNWwtNDMuOTgxLDQzLjkyNUw0MzMuMTU0LDM0OC45MDZ6Ii8+DQoJCTwvZz4NCgk8L2c+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8L3N2Zz4NCg==" /></span>
                </div>
                
                <div id="add-result">
                    
                </div>
                
                <div align="center">
                    <button type="button" id="add-clone" class="clone-btn">+ 추가</button>
                </div>
                
            </div>
        </div>

        <!-- 4) 요리 순서 영역  -->
        <div class="enroll-form4">
            
            <div class="enroll-content4">
                
                
                <div>
                    <span class="vital">*</span><label class="content-title" for="">요리순서</label>
                </div>
                
                <div class="guide-area">
                    &nbsp;&nbsp;&nbsp;&nbsp;<img width="30" height="30" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMSIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHhtbG5zOnN2Z2pzPSJodHRwOi8vc3ZnanMuY29tL3N2Z2pzIiB3aWR0aD0iNTEyIiBoZWlnaHQ9IjUxMiIgeD0iMCIgeT0iMCIgdmlld0JveD0iMCAwIDQ3OS43OTcgNDc5Ljc5NyIgc3R5bGU9ImVuYWJsZS1iYWNrZ3JvdW5kOm5ldyAwIDAgNTEyIDUxMiIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSIgY2xhc3M9IiI+PGc+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+Cgk8Zz4KCQk8cGF0aCBkPSJNMzgyLjc3NiwxMjYuMjM3QzM3NC40MSw2MC41MjQsMzIyLjQ0MSw4LjkxMSwyNTYuNjcyLDAuOTk3QzE3Ny42ODYtOC4yODEsMTA2LjEzNCw0OC4yMjgsOTYuODU1LDEyNy4yMTQgICAgYy0wLjY1Nyw1LjU5NC0wLjk4NSwxMS4yMjItMC45ODMsMTYuODU1Yy0wLjEzNiw0NC41MTMsMjAuNDM2LDg2LjU1OCw1NS42NjQsMTEzLjc2OGMxMC4xNTksNy41ODUsMTYuMiwxOS40NzQsMTYuMzM2LDMyLjE1MiAgICB2MTE4LjA4YzAuMDQ4LDEwLjI5OCw2LjY2LDE5LjQxNywxNi40MzIsMjIuNjY0YzMuODM0LDMwLjY4OSwzMS44MjEsNTIuNDYsNjIuNTEsNDguNjI1ICAgIGMyNS40MjQtMy4xNzYsNDUuNDQ5LTIzLjIwMiw0OC42MjYtNDguNjI1YzkuNzcyLTMuMjQ3LDE2LjM4NC0xMi4zNjYsMTYuNDMyLTIyLjY2NHYtMTE4LjA4ICAgIGMwLjEtMTIuNjA3LDYuMDQzLTI0LjQ1NCwxNi4wODgtMzIuMDcyQzM2OC4zMzgsMjI2Ljg4NywzODkuMjA3LDE3Ni43NTQsMzgyLjc3NiwxMjYuMjM3eiBNMjM5Ljg3Miw0NjQuMDY5ICAgIGMtMTkuMDAyLTAuMDIxLTM1LjM3NS0xMy4zODctMzkuMi0zMmg3OC40QzI3NS4yNDcsNDUwLjY4MiwyNTguODc0LDQ2NC4wNDgsMjM5Ljg3Miw0NjQuMDY5eiBNMjk1Ljg3MiwzMTIuMDY5aC01NiAgICBjLTQuNDE4LDAtOCwzLjU4Mi04LDhzMy41ODIsOCw4LDhoNTZ2OGgtNTZjLTQuNDE4LDAtOCwzLjU4Mi04LDhzMy41ODIsOCw4LDhoNTZ2OGgtNTZjLTQuNDE4LDAtOCwzLjU4Mi04LDhzMy41ODIsOCw4LDhoNTZ2OCAgICBoLTU2Yy00LjQxOCwwLTgsMy41ODItOCw4czMuNTgyLDgsOCw4aDU2djhjMCw0LjQxOC0zLjU4Miw4LTgsOGgtOTZjLTQuNDE4LDAtOC0zLjU4Mi04LTh2LTcuOTI4bDIzLjkyOCwwLjIzMmgwLjA3MiAgICBjNC40MTgsMC4wMiw4LjAxNi0zLjU0Niw4LjAzNi03Ljk2NHMtMy41NDYtOC4wMTYtNy45NjQtOC4wMzZsLTI0LjA3Mi0wLjIzMnYtOGwyMy45MjgsMC4yMzJoMC4wNzIgICAgYzQuNDE4LDAuMDIsOC4wMTYtMy41NDYsOC4wMzYtNy45NjRzLTMuNTQ2LTguMDE2LTcuOTY0LTguMDM2bC0yNC4wNzItMC4yMzJ2LThsMjMuOTI4LDAuMjMyaDAuMDcyICAgIGM0LjQxOCwwLjAyLDguMDE2LTMuNTQ2LDguMDM2LTcuOTY0cy0zLjU0Ni04LjAxNi03Ljk2NC04LjAzNmwtMjQuMDcyLTAuMjMydi04bDIzLjkyOCwwLjIzMmgwLjA3MiAgICBjNC40MTgsMC4wMiw4LjAxNi0zLjU0Niw4LjAzNi03Ljk2NHMtMy41NDYtOC4wMTYtNy45NjQtOC4wMzZsLTI0LjA3Mi0wLjIzMnYtMTYuMDcyaDExMlYzMTIuMDY5eiBNMzY2Ljk0LDE1OS4wODYgICAgYy00LjAzNCwzNC4xMTktMjEuNjE1LDY1LjE4NC00OC43ODgsODYuMjA3bDAuMDMyLTAuMDRjLTExLjE2Niw4LjU3Mi0xOC43NjQsMjAuOTc0LTIxLjMyOCwzNC44MTZIMTgyLjg3MiAgICBjLTIuNjExLTEzLjg4OC0xMC4yODItMjYuMzE0LTIxLjUyOC0zNC44NzJjLTU1Ljg1Mi00My40MjMtNjUuOTI3LTEyMy45LTIyLjUwNC0xNzkuNzUyYzQuNzU0LTYuMTE1LDEwLjA1My0xMS43ODYsMTUuODMyLTE2Ljk0NCAgICBjMjMuMzI1LTIwLjk3OCw1My42MTQtMzIuNTM3LDg0Ljk4NC0zMi40MzJjNS4wNzksMC4wMDMsMTAuMTU0LDAuMjk0LDE1LjIsMC44NzJDMzI1LjA1OSwyNS4yNDIsMzc1LjI0MSw4OC44ODIsMzY2Ljk0LDE1OS4wODZ6IiBmaWxsPSIjN2Y3ZjdmIiBkYXRhLW9yaWdpbmFsPSIjMDAwMDAwIiBzdHlsZT0iIiBjbGFzcz0iIj48L3BhdGg+Cgk8L2c+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPC9nPjwvc3ZnPg=="/>
                    <span class="guide">
                        <b>요리의 맛이 좌우될 수 있는 중요한 부분은 빠짐없이 적어주세요.</b><br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        예) 10분간 익혀주세요 ▷ 10분간 약한불로 익혀주세요. <br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        마늘편은 익혀주세요 ▷ 마늘편을 충분히 익혀주셔야 매운 맛이 사라집니다. <br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        꿀을 조금 넣어주세요 ▷ 꿀이 없는 경우, 설탕 1스푼으로 대체 가능합니다.
                    </span>
                </div>
                
                <!-- step(1~10) 영역 -->
                <div id="order-area">
                    <table>
                        <tr>
                            <td width="100">
                                <label class="order-title">
                                    Step
                                </label>
                                <label class="order-no">1</label>
                                <input type="hidden" name="order" value="1">
                            </td>
                            <th width="500"><textarea class="order-textarea" name="expln1" required></textarea></th>
                            <td width="160"><img id="orderImg1" class="order-img"></td>
                            <th width="50"><span class="order-ct-close"><img width="30px" height="30px" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pg0KPCEtLSBHZW5lcmF0b3I6IEFkb2JlIElsbHVzdHJhdG9yIDE2LjAuMCwgU1ZHIEV4cG9ydCBQbHVnLUluIC4gU1ZHIFZlcnNpb246IDYuMDAgQnVpbGQgMCkgIC0tPg0KPCFET0NUWVBFIHN2ZyBQVUJMSUMgIi0vL1czQy8vRFREIFNWRyAxLjEvL0VOIiAiaHR0cDovL3d3dy53My5vcmcvR3JhcGhpY3MvU1ZHLzEuMS9EVEQvc3ZnMTEuZHRkIj4NCjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iQ2FwYV8xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgd2lkdGg9IjYxMi4wMDhweCIgaGVpZ2h0PSI2MTIuMDA4cHgiIHZpZXdCb3g9IjAgMCA2MTIuMDA4IDYxMi4wMDgiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDYxMi4wMDggNjEyLjAwODsiDQoJIHhtbDpzcGFjZT0icHJlc2VydmUiPg0KPGc+DQoJPGcgaWQ9Il94MzlfXzQxXyI+DQoJCTxnPg0KCQkJPHBhdGggZD0iTTUzNS40NCw5NS42NjZIMTkyLjI2N2MtNS4zNTQtMC4zMjUtMTAuODA0LDEuMzM4LTE0LjkxNiw1LjQxMkw1LjUxNSwyOTEuMTU2Yy00LjAzNSwzLjk5Ny01Ljc1Niw5LjMzMi01LjQ4OCwxNC41NzINCgkJCQljLTAuMjY4LDUuMjM5LDEuNDU0LDEwLjU1Niw1LjQ4OCwxNC41NzFsMTcxLjgzNiwxOTAuMDc5YzMuNzQ4LDMuNzA5LDguNjI0LDUuNTQ1LDEzLjUyLDUuNjAzdjAuNDAxaDM0NC41Nw0KCQkJCWM0Mi4yOCwwLDc2LjU2Ny0zNC4yNDgsNzYuNTY3LTc2LjQ5VjE3Mi4xNzVDNjEyLjAwOCwxMjkuOTE0LDU3Ny43MjEsOTUuNjY2LDUzNS40NCw5NS42NjZ6IE00MzMuMTU0LDM0OC45MDYNCgkJCQljNy40NzcsNy40NzcsNy40NzcsMTkuNTgyLDAsMjcuMDM5Yy03LjQ3OCw3LjQ3OC0xOS42MDEsNy40NzgtMjcuMDc4LDBsLTQyLjgxNS00Mi43NzdsLTQzLjM3LDQzLjMzMg0KCQkJCWMtNy41MzQsNy41MTYtMTkuNzUzLDcuNTE2LTI3LjI4OCwwYy03LjUzNS03LjUzNC03LjUzNS0xOS43MzQsMC0yNy4yNDlsNDMuMzctNDMuMzMzbC00Mi44MTUtNDIuNzc3DQoJCQkJYy03LjQ3Ny03LjQ3Ny03LjQ3Ny0xOS41ODIsMC0yNy4wNGM3LjQ3Ny03LjQ3NywxOS42MDEtNy40NzcsMjcuMDc4LDBsNDIuODE1LDQyLjc3N2w0My45ODEtNDMuOTI1DQoJCQkJYzcuNTM0LTcuNTM0LDE5Ljc1NC03LjUzNCwyNy4yODgsMHM3LjUzNCwxOS43MzQsMCwyNy4yNWwtNDMuOTgxLDQzLjkyNUw0MzMuMTU0LDM0OC45MDZ6Ii8+DQoJCTwvZz4NCgk8L2c+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8L3N2Zz4NCg=="></span></th>
                            </tr>
                        </table>
                        
                    </div>
                    
            <div id="order-result">
                
            </div>
            
            <div align="center">
                <button type="button" id="order-clone" class="clone-btn">+ 추가</button>
            </div>
            
            <div class="input-file">
                <input type="file" id="file1" name="orderImg1" onchange="loadImg(this, 1);">
                <input type="file" id="file2" name="orderImg2" onchange="loadImg(this, 2);">
                <input type="file" id="file3" name="orderImg3" onchange="loadImg(this, 3);">
                <input type="file" id="file4" name="orderImg4" onchange="loadImg(this, 4);">
                <input type="file" id="file5" name="orderImg5" onchange="loadImg(this, 5);">
                <input type="file" id="file6" name="orderImg6" onchange="loadImg(this, 6);">
                <input type="file" id="file7" name="orderImg7" onchange="loadImg(this, 7);">
                <input type="file" id="file8" name="orderImg8" onchange="loadImg(this, 8);">
                <input type="file" id="file9" name="orderImg9" onchange="loadImg(this, 9);">
                <input type="file" id="file10" name="orderImg10" onchange="loadImg(this, 10);">
            </div>
        </div>
        
    </div>

    

<!-- 5) 마지막 버튼 영역-->
<div class="enroll-form5" align="center">
    <button class="btn btn-secondary" id="cancel-btn">취소 </button>
    <button type="submit" class="btn btn-success" id="enroll-btn">등록</button>
</div>


</form>

    <!--모든 스크립트 영역-->
    <script>
    
    /*2) 검색버튼기능 영역 [2~3 clone|remove] [1버튼 display:none <-> display:block] 개수전달 : sbCount*/ 
    $(function(){
        var sbCount = 0;
            
        $("#search-btn-clone").click(function(){
                
            if(sbCount < 3){
	            ++sbCount;
	            $("input[name=sbCount]").val(sbCount);
                var $clone = $("#serach-btn-input-area").clone(true);
                
        		$clone.css("display", "block");
                $clone.children().eq(0).attr("name", "btnMainCat" + sbCount);
                $clone.children().eq(1).attr("name", "btnSubCat" + sbCount);
                    
                $clone.appendTo("#serach-btn-input-result");
            }
        })
        
        $("#serach-btn-input-area").children().eq(2).click(function(){

            if(sbCount <= 3) {
	            sbCount--;
                $(this).parent().remove();
            
            	$("#sbCount").val(sbCount);
            }
        })
        
        $("#serach-btn-input-area").hover(function(){
            if(sbCount == 1) {
                $(this).children().eq(2).show();
            }
        }, function(){
            if(sbCount == 1) {
                $(this).children().eq(2).hide();
            }
        })
        
        $("#serach-btn-input-result").hover(function(){
            $(this).children().last().children().eq(2).show();
            
        }, function(){
            $(this).children().last().children().eq(2).hide();
        })

    })
    
    
    /* 3_1) 필수재료 select요소 복제 [2~5 복제가능 ] [1 remove버튼 안보임]*/
        $(function(){
            $(".ct-close").hide();
            var ingCount = 1;

            $("#ingre-clone").click(function(){
                if(ingCount < 5){
                    var $clone = $("#hide-org").clone(true);
                    
                    ingCount++;
                    $("input[name=ingCount]").val(ingCount);
                    
                    $clone.css("display","block");
                    $clone.children().eq(0).attr("name", "ingMainCat" + ingCount);
                    $clone.children().eq(1).attr("name", "ingSubCat" + ingCount);
                    $clone.children().eq(2).prop("required", true);
                    $clone.children().eq(2).attr("name", "ingAmount" + ingCount);
                    $clone.children().eq(3).attr("name", "ingUnit" + ingCount);
                    
                    $clone.appendTo("#ingre-result");
                    
                }
            })
            
            $("#hide-org").children().eq(4).click(function(){
                
                $(this).parent().remove();
                
                ingCount--;
                $("input[name=ingCount]").val(ingCount);
                
            })
            
            
            $("#ingre-result").hover(function(){
                $(this).children().last().children().eq(4).show();
                
            }, function(){
                $(this).children().last().children().eq(4).hide();
            })

        })
        
        
        /*3_2) 부가재료 select요소 복제 0~5가능 x버튼[1=hide | 2~5 remove] !!버튼개수 addCount*/
        $(function(){
            var addCount = 0;
            
            
            $("#add-clone").click(function(){
                    
                    if(addCount < 5){
	                	++addCount;
                        var $clone = $("#add-area").clone(true);
                        
                        $clone.css("display", "block");
                        $clone.children().eq(0).attr("name", "addMainCat" + addCount);
                        $clone.children().eq(1).attr("name", "addSubCat" + addCount);
                        $clone.children().eq(2).prop("required", true);
                        $clone.children().eq(2).attr("name", "addAmount" + addCount);
                        $clone.children().eq(3).attr("name", "addUnit" + addCount);
                        $("input[name=addCount]").val(addCount);
                        $clone.appendTo("#add-result");
                    }
            })
            
            $("#add-area").children().eq(4).click(function(){
                
                if(addCount <= 5) {
	                addCount--;
                    $(this).parent().remove();
	                $("input[name=addCount]").val(addCount);
                }
                
            })
            
     
            
            $("#add-area").hover(function(){
                if(addCount == 1) {
                    $(this).children().eq(4).show();
                }
            }, function(){
                if(addCount == 1) {
                    $(this).children().eq(4).hide();
                }
            })

            $("#add-result").hover(function(){
                $(this).children().last().children().eq(4).show();
                
            }, function(){
                $(this).children().last().children().eq(4).hide();
            })
            
        })

    /* 4) 요리순서 버튼추가 동작[1개 기본 10개 까지가능] [지우기는 2~10까지만가능]*/
    $(function(){
        $(".input-file").hide();    
        $(".order-ct-close").hide();

        var orderCount = 1;
            
        
        $("#order-clone").click(function(){
        	
            if(orderCount < 10){
            	
                var $clone = $("#order-area").clone(false);
                ++orderCount;
                $("input[name=orderCount]").val(orderCount);
                            
                $clone.find("label[class=order-no]").text(orderCount);
                $clone.find("input[name=order]").val(orderCount);
                $clone.find("textarea[class=order-textarea]").val(null);
                $clone.find("textarea[class=order-textarea]").prop("name", "expln" + orderCount).trigger("change");
                $clone.find("textarea[class=order-textarea]").prop('required', true).trigger("change");
                $clone.find("img[id^=orderImg]").prop("id", "orderImg" + orderCount).trigger("change");
                $clone.find("img[class=order-img]").attr("src", null);
                            
                $clone.appendTo("#order-result");
                            
            }
            
            $("#orderImg"+orderCount).click(function(){
                $("#file"+orderCount).click();
            })
           
                    
        })
 
        $(document).on("click", "span[class=order-ct-close]", function(){
	        $(this).parents("#order-area").remove();                      
	        orderCount--;
	        $("input[name=orderCount]").val(orderCount);
        })
        

        $("#order-result").hover(function(){
        	$(this).children().last().find("span[class=order-ct-close]").show();
                        
        }, function(){
            $(this).children().last().find("span[class=order-ct-close]").hide();
        })
                    
    })



    /*6) 위로올라가기 top 버튼*/
    $(function(){
        
        $(window).scroll(function() {
            if ($(this).scrollTop() > 500) {
                $('.up-btn').fadeIn();
            } else {
                $('.up-btn').fadeOut();
            }
        });

        $(".up-btn").click(function(){
            $("html, body").animate({
                scrollTop : 0
            }, 400);
            return false;
        })

    })
    
    /*7) file 미리보기 기능*/
    
    /*7_1) file 클릭시 연동*/
    $(function(){
    	
    	$("#insertMainImg").click(function(){
    		$("#file11").click();
    	})
    	
    	$("#insert-ingre-img").click(function(){
    		$("#file12").click();
    	})
    	
    	$("#orderImg1").click(function(){
        	$("#file1").click();
        })
        
    	
    })
    	
    /*loadImg 이미지파일 미리보기 기능*/
    	function loadImg(inputFile, num){
    	
		    if(inputFile.files.length == 1){    //선택한 파일이 존재하는 경우
		    	
		        var reader = new FileReader();
		        
		        reader.readAsDataURL(inputFile.files[0]);
		        
		        reader.onload = function(e){
		        	
		        	switch(num){
		        	case 1:$("#orderImg1").attr("src", e.target.result); break;
		        	case 2:$("#orderImg2").attr("src", e.target.result); break;
		        	case 3:$("#orderImg3").attr("src", e.target.result); break;
		        	case 4:$("#orderImg4").attr("src", e.target.result); break;
		        	case 5:$("#orderImg5").attr("src", e.target.result); break;
		        	case 6:$("#orderImg6").attr("src", e.target.result); break;
		        	case 7:$("#orderImg7").attr("src", e.target.result); break;
		        	case 8:$("#orderImg8").attr("src", e.target.result); break;
		        	case 9:$("#orderImg9").attr("src", e.target.result); break;
		        	case 10:$("#orderImg10").attr("src", e.target.result); break;
		        	case 11:$("#thumbnail-img").attr("src", e.target.result); break;
		        	case 12:$(".ingre-img").attr("src", e.target.result); break;
		        	
		        	}
		        	
		        }           	
		        
		    }else{
		    	
		    	switch(num){
		    	case 1:$("#orderImg1").attr("src", null); break;
	        	case 2:$("#orderImg2").attr("src", null); break;
	        	case 3:$("#orderImg3").attr("src", null); break;
	        	case 4:$("#orderImg4").attr("src", null); break;
	        	case 5:$("#orderImg5").attr("src", null); break;
	        	case 6:$("#orderImg6").attr("src", null); break;
	        	case 7:$("#orderImg7").attr("src", null); break;
	        	case 8:$("#orderImg8").attr("src", null); break;
	        	case 9:$("#orderImg9").attr("src", null); break;
	        	case 10:$("#orderImg10").attr("src", null); break;
	        	case 11:$("#thumbnail-img").attr("src", null); break;
	        	case 12:$(".ingre-img").attr("src", null); break;
		    	}
		    }
		    	
    	}
    
    
    </script>
    <script>
    	// sub카테고리 ajax 조회
    	$(function(){
	    	$(document).on("change", "select[class=mc]", function(){
	    		var $subCat = $(this);
	    		var option = "";
	    		
	    		$.ajax({
	    			url:"jqAjaxSbCatList.rcp",
	    			data:{"mcNo":$(this).val()},
	    			success:function(subCat){
	    				
	    				for(var i=0; i<subCat.length; i++) {
		    				option += "<option value='" + subCat[i].categorySubNo + "'>" + subCat[i].ingredientName + "</option>";    
	    				}
	    				
						$subCat.next().html(option);
	    				
	    			}
	    		})
	    	})
    	})
    	
    </script>    
    </div>
    
    
</body>
</html>