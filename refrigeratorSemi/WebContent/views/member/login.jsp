<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.refrigerator.member.model.vo.Member"%>
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        a{
            color: #333;
            text-decoration: none;

        }
        .login_outer{
            position: absolute;
            left: 50%;
            top: 50%;
            width:320px;
            margin-left:-160px;
            margin-top:-160px;
        }
        .login_inner{
            width:100%;
            height:100%;
            position:relative;
        }

        .box_login{
            border: 1px solid #ddd;
            border-radius: 8px;
            box-sizing: border-box;
            background: #f4f4f4;
            
        }
        .box_login .input_text{
            position: relative;
            width: 100%;
            box-sizing: border-box;
            padding: 15px 14px 15px;
            margin: 0;
        }
        .input_text input{
            display: block;
            width: 100%;
            height: 100%;
            font-size: 14px;
            border: none;
            outline: 0;
            background-color: transparent;
        }
        .box_login .input_text+.input_text {
            border-top: 1px solid #ddd;
        }
        .btn_login{
            margin: 20px 0 0;
            width: 100%;
            height: 48px;
            border-radius: 8px;
            padding: 15 10;
            font-size: 17px;
            color: #fff;
            background: #009764;
            border: 0;
            outline: 0;
        }

        .input_check .inputCb{
            position: absolute;
            width: 18px;
            height: 18px;
            margin-top: 9px;
        }
        .input_check .check_blank{
            display: inline-block;
                width: 20px;
                height: 20px;
                margin: 2px 5px 0 0;
        }
        .input_check .label_text{
            color: #909090;
            font-size: 13px;
            line-height: 19px;
        }
        .input_check .lab_keep{
            display: inline-block;
            vertical-align: top;
        }
        .find_login{
            width: 100%;
            text-align: center;
            margin: 30px 0;
        }
        .find_login a{
            line-height: 1;
            font-size: 13px;
            padding: 12px;
        }
        a:hover{
            color: #333;
        }
        a:active{
            color: #009764;
            outline: 0;
        }
    </style>
</head>
<body>
	<div class="login_outer">

        <div class="login_inner">

            <form action="<%= contextPath %>/login.me" id="" method="POST">

                <div class="box_login">
                    <div class="input_text">
                        <input type="text" id="loginId" name="userId" placeholder="아이디">
                    </div>
                    <div class="input_text">
                        <input type="password" id="loginPw" name="userPwd" placeholder="비밀번호">
                    </div>
                </div>
    
                <div class="input_check">
                    <input type="checkbox" id="keepLogin" name="keepLogin" class="inputCb">
                    <label for="keepLogin" class="lab_keep">
                        <span class="check_blank"></span>
                        <span class="label_text">
                            로그인 상태 유지
                        </span> 
                    </label>

                </div>
    
                <button type="submit" class="btn_login">로그인</button>
    
                <div class="find_login">
                    <a href="<%= contextPath %>/findId.me" class="find_link">아이디 찾기</a>
                    <a href="<%= contextPath %>/findPwd.me" class="find_link">비밀번호 재설정</a>
                    <a href="" class="find_link">회원가입</a>
                </div>
    
            </form>
        </div>

    </div>
</body>
</html>