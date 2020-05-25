<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Stagram</title>

	<link rel="stylesheet" href="css/reset.css">
	<link rel="stylesheet" href="css/common.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/login.css">
	<link rel="shortcut icon" href="imgs/instagram.png">
	

</head>

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
                <a href="new_post.jsp"><div class="sprite_camera_icon"></div></a>
                <a href="login.jsp"><div class="sprite_compass_icon"></div></a>
                <a href="follow.jsp"><div class="sprite_heart_icon_outline"></div></a>
                <a href="profile.jsp"><div class="sprite_user_icon_outline"></div></a>
            </div>
        </section>
    </header>



    <div id="main_container">

        <div class="form_container">

            <div class="form">

                <h1 class="sprite_insta_big_logo title"></h1>

                <form method="post" id="loginForm" action="member/login">
                    <p class="login_user_name">
                        <input type="text" id="m_id" name="m_id" placeholder="ID">
                    </p>

                    <p class="login_user_password">
                        <input type="password" id="m_pw" name="m_pw" placeholder="Password">
                    </p>

                    <input type="submit" id="submit_btn" value="로그인" class="submit_btn">
                </form>
	           
	            <div class="rr">
		            <div class="K-1uj Z7p_S">
		            	<div class="s311c"></div>
		            	<div class="or">또는</div>
		            	<div class="s311c"></div>
		            </div>
        		</div>
            </div>
                

            <div class="bottom_box">
                <div>
                    <span>아이디가 없으신가요?</span><a href="member/signUp">회원가입</a>
                </div>
            </div>


        </div>

    </div>


</section>

</body>
</html>