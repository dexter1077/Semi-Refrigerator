<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="jaewon.s">
<!-- 작성자 : 재원      ※ 혹여나 해당 페이지에 작업시에 작업하신부분에 주석으로 성함과 영역을 표시해주세요! (혹여나 파일이 날라갈수있으니 push전에 백업부탁드려요~)  -->

<title>Insert title here</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- 혹여나 아래의 폰트어썸이 빠져있으면 head쪽에 link로 꼭 달아주자 -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">

    <style>
        /* 전반적인 header영역 대충 잡은것 시작  */
        header{height: 230px; width: 1200px; margin: auto;}
        .logo-area{height: 125px;}
        .logo-area>img{margin-top: 10px;}
        .search-bar{width: 100%; height: 45px; background-color:rgb(0,153,102); color: white; line-height: 45px;} 
        .header-bottom-area{border: 1px solid rgb(0,102,51); height: 105px; position: relative; border-top: none;}
        .login-form{width: 290px; height: 60px; float: right; line-height: 60px; border: 1px solid red; box-sizing: border-box;}
        /* 전반적인 header영역 대충 잡은것 끝  위는 다른분 영역임 대충만 잡은것이다.*/


        /* nav 영역 */
        .nav-area{
            width: 900px; 
            height: 60px; 
            position: relative; 
            display: inline-block;
            }

        /* 각각의 메뉴 스타일*/
        .menu > a{
            width: 100%;
            height: 100%;
            color:rgb(51,51,51);
            font-size: 17.5px;
            font-weight: 500;
            line-height: 60px;
            display: block;
            text-decoration: none;
        }
        .menu > a:hover{color: rgb(0,102,51); font-weight: bold;}

        /* 각각 메뉴들 위치가 바뀌었을시의 위치잡기용 */
        .menu{width: 120px; position: absolute;}
        .menu1{left: 16%;}
        .menu2{left: 30%;}
        .menu3{left: 44%}
        .menu4{left: 58%}
        .menu5{left: 72%}

        /* 카테고리 클릭시 열리는 세부카테고리 div */
        #inner-category{
            width: 900px; 
            height: 360px;
            border: 1px solid gray;
            border-top: none;
            border-radius: 3px;
            margin-top: 1px;
            display: none;
            position: relative;
            z-index: 10000;
            background-color: rgba(255,255,255,0.95);
        }

        /* 세부카테고리 안에 테이블 스타일 */
        #inner-category > table{
            padding-top: 10px;
            padding-left: 5px;
        }

        /* 세부카테고리 각각의 셀 스타일 */
        #inner-category tr, #inner-category a{
            color: black;
            font-size: 14px;
            line-height: 35px;
            text-align: center;
            text-decoration: none;
            }

        #inner-category th{
            color: tomato;
            border: 1px solid green;
            border-radius: 10px;
        }

        /* 하단에 나가기 버튼 */
        #inner-category button{
            bottom: 10px;
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
        }   

    </style>
</head>
<body>
    <header align="center">
        <div class="logo-area">
            <img src="<%= request.getContextPath() %>/resources/image/logo.png" style="width: 170px; height: 75px;">
        </div>
        <div class="header-bottom-area">
            <div class="search-bar">검색영역</div>
        <!-- 위가 대략작인 header 부분 -->

<!--------------------------------------아래가 일부기능을 담당한 내 영역 ----------------------------------------------->
            <div class="nav-area" align="center">
                
                <!-- jsp 페이지라고 가정하면 각각 nav 메뉴들의 class속성값의 맨끝숫자를 아래에 출력문으로 대체해주면된다. -->
                <!-- 홈메뉴 -->
                <div class="menu menu1"><a href="index.html">홈</a></div> <!--contextPath만 넣어주면 기능끝난다.-->

                <!------------------------------------- 카테고리메뉴-------------------------------------------------->
                <div class="menu menu2" id="nav-category"><a href="javascript:showDiv()">카테고리</a>
                    <!-- 페이지넘어가는게 아닌 아래의 상세카테고리 div가 보이는 형식 -->
                    <div id="inner-category" align="center">
                        <table>
                            <!-- 어짜피 카테고리명 재료명을 조회해와서 뿌려줘야한다.!!! 
                                즉 상단에 스크립틀릿으로 카테고리 번호 카테고리명 재료명을 가져올것이다. 
                                이를 출력문으로 뿌려줄때에!! 
                                servlet 하나 만들어두고 ! 해당 카테고리 number를 넘기는 식으로 하면된다.  
                                위치는 잡아줬다. 아래는 반복문으로 만들어줄것이다. 
                                ★ 다만 좀 수정봐야하는게 대분류가 몇개가 될지는 아직 미지수이다 이부분 CSS처리해줘야한다.  
                            -->
                            <tr>
                                <th width=120 >육류</th>
                                <td width=86><a href="">소고기</a></td>
                                <td width=86><a href="">돼지고기</a></td> 
                                <td width=86><a href="">닭고기</a></td>
                                <td width=86><a href="">양고기</a></td> 
                                <td width=86><a href="">말고기</a></td>
                                <td width=86><a href="">리코타치즈</a></td>
                                <td width=86><a href="">다섯글자임</a></td>
                                <td width=86><a href="">예시예시</a>
                                <td width=86><a href="">예시예시</a></td>
                                <td width=86><a href="">예시예시</a></td>
                            </tr>
                        </table>
                        <button onclick="showDiv()">닫기버튼</button>
                    </div>               
                </div>
                <!-- 이벤트메뉴 -->
                <div class="menu menu3"><a href="이벤트 페이지로 넘어가는 servlet호출">이벤트</a></div>
                <!-- 레시피메뉴 -->
                <div class="menu menu4"><a href="이벤트 페이지로 넘어가는 servlet호출">레시피</a></div>
                <!-- 고객센터메뉴 -->
                <div class="menu menu5"><a href="고객센터 페이지로 넘어가는 servlet호출">고객센터</a></div>
            </div>

            <script>
                // 페이지 로딩이 끝나자마자 실행할 script (자바스크립트 버전) 순서 변경시에 아래에 뜰 창 위치 변경 
                window.onload = function(){
                    var navCategory = document.getElementById('nav-category');
                    var num = navCategory.getAttribute('class').charAt(9);
                    var categoryArea = document.getElementById("inner-category");

                    // menu위치가 바뀌었을때 세부카테고리 div 위치 다 잡아준것이다. (노가다)
                    switch(num){
                    case '1' :  categoryArea.style.transform = "translateX(0px)";        break;
                    case '2' :  categoryArea.style.transform = "translateX(-125px)";     break;
                    case '3' :  categoryArea.style.transform = "translateX(-250px)";     break;
                    case '4' :  categoryArea.style.transform = "translateX(-376px)";     break;
                    case '5' :  categoryArea.style.transform = "translateX(-502px)";     break;
                    }
                }

                // 세부카테고리페이지 열고닫히기 용 스크립트
                function showDiv() {
                    var categoryArea = document.getElementById("inner-category");
                    categoryArea.style.display =(categoryArea.style.display != 'block'?"block":"none"); 
                }
            </script>
<!-------------------------------------- 일부기능을 담당한 내 영역 끝 ----------------------------------------------->
            <!-- 로그인 form영역 -->
            <div class="login-form">로그인 영역</div>
        </div>
    </header>
</body>
</html>