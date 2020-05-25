<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<title>Stargram</title>

	<link rel="stylesheet" href="css/reset.css">
	<link rel="stylesheet" href="css/common.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/style2.css">
	<link rel="stylesheet" href="css/login.css">
	<link rel="stylesheet" href="css/signup.css">
	<link rel="shortcut icon" href="imgs/instagram.png">
	
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

//아이디 정규식
var idJ = /^[a-z0-9][a-z0-9]{3,11}$/;
// 비밀번호 정규식
var pwJ = /^[A-Za-z0-9]{4,12}$/;


$(document).ready(function() {

	$("#m_id").keyup(function() {
		if(idJ.test($('#m_id').val())){
			console.log('true');
			$('#id_check').text('');
		} else {
			$('#id_check').text('유효하지 않은 아이디입니다.');
			$('#id_check').css('color', 'red');
		}
	});//keyup
	
	$("#m_pw").keyup(function() {
		if(pwJ.test($('#m_pw').val())){
			console.log('true');
			$('#pw_check').text('');
		} else {
			$('#pw_check').text('유효하지 않은 비밀번호입니다.');
			$('#pw_check').css('color', 'red');
		}
	});//keyup
	
	
});
</script>
<body>


<section id="container">


    <!-- <header id="header">
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
                <a href="new_post.jsp"><div class="sprite_camera_icon"></div></a>
                <a href="login.jsp"><div class="sprite_compass_icon"></div></a>
                <a href="follow.jsp"><div class="sprite_heart_icon_outline"></div></a>
                <a href="profile.jsp"><div class="sprite_user_icon_outline"></div></a>
            </div>
        </section>
    </header> -->



    <div id="main_container">

        <div class="form_container">

            <div class="form">

                <h1 class="sprite_insta_big_logo title"></h1>

                <form action="member/login" method="post">
               		<div class="form-group">
	                   <p class="login_user_name">
	                   	<input type="text" id="m_id" name="m_id" placeholder="ID" >
	                   </p>
	                   <div class="eheck_font" id="id_check"></div>
					</div>
					
					<div class="form-group">
	                    <p class="login_user_password">
	                	    <input type="password" id="m_pw" name="m_pw" placeholder="Password" >
	                    </p>
	                    <div class="eheck_font" id="pw_check"></div>
					</div>
					
					<div class="form-group">
	                    <input type="submit" id="submit_btn" value="로그인" class="submit_btn" />
	                    <!-- <button type="submit" id="submit_btn" class="submit_btn" disabled="disabled">로그인</button> -->
	                </div>

		          	<div class="rr">
			            <div class="K-1uj Z7p_S">
			            	<div class="s311c"></div>	
			            	<div class="or">또는</div>
			            	<div class="s311c"></div>
			            </div>
		       		</div>
		       		
		       		<a class="_2Lks6" href="member/findpw">비밀번호를 잊으셨나요?</a>
                </form>
                
	       		
            </div> <!-- form div -->

            <div class="gr27e">
                <div>
                    <p class="izU2O ">계정이 없으신가요?<a href="member/signUp"> 회원가입</a></p>
                </div>
       	   	</div>

       	</div>
    </div>
</section>


</body>
</html>