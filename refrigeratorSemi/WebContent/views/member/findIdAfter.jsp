<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.refrigerator.member.model.vo.Member"%>
<%
	String contextPath = request.getContextPath(); 
	Member findUser = (Member)session.getAttribute("findUser");
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script><style></style>
<style>
    .idPwd-outer{
        position: absolute;
        left: 50%;
        top: 50%;
        margin-left:-250px;
        margin-top:-300px;
    }
    .join{
        position: relative;
        width:100%;
        height:100%;
        width:500px;
    }
    .idPwd-inner {
        margin: 80px auto;
    }
    .idPwd-find ul{
        border: 1px solid #ddd;
        border-radius: 8px;
        box-sizing: border-box;
        background: #009764;
        width: 100%;
        height: 50px;
        padding: 0;
    }
    .idPwd-find ul li{
        list-style: none;
        margin-left: 10px;
        margin-top: 10px;
        padding: 0 30px 0 80px;
        display: inline;
        line-height: 45px;
    }
    .idPwd-find a{
        text-decoration: none;
        color: #fff;
        font-size: 16px;
    }
    .find-txt01{
        font-size: 21px;
        margin: 70px 0 50px;
        line-height: 1.5;
        text-align: center;
        letter-spacing: -0.4px;
        font-weight: 400;
    }
    .find-txt02{
        font-size: 13px;
        color: #636363;
        margin: 10px 0 20px 60px;
        line-height: 1;
        letter-spacing: -0.2px;
    }
    .idPWd-verify{
        border: 1px solid transparent;
        border-radius: 8px;
        box-sizing: border-box;
        background: #f4f4f4;
        width: 100%;
        height: 125px;
        padding: 17px 30px 10px;
    }
    /*검색결과*/
    .idPWd-verify li{
        display: inline-block;
        font-size: 15px;
        margin: 10px 0;
        padding: 0 20px;
    }
    .id-result{
        display: inline-block;
        padding: 0 110px;
        font-size: 17px;
    }
    .idPWd-verify a{
        text-decoration: none;
        color: #0e0808;
        font-weight: 500;
    }
    
    .btn_login a{
        display: inline-block;
        width: 100%;
        height: 48px;
        border-radius: 8px;
        padding: 15 10;
        background: #009764;
        border: 0;
        outline: 0;
        font-size: 17px;
        color: #fff;
        text-decoration: none;
        text-align: center;
        line-height: 45px;
    }
</style>
</head>
<body>

    <!--헤더부분뺀 전체바디영역-->
    <div class="idPwd-outer">

        <!--입력폼 전체-->
        <div class="join idPwd-inner">

            <!-- 아이디찾기 / 비밀번호재설정 -->
            <div class="idPwd-find">
                <ul>
                    <li>
                        <a href="<%= contextPath %>/findId.member">아이디 찾기</a>
                    </li>
                    <li>
                        <a href="<%= contextPath %>/findPwd.member">비밀번호 재설정</a>
                    </li>
                </ul>
            </div>

            <div class="find-txt01">
                입력하신 정보와 일치하는 회원입니다.
            </div>

            <!-- 결과 출력영역 -->
            <ul class="idPWd-verify">

                <li class="id-label">
                    <b>아이디</b> 
                    <div class="id-result">
                        <a><%= findUser.getUserId() %></a>
                    </div>
                </li>
                
                <li class="id-label">
                    <b>가입일</b> 
                    <div class="id-result">
                        <a><%= findUser.getEnrollDate()%></a>
                    </div>
                </li>
                
            </ul>

            <div class="btn_login">
                <a href="<%= contextPath %>/loginView.me">로그인</a>
            </div>

        </div>            

    </div>


</body>
</html>