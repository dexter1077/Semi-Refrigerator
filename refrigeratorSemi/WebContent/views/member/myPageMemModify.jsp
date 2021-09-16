<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.refrigerator.member.model.vo.Member"%>
<%
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="jaewon.s / heerak.Y">
<!-- Author : Jaewon -->
<title>마이페이지 회원정보수정</title>
<%--  이미 float right은 들어가있는상태이다 나머지는기호에따라 조금씩 움직여주면된다. --%>
<style>
    .outer{
        width: 850px;
        height: 700px;
        padding-top: 60px;
        margin-top: 20px;
        margin-right: 55px;
        margin-bottom: 20px;
    }

    .outer > p {
        color: rgb(0,102,51);
        font-size: 18px;
        font-weight: 900;
        padding-left: 30px;
    }


    .division-line{
        width: 820px;
        border: 1px solid rgb(207,207,207);
        margin-bottom: 20px;
    }

    #member-modify-table{
        width: 820px;
        font-size: 16px;
        font-weight: 600;
    }

    #member-modify-table > tbody > tr{
        border: 1px solid rgb(204,204,204);
    }

    #member-modify-table > tbody p{
        width: 170px;
        height: 35px;
        line-height: 35px;
        color: white;
        border-radius: 3px;
        padding-left: 15px;
        margin: auto;
        background-color:rgb(0,153,102);
    }

    #member-modify-table > tbody td:last-child{
        padding-left: 15px;
    }

    #member-modify-table > tbody td>input{
        width: 300px;
        height: 36px;
        font-weight: 600;
    }

    #member-modify-table > tbody button{
        width: 110px;
        height: 36px;
        font-size: 12px;
        font-weight: 600;
        border: none;
        padding: 0;
        background-color: rgb(52,152,219) ;
    }

    #member-modify-table>tbody >tr{
        height: 55px;
    }

    #member-modify-table>tfoot >tr{
        height: 150px;
        border: none;
    }

    #member-modify-table>tfoot button{
        width: 150px;
        height: 50px;
        color: white;
        border: none;
        border-radius: 3px;
        font-size: 18px;
        font-weight: 600;
    }

    #member-modify-table>tfoot td:nth-child(2) > button{
        background-color: rgb(52,152,219);
        transform: translateX(-100px);
    }

    #member-modify-table>tfoot td:nth-child(3) button{
        background-color: rgb(231,76,60);
    }

    #member-modify-table button:hover{
        color: pink;
        border: 2px solid pink;
    }

/*-------(희락님) 회원 탈퇴 모달 시작--------------*/
    #memDelete-modal{
        margin-top:400px;
    }

    #memDelete-modal>div>div{
        width:650px;
        height:320px;
    }

    #delete-modal-header{
        width:600px;
        border: none;
        padding:30px 0px 0px 30px;
    }

    #delete-modal-title{
        width: 600px;
        border: 30px 30px 0px;
        border-bottom:4px solid rgb(0,102,51);
        color: rgb(0,102,51);
        font-weight:bolder;
    }

    .delete-modal-body{
        font-size:12px;
        margin-left:30px;
    }

    .add-exp{
        color: rgb(127,127,127);
        font-size:12px;
    }

    .red-exp{
        color:rgb(231,76,60);
    }

    .btn-cancel, .btn-delete{
        width: 200px;
    }

    .delete-modal-body>form>input[type=password]{
        width:300px;
        height:30px;
        margin-bottom:20px;
    }            
/*-------(희락님) 회원 탈퇴 모달 끝--------------*/
</style>

</head>
<body>
	<%@ include file="../common/user/menubar.jsp" %>
	 <script>
	 	function changePwd(){
	 		var form = document.createElement('form');
	 		var objs;
	 		objs = document.createElement('input'); 
	 		objs.setAttribute('type', 'text'); 
	 		objs.setAttribute('name', 'userId'); 
	 		objs.setAttribute('value', '<%= loginUser.getUserId() %>'); 
	 		form.appendChild(objs);
	 		form.setAttribute('method', 'post');
	 		form.setAttribute('action', 'pwdUpdateView.me'); 
	 		document.body.appendChild(form);
	 		form.submit();
	 		console.log("tset");
	 	}
	</script>
	<%@ include file="../common/user/myPageVerticalNav.jsp" %>    
        <div class="outer">
            <p>회원정보수정</p> 
            <div class="division-line"></div>
            <form action="updateInfo.me" method="post" id="member-modify-form"> 
                <table id="member-modify-table" >
                    <tbody>
                    	<input type="hidden" name="userNo" value="<%= loginUser.getUserNo() %>">
                        <tr>
                            <td width="190"><p>성함</p></td>
                            <td colspan="2"><input type="text" name="userName" value="<%= loginUser.getUserName() %>"></td>
                        </tr>
                        <tr>
                            <td><p>아이디</p></td>
                            <td colspan="2"><%= loginUser.getUserId() %></td>
                        </tr>
                        <tr>
                            <td><p>비밀번호</p></td>
                            <td colspan="2"><button type="button" class="btn btn-secondary btn-sm" onclick="changePwd();">비밀번호 수정하기</button></td>
                        </tr>
                        <tr>
                           	<%
                           		String birthday = loginUser.getBirthday().substring(0, 4) + "년 " + loginUser.getBirthday().substring(4, 6) + "월 " + loginUser.getBirthday().substring(6, 8) + "일";
                        	%>
                        
                            <td><p>생년월일</p></td>
                            <td colspan="2"><%= birthday %></td>
                        </tr>
                        <tr>
                            <td><p>성별</p></td>
                            <td colspan="2">
                            	<script>
                            		$(function(){
	                            		$("input[value='<%= loginUser.getGender() %>']").attr("checked", true); 
                            		})                            		
                            	</script>
                                <label><input type="radio" value="F" name="gender"> 여자 &nbsp;</label>
                                <label><input type="radio" value="M" name="gender"> 남자 &nbsp;</label> 
                                <label><input type="radio" value="N" name="gender"> 선택안함</label>
                            </td>
                        </tr>
                        <tr>
                        	<script>	
                        	$(function(){
					            $("#emailcheck").focusout(function(){
					                var newEmail = $("#emailcheck").val();
									
									$.ajax({
										url : "AjaxEmailCheck.me",
										data : {
											newEmailCheck: newEmail
										},
										type:"post",
										success:function(result){
											if(result == "true"){
												$("#emailbox").text("* 이미 사용하고 있는 e-mail입니다!");
												$("#emailcheck").val("").focus();
											}else{
												$("#emailbox").text("* 사용가능한 이메일입니다.");
											}
										},error:function(){
											console.log("Ajax 통신 실패");
										}
					         	   }) 
					        	}) 
                        	}); 	
                        	
                           	$(function(){		
					            $("#tlno").focusout(function(){
					                var beforePhone = $("#tlno").val();
					                var newPhone = beforePhone.replace("-", "").replace("-","");

									$.ajax({
										url : "AjaxPhoneCheck.me",
										data : {
											newPhoneCheck: newPhone
										},
										type:"post",
										success:function(result){
											if(result == "true"){
												$("#phoneBox").text("* 이미 사용하고 있는 전화번호입니다!");
												$("#tlno").val("").focus();
											}else{
												$("#phoneBox").text("* 사용가능한 전화번호입니다!");
											}
										},error:function(){
											console.log("Ajax 통신 실패");
										}
					            	});      
                        		})    
                        	})	
                        	</script>
                        
                            <td><p>이메일 주소</p></td>
                            <td colspan="2"><input type="email" id="emailcheck" name="email" value="<%= loginUser.getEmail() %>">
                            <span id="emailbox" style="font-size:12px; color:red;"></span>
                            </td>
                        </tr>
                        <tr>
                        	<%
								String phoneNo = loginUser.getPhone().substring(0, 3) + "-" + loginUser.getPhone().substring(3, 7) + "-" + loginUser.getPhone().substring(7, 11);                        		
                        	%>
                            <td><p>휴대전화</p></td>
                            <td colspan="2">
                            	<script>
                            	</script>
                            	<input type="text" id="tlno" name="phone" value="<%= phoneNo %>" maxlength="13" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" title="000-0000-0000형식으로 입력해주세요" placeholder="xxx-xxxx-xxxx">
                           		<span id="phoneBox" style="font-size:12px; color:red;"> * 전화번호는 "-"을 꼭 넣어서 입력해주세요.</span>
                           	</td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr align="center">
                            <td></td>
                            <td><button type="submit">정보수정</button></td>
                            <td width="150"><button type="button" data-toggle="modal" data-target="#memDelete-modal">탈퇴</button></td>
                        </tr>
                    </tfoot>
                </table>
            </form>

            
<%----------------------------------------(희락님) 회원탈퇴 모달 영역 시작--------------------------------------------------------------------%>
            <div class="modal fade" id="memDelete-modal">
                <div class="modal-dialog">
                    <div id="member-delete-modal" class="modal-content">
                    
                        <!-- Modal Header -->
                        <div id="delete-modal-header" class="modal-header">
                            <h3 id="delete-modal-title" class="modal-title">탈퇴 안내</h3>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                                
                        <!-- Modal body -->
                        <div class="delete-modal-body">
                            <form action="/delete.me" method="POST">
                                <label class="add-exp">회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요</label>
                                    
                                <p><b>사용하고 계신 아이디(<%=loginUser.getUserId()%>)는 탈퇴할 경우 재사용 및 복구가 불가능합니다.</b><br><br>
                                <label class="red-exp">탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가</label>하오니 신중하게 선택하시기 바랍니다.
                                </p>

                                <input type="password" id="userPwd" name="userPwd" placeholder="비밀번호 입력" required>

                                <div class="form-btn" width="500">
                                    <button class="btn btn-secondary btn-cancel" data-dismiss="modal">취소</button> &nbsp;&nbsp;&nbsp;
                                    <button type="button" id="delete" class="btn btn-danger btn-delete">회원탈퇴</button>
                                </div>
                            </form>
                        </div>
                    </div>                  
                </div>
            </div>
            
            <script>
            	// 회원 탈퇴 비밀번호 입력시 작동하는 ajax
            	$("#delete").click(function(){
            		
            		$.ajax({
            			url:"jqAjaxDelete.me",
            			type:"POST",
            			data:{userPwd:$("#userPwd").val()},
            			success: function(result){
            				
            				if(result > 0){
            					
            					location.href="<%=contextPath%>/main?alertMsg=그 동안 이용해 주셔서 감사합니다.";
            					
            				}else{
								
            					alert("비밀번호가 일치 하지 않습니다. 다시 입력해주세요.");
            					
            				}
            				
            			},error:function(){
            				
            			}
            		})
            		
            	})
            	
            	
            	
            
            </script>
<%----------------------------------------(희락님) 회원탈퇴 모달 영역 끝--------------------------------------------------------------------%>

        </div>
    </div><%-- 여기가 사실상 vertical-nav랑 .outer랑 묶은 div닫는 태그이다.  --%>

	<%@ include file="../common/user/footer.jsp" %>

</body>
</html>