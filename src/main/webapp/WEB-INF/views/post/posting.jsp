<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<!-- oje -> oje -->
<!-- 왜 안올라가아아아ㅏㅏㅏㅏㅏㅏ -->

   <!--  <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"> -->
<title>Instagram Posting</title>

<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/new_post.css">
<link rel="shortcut icon" href="/imgs/instagram.png">


</head>

<style>
	
	/*
	인스타그램 픽셀 사이즈
	프로필 사진 : 110*110
	마이페이지 : 161*161
	피드/업로드 : 510*510	
	*/
	
		#preview {
			width: 510px; 
			height: 510px;		
		}
		
		/* 이미지 크기랑 똑같이 맞춰주기 */	
		figure {
			width: 510px; 
			height: 510px;		
		}	
			
	</style>

<body>

<section id="container">
	
	 <header id="header">
	        <section class="h_inner">
	
	            <h1 class="logo">
	                <a href="index.jsp">
	                    <div class="sprite_insta_icon"></div>
	                    <div>
	                        <div class="sprite_write_logo"></div>
	                    </div>
	                </a>
	            </h1>
	
	            <div class="search_field">
	                <input type="text" placeholder="검색" tabindex="0">
	
	                <div class="fake_field">
	                    <span class=sprite_small_search_icon></span>
	                    <span>검색</span>
	                </div>
	            </div>
	
	            <div class="right_icons">
	                <a href="posting.jsp"><div class="sprite_camera_icon"></div></a> <!--  아예 안되게? -->
	                <a href="login.jsp"><div class="sprite_compass_icon"></div></a>
	                <a href="follow.jsp"><div class="sprite_heart_icon_outline"></div></a>
	                <a href="profile.jsp"><div class="sprite_user_icon_outline"></div></a>
	            </div>
	        </section>
	    </header>


    <div id="main_container">

        <div class="post_form_container">
            <form action="postingOK" class="post_form" name="fr" method="post" enctype="multipart/form-data" >
                <div class="title">
                    NEW POST
                </div>
                <div>
				<input type="hidden" name="p_id" value="${login.m_id}">
                </div>
                <div class="preview">
                    <div class="upload">
                        <div class="post_btn">
                            <div class="plus_icon">
                                <span></span>
                                <span></span>
                            </div>
                             <p>포스트 이미지 추가</p> 
                            <canvas id="imageCanvas"></canvas>                             
                        </div>
                    </div>
                </div>
                <p>
                    <input type="file" name="file" id="id_photo" required="required" >
                </p>
                <p>
                    <textarea name="p_content" id="content" cols="50" rows="5" placeholder="140자 까지 등록 가능합니다.
#태그명 을 통해서 검색 태그를 등록할 수 있습니다.
예시 : I # love # insta!"></textarea>

                </p>
			<input type="button" value="upload" onclick="formCheck()"/>
			<input type="reset" value="rewrite" onclick="formDelete()"/>
			<input type="hidden" id="filterValue" value="0" name="p_filter"> <!-- 0이면 원본, 1~7 필터 지정값 -->
            </form>

        </div>

    </div>
    
</section>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script type="text/javascript" >


      
//폼 입력 검사
function formCheck() {	

    var fileNm = $("#id_photo").val();
	var ext = fileNm.slice(fileNm.lastIndexOf(".") + 1).toLowerCase();	// 확장자 가져오기

	if ($("#content").val() == "") {
		alert("내용을 반드시 적어주세요.")
		fr.p_content.focus();
		return false;
	} else if ($("#id_photo").val() == "") {
		alert("이미지 파일을 반드시 업로드해주세요.")
		return false;		 	
	} else if (!(ext == "jpg" || ext == "png" || ext == "jpeg")) {			
		alert("이미지 파일(jpg, png ...) 확장자만 가능합니다.")
		return false;		 				
	} else {
		document.fr.submit();
	}	
}

		var fileInput  = document.querySelector( "#id_photo" ),
		button     = document.querySelector( ".input-file-trigger" ),
		the_return = document.querySelector(".file-return");
		
		// Show image
		fileInput.addEventListener('change', handleImage, false);
		var canvas = document.getElementById('imageCanvas');
		var ctx = canvas.getContext('2d');
		
		
		function handleImage(e){
		var reader = new FileReader();
		reader.onload = function(event){
		    var img = new Image();
		    // var imgWidth =
		    img.onload = function(){
		        canvas.width = 300;
		        canvas.height = 300;
		        ctx.drawImage(img,0,0,300,300);
		    };
		    img.src = event.target.result;
		    // img.width = img.width*0.5
		    // canvas.height = img.height;
		};
		reader.readAsDataURL(e.target.files[0]);
		}


</script>
</body>
</html>

