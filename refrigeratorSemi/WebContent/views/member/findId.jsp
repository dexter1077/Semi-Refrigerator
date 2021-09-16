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
    .idPWd-verify, .id-verify{
        border: 1px solid transparent;
        border-radius: 8px;
        box-sizing: border-box;
        background: #f4f4f4;
        width: 100%;
        height: 250px;
        padding: 0;
    }
    .idPWd-verify h3 , .id-verify h3{
        margin: 20px 30px 10px 30px;
    }
    .idPWd-verify li {
        list-style: none;
        float: left;
        border: solid 1px #c2c2c2;
        background: white;
        border-radius: 6px;
        text-align: center;
        position: relative;
        width: 450px;
        padding: 41px 0 36px;
        margin: 20px 24px;
    }
    .idPWd-verify a{
        text-decoration: none;
        color: #333;
    }
    .id-verify{
        height: 330px;
    }
    
    .find-wrap01 li{
        list-style: none;
        display: inline;
        
    }
    .dsn {
        display: none !important;
    }
    .input-style01{
        width: 430px;
        padding: 10px 15px 10px 15px;
        margin: 2px 20px;
        border: solid 1px #c2c2c2;
        background: white;
        border-radius: 6px;
        font-size: 14px;
        letter-spacing: -0.9px;
        height: 20px;
    }
    .blank{height: 4px;}
    .marT40 {
        margin: 30px 0 0;
    }
    .btn-next{
        width: 460px;
        height: 48px;
        margin: 0 20px;
        border-radius: 8px;
        color: #fff;
        background: #009764;
        border: 0;
        outline: 0;
    }
    .btn-next > a {
        display: block;
        height: 60px;
        line-height: 50px;
        font-size: 17px;
        color: #fff;
        text-align: center;
        text-decoration:none;
    }

    /*간편찾기*/
    .input_label{
        background: rgb(155, 192, 161);
        width: 95%;
        margin: 5px 13px;
        height: 35px;
        text-align: center;
        font-size: 14px;
        line-height: 35px;  /*글씨 세로위치*/
        border-radius: 10px;
        border: none;
    }
    span{
        border: 1px solid rgb(203, 218, 235);
        width: 95%;
        height: 90px;
        margin-top: 5px;
        border-radius: 10px;
        box-sizing: border-box;
        
    }
    .input-wrap{
        border: none;
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
                        <a href="<%= contextPath %>/findId.me">아이디 찾기</a>
                    </li>
                    <li>
                        <a href="<%= contextPath %>/findPwd.me">비밀번호 재설정</a>
                    </li>
                </ul>
            </div>

            <div class="find-txt01">
                아래의 아이디 찾기 수단 중 하나를 선택하세요.
            </div>

            <ul class="idPWd-verify">
                <h3>본인인증</h3>
                <p class="find-txt02">
                    본인 명의의 휴대전화 인증으로 아이디를 조회합니다.
                </p>
                
                <li>
                    <a href="" onclick="">
                        <img src="" alt="">
                        <strong>휴대전화 인증</strong>
                    </a>
                </li>
            </ul>

            <form action="<%=contextPath %>/findId.member" id="myFrm" method="post" name="myFrm" class="id-verify">
                		
                <h3>간편찾기</h3>
                
                <p class="find-txt02">
                    회원정보에 등록된 정보로 아이디를 찾습니다.<br>
                    회원가입 정보와 다를 경우 조회가 되지 않습니다.
                </p>
                
                <!--사용자 입력창-->
                <span class="input-wrap">

                    <div>   
                        <label class="dsn" for="userName">이름</label>
                        <input type="text" placeholder="이름" title="이름" class="input-style01" name="userName" id="userName" required>
                    </div>
                    
                    <div>
                        <label class="dsn" for="user-phone-email" id="user-phone-email-label">휴대전화번호</label>
                        <input type="text" placeholder="휴대전화 번호 (번호만 입력)" title="휴대폰번호" class="input-style01 isPhoneEvent isPhone" name="phone" id="user-phone-email" required>
                    </div>            
                    
                    <div>
                        <label class="dsn" for="user-phone-email" id="user-phone-email-label">이메일 주소</label>
                        <input type="text" placeholder="이메일" title="이메일" class="input-style01 isEmailEvent isEmail" name="email" id="user-phone-email" required>
                    </div>            
                    
                </span>

                
                <div class="marT40">
                    <div >
                        <button class="btn-next" type="submit">다음</button>
                    </div>
                </div>
            </form>

        </div>

        





    </div>


</body>
</html>