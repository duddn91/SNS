<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
      content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

    <title>instagram</title>
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/style2.css">
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


    <div id="main_container">

        <section class="b_inner">

            <div class="hori_cont">
                <div class="profile_wrap">
                    <div class="profile_img">
                        <img src="/imgs/thumb.jpeg" alt="착한호랑이">
                    </div>
                </div>
                <div class="detail">
                    <div class="top">
                        <div class="user_name">${login.m_id}</div>
                        <a href="#" class="logout">로그아웃</a>
                        <a href="/member/profileEdit" class="profile"><div class="profile_edit_icon"></div></a>
                    </div>

                    <ul class="middle">
                        <li>
                            <span>게시물</span>
                            3
                        </li>
                        <li>
                            <span>팔로워</span>
                            3
                        </li>
                        <li>
                            <span>팔로우</span>
                            3
                        </li>
                    </ul>
                    <p class="about">
                        <h1 class="nick_name">kindtigerrr</h1>
                        <span class="book_mark">bookmark</span>
                    </p>

                </div>
            </div>

			<div class="fx7hk">
			
			</div>

            <div class="bookmark_contents contents_container">
            	
                <c:forEach var="vo" items="${postList}">
	                <div class="pic">
	                    <a href="#"><img src="/photo/${vo.p_photo}" alt="사진1" style="width: 300px; height: 300px;"></a>
	                </div>
                </c:forEach>
            </div>




        </section>
    </div>


</section>


</body>
</html>