<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.refrigerator.notice.model.vo.Notice"%>
    
    <!--윤희락 05.26 작성-->
<%

	String title = (String)request.getAttribute("title");
	int noticeNo = (int)request.getAttribute("noticeNo");
	
	Notice n = (Notice)request.getAttribute("n");
	
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자_공지사항등록</title>

    <style>
        #wrap{
        	margin:auto;
        	width:1200px;
        }
        
        #for-height{height:750px;}
        
        .outer{
            margin:50px 50px;
            width:900px;
            height:600px;
            font-size: 16px;
            
        }

        h2{
            font-weight:600;
            font-size:36px;
            color:rgb(0, 153, 102);
            display: inline-block;
            width: 850px;
        }
        .back-btn{
            display: inline-block;
        }

        input, textarea{
            box-sizing:border-box;
            width:100%;
            border:2px solid gray;
            border-radius: 3px;
            margin-top: 5px;
        }

        textarea{
            height:300px;
            resize:none;
        }
        
        button{
            border: none;
        }

        .table-label{
            margin-bottom:3px;
        }
        
        #back-btn:hover{
        	opacity:0.85;
        	cursor:pointer;
        }


        .form-btn{
            width:350px;
            height:70px;
            font-size:30px;
            font-weight:600;
            margin-top:55px;
        }
		
		.btn1, .btn2{
			border-radius:3px;
		}
		
        .btn1{
            color: grey;
            
        }
        .btn2{
            background: rgb(0, 153, 102);
            color: white;
        }

        .current-page{
            background-color:rgb(0, 102, 51);
            color: white;
            border: 2px solid gray;
        }
        .count-area{
            color: orange;
        }


    </style>
</head>
<body>

	<%@ include file="../common/admin/adminTopNavView.jsp" %>
<div id="wrap">
	<%@ include file="../common/admin/adminSideBarView.jsp" %>

    <div class="outer">
    	<% if(title.equals("수정") && noticeNo != 0) {%>
	    	
	       <div class="outer-header">
                <h2>관리자_공지사항수정</h2>
                <div class="back-btn" wdith="700px">
                    <a id="back-btn"><img width="45" height="45" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMSIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHhtbG5zOnN2Z2pzPSJodHRwOi8vc3ZnanMuY29tL3N2Z2pzIiB3aWR0aD0iNTEyIiBoZWlnaHQ9IjUxMiIgeD0iMCIgeT0iMCIgdmlld0JveD0iMCAwIDI1LjY0IDI1LjY0IiBzdHlsZT0iZW5hYmxlLWJhY2tncm91bmQ6bmV3IDAgMCA1MTIgNTEyIiB4bWw6c3BhY2U9InByZXNlcnZlIiBjbGFzcz0iIj48ZyB0cmFuc2Zvcm09Im1hdHJpeCgxLDAsMCwxLDEuNzc2MzU2ODM5NDAwMjUwNWUtMTUsLTEuNDIxMDg1NDcxNTIwMjAwNGUtMTQpIj4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KCTxnPgoJCTxwYXRoIHN0eWxlPSIiIGQ9Ik0xMC4zODUsMS40OTlDMTAuMDk2LDEuMzc4LDkuNzYsMS40NDYsOS41MzcsMS42NjdMMC4yMjgsOC45OGMtMC4zMDQsMC4zMDItMC4zMDQsMC43OTcsMCwxLjEgICAgbDkuMzA5LDcuMjc4YzAuMTQ4LDAuMTUsMC4zNDgsMC4yMjksMC41NDksMC4yMjljMC4xMDIsMCwwLjIwMy0wLjAyMSwwLjI5OS0wLjA1OWMwLjI5MS0wLjEyMSwwLjQ2NS0wLjQwNCwwLjQ2NS0wLjcxOVYxMi40NSAgICBjOS45NTUsMCwxNC4zMDksMi44MDgsMTMuNjQ2LDExLjc1MUMyOC43MTMsOS44OTMsMjAuNjE5LDYuNjU5LDEwLjg1LDYuNjU5VjIuMjE3QzEwLjg0OSwxLjkwMiwxMC42NzYsMS42MTksMTAuMzg1LDEuNDk5eiIgZmlsbD0iIzAwOTk2NiIgZGF0YS1vcmlnaW5hbD0iIzAzMDEwNCIgY2xhc3M9IiI+PC9wYXRoPgoJPC9nPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjwvZz48L3N2Zz4=" /></a>
                </div>
            </div>
            
            <br>
            <form action="<%=contextPath%>/update.no" class="form-group" method="post">
            	<input type="hidden" name="noticeNo" value="<%=noticeNo%>">
                <table>
                    
                    <tr>
                        <th width="900" colspan="2">제목</th>
                    </tr>
                    
                    <tr>
                        <th width="700"><input type="text" name="title" value="<%=n.getNoticeTitle()%>" required maxlength="33" required></th>
                    </tr>
                    
                    <tr>
                        <th colspan="2">내용</th>
                    </tr>
                    
                    <tr>
                        <th><textarea name="content" width:100% required><%=n.getNoticeContent()%></textarea></th>
                    </tr>
                    
                </table>
                
                <div align="center">
	                <button type="button" class="form-btn btn1">취소</button>
	                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                <button type="submit" class="form-btn btn2">게시</button>
	            </div>
	            
            </form>
	        
    	<%}else if(title.equals("조회") && noticeNo != 0){ %>
            
             <div class="outer-header">
                <h2>관리자_공지사항조회</h2>
                <div class="back-btn" wdith="700px">
                    <a id="back-btn"><img width="45" height="45" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMSIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHhtbG5zOnN2Z2pzPSJodHRwOi8vc3ZnanMuY29tL3N2Z2pzIiB3aWR0aD0iNTEyIiBoZWlnaHQ9IjUxMiIgeD0iMCIgeT0iMCIgdmlld0JveD0iMCAwIDI1LjY0IDI1LjY0IiBzdHlsZT0iZW5hYmxlLWJhY2tncm91bmQ6bmV3IDAgMCA1MTIgNTEyIiB4bWw6c3BhY2U9InByZXNlcnZlIiBjbGFzcz0iIj48ZyB0cmFuc2Zvcm09Im1hdHJpeCgxLDAsMCwxLDEuNzc2MzU2ODM5NDAwMjUwNWUtMTUsLTEuNDIxMDg1NDcxNTIwMjAwNGUtMTQpIj4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KCTxnPgoJCTxwYXRoIHN0eWxlPSIiIGQ9Ik0xMC4zODUsMS40OTlDMTAuMDk2LDEuMzc4LDkuNzYsMS40NDYsOS41MzcsMS42NjdMMC4yMjgsOC45OGMtMC4zMDQsMC4zMDItMC4zMDQsMC43OTcsMCwxLjEgICAgbDkuMzA5LDcuMjc4YzAuMTQ4LDAuMTUsMC4zNDgsMC4yMjksMC41NDksMC4yMjljMC4xMDIsMCwwLjIwMy0wLjAyMSwwLjI5OS0wLjA1OWMwLjI5MS0wLjEyMSwwLjQ2NS0wLjQwNCwwLjQ2NS0wLjcxOVYxMi40NSAgICBjOS45NTUsMCwxNC4zMDksMi44MDgsMTMuNjQ2LDExLjc1MUMyOC43MTMsOS44OTMsMjAuNjE5LDYuNjU5LDEwLjg1LDYuNjU5VjIuMjE3QzEwLjg0OSwxLjkwMiwxMC42NzYsMS42MTksMTAuMzg1LDEuNDk5eiIgZmlsbD0iIzAwOTk2NiIgZGF0YS1vcmlnaW5hbD0iIzAzMDEwNCIgY2xhc3M9IiI+PC9wYXRoPgoJPC9nPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjwvZz48L3N2Zz4=" /></a>
                </div>
            </div>
            
            <br>
            	<input type="hidden" name="noticeNo" value="<%=noticeNo%>">
                <table>
                    
                    <tr>
                        <th width="900" colspan="2">제목</th>
                    </tr>
                    
                    <tr>
                        <th width="700"><input type="text" readonly name="title" value="<%=n.getNoticeTitle()%>" required maxlength="33"></th>
                    </tr>
                    
                    <tr>
                        <th colspan="2">내용</th>
                    </tr>
                    
                    <tr>
                        <th><textarea name="content" width:100% readonly required><%=n.getNoticeContent()%></textarea></th>
                    </tr>
                    
                </table>
                
            
        <%}else{ %>
        
            <!--등록-->
	        <div class="outer-header">
	            <h2>관리자_공지사항등록</h2>
	            <div class="back-btn" wdith="700px">
	                <a id="back-btn"><img width="45" height="45" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMSIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHhtbG5zOnN2Z2pzPSJodHRwOi8vc3ZnanMuY29tL3N2Z2pzIiB3aWR0aD0iNTEyIiBoZWlnaHQ9IjUxMiIgeD0iMCIgeT0iMCIgdmlld0JveD0iMCAwIDI1LjY0IDI1LjY0IiBzdHlsZT0iZW5hYmxlLWJhY2tncm91bmQ6bmV3IDAgMCA1MTIgNTEyIiB4bWw6c3BhY2U9InByZXNlcnZlIiBjbGFzcz0iIj48ZyB0cmFuc2Zvcm09Im1hdHJpeCgxLDAsMCwxLDEuNzc2MzU2ODM5NDAwMjUwNWUtMTUsLTEuNDIxMDg1NDcxNTIwMjAwNGUtMTQpIj4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KCTxnPgoJCTxwYXRoIHN0eWxlPSIiIGQ9Ik0xMC4zODUsMS40OTlDMTAuMDk2LDEuMzc4LDkuNzYsMS40NDYsOS41MzcsMS42NjdMMC4yMjgsOC45OGMtMC4zMDQsMC4zMDItMC4zMDQsMC43OTcsMCwxLjEgICAgbDkuMzA5LDcuMjc4YzAuMTQ4LDAuMTUsMC4zNDgsMC4yMjksMC41NDksMC4yMjljMC4xMDIsMCwwLjIwMy0wLjAyMSwwLjI5OS0wLjA1OWMwLjI5MS0wLjEyMSwwLjQ2NS0wLjQwNCwwLjQ2NS0wLjcxOVYxMi40NSAgICBjOS45NTUsMCwxNC4zMDksMi44MDgsMTMuNjQ2LDExLjc1MUMyOC43MTMsOS44OTMsMjAuNjE5LDYuNjU5LDEwLjg1LDYuNjU5VjIuMjE3QzEwLjg0OSwxLjkwMiwxMC42NzYsMS42MTksMTAuMzg1LDEuNDk5eiIgZmlsbD0iIzAwOTk2NiIgZGF0YS1vcmlnaW5hbD0iIzAzMDEwNCIgY2xhc3M9IiI+PC9wYXRoPgoJPC9nPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjwvZz48L3N2Zz4=" /></a>
	            </div>
	        </div>
	        
	        <br>
	        <form action="<%=contextPath%>/insert.no" class="form-group" method="post">
	            <table>
	                <tr>
	                    <th width="900">제목</th>
	                </tr>
	                <tr>
	                    <th width="700"><input type="text" name="title" required></th>
	                </tr>
	                <tr>
	                    <th>내용</th>
	                </tr>
	                <tr>
	                    <th><textarea name="content" width:100% required></textarea></th>
	                </tr>
	            </table>
	            
	            <div align="center">
	                <button type="button" class="form-btn btn1">취소</button>
	                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                <button type="submit" class="form-btn btn2">게시</button>
	            </div>
	        </form>
	        
        <%} %>
        
    </div>

</div>
	<script>
		$(function(){
			$("#back-btn").click(function(){
				history.go(-1);
			})
		})
	</script>


</body>
</html>