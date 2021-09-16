<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.refrigerator.member.model.vo.Member"%>
<%
	Member m = (Member)request.getAttribute("m");
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
    
 			<!--윤희락   05-26등록-->
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지_프로필 수정</title>
        
        <style>

        .outer{
            margin:30px 30px;
            width:870px;
            height:460px;
        }

        .menu-path>label{
            text-decoration: underline;
        }

        .menu-title{
            width:700px;
            font-size:18px;
            color: rgb(0, 102, 51);
            font-weight:600;
            border-bottom:4px solid rgb(0, 102, 51);
            margin-bottom:0;
        }

        .prof-modify-date{
            width:700px;
            font-size:14px;
            color: rgb(102, 102, 102);
            text-align:right;
        }

        .prof-content{
            margin:20px 30px;
            width:600px;
            height:320px;

        }

        .prof-content>form>div{
            height:100%;
            float:left;
        }

        .profImg-area{
            box-sizing:border-box;
            width:285px;
        }

        .profIntro-area{
            box-sizing: border-box;
            width:310px;
        }

        .profIntro-area>label{
            margin-bottom:2px;
            color: rgb(0, 102, 51);
            font-weight:600;
        }

        .profIntro-area>input, .profIntro-area>textarea{
            font-size:14px;
        }

        .profIntro-area>button{
            width:310px;
            background:rgb(0, 102, 51);
        }

        #profile-img{
            width:250px;
            height:250px;
        }

        #intro{
            height:160px;
        }

        #profile-img:hover{
        	cursor:pointer;
        }

    </style>
</head>
<body>

<%@ include file="../common/user/menubar.jsp" %>
<%@ include file="../common/user/myPageVerticalNav.jsp" %>
    
    <script>
		//alertMsg
		var msg = "<%=alertMsg%>";
		if(msg != "null"){
			alert(msg);
			<% session.removeAttribute("alertMsg"); %>
		}
	</script>
    
    <div class="outer">

        <div class="menu-path" style="font-size: 12px;">
                마이페이지 &gt; <label>프로필수정</label> 
        </div>
        
        <br>
        
        <div>
            <label class="menu-title">프로필 수정</label>
            <label class="prof-modify-date">변경일 : <%=m.getModifyDate()%></label>
        </div>

        
        <div class="prof-content">

            <form action="<%=contextPath%>/update.pro" method="post" enctype="multipart/form-data">
                <input type="hidden" name="userNo" value="<%=m.getUserNo()%>">

                <div class="profImg-area">
                    
                    <img src="<%=m.getProfileImg()%>" id="profile-img" width="250" height="250">

                    <input type="file" id="img-load" name="file1" onchange="loadImg(this, 1)">
                </div>
                
                <div class="profIntro-area">

                    <label for="nic">닉네임</label>
                    <input type="text" name="nickName" class="form-control" id="nic" value="<%=m.getNickname()%>" required>
                    <label for="intro">소개글</label>
                    <textarea name="intro" id="intro" class="form-control" style="resize:none;" required><%=m.getIntro()%></textarea>

                    <br>

                    <button type="submit" class="btn btn-success btn-big">등록</button>

                </div>
                

            </form>

        </div>
    </div>
    
    <%@ include file="../common/user/footer.jsp" %>

    <script>
    
		/*input file 숨기고 클릭이벤트 똑같이 img영역도 주기*/
        $(function(){
            $(".profImg-area").children().eq(1).hide();

            $("#profile-img").click(function(){
                $(".profImg-area").children().eq(1).click();
            })
        })
        
        function loadImg(inputFile, num){
			
            if(inputFile.files.length == 1){    //선택한 파일이 존재하는 경우
            	
                var reader = new FileReader();
                
                reader.readAsDataURL(inputFile.files[0]);
                
	            reader.onload = function(e){
	            	
	                $("#profile-img").attr("src", e.target.result);
	                
	            }                	
                
            }else{
                $("#profile-img").attr("src", null);
            }
            
        }
        
    </script>

</body>
</html>