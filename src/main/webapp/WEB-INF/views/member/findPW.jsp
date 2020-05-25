<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<title>Instagram Find Password</title>

<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/new_post.css">
<link rel="shortcut icon" href="/imgs/instagram.png">

<link rel="stylesheet" href="/css/find-custom.css'/>">


</head>

<body>

<!-- 왜 안 올라가냐 -->

<!-- 검색창 부분 -->

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
	                <a href="post/posting.jsp"><div class="sprite_camera_icon"></div></a> <!--  아예 안되게? -->
	                <a href="login.jsp"><div class="sprite_compass_icon"></div></a>
	                <a href="follow.jsp"><div class="sprite_heart_icon_outline"></div></a>
	                <a href="profile.jsp"><div class="sprite_user_icon_outline"></div></a>
	            </div>
	        </section>
	    </header>

	<!-- 전체화면 -->
	<div class="container-fluid" style="background-color: #fafafa;">
		<!-- content-box : 비번찾기 박스 -->
		<div class="content-box">
			<!-- 비밀번호 찾기 박스 -->
			<div class="find-pw-box">
				<div class="find-pw">
					<div class="find-icon">
						<span><i class="far fa-flushed fa-6x"></i></span>
					</div>
					<div class="find-box">
						<h4 class="msg1">로그인에 문제가 있나요?</h4>
					</div>
					<div class="find-box">
						<div class="msg2">가입한 이메일을 입력하면 다시 계정에 로그인 할 수 있는 임시 비밀번호를 보내드립니다.</div>
					</div>
					<div class="find-box">
						<form method="post">
							<input id="email" class="find-input-box" placeholder="이메일" type="text">
						</form>
					</div>
					<div class="find-box">
						<button id="send_link_btn" class="join-btn-btn">로그인 링크 보내기</button>
					</div>
					<div class="findBox find-bar-box" style="margin-top: 16px;">
						<div class="find-bar"></div>
						<div class="or-text">또는</div>
						<div class="find-bar"></div>
					</div>
					<div class="find-box">
						<a class="join-account" href="<c:url value='/user/join'/>">새 계정 만들기</a>
					</div>
					<div class="login-back">
						<div class="login-back-btn" style="height: 48px;">
							<a href="<c:url value='/'/>">로그인으로 돌아가기</a>
						</div>
					</div>
				</div>
			</div>
		
		
		</div>
		<!-- end of contentBox -->
		
		<!-- 네비게이션 메뉴 -->
		<!--<jsp:include page="../include/top-menu.jsp"/>-->
		
		
		<!-- footer -->
		<%-- <jsp:include page="../include/footer.jsp"/>--%>		
	</div>
	<!-- end of 전체 화면 -->
    
</section>



<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
	<script type="text/javascript">
	</script>
</body>
</html>

