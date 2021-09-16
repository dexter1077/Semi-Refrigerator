<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- @author leeyeji -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
    .outer{
        width: 1200px;
        margin: auto;
    }
    #floatMenu {
	position: absolute;
	width: 200px;
	height: 500px;
	right: 10px;
	top: 10px;
    background: rgb(235, 235, 235);
	color: black;
    text-align: center;
    }
    #profile-float{
        margin-top: 10px;
        font-size: 15px;
    }
    #pro-img{
        width: 60px;
        height: 60px;
        border: 1px solid black;
    }
    #floatMenu div{margin-bottom: 5px;}
    #profile-float button{color: rgb(0, 120, 51);}
    #profile-float button:hover{
        background: rgba(0, 120, 51, 0.3);
        color: black;
    }
    #ingre-float, #addIngre-float{font-size: 14px;}
    #btn-float img{margin-right: 10px;}
    #topBtn {
        position: absolute;
        right: 2%;
        bottom: 2%;
        width: 30px;
        height: 30px;
        line-height: 30px;
        display: block;
        background: #000;
        color: #fff;
        font-size: 10px;
        text-align: center;
        border-radius: 5px;
    }
    #topBtn:hover{cursor: pointer;}
</style>
</head>
<body>

    <div class="outer">
        <div id="floatMenu">
            <div id="profile-float" align="center">
                <div id="pro-img"><img src="../../../resources/image/user.png" width="60px"></div>
                <div><b>마법의 소라고동</b></div>
                <div style="font-size: 12px;">먹기위해 삽니다</div>
                <button class="btn btn-sm">팔로잉</button>
            </div>
            <br>
            <div id="ingre-float" align="center">
                <div style="font-weight: bold;">준비 되었나요?</div>
                <div>오리고기 400g</div>
            </div>
            <br>
            ￣￣￣￣￣￣￣￣￣￣
            <div id="addIngre-float">
                <div style="font-weight: bold;">있으면 좋아요</div>
                <div>깻잎</div>
            </div>
            <br>
            ￣￣￣￣￣￣￣￣￣￣
            <br>
            <div id="btn-float">
                <div id="btn-img">
                    <a href="" data-toggle="popover" title="좋아요" data-content="이 레시피를 좋아합니다." data-placement="bottom">
                        <img src="<%=request.getContextPath() %>/resources/image/like.png" width="25px">
                    </a>
                    <a href="" >
                        <img src="<%=request.getContextPath() %>/resources/image/share.png" width="25px">
                    </a>
                    <a href="" data-toggle="popover" title="찜하기" data-content="이 레시피 찜했습니다." data-placement="bottom">
                        <img src="<%=request.getContextPath() %>/resources/image/clipboard.png" width="25px" style="margin: right 0px;">
                    </a>
                </div>
                <div id="goTop">
                    <span id="topBtn"> Top</span>
                </div>
            </div>
        </div>
    

    </div>

    
    <script>
        /*
        $(function() {
            var offset = $("#sidebar").offset();
            var topPadding = 300;
            $(window).scroll(function() {
                if ($(window).scrollTop() > offset.top) {
                    $("#sidebar").stop().animate({
                        marginTop: $(window).scrollTop() - offset.top + topPadding
                    });
                } else {
                    $("#sidebar").stop().animate({
                        marginTop: 0
                    });
                };
            });
        });
        */
        $(function() {
            
            var floatPosition = parseInt($("#floatMenu").css('top'));

            $(window).scroll(function() {
                
                var scrollTop = $(window).scrollTop();
                var newPosition = scrollTop + floatPosition + "px";

                $("#floatMenu").stop().animate({
                    "top" : newPosition
                }, 500);

            }).scroll();

        });

        // 팝오버
        $(function(){
            $('[data-toggle="popover"]').popover({
                trigger: 'focus'
            });
        });

        // top버튼
        var topEle = $('#topBtn');
        var delay = 500;
        topEle.on('click', function() {
        $('html, body').stop().animate({scrollTop: 0}, delay);
        });
    </script>

</body>
</html>