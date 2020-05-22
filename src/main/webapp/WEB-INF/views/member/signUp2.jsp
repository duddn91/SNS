<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="front/css/reset.css">
    <link rel="stylesheet" href="front/css/common.css">
    <link rel="stylesheet" href="front/css/style.css">
    <link rel="stylesheet" href="front/css/login.css">
    <link rel="shortcut icon" href="front/imgs/instagram.png">
</head>
<body>


<section id="container">
	<!-- 상단 부분 -->
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
	
	<!-- 회원가입 폼 -->
    <div id="main_container">

        <div class="form_container">

            <div class="form">


                <h1 class="sprite_insta_big_logo title"></h1>

                <form method="post" id="authForm" action="member/login">
                    <p class="login_user_name">
                        <label for="m_id">사용자명:</label>
                        <input type="text" id="m_id" name="m_id" placeholder="ID">
                    </p>

                    <p class="login_user_password">
                        <label for="m_pw">비밀번호:</label>
                        <input type="password" id="m_pw" name="m_pw" placeholder="Password">
                    </p>

                    <input type="submit" id="submit_btn" value="로그인" class="submit_btn">
                </form>

            </div>

<!--  -->


		<form action="signOK" method="post" role="form" id="joinForm" name="member">

				<div class="form-group">
					<label for="id">아이디</label> <input type="text" class="form-control"
						id="m_id" name="m_id" placeholder="ID">
					<div class="eheck_font" id="id_check"></div>
				</div>

				<div class="form-group">
					<label for="pw">비밀번호</label> <input type="password"
						class="form-control" id="m_pw" name="m_pw" placeholder="PASSWORD">
					<div class="eheck_font" id="pw_check"></div>
				</div>

				<div class="form-group">
					<label for="pw2">비밀번호 확인</label> <input type="password"
						class="form-control" id="m_pw2" name="m_pw2"
						placeholder="Confirm Password">
					<div class="eheck_font" id="pw2_check"></div>
				</div>

				<div class="form-group">
					<label for="mem_name">이름</label> <input type="text"
						class="form-control" id="m_name" name="m_name" placeholder="Name">
					<div class="eheck_font" id="name_check"></div>
				</div>

				<div class="form-group">
					<label for="mem_birth">생년월일</label> <input type="tel"
						class="form-control" id="m_birth" name="m_birth"
						placeholder="ex) 19990101">
					<div class="eheck_font" id="birth_check"></div>
				</div>

				<div class="form-group">
					<label for="mem_email">이메일 주소</label> <input type="email"
						class="form-control" id="m_email" name="m_email"
						placeholder="E-mail">
					<div class="eheck_font" id="email_check"></div>
				</div>

				<div class="form-group">
					<label for="mem_phone">휴대폰 번호('-'없이 번호만 입력해주세요)</label> <input
						type="tel" class="form-control" id="m_phone" name="m_phone"
						placeholder="Phone Number">
					<div class="eheck_font" id="phone_check"></div>
				</div>

				<div class="form-group">
					<label for="m_gender">성별 </label> 
					<input type="radio" id="m_gender" name="m_gender" value="남" checked="checked">남
					<input type="radio" id="m_gender" name="m_gender" value="여">여
				</div>

				<div class="form-group text-center">
					<button type="submit" class="signUp">회원가입</button>
				</div>
			</form>



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