<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- @author leeyeji -->
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
        .outer{
            width: 1200px;
            height: 700px;
            margin: auto;
            margin-top: 50px;
        }
        #contact-enroll-table th{
            background: rgba(0, 120, 52, 0.2);
        }
        #contact-enroll-table{
            border: 1px solid whtie;
            border-top: 2px solid rgb(0, 120, 51);
            border-bottom: 2px solid rgb(0, 120, 51);
            text-align: center;
            height: 30px;
        }
        #contact-enroll-table tr{
            border-bottom: 1px solid rgba(211, 211, 211, 0.5);
        }
        #contact-enroll-form input, #contact-enroll-form textarea{
            width: 800px;
            box-sizing: border-box;
            resize: none;
        }
        #contact-enroll-table td{
            padding-left: 20px;
            padding-right: 10px;
        }
        #contact-form-btn{
            width: 900px;
        }
        .contact-btn{
            width: 1050px;
        }
        .contact-btn button{
            background: rgb(0, 120, 51);
            color: white;
        }
        .contact-btn button:hover{
            background: white;
            color: rgb(0, 120, 51);
            border: 1px solid rgb(0, 120, 51);
        }
    </style>
    </head>
    <body>
    
    	<%@ include file="../common/user/menubar.jsp" %>
    
        <div class="outer">
            <br><h2 align="center">1:1문의 작성</h2><br>
    
            <form action="<%=contextPath %>/insert.inq" id="contact-enroll-form" method="post">
    
    			<input type="hidden" name="userNo" value="<%=loginUser.getUserNo()%>">
                <table id="contact-enroll-table" align="center">
                    <tr>
                        <th width="90" height="50">제목</th>
                        <td><input type="text" name="title" required></td>
                    </tr>
                    <tr>
                        <th height="50">이메일</th>
                        <td><input type="email" name="title"></td>
                    </tr>
                    <tr>
                        <th height="640">내용</th>
                        <td><textarea name="content" rows="25" required></textarea></td>
                    </tr>
                </table>
    
                <br>
                <div align="right" class="contact-btn">
                    <button type="submit" id="form-btn" class="btn btn-sm">작성</button>
                </div>
                <br>
    
            </form>
    
    
        </div>
</body>
</html>