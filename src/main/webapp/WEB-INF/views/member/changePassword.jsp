<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChangePassword | Stagram</title>
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
            <li><a href="profileEdit" class="font1">프로필 편집</a></li>
            <li><a href="changePassword" class="font1">비밀번호 변경</a></li>
         </ul>
         <article class="PVkFi" style="width:664px;">
            <div class="C_9MP">
            	<div class="LqNQc">
            		<div class="M-jxE">
            			<button class="IalUJ ">
            				<img class="be6sR" src="">
            			</button>
            		</div>
            	</div>
	            <div class="XX1Wc">
	            	<h1 class=" QXEMa" title="m_ID">${login.m_id}</h1>
	            </div> 
            </div>
     
            
         	<form class="iElgJ" method="POST" >
         		<div class="eE-OA">
         			<aside class="sxIVS  ">
         				<label for="m_password">이전 비밀번호</label>
         			</aside>
					<div class="ada5V">
						<input autocomplete="current-password" class="j_2Hd    RO68f  M5V28" id="m_password" name="m_password" required="" spellcheck="true" type="password" value="" size=30>
					</div>
         		</div>
         		<div class="eE-OA">
         			<aside class="sxIVS  ">
         				<label for="m_newPassword">새 비밀번호</label>
         			</aside>
         			<div class="ada5V">
         				<input autocomplete="new-password" class="j_2Hd    RO68f  M5V28" id="m_newPassword" name="m_newPassword" required="" spellcheck="true" type="password" value="" size=30>
         			</div>
         		</div>
				<div class="eE-OA">
					<aside class="sxIVS  ">
						<label for="m_newPasswordConfirm">새 비밀번호 확인</label>
					</aside>
					<div class="ada5V">
						<input autocomplete="new-password" class="j_2Hd    RO68f  M5V28" id="m_newPasswordConfirm" name="m_newPasswordConfirm" required="" spellcheck="true" type="password" value="" size=30>
					</div>
				</div>
         		<div class="eE-OA">
         			<aside class="sxIVS  tvweK">
         				<label></label>
         			</aside>
         			<div>
         				<div>
         					<button type="button">비밀번호 변경</button>
         				</div>
         			</div>
         		</div>
         		<div class="eE-OA">
         			<aside class="sxIVS  tvweK">
         				<label></label>
         			</aside>
         			<div class="ada5V">
         				<div class="Igw0E     IwRSH      eGOV_         _4EzTm aGBdT">
         					<div class="_7UhW9 xLCgt MMzan KV-D4 uL8Hv">
         						<a class="sqdOP yWX7d y3zKF ZIAjV" href="#">비밀번호를 잊으셨나요?</a>
         					</div>
         				</div>
         			</div>
         		</div>
         	</form>	            	
		</article>
	</div>
</div>
</section>
</body>
</html>







