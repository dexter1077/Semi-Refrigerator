<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<style>
	.sign-up_form-wrap{width: 400px; margin:0 auto; padding: 60px 0;}
	.sign-up_form-group{margin: 0 0 30px;}
	.sign-up_form-group_input{margin: 10px 0 0;display: flex;}
	.sign-up_form-group_label{display: block; margin: 0 0 12px; font-size: 14px; font-weight: 700; line-height: 20px;}
        
	.form-control{display: block; box-sizing: border-box; height: 40px; width: 100%; padding: 0 15px; line-height: 0; border-radius: 4px; border: 1px solid #cccccc;}
	.userId-input_local, .gender-input{width: 100%;}
        
	.birth-input_separator{flex: 0 0 10px; text-align: center; line-height: 35px; color: transparent;}
	.birth-input_month{width: 170px; color: #cccccc;}
	.sign-up_submit{background-color: #009764; color: #fff; 
		text-align: center; font-size: 15px; font-weight: 540; 
		width: 100%; height: 50px;
		border: none; border-radius: 4px; 
		margin: 10px 0; padding: 10px 0;
	}
    </style>
</head>
<body>
    <section class="container sign-up">

        <div class="sign-up_form-wrap">

            <form action="<%= contextPath %>/insert.member" class="sign-up_form" id="sign-up_form" method="post">
				
				<!-- 아이디 -->
                <div class="sign-up_form-group"> 
                    <!-- 텍스트div -->
                    <div class="sign-up_form-group_label">아이디</div>
                    <!-- 입력란div -->
                    <div class="sign-up_form-group_input"><span class="userId-input_local"><input class="form-control" type="text" id="userId" name="userId" placeholder="아이디" required></span></div>
                    <!-- 아이디 유효성검사+중복체크 -->
                    <div class="userId-input_idCheck" id="idCheck"></div>
                </div>
                
                <!-- 닉네임 input hidden -->
                <div class="sign-up_form-group"> 
                    <input class="form-control" type="hidden" id="nickname" name="nickname" value='' required>
                </div>

                
				<!-- 비밀번호 -->
                <div class="sign-up_form-group"> 
                    <!-- 텍스트div -->
                    <div class="sign-up_form-group_label">비밀번호</div>
                    <div class="sign-up_form-group_description">4자 이상 입력해주세요.</div>
                    <div class="sign-up_form-group_input">
                        <input class="form-control" type="password" id="userPwd" name="userPwd" placeholder="비밀번호(8자~20자)" required> 
                    </div>
                    <!-- 비밀번호 유효성검사 -->
                    <div class="userPwd-input_pwdCheck" id="pwdCheck"></div>
                </div>

                <!-- 비밀번호 확인 -->
                <div class="sign-up_form-group"> 
                    <!-- 텍스트div -->
                    <div class="sign-up_form-group_label">비밀번호 확인</div>
                    <div class="sign-up_form-group_input">
                        <input class="form-control" type="password" id="rePwd" name="rePwd" placeholder="비밀번호를 다시 입력해주세요." required> 
                    </div>
                    <!-- 비밀번호 재입력 검사 -->
                    <div class="userRePwd-input_rePwdCheck" id="rePwdCheck"></div>
                </div>

                <!-- 이름 -->
                <div class="sign-up_form-group"> 
                    <!-- 텍스트div -->
                    <div class="sign-up_form-group_label">이름</div>
                    <div class="sign-up_form-group_input">
                        <input class="form-control" type="text" id="userName" name="userName" required> 
                    </div>
                    <!-- 이름 유효성 검사 -->
                    <div class="userName-input_nameCheck" id="nameCheck" name="nameCheck"></div>
                </div>

                <!-- 생년월일 -->
                <div class="sign-up_form-group"> 
                    <!-- 텍스트div -->
                    <div class="sign-up_form-group_label">생년월일</div>
                    <!-- 입력란div -->
                    <div class="sign-up_form-group_input"> 
                        <span class="birth-input_year">
                            <input class="form-control" type="text" id="birthYear" name="birthYear" placeholder="년(4자)" required maxlength="4">
                        </span>
                        <span class="birth-input_separator">::</span>
                        <span class="birth-input_month">
                            <select class="form-control" id="birthMonth" name="birthMonth">
                                <option selected disabled>월</option>
                                <option value="01">1</option>
                                <option value="02">2</option>
                                <option value="03">3</option>
                                <option value="04">4</option>
                                <option value="05">5</option>
                                <option value="06">6</option>
                                <option value="07">7</option>
                                <option value="08">8</option>
                                <option value="09">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </select>
                        </span>
                        <span class="birth-input_separator">::</span>
                        <span class="birth-input_day">
                            <input class="form-control" type="text" id="birthDay" name="birthDay" placeholder="일" required maxlength="2">
                        </span>
                    </div>
                    <!-- 생년월일 유효성검사 -->
                    <div class="birth-input_birthCheck" id="birthCheck" name="birthCheck"></div>
                </div>

                <!-- 성별 -->
                <div class="sign-up_form-group">
                    <!-- 텍스트div --> 
                    <div class="sign-up_form-group_label">성별</div>
                    <!-- 입력란div -->
                    <div class="sign-up_form-group_input"> 
                        <span class="gender-input">
                            <select class="form-control" id="gender" name="gender">
                                <option selected disabled>성별</option>
                                <option value="M">남</option>
                                <option value="F">여</option>
                                <option value="N">선택안함</option>
                            </select>
                        </span>
                    </div>
                    <!-- 성별 유효성검사 -->
                    <div class="gender-input_genderCheck" id="genderCheck" name="genderCheck"></div>
                </div>

                <!-- 본인확인이메일 -->
                <div class="sign-up_form-group"> 
                    <!-- 텍스트div -->
                    <div class="sign-up_form-group_label">본인 확인 이메일 (선택)</div>
                    <div class="sign-up_form-group_input">
                        <input class="form-control" type="email" id="email" name="email"> 
                    </div>
                    <!-- 이메일 유효성검사 -->
                    <div class="email-input_emailCheck" id="emailCheck" name="emailCheck"></div>
                </div>

                <!-- 프로필사진 input hidden -->
                <div class="sign-up_form-group"> 
                    <input class="form-control" type="hidden" id="profileImg" name="profileImg" value="" required>
                </div>

                <button class="sign-up_submit" id="signUp_Submit" type="submit">회원가입</button>

            </form>

        </div>

    </section>


    <script>

        
        // 프로필 기본 경로 input hidden 프로필에 담기
        var profileImg = "resources/image/user.png";
        $('input[name=profileImg]').attr('value',profileImg);

        
        $("#userId").focusout(function() {
            
            // 아이디 유효성검사
            var userId = $("#userId").val();
            var idLength = /^[a-zA-Z0-9]{4,15}$/;

            if(idLength.test(userId)){ //검증을 통과 했다면
                $("#idCheck").text("멋진 아이디네요!");
                $("#userId").css("border", "");
                $("#idCheck").css("color", "#009764");
                // 아이디 input hidden 닉네임에 담기
                $('input[name=nickname]').attr('value', userId);
                    
            }else {//검증을 통과 하지 못했다면 
                $("#idCheck").text("5~20자의 영문 소문자, 숫자만 사용가능합니다.");
                $("#userId").css("border", "1px solid #009764");
                $("#idCheck").css("color", "#009764");
                $("#signUp_Submit").attr("disabled", true);
                return;
            }
            
            // 아이디 중복검사
            var $userId = $("#sign-up_form input[name=userId]");
            
            $.ajax({
                url:"idCheck.member",
                data:{checkId:$userId.val()},
                success:function(result){
                        
                    if(result == "NNNNN"){ // 사용 불가능
                            
                        $("#idCheck").text("이미 존재하거나 탈퇴한 회원의 아이디입니다.");
                        $("#userId").css("border", "1px solid #009764");
                        $("#idCheck").css("color", "#009764");
                        $userId.focus();
                        
                    }else{ // 사용 가능
                            
                        $("#idCheck").text("멋진 아이디네요!");
                        $("#userId").css("border", "");
                        $("#idCheck").css("color", "#009764");
                        $("#sign-up_form :submit").removeAttr("disabled"); // 회원가입 활성화
                    } 
                },error:function(){
                    console.log("아이디 중복체크용 ajax 통신실패");
                }
            });

        });

         // 비밀번호 유효성검사
        $("#userPwd").focusout(function(){
           
            var userPwd = $("#userPwd").val();
            var pwdLength = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+])(?!.*[^a-zA-z0-9$`~!@$!%*#^?&\\(\\)\-_=+]).{4,16}$/;

            if(pwdLength.test(userPwd)){
                $("#pwdCheck").hide();
                $("#userPwd").css("border", "");
            }else{
                $("#pwdCheck").text("8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
                $("#userPwd").css("border", "1px solid #009764");
                $("#pwdCheck").css("color", "#009764");
            }
        });

        // 비밀번호 재확인 일치여부 검사
        $("#rePwd").focusout(function(){
            var userPwd = $("#userPwd").val();
            var rePwd = $("#rePwd").val();

            if(userPwd != '' || rePwd != ''){
                
                if(userPwd == rePwd){ // 일치
                    $("#rePwdCheck").hide();
                    $("#rePwd").css("border", "");
                }else{ // 불일치
                    $("#rePwdCheck").text("비밀번호가 일치하지 않습니다.");
                    $("#rePwd").css("border", "1px solid #009764");
                    $("#rePwdCheck").css("color", "#009764");
                }
            }
        }); 

        // 이름 유효성검사
        $("#userName").focusout(function(){
             
            var userName = $("#userName").val();
            var regName = /^[가-힣a-zA-Z]{2,10}$/;

            if(regName.test(userName)){
                $("#nameCheck").hide();
                $("#userName").css("border", "");
            }else{
                $("#nameCheck").text("한글과 영문 대 소문자를 사용하세요.");
                $("#userName").css("border", "1px solid #009764");
                $("#nameCheck").css("color", "#009764");
            }
        });

        // 년 유효성검사
        $("#birthYear").focusout(function(){
             
            var birthYear = $("#birthYear").val();
            var regBirth = /[0-9]/g;

            if(birthYear < 1920 ) {
                $("#birthCheck").text("정말이세요?");
                $("#birthYear").css("border", "1px solid #009764");
                $("#birthCheck").css("color", "#009764");
                return;
            }
             
            if(regBirth.test(birthYear)){
                $("#birthCheck").hide();
                $("#birthYear").css("border", "");
            }else{
                $("#birthCheck").text("태어난 년도 4자리를 정확하게 입력하세요.");
                $("#birthYear").css("border", "1px solid #009764");
                $("#birthCheck").css("color", "#009764");
            }
            
         });

        // 월 유효성검사
        $("#sign-up_form").submit(function(){
            var birthMonth = $("#birthMonth option:selected").val();
            if(birthMonth == " "){
                $("#birthCheck").text("태어난 월을 선택하세요.");
                $("#birthCheck").css("color", "#009764");
            }
        });

        // 일 유효성검사
        $("#birthDay").focusout(function(){
             
            var birthDay = $("#birthDay").val();
            var regBirth = /[0-9]/g;
 
            if(birthDay > 31 ) {
                $("#birthCheck").text("태어난 일(날짜) 2자리를 정확하게 입력하세요.");
                $("#birthDay").css("border", "1px solid #009764");
                $("#birthCheck").css("color", "#009764");
                return;
            }
              
            if(regBirth.test(birthDay)){
                $("#birthCheck").hide();
                $("#birthDay").css("border", "");
            }else{
                $("#birthCheck").text("태어난 일(날짜) 2자리를 정확하게 입력하세요.");
                $("#birthDay").css("border", "1px solid #009764");
                $("#birthCheck").css("color", "#009764");
            }
             
        });

        // 성별 유효성검사 아니 왜 안돼?ㅠ
        $("#sign-up_form").submit(function(){
            var gender = $("#gender option:selected").val();
            if(gender == " "){
                $("#genderCheck").text("필수 입력 항목입니다.");
                $("#genderCheck").css("color", "#009764");
            }else{
                $("#genderCheck").hide();
                return;
            }
        });
        
        // 이메일 유효성검사
        $("#email").focusout(function(){
             
            var email = $("#email").val();
            var regEmail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
 
            if(regEmail.test(email)){
                $("#emailCheck").hide();
                $("#email").css("border", "");
            }else{
                $("#emailCheck").text("이메일 주소를 다시 확인해주세요.");
                $("#email").css("border", "1px solid #009764");
                $("#emailCheck").css("color", "#009764");
            }
         });



    
	</script>
	

</body>
</html>