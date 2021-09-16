<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
    int myPageNo = (int)request.getAttribute("myPageNo");
%>    
<%-- servlet에서 넘긴 myPageNo를 가지고 해당 menu선택시 css적용하게만듬  --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="jaewon.s">
<!-- Author : Jaewon -->

<title>Insert title here</title>
<style>
        .inner-page{
          	width: 1200px;
            margin: auto;
        }

        .navbar{
            width: 200px;
            height: 470px;
            margin-left: 65px;
            padding: 0px;
            padding-top: 20px;
            background-color: white;
            float: left;
        }

        .navbar span{
            font-size: 27px;
            font-weight: 900;
            padding-bottom: 35px;
        }

        .navbar-nav{
            width: 100%;
            height: 385px;
            margin: 0px;
            background-color: white;
        }

        .nav-item{
            width: 100%;
            height: 48px;
            border: 1px solid rgb(224,224,224);
            border-bottom: none;
            line-height: 32px;
            padding-left: 22px;
        }

        .navbar-nav:last-child{
            border-bottom: 1px solid rgb(224,224,224);
        }

        .nav-item a{
            color: rgb(127,127,127);
            font-size: 18px;
            font-weight: 700;
            position: relative;
        }

        .nav-item a:hover{
            color: orange;
            transform: scale(1.02);
        }

        .fa-chevron-right{
            position: absolute;
            top: 14px;
            right: 10px;
        }

        /* 각각의 페이지로 넘어가는 서블렛에서 !!! request.getRequestDispatcher로 forward해서 url요청을 하거나 혹은 
                      재요청을 할때 !! request.setAttribute("myPageNo", 1); 이런식으로 번호를 넘기면 해당 페이지에서 받아서 넣어준것 */
        .nav-item:nth-child(<%= myPageNo %>) a{    
            color: rgb(0,102,51);
        }

        .nav-item:nth-child(<%= myPageNo %>) {    
            background-color: rgb(241,241,241);
        }
        /*-- 기본적으로 outer에 flaot right 부여한 상태이다. --*/
        .outer{
            float: right;
        }
</style>
</head>
<body>
	<%-- 일부러 닫힘 태그를 작성하지 않았다 현재 include로  jsp를 호출시  그 페이지에서 닫힘 태그를 작성해줌으로서 하나의 공간에 담기 위함이다.--%>
    <div class="inner-page">
        <nav class="navbar">
            <span>마이페이지</span>
            <ul class="navbar-nav">
            <%-- Link들 들어갈 자리 --%>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/myInfo.me" >회원정보수정<i class="fas fa-chevron-right"></i></a>
                </li>
                <li class="nav-item">
                <%-- javascript를 통해서 cookie에 저장해놓은 최근본레시피 값을 번호로서 받아와 servlet호출시에  query String으로 해당 레시피 번호들을 하나의 문자열로서 넘기며 최근본레시피 페이지호출 --%>
				<script>
					function moveToRecent(){
						var rcpNo = sessionStorage.getItem("recentRecipeNo");
						location.href="<%=request.getContextPath()%>/myRecent.rcp?rcpNo=" +rcpNo; 						
					}
				</script>
                    <a class="nav-link" id="passRecent" onclick="moveToRecent();">최근본레시피<i class="fas fa-chevron-right"></i></a>
                </li>
                <li class="nav-item">            
                    <a class="nav-link" href="<%=request.getContextPath()%>/myScrap.scr">찜한레시피<i class="fas fa-chevron-right"></i></a>
                </li>
                <li class="nav-item">       	
                    <a class="nav-link" href="<%=request.getContextPath()%>/mylist.rcp?currentPage=1">내가 쓴 레시피<i class="fas fa-chevron-right"></i></a>
                </li>
                <li class="nav-item">        
                    <a class="nav-link" href="<%=request.getContextPath()%>/mylist.rpl?currentPage=1">내 댓글 관리<i class="fas fa-chevron-right"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/updateForm.pro">프로필 수정<i class="fas fa-chevron-right"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/review.me?currentPage=1">후기&별점 관리<i class="fas fa-chevron-right"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/deleteForm.fol?currentPage=1">팔로잉 관리<i class="fas fa-chevron-right"></i></a>
                </li>
            </ul>
        </nav>        
</body>
</html>