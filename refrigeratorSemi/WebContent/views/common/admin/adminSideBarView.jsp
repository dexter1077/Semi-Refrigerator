<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- @author leeyeji -->
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Document</title>
<style>
    .side-nav{
        width: 150px;
        height: 900px;
        background: rgb(0, 153, 102);
        float: left;
    }
    /*희락*/
    .outer{
    	float:left;
    }
    .side-title button{
        text-align: left;
        color: white;
        font-size: 20px;
        padding-top: 10px;
        padding-left: 10px;
        font-weight: bold;
    }
    .side-title:hover{
        color: black;
        cursor: pointer;
    }
    #side-sub{
        margin-top: 3px;
        margin-left: 10px;
        background: white;
        width: 130px;
        border-radius: 5px;
        text-align: center;
        padding-bottom: 3px;
        display: none;
    }
    #side-sub a{
        font-size: 13px;
        color: black;
        text-decoration: none;
        display: inline-block;
    }
    #side-sub a:hover{
        color: rgb(0, 120, 51);
        font-weight: bold;
    }
</style>
</head>
<body>

	<div class="side-nav" align="left" id="for-height">
        <!--회원관리-->
        <div class="side-title">
            <button type="button" data-toggle="collapse1" data-target="#side-sub" class="btn side-btn">
                회원 관리
            </button>
            <div id="side-sub" class="collapse1">
                <a href="<%=contextPath%>/adList.me?currentPage=1">회원 목록</a><br>
                <a href="<%=contextPath%>/adList.repo?currentPage=1">신고 내역</a>
            </div>
        </div>

        <!--문의 관리-->
        <div class="side-title">
            <button type="button" data-toggle="collapse2" data-target="#side-sub" class="btn side-btn">
                문의 관리
            </button>
            <div id="side-sub" class="collapse2">
                <a href="<%=contextPath%>/adList.no?currentPage=1">공지사항</a><br>
                <a href="<%=contextPath%>/adList.faq?currentPage=1">FAQ</a><br>
                <a href="<%=contextPath%>/adList.inq?unSolCurrentPage=1&solCurrentPage=1">문의/답변</a><br>
            </div>
        </div>

        <!--사이트 관리-->
        <div class="side-title">
            <button type="button" data-toggle="collapse3" data-target="#side-sub" class="btn side-btn">
                사이트 관리
            </button>
            <div id="side-sub" class="collapse3">
                <a href="<%= request.getContextPath()%>/list.tos?currentPage=1">이용약관</a><br>
                <a href="<%= request.getContextPath()%>/list.cat">카테고리</a><br>
                <a href="<%= request.getContextPath()%>/menuList.nav">네비게이션바</a><br>
                <a href="<%= request.getContextPath()%>/adlist.ba?currentPage=1">배너</a>
            </div>
        </div>

        <!--게시판 관리-->
        <div class="side-title">
            <button type="button" data-toggle="collapse4" data-target="#side-sub" class="btn side-btn">
                게시판 관리
            </button>
            <div id="side-sub" class="collapse3">
                <a href="<%=contextPath%>/reviewlist.admin?currentPage=1">요리 후기</a><br>
                <a href="<%=contextPath%>/rlist.admin?currentPage=1">댓글</a><br>
                <a href="<%=contextPath%>/selectEvent.admin?currentPage=1">이벤트</a><br>
            </div>
        </div>

        <!--통계 관리-->
        <div class="side-title">
            <button type="button" data-toggle="collapse4" data-target="#side-sub" class="btn side-btn">
                통계 관리
            </button>
            <div id="side-sub" class="collapse4">
                <a href="">레시피</a>
            </div>
        </div>

        <!--레시피 관리-->
        <div class="side-title">
            <button type="button" class="btn side-btn">
                레시피 관리
            </button>
            <div id="side-sub" class="collapse5">
                <a href="">레시피 삭제</a><br>
                <a href="<%=contextPath%>/adRecipeList.banner?currentPage=1">메인 배너 레시피</a><br>
                <a href="">메인 레시피 목록</a><br>
            </div>
        </div>

    </div>

    
    <script>
        
        $(function(){

            $(".side-btn").click(function(){

                var $side = $(this).next();

                if($side.css("display") == "none"){
                    $(this).siblings("div").show(200);
                }else{
                    $side.hide(200);
                }

            })
        })

    </script>

</body>
</html>