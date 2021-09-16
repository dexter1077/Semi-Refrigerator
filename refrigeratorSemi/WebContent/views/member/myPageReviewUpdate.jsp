<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.refrigerator.common.model.vo.PageInfo,
				 com.refrigerator.review.model.vo.Review,
				 java.util.ArrayList"%>
<%

ArrayList<Review> list = (ArrayList<Review>) request.getAttribute("list");
String alertMsg = (String)session.getAttribute("alertMsg");

PageInfo pi = (PageInfo) request.getAttribute("pi");

int currentPage = pi.getCurrentPage();
int startPage = pi.getStartPage();
int endPage = pi.getEndPage();
int maxPage = pi.getMaxPage();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지_ 후기&별점관리</title>

<style>
.outer {
	width: 890px;
	height: 460px;
	padding-top: 10px;
}

.menu-path>label {
	text-decoration: underline;
}

.menu-title {
	width: 750px;
	font-size: 18px;
	color: rgb(0, 102, 51);
	font-weight: 600;
	border-bottom: 4px solid rgb(0, 102, 51);
	margin-bottom: 0;
}

.review-table>thead>tr {
	height: 30px;
	font-size: 16px;
}

.review-table>tbody>tr {
	height: 150px;
}

table tr {
	border-bottom: 2px solid rgb(188, 188, 188);
}

.allCheckbox {
	margin-top: 5px;
	padding-left: 20px;
	font-weight: 600px;
}

button {
	border: none;
}

.current-page {
	background-color: rgb(0, 102, 51);
	color: white;
}

.count-area {
	color: orange;
}

.page-area{
	margin-right:130px;
}

/*리뷰 수정 모달영역*/
.review-img{
	width:150px;
	height:150px;
}
#inputFile{
	width:300px;
	height:40px;
	margin-bottom:20px;
	font-size:14px;
} 

#review-content{
	width:300px;
	height:60px;
}

#btn-modify{
	background: rgb(0, 102, 51);
	color:white;
}

input[type=file]{
	display:none;
}

.guide{
	font-size:14px;
}

.modify-title{
	font-size: 22px;
}

.footer{
	
	margin-left:-250px;
}


</style>
</head>
<body>
	<script>
		//alertMsg
		var msg = "<%=alertMsg%>";
		if(msg != "null"){
			alert(msg);
			<% session.removeAttribute("alertMsg"); %>
		}
	</script>

	<%@ include file="../common/user/menubar.jsp"%>
	<%@ include file="../common/user/myPageVerticalNav.jsp"%>
	<div class="outer">
	

		<div class="menu-path" style="font-size: 12px;">
			마이페이지 > <label>후기&별점관리</label>
		</div>

		<br>

		<div class="menu-title">
			<label>후기&별점관리</label>
		</div>


		<div class="prof-content">
			<table class="review-table">

				<thead style="text-align: center;">
					<tr>
						<th width="50"></th>
						<th width="120"></th>
						<th width="60">번호</th>
						<th width="240">제목</th>
						<th width="100">별점</th>
						<th width="130">작성일</th>
						<th width="50"></th>
					</tr>
				</thead>

				<tbody align="center">
					<form action="delete.rv">
						<%
							if (list.isEmpty()) {
						%>
						<tr>
							<td colspan="7">작성하신 요리 후기가 없습니다.</td>
						</tr>
						<%
							} else {
						%>
						<%
							for (int i = 0; i < list.size(); i++) {
						%>
						<tr>
							<td><input type="checkbox" name="deleteCheck<%=i + 1%>"
								value="<%=list.get(i).getReviewNo()%>"></td>
							<td><img src="<%=contextPath%>/<%=list.get(i).getImgName()%>" width="100"
								height="100"></td>
							<td><%=list.get(i).getReviewNo()%></td>
							<td width="200"><%=list.get(i).getReviewContent()%></td>
							<td>★<%=list.get(i).getStar()%></td>
							<td><%=list.get(i).getModifyDate()%></td>
							<td>
								<button type="button" id="modify-btn" data-toggle="modal" data-target="#modify" onclick="selectReview(<%=list.get(i).getReviewNo()%>);">수정</button>
							</td>
						</tr>
						<%
							}
						%>
						<%
							}
						%>
						
						
						<!-- 삭제 모달 -->
						<div class="modal fade" id="delete">
							<div class="modal-dialog">
								<div class="modal-content">

									<!-- Modal Header -->
									<div align="right">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>

									<!-- Modal body -->
									<div class="modal-body" style="margin:auto">
										<p>
											<span style="color: red">선택한 요리 후기를 삭제</span>하시겠습니까?
										</p>
									</div>

									<div class="modal-btn">
										<button type="button" data-dismiss="modal" class="btn btn-secondary btn-sm">취소</a> 
										<button type="submit" class="btn btn-danger btn-sm">삭제</a>
									</div>

								</div>
							</div>
						</div>

					</form>
				</tbody>

			</table>
			<div class="allCheckbox">
				<input type="checkbox" id="all-checkbox"> &nbsp;전체선택
				<button class="btn btn-danger btn-sm" data-toggle="modal"
					data-target="#delete">삭제</button>
			</div>
						<!-- 수정 모달 -->
						<div class="modal fade" id="modify">
							<div class="modal-dialog">
								<div class="modal-content">

									<!-- Modal Header -->
									<div align="right">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>

									<!-- Modal body -->
									<form action="<%=contextPath %>/update.rv" method="post" enctype="multipart/form-data">
										<div class="modal-body" align="center">
											<div><img class="review-img"></div>
											<br>
											<span class="modify-title">이 레시피의 별점은?</span>
											<br>
											<br>
											<select name="starPoint" id="star-point" required style="maring:atuo">
												<option value="0.5">0.5</option>
												<option value="1">1</option>
												<option value="1.5">1.5</option>
												<option value="2">2</option>
												<option value="2.5">2.5</option>
												<option value="3">3</option>
												<option value="3.5">3.5</option>
												<option value="4">4</option>
												<option value="4.5">4.5</option>
												<option value="5">5</option>
											</select>
											
											<br><br>
											
											<button type="button" id="inputFile">사진 첨부하기</button>
											<p class="guide">한 장이라도 좋아요<br>완성된 요리를 자랑해주세요</p>
											
											<textarea id="review-content" name="reviewContent" required style="resize:none;" min="20" placeholder="자세한 리뷰는 다른 쉐프님들께 큰 도움이 될 거에요 (최소20자)"></textarea>
										</div>
										<input type="file" name="reviewImg" onchange="loadImg(this);">
										<input type="hidden" name="reviewNo">
	
										<div class="modal-btn">
											<button type="button" data-dismiss="modal" class="btn btn-secondary btn-sm">취소</button> 
											<button type="submit" class="btn btn-sm" id="btn-modify">수정</button>
										</div>
									</form>

								</div>
							</div>
						</div>



			<br>
			<div align="center" class="page-area">
				<%
					if (currentPage != 1) {
				%>
				<button
					onclick="location.href='<%=contextPath%>/review.me?currentPage=<%=currentPage - 1%>';">&lt;</button>
				<%
					}
				%>
				<%
					for (int p = startPage; p <= endPage; p++) {
				%>
				<%
					if (p != currentPage) {
				%>
				<button
					onclick="location.href='<%=contextPath%>/review.me?currentPage=<%=p%>';"><%=p%></button>
				<%
					} else {
				%>
				<button class="cp" disabled><%=p%></button>
				<%
					}
				%>
				<%
					}
				%>
				<%
					if (currentPage != maxPage) {
				%>
				<button
					onclick="location.href='<%=contextPath%>/review.me?currentPage=<%=currentPage + 1%>';">&gt;</button>
				<%
					}
				%>
			</div>

			<br>
		</div>
		<div class="footer">
			<%@ include file="../common/user/footer.jsp" %>
		</div>
	</div>
	
	
	
	
	
	

	
	
	<script>
	
		// 수정 모달 데이터 가져오기
		function selectReview(rvNo){
			
			$.ajax({
				url:"jqAjaxSelect.rv",
				data:{reviewNo:rvNo},
				success:function(review){
					var starPoint = review.star;
					console.log(starPoint);
					
					$("#review-content").text(review.reviewContent);
					$("#star-point").children("option").prop("selected", false);
					$("#star-point").children("option[value='" + starPoint + "']").prop("selected", true);
					$(".review-img").prop("src", "<%=contextPath%>/" + review.imgName);
					$("input[type=hidden]").val(rvNo);
					
				},errorPage:function(){
					
				}
			})
			
		}
		
		// 사진 첨부시 버튼 클릭 이관 / 이미지 로드
		$(function(){
			
			$("#inputFile").click(function(){
				$("input[name=reviewImg]").click();
			})
			
		})
		
		function loadImg(inputFile){
			
			if(inputFile.files.length == 1){//선택한 파일이 존재하는 경우
				console.log(inputFile);
				var reader = new FileReader();
				reader.readAsDataURL(inputFile.files[0]);
				
				reader.onload = function(e){
					
					$(".review-img").attr("src", e.target.result);
				}
				
			}else{
				$(".review-img").attr("src", null);
			}
		}
	
		// 체크박스 전체선택 기능
		$(function() {
			var $allCheck = $(".review-table input[type=checkbox]");

			$("#all-checkbox").click(function() {

				if ($(this).is(":checked")) {
					$allCheck.attr("checked", true);
					$allCheck.prop("checked", true);
				} else {
					$allCheck.attr("checked", false);
					$allCheck.prop("checked", false);
				}

			})
		})
		
	</script>


</body>
<style>
/*--모달 영역 */
.modal-content { /*모달창 위치*/
	margin: auto;
	margin-top: 200px;
}

.modal-btn {
	text-align: center;
	margin: 25px 35px;
}

.modal-btn>button {
	width: 100px;
	height: 35px;
	font-size: 16px;
	margin: 0px 25px 0px 25px;
}

.btn-secondary {
	background: rgb(222, 222, 222);
	color: black;
	border: none;
}

.close {
	border: 1px solid black;
	font-size: 40px;
}
</style>

</html>