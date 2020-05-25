<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<title>Stargram</title>

	<link rel="stylesheet" href="/css/reset.css">
	<link rel="stylesheet" href="/css/common.css">
	<link rel="stylesheet" href="/css/style.css">
	<link rel="stylesheet" href="/css/style2.css">
	<link rel="stylesheet" href="/css/login.css">
    <link rel="stylesheet" href="/css/findpw.css">
	<link rel="shortcut icon" href="/imgs/instagram.png">
</head>
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

<!-- 학원에서 할 거 -->
<!-- https://foodchain.tistory.com/140 -->

    <div id="main_container">

        <div class="form_container">

            <div class="form">
     			<div class="lock_icon">
                	<span class="sprite_lock_icon"></span>
                </div>
                <div class="findpw_col">
                	<h4>로그인에 문제가 있나요?</h4>
                </div>
                <div class="findpw_col">
                	<div class="findpw_help">이메일을 입력하면 다시 계정에 로그인할 수 있는 링크를 보내드립니다.</div>
                </div>
               	<div class="findpw_col">
	                <form action="#" method="post">
	               		<p class="login_user_password">
	                	    <input type="text" id="m_pw" name="m_pw" placeholder="Password" >
	                    </p>
	                </form>
                </div>
            </div> <!-- form div -->

            <div class="gr27e">
                <div class="findpw_bottom">
                   <a href="/login" class="back_login">로그인으로 돌아가기</a></p>
       	   		</div>
            </div>

       	</div>
    </div>
</section>


</body>
</html>