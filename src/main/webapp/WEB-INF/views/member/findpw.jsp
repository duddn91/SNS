<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- 임시 비밀번호 페이지-->
<title>Stargram</title>

<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/style2.css">
<link rel="stylesheet" href="/css/new_post.css">
<link rel="stylesheet" href="/css/find-custom.css">
<link rel="shortcut icon" href="/imgs/instagram.png">

</head>
<body>

	<!-- 전체화면 -->
	<div class="container-fluid" style="background-color: #fafafa;">
		<!-- content-box : 비번찾기 박스 -->
		<div class="content-box">
			<!-- 비밀번호 찾기 박스 -->
			<div class="find-pw-box">
				<div class="find-pw">
					<div class="find-icon">
						<img alt="scared face" src="/imgs/scared.png">
					</div>
					<div class="find-box">
						<h4 class="msg1">로그인에 문제가 있나요?</h4>
					</div>
					<div class="find-box">
						<div class="msg2">가입한 아이디와 이메일을 입력하시면 임시 비밀번호를 보내드립니다.</div>
					</div>
					
					<form action="findPWOK"  method="post" role="form" id="findPWForm" name="findPW">
						<div class="find-box">
								<input id="m_id" name="m_id" class="find-input-box" placeholder="아이디" type="text">
								<div class="eheck_font" id="id_check"></div>
								<input id="m_email" name="m_email" class="find-input-box" placeholder="이메일" type="text">
								<div class="eheck_font" id="email_check"></div>
						</div>
						<div class="find-box">
							<button id="send_link_btn" class="join-btn-btn" type="submit" class="findPWOK" >임시 비밀번호 보내기</button>
						</div>
					</form>
					
					<div class="rr">
			            <div class="K-1uj Z7p_S">
			            	<div class="s311c"></div>	
			            	<div class="or">또는</div>
			            	<div class="s311c"></div>
			            </div>
		       		</div>
					<div class="find-box">
						<a class="join-account" href="/member/signUp">새 계정 만들기</a>
					</div>
					<div class="login-back">
						<div class="login-back-btn" style="height: 48px;">
							<a href="/login">로그인으로 돌아가기</a>
						</div>
					</div>
				</div>
			</div>
		
		
		</div>
		<!-- end of contentBox -->
		</div>
		<!-- end of 전체 화면 -->

<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	
	let idchk = false;
	let emchk = false;
	
	// 아이디 확인
	$('#m_id').keyup(function() {
		if ($('#m_id').val() == '') {
		} else if($('#m_id').val()!='') {
			const m_id = $('#m_id').val();
			const paramData = {"m_id" : m_id};
			
			$.ajax({
				type : 'GET',
				data : paramData,	
				url : 'checkId',
				success : function(data) {
					if (data > 0) {
						$('#id_check').text('존재하는 아이디입니다.');
						$('#id_check').css('color', 'blue');								
					} else {
						$('#id_check').text('존재하지 않는 아이디입니다.');
						$('#id_check').css('color', 'red');								
						}
					}
			});	// $.ajax
		}				
	});	// $('#m_id')
	
	// 이메일 확인
	$('#m_email').keyup(function() {
		if ($('#m_email').val() == '') {
		} else if($('#m_email').val()!='') {
			const m_email = $('#m_email').val();
			const paramData = {"m_email" : m_email};
			
			$.ajax({
				type : 'GET',
				data : paramData,	
				url : 'checkEmail',
				success : function(data) {
					if (data > 0) {
						$('#email_check').text('일치하는 이메일입니다.');
						$('#email_check').css('color', 'blue');								
					} else {
						$('#email_check').text('이메일을 다시 확인해주세요.');
						$('#email_check').css('color', 'red');								
						}
					}
			});	// $.ajax
		}				
	});	// $('#m_email')
	
}); // $(document).ready



</script>
</body>
</html>