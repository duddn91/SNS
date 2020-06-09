<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
      content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

    <title>ProfileEdit | Stagram</title>
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/profile.css">
    <link rel="shortcut icon" href="/imgs/instagram.png">


</head>
<body>
<section id="container">

     <header id="header">
        <section class="h_inner">

            <h1 class="logo">
                <a href="/post/postview">
                    <div class="sprite_insta_icon"></div>
                    <div>
                        <div class="sprite_write_logo"></div>
                    </div>
                </a>
            </h1>

            <div class="search_field">
                <input type="text" placeholder="검색" tabindex="0" id="search-field" onkeyup="searchBtn()">

                <div class="fake_field">
                    <span class=sprite_small_search_icon></span>
                    <span>검색</span>
                </div>
            </div>


            <div class="right_icons">
                <a href="/post/posting"><div class="sprite_camera_icon"></div></a>
                <a href="mypage"><div class="sprite_user_icon_outline"></div></a>
            </div>
        </section>
    </header>
</section>

<section id="container">

    <div class="SCxLW">

        <div class="BvMHM ">
         <ul class="wW1cu">
            <li><a href="/member/profileEdit" class="font1">프로필 편집</a></li>
            <li><a href="/member/changePassword" class="font1">비밀번호 변경</a></li>
         </ul>
         <article class="PVkFi">
            <div class="C_9MP">
				<div class="LqNQc">
					<div class="M-jxE">
						<button class="IalUJ " title="프로필 사진 추가">
							<img alt="프로필 사진 추가" class="be6sR" src="/profile/${login.m_id}.jpg"/>
						</button>
						<div>
							<form enctype="multipart/form-data" method="POST" role="presentation">
								<input accept="image/jpeg,image/png" class="tb_sK" type="file">
							</form>
						</div>
					</div>
				</div>            
				<div class="XX1Wc">
					<h1 class="kHYQv " title="m_id">${login.m_id}</h1>
				</div>
				<button class="sqdOP yWX7d y3zKF" type="button">프로필 사진 바꾸기</button>
			</div>
			<form class="kWXsT" method="POST" action="/member/memberUpdate">
				
				<div class="eE-OA">
					<aside class="sxIVS  ">
						<label for="m_Username">사용자 이름</label>
					</aside>
					<div class="ada5V">
						<input aria-required="true" name="m_name" type="text" class="JLJ-B zyHYP" value="" size=30><br /><br />
					</div>
				</div>
				<div class="eE-OA">
					<aside class="sxIVS  ">
						<label for="m_email">이메일</label>
					</aside>
					<div class="ada5V">
						<input aria-required="false" name="m_email" type="text" class="JLJ-B zyHYP" value="" size=30><br /><br />
					</div>
				</div>
				<div class="eE-OA">
					<aside class="sxIVS">
						<label for="m_phone">전화번호</label>
					</aside>
					<div class="ada5V">
						<input aria-required="false" name="m_phone" type="text" class="JLJ-B zyHYP" value="" size=30><br /><br />
					</div>
				</div>
					<div class="Igw0E IwRSH eGOV_ _4EzTm aGBdT" style="width: 100%; max-width: 355px;">
						<div class="Igw0E IwRSH eGOV_ _4EzTm pjcA_">
							<h2 class="JJF77">개인 정보</h2>
						</div>
						<div class="_7UhW9  PIoXz MMzan_0PwGv uL8Hv">비즈니스나 반려동물 등에 사용된 계정인 경우에도<br/>회원님의 개인 정보를 입력하세요. <br/> 공개 프로필에는 포함되지 않습니다.</div><br/>
					</div>
				<div class="eE-OA">
					<aside class="sxIVS  tvweK">
						<label></label>
					</aside>
					<div class="ada5V">
						<div class="fi8zo">
							<button class="sqdOP L3NKy y3zKF" type="submit">제출</button>
						</div>
					</div>
				</div>
			</form>
         </article>
          </div>
    </div>
</section>




</script>
</body>
</html>