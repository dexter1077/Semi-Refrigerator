<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.refrigerator.category.model.vo.MainCategory,
				 com.refrigerator.category.model.vo.SubCategory,
				 
 				 com.refrigerator.recipe.model.vo.Recipe,
				 com.refrigerator.ingre_search.model.vo.IngreSearch,
				 com.refrigerator.ingre.model.vo.Ingre,
				 com.refrigerator.reicpe_order.model.vo.RecipeOrder,
				 
				 java.util.ArrayList" %>
    
<%
	int userNo = (int)request.getAttribute("userNo");
	ArrayList<MainCategory> mList = (ArrayList<MainCategory>)request.getAttribute("mList");
	ArrayList<SubCategory> sList = (ArrayList<SubCategory>)request.getAttribute("sList");
	
	Recipe recipeInfo = (Recipe)request.getAttribute("myRecipe");
	ArrayList<IngreSearch> searchInfo = (ArrayList<IngreSearch>)request.getAttribute("myIngreSearch");
	ArrayList<Ingre> ingreInfo = (ArrayList<Ingre>)request.getAttribute("myIngre");
	ArrayList<RecipeOrder> orderInfo = (ArrayList<RecipeOrder>)request.getAttribute("myRecipeOrder");

%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="jaewon.s">
<!-- Author : Jaewon -->

<title>냉뭐?레시피 수정 페이지</title>
<style>
	.outer{
		width: 900px;
		margin-right: 10px;
		margin-top: 20px;
		margin-bottom: 20px;
	}
	
	.outer>form>div{
	    box-sizing: border-box;
	    width:100%;
	    margin-bottom:8px;
	    border:2px solid rgb(200, 200, 200);
	}
	
	.enroll-form-title{
	    height:60px;
	    background-color: rgb(233, 233, 233);
	    color: rgb(0, 102, 51);
	    font-size:24px;
	    line-height: 60px;
	    font-weight: 900;
	    
	}
	
	/*form 공통 영역*/
	div{box-sizing:border-box;}
	
	input, textarea, select{
	    background-color: rgb(233, 233, 233);
	    border:1px solid rgb(200, 200, 200);
	    border-radius: 3px;
	}
	textarea{
	    text-align: left;
	}
	select{
	    width:140px;
	    height:40px;
	}
	label{
	    font-size:24px;
	    font-weight:550;
	}
	.guide{
	    font-size:12px;
	    color: rgb(127, 127, 127);
	}
	.vital{
	    color:rgb(0, 153, 102);
	    font-size:20px;
	}
	.lightImg{
	    width:30px;
	    height:30px;
	}
	.clone-btn{
	    border:none;
	    background:white;
	    font-weight: 550;
	    color: rgb(0, 153, 102);
	}
	.clone-btn{
	    border:none;
	    background:white;
	    font-weight: 550;
	    color: rgb(0, 153, 102);
	}
	
	
	/*form1*/
	.enroll-form1{height:350px}
	
	table{width:100%; height:100%;}
	
	#enroll-content1{
	    margin:2% 6%;
	    width:88%;
	    height:90%;
	}
	
	#enroll-content1>div{
	    float:left;
	    height:100%;
	}
	.form1-area1{width:70%;}
	.form1-area2{width:30%;}
	
	.fomr1-area2>div.lastchildren{
	    color: red;
	    width:600px;
	}
	
	.thumbnail-area{
	    border-radius:3px;
	    margin:auto;
	    margin-top:20px;
	    margin-bottom:10px;
	    width:200px;
	    height:200px;
	}
	
	.form1-area2 div:nth-child(2){
	    width:255px;
	
	}
	
	/*2번째 form영역*/
	.enroll-form2{height:400px}
	.search-btn-area{
	    width:880px;
	    height:300px;
	    margin:50px 50px;
	}
	
	.search-btn-area>div{
	    height:100%;
	    float:left;
	}
	
	.search-btn-img-area{
	    width:450px;
	}
	
	.search-btn-menu-area{
	    width:428px;
	}
	.ingre-img{
	    width:300px;
	    height:150px;
	}
	
	#serach-btn-input-area{
	    width:330px;
	    margin: 10px 60px;
	}
	
	#serach-btn-input-area{
	    display:none;
	}
	
	
	/*3번째 영역 css*/
	
	.content-title{
	    font-size:24px;
	    font-weight:550;
	}
	
	.ingre-area, #add-area{
	    width: 620px;
	    margin:10px 60px;
	}
	
	#add-area{
	    display:none;
	}
	
	.content-area2{
	    margin:40px 60px;
	    width:780px;
	}
	
	.amount{
	    width:140px;
	    height:40px;
	}
	
	/*4번째 요리순서 영역*/
	.enroll-content4{
	    margin:50px 60px;
	    width:880px;
	}
	
	.guide-area{
	    margin-bottom:20px;
	}
	
	#order-area{
	    margin-bottom:10px;
	}
	
	#order-area>table tr{
	    height:150px;
	}
	.order-title, .order-no{
	    font-weight: 600;
	    color: rgb(0, 102, 51);
	    font-size:28px;
	}
	.order-textarea{
	    box-sizing:border-box;
	    width:100%;
	    height:150px;
	    resize:none;
	}
	
	.order-img{
		margin-bottom:5px;
		margin-left:10px;
	    width:150px;
	    height:150px;
	}
	
	.order-img:hover{
		cursor:pointer;
	}
	
	.order-area{
	    width:860px;
	}
	
	/* 5) 버튼 영역 */
	.enroll-form5{
	    height:60px;
	}
	#cancel-btn, #enroll-btn{
	    width:300px;
	    height:40px;
	    margin-top:8px;
	    margin-left: 40px;
	    font-weight:500;
	}
	#enroll-btn{background:rgb(0, 102, 51)}
	#cancel-btn{
	    background:rgb(224, 224, 224);
	    color:black;
	}
	
	/*리모컨 버튼*/
	.up-btn{
		margin:auto;
	    width:2150px;
	    height:50px;
	    position:fixed;
	}
	
	.up-btn:hover{
	    opacity: 0.9;
	    cursor: pointer;
	}
	
	input[type=file]{
		display:none;
	}
	
	.select-title, #hide-org{
		display:none;
	}

    /* Jaewon css 추가  */
    #thumbnail-img{
        margin-left: 12px;
        object-fit: cover;        
    }
	
	img{
        object-fit: cover;        	
	}

</style>
</head>


<body>
	<%@ include file="../common/user/menubar.jsp" %>
	<%@ include file="../common/user/myPageVerticalNav.jsp" %>
    <div class="outer">
        <form action="<%=contextPath%>/modify.rcp" method="post" enctype="multipart/form-data">
        <!-- input type="hidden" 입력폼 개수 넘기기-->
        <input type="hidden" name="recipeNo" value="<%= recipeInfo.getRecipeNo() %>">        
        <input type="hidden" name="userNo" value="<%=userNo%>">
        <input type="hidden" id="sbCount" name="sbCount" value="0">
        <input type="hidden" id="ingCount" name="ingCount" value="1">
        <input type="hidden" id="addCount" name="addCount" value="0">
        <input type="hidden" id="orderCount" name="orderCount" value="1">

            <div class="enroll-form-title">
                &nbsp;&nbsp;&nbsp;레시피 수정
            </div>
            
            <div class="enroll-form1">
                
                
                <div id="enroll-content1">
                    
                    <div class="form1-area1">
                        <table>
                            
                            <tr>
                                <th width="180"><label for=""><span class="vital">*</span> 레시피<br> &nbsp;&nbsp;&nbsp;제목</label></th>
                                <td colspan="2"><input type="text" name="title" style="width:400px; height:50px;" placeholder="예) 소고기 미역국끓이기" value="<%= recipeInfo.getRecipeTitle() %>" required></td>
                            </tr>
                            
                            <tr>
                                <th><label for=""><span class="vital">*</span> 요리<br>&nbsp; 소개</label></th>
                                <td>
                                    <textarea name="intro" cols="54" rows="5" placeholder="레시피의 탄생배경을 적어주세요." required style="resize: none;"><%= recipeInfo.getRecipeIntro() %></textarea>
                                </td>
                            </tr>
                            
                            <tr>
                                <th><label><span class="vital">*</span> 요리 <br>&nbsp; 정보</label></th>

                                <td colspan="2">
                                    &nbsp;&nbsp;&nbsp;
                                    인분
                                    <script>
                                    	var serv = "<%=recipeInfo.getSeveralServings()%>";
                                    	$(function(){
	                                   		$('#servValue').val(serv).prop("selected",true);
                                    	})
                                 	</script>
                                    <select id="servValue" name="servings" required>
                                        <option value="1">1인분</option>
                                        <option value="2">2인분</option>
                                        <option value="3">3인분</option>
                                        <option value="4">4인분</option>
                                        <option value="5">5인분</option>
                                        <option value="6">6인분 이상</option>
                                    </select>
                                    &nbsp;&nbsp;&nbsp;
                                    시간
                                    <script>
                                    	var time = "<%=recipeInfo.getCookingTime()%>";
                                    	$(function(){
	                                   		$('#timeValue').val(time).prop("selected",true);
                                    	})
                                 	</script>
                                    <select id="timeValue" name="time" required>
                                        <option value="10">10분이하</option>
                                        <option value="20">20분이하</option>
                                        <option value="30">30분이하</option>
                                        <option value="40">40분이하</option>
                                        <option value="50">50분이하</option>
                                        <option value="60">60분이상</option>
                                    </select>
                                </td>
                                
                                
                            </tr>
                    
                        </table>
                        
                    </div>
                    
                    <div class="form1-area2" >
                        <div class="thumbnail-area" border="1"><img src="<%= recipeInfo.getMainImg() %>" width="200" height="200" id="thumbnail-img"></div>
                        <div align="center"><span>*</span><button type="button" id="insertMainImg" class="btn btn-secondary btn-sm">대표이미지 등록</button></div>
                        <div><input type="file" id="file11" class="file" name="file11" required onchange="loadImg(this, 11);"></div>
                    </div>
                    
                </div>
            </div>
            

<%--  마지막 버튼 영역--%>
<div class="enroll-form5" align="center">
    <button class="btn btn-secondary" id="cancel-btn">취소 </button>
    <button type="submit" class="btn btn-success" id="enroll-btn">수정</button>
</div>


</form>

    <script>
    
    /*2) 검색버튼기능 영역 [2~3 clone|remove] [1버튼 display:none <-> display:block] 개수전달 : sbCount*/ 
    $(function(){
        var sbCount = 0;
            
        $("#search-btn-clone").click(function(){
                
            if(sbCount < 3){
	            ++sbCount;
	            $("input[name=sbCount]").val(sbCount);
                var $clone = $("#serach-btn-input-area").clone(true);
                
        		$clone.css("display", "block");
                $clone.children().eq(0).attr("name", "btnMainCat" + sbCount);
                $clone.children().eq(1).attr("name", "btnSubCat" + sbCount);
                    
                $clone.appendTo("#serach-btn-input-result");
            }
        })
        
        $("#serach-btn-input-area").children().eq(2).click(function(){

            if(sbCount <= 3) {
	            sbCount--;
                $(this).parent().remove();
            
            	$("#sbCount").val(sbCount);
            }
        })
        
        $("#serach-btn-input-area").hover(function(){
            if(sbCount == 1) {
                $(this).children().eq(2).show();
            }
        }, function(){
            if(sbCount == 1) {
                $(this).children().eq(2).hide();
            }
        })
        
        $("#serach-btn-input-result").hover(function(){
            $(this).children().last().children().eq(2).show();
            
        }, function(){
            $(this).children().last().children().eq(2).hide();
        })

    })
    
    
    /* 3_1) 필수재료 select요소 복제 [2~5 복제가능 ] [1 remove버튼 안보임]*/
        $(function(){
            $(".ct-close").hide();
            var ingCount = 1;

            $("#ingre-clone").click(function(){
                if(ingCount < 5){
                    var $clone = $("#hide-org").clone(true);
                    
                    ingCount++;
                    $("input[name=ingCount]").val(ingCount);
                    
                    $clone.css("display","block");
                    $clone.children().eq(0).attr("name", "ingMainCat" + ingCount);
                    $clone.children().eq(1).attr("name", "ingSubCat" + ingCount);
                    $clone.children().eq(2).prop("required", true);
                    $clone.children().eq(2).attr("name", "ingAmount" + ingCount);
                    $clone.children().eq(3).attr("name", "ingUnit" + ingCount);
                    
                    $clone.appendTo("#ingre-result");
                    
                }
            })
            
            $("#hide-org").children().eq(4).click(function(){
                
                $(this).parent().remove();
                
                ingCount--;
                $("input[name=ingCount]").val(ingCount);
                
            })
            
            
            $("#ingre-result").hover(function(){
                $(this).children().last().children().eq(4).show();
                
            }, function(){
                $(this).children().last().children().eq(4).hide();
            })

        })
        
        
        /*3_2) 부가재료 select요소 복제 0~5가능 x버튼[1=hide | 2~5 remove] !!버튼개수 addCount*/
        $(function(){
            var addCount = 0;
            
            
            $("#add-clone").click(function(){
                    
                    if(addCount < 5){
	                	++addCount;
                        var $clone = $("#add-area").clone(true);
                        
                        $clone.css("display", "block");
                        $clone.children().eq(0).attr("name", "addMainCat" + addCount);
                        $clone.children().eq(1).attr("name", "addSubCat" + addCount);
                        $clone.children().eq(2).prop("required", true);
                        $clone.children().eq(2).attr("name", "addAmount" + addCount);
                        $clone.children().eq(3).attr("name", "addUnit" + addCount);
                        $("input[name=addCount]").val(addCount);
                        $clone.appendTo("#add-result");
                    }
            })
            
            $("#add-area").children().eq(4).click(function(){
                
                if(addCount <= 5) {
	                addCount--;
                    $(this).parent().remove();
	                $("input[name=addCount]").val(addCount);
                }
                
            })
            
     
            
            $("#add-area").hover(function(){
                if(addCount == 1) {
                    $(this).children().eq(4).show();
                }
            }, function(){
                if(addCount == 1) {
                    $(this).children().eq(4).hide();
                }
            })

            $("#add-result").hover(function(){
                $(this).children().last().children().eq(4).show();
                
            }, function(){
                $(this).children().last().children().eq(4).hide();
            })
            
        })

    /* 4) 요리순서 버튼추가 동작[1개 기본 10개 까지가능] [지우기는 2~10까지만가능]*/
    $(function(){
        $(".input-file").hide();    
        $(".order-ct-close").hide();

        var orderCount = 1;
            
        
        $("#order-clone").click(function(){
        	
            if(orderCount < 10){
            	
                var $clone = $("#order-area").clone(false);
                orderCount++;
                $("input[name=orderCount]").val(orderCount);
                            
                $clone.find("label[class=order-no]").text(orderCount);
                $clone.find("input[name=order]").val(orderCount);
                $clone.find("textarea[class=order-textarea]").val(null);
                $clone.find("textarea[class=order-textarea]").prop("name", "expln" + orderCount).trigger("change");
                $clone.find("textarea[class=order-textarea]").prop('required', true).trigger("change");
                $clone.find("img[id^=orderImg]").prop("id", "orderImg" + orderCount).trigger("change");
                $clone.find("img[class=order-img]").attr("src", null);
                            
                $clone.appendTo("#order-result");
                            
            }
            
            $("#orderImg"+orderCount).click(function(){
                $("#file"+orderCount).click();
            })
                    
        })
 
        $(document).on("click", "span[class=order-ct-close]", function(){
	        $(this).parents("#order-area").remove();                      
	        orderCount--;
	        $("input[name=orderCount]").val(orderCount);
        })
        

        $("#order-result").hover(function(){
        	$(this).children().last().find("span[class=order-ct-close]").show();
                        
        }, function(){
            $(this).children().last().find("span[class=order-ct-close]").hide();
        })
                    
    })



    /*6) 위로올라가기 top 버튼*/
    $(function(){
        
        $(window).scroll(function() {
            if ($(this).scrollTop() > 500) {
                $('.up-btn').fadeIn();
            } else {
                $('.up-btn').fadeOut();
            }
        });

        $(".up-btn").click(function(){
            $("html, body").animate({
                scrollTop : 0
            }, 400);
            return false;
        })

    })
    
    /*7) file 미리보기 기능*/
    
    /*7_1) file 클릭시 연동*/
    $(function(){
    	
    	$("#insertMainImg").click(function(){
    		$("#file11").click();
    	})
    	
    	$("#insert-ingre-img").click(function(){
    		$("#file12").click();
    	})
    	
    	$("#orderImg1").click(function(){
        	$("#file1").click();
        })
        
    	
    })
    	
    /*loadImg 이미지파일 미리보기 기능*/
    	function loadImg(inputFile, num){
    	
		    if(inputFile.files.length == 1){    //선택한 파일이 존재하는 경우
		    	
		        var reader = new FileReader();
		        
		        reader.readAsDataURL(inputFile.files[0]);
		        
		        reader.onload = function(e){
		        	
		        	switch(num){
		        	case 1:$("#orderImg1").attr("src", e.target.result); break;
		        	case 2:$("#orderImg2").attr("src", e.target.result); break;
		        	case 3:$("#orderImg3").attr("src", e.target.result); break;
		        	case 4:$("#orderImg4").attr("src", e.target.result); break;
		        	case 5:$("#orderImg5").attr("src", e.target.result); break;
		        	case 6:$("#orderImg6").attr("src", e.target.result); break;
		        	case 7:$("#orderImg7").attr("src", e.target.result); break;
		        	case 8:$("#orderImg8").attr("src", e.target.result); break;
		        	case 9:$("#orderImg9").attr("src", e.target.result); break;
		        	case 10:$("#orderImg10").attr("src", e.target.result); break;
		        	case 11:$("#thumbnail-img").attr("src", e.target.result); break;
		        	case 12:$(".ingre-img").attr("src", e.target.result); break;
		        	
		        	}
		        	
		        }           	
		        
		    }else{
		    	
		    	switch(num){
		    	case 1:$("#orderImg1").attr("src", null); break;
	        	case 2:$("#orderImg2").attr("src", null); break;
	        	case 3:$("#orderImg3").attr("src", null); break;
	        	case 4:$("#orderImg4").attr("src", null); break;
	        	case 5:$("#orderImg5").attr("src", null); break;
	        	case 6:$("#orderImg6").attr("src", null); break;
	        	case 7:$("#orderImg7").attr("src", null); break;
	        	case 8:$("#orderImg8").attr("src", null); break;
	        	case 9:$("#orderImg9").attr("src", null); break;
	        	case 10:$("#orderImg10").attr("src", null); break;
	        	case 11:$("#thumbnail-img").attr("src", null); break;
	        	case 12:$(".ingre-img").attr("src", null); break;
		    	}
		    }
		    	
    	}
    
    
    </script>
    <script>
    	// sub카테고리 ajax 조회
    	$(function(){
	    	$(document).on("change", "select[class=mc]", function(){
	    		var $xx = $(this);
	    		var option = "";
	    		
	    		$.ajax({
	    			url:"jqAjaxSbCatList.rcp",
	    			data:{"mcNo":$(this).val()},
	    			success:function(subCat){
	    				console.log(subCat.length);
	    				
	    				for(var i=0; i<subCat.length; i++) {
		    				option += "<option value='" + subCat[i].categorySubNo + "'>" + subCat[i].ingredientName + "</option>";    
	    				}
	    				
						$xx.next().html(option);
	    				
	    			}
	    		})
	    	})
    	})
    	
    </script>    
    </div>

<%-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------ --%>    			
			
		</div>
		<!-- 마이페이지 작업영역  끝-->
	</div>

	<%@ include file="../common/user/footer.jsp" %>

</body>
</html>