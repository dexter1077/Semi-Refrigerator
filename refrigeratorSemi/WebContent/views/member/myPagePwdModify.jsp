<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String userId = request.getParameter("userId");
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="jaewon.s">
<!-- Author: Jaewon -->

<title>마이페이지 비밀번호 변경</title>
<style>
    .logo-area{
        margin-top: 10px;
    }

    .outer{
        width: 1200px;
        height: 640px;
        text-align: center;
        margin: auto;
        position: relative;
        z-index: 1000000;
        background-color: white;
        transform: translateY(-110px);
    }

    #pswModifyForm{
        width: 500px;
        height: 640px;
        margin: auto;
        padding-top: 90px;
    }
    
    #pswModifyForm h3{
        font-weight: 600;
        margin-bottom: 50px;
    }

    #pswModifyForm input{
        width: 100%;
        height: 55px;
        font-size: 19px;
        border: 1px solid rgb(190,190,190);
        border-radius: 5px;
        padding-left: 20px;
        margin-bottom: 12px;
    }

    #pswModifyForm input:hover{
        transform: scale(1.02);
        border: 1px solid orange;
    }

    #pswModifyForm span{
        height: 60px;
        float: left;
        font-size: 18px;
        font-weight: 500;
        line-height: 82px;
    }

    #pswModifyForm button{
        width: 100%;
        height: 60px;
        font-size: 20px;
        font-weight: 700;
        margin-top: 15px;
        border-radius: 5px;
        background-color: white;
        border: 1px solid rgb(220,220,220);
    }

    #pswModifyForm button:hover{
        color: pink;
        border: 2px solid pink;
    }

    #pswModifyForm button[type="submit"]{
        color: white;
        background-color: rgb(0,153,102) ;
    }
</style>

</head>
<body>
	<%@ include file="../common/user/tempJWHeader.jsp" %>

    <div class="outer">   
        <form action="pwdUpdate.me" method="post" id="pswModifyForm">
            <h3>비밀번호 변경</h3>
            <input type="hidden" name="userId" value="<%= userId %>">
            <input type="password" name="userPwd" placeholder="현재 비밀번호" required><br>
            <span>※ 영문자(대/소), 숫자, 특수문자를 포함하여 4자 이상 입력.</span><br>
            <input type="password" id="newPwd" name="newPwd" placeholder="새 비밀번호" required><br>
            <input type="password" id="newPWdCheck" placeholder="새 비밀 번호를 확인합니다" disabled required><br>
            <div id="checkPwdBox" style="display:none;">test</div>
            <script>         
			//새로운 비밀 번호 유효성 검사
			$(function(){
				$("input[name='userPwd']").focus();
			});
			
            $("#newPwd").focusout(function(){
                var newPwd = $("#newPwd").val();
                var pwdLength = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+])(?!.*[^a-zA-z0-9$`~!@$!%*#^?&\\(\\)\-_=+]).{4,16}$/;

                if(pwdLength.test(newPwd)){
					$("#checkPwdBox").html("※ 유효한 비밀번호입니다!");
					$("#checkPwdBox").css("color","green");
					$("#checkPwdBox").css("display", "");
					$("#checkPwdBox").css("text-align", "left");
					$("#newPWdCheck").prop("disabled" , false)
                }else{
					$("#checkPwdBox").html("※ 영문자, 숫자, 특수문자를 사용하여 4~16자로 설정해주세요");
					$("#checkPwdBox").css("color","red");
					$("#checkPwdBox").css("display", "");
					$("#checkPwdBox").css("text-align", "left");
					$("#checkPwdBox").focus();
                }
            });

			//새로운 비밀 번호 검사 한번더 ajax를 통해 유효성 검사            
            $("#newPWdCheck").focusout(function(){
				$.ajax({
					url : "AjaxPWDCheck.me",
					data : {
						newPwd:$("#newPwd").val(),
						newPwdCheck:$("#newPWdCheck").val()
					},
					type:"post",
					success:function(result){
						if(result == "true"){
						// 가입버튼 해제 
							$("#submitBtn").prop("disabled", false);
						// 일치여부에 따라서 알려주기
							$("#checkPwdBox").html("※ 비밀번호 일치");
							$("#checkPwdBox").css("color","green");
							$("#checkPwdBox").css("display", "");
							$("#checkPwdBox").css("text-align", "left");
						}else{
							$("#checkPwdBox").html("※ 비밀번호가 일치하지 않습니다 다시 입력해주세요");
							$("#checkPwdBox").css("color","red");
							$("#checkPwdBox").css("display", "");							
							$("#checkPwdBox").css("text-align", "left");
						};
					},error:function(){
						console.log("Ajax 통신 실패");
					}
				});
            });
            </script>
            <br>
            <button type="submit" id="submitBtn" disabled>확인</button><br>
            <button type="button" onclick="history.back()">취소</button>
        </form>
    </div>

	<%@ include file="../common/user/footer.jsp" %>
</body>
</html>