<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<title>Stargram</title>

	<link rel="stylesheet" href="/css/reset.css">
	<link rel="stylesheet" href="/css/common.css">
	<link rel="stylesheet" href="/css/style.css">
	<link rel="stylesheet" href="/css/style2.css">
	<link rel="stylesheet" href="/css/login.css">
	<link rel="shortcut icon" href="/imgs/instagram.png">

</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	
	//모든 공백 체크 정규식
	var empJ = /\s/g;
	//아이디 정규식
	var idJ = /^[a-z0-9][a-z0-9]{3,11}$/;
	// 비밀번호 정규식
	var pwJ = /^[A-Za-z0-9]{4,15}$/;
	// 이름 정규식
	var nameJ = /^[가-힣]{2,4}$/;
	// 이메일 검사 정규식
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// 휴대폰 번호 정규식
	var phoneJ = /^01([0|1|6-9]?)(\d{4})(\d{4})$/;
	
	var birthJ = false;

$(document).ready(function() {
	
	//아이디 중복확인
	$("#m_id").keyup(function() {
		if($('#m_id').val()==''){
			$('#id_check').text('아이디를 입력하세요.');
			$('#id_check').css('color', 'red');
		} else if(idJ.test($('#m_id').val())!=true){
			$('#id_check').text('4~12자의 영문, 숫자만 사용 가능합니다.');
			$('#id_check').css('color', 'red');
		} else if($('#m_id').val()!=''){
			
			const m_id = $('#m_id').val();
			const paramData = {"m_id" : m_id};
			
			$.ajax({
				type : 'GET',
				data : paramData,
				url : 'checkId',
				success : function(data) {
					if(data > 0){
						$('#id_check').text('중복된 아이디 입니다.');
						$('#id_check').css('color', 'red');
						$("#usercheck").attr("disabled", true);
					}else{
						if(idJ.test(m_id)){
							$('#id_check').text('사용가능한 아이디 입니다.');
							$('#id_check').css('color', 'blue');
							$("#usercheck").attr("disabled", false);
						}
						else if(m_id==''){
							$('#id_check').text('아이디를 입력해주세요.');
							$('#id_check').css('color', 'red');
							$("#usercheck").attr("disabled", true);
						}
						else if(idJ.test($('#m_id').val())){
							console.log('false');
							$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다.");
							$('#id_check').css('color', 'red');
						}
						else{
							$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다.");
							$('#id_check').css('color', 'red');
							$("#usercheck").attr("disabled", true);
						}
					}
				}
			});//ajax///
		}//else if
	});//keyup
	
	// 생일 유효성 검사
	
	// 생년월일 birthJ 유효성 검사
	$('#m_birth').keyup(function(){
		var dateStr = $(this).val();
		var year = Number(dateStr.substr(0,4)); // 입력한 값의 0~4자리까지 (연)
		var month = Number(dateStr.substr(4,2)); // 입력한 값의 4번째 자리부터 2자리 숫자 (월)
		var day = Number(dateStr.substr(6,2)); // 입력한 값 6번째 자리부터 2자리 숫자 (일)
		var today = new Date(); // 날짜 변수 선언
		var yearNow = today.getFullYear(); // 올해 연도 가져옴
		if (dateStr.length == 8) {
			// 연도의 경우 1900 보다 작거나 yearNow 보다 크다면 false를 반환합니다.
			if (year > yearNow || year < 1900 ){
				$('#birth_check').text('생년월일을 확인해주세요');
				$('#birth_check').css('color', 'red');
			}
			else if (month < 1 || month > 12) {
				$('#birth_check').text('생년월일을 확인해주세요 ');
				$('#birth_check').css('color', 'red');
			}else if (day < 1 || day > 31) {
				$('#birth_check').text('생년월일을 확인해주세요 ');
				$('#birth_check').css('color', 'red');
			}else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
				$('#birth_check').text('생년월일을 확인해주세요 ');
				$('#birth_check').css('color', 'red');
			}else if (month == 2) {
				var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
				if (day>29 || (day==29 && !isleap)) {
				$('#birth_check').text('생년월일을 확인해주세요 ');
				$('#birth_check').css('color', 'red');
				}else{
					$('#birth_check').text('');
					birthJ = true;
				}
			}else{
				$('#birth_check').text('');
				birthJ = true;
				}//end of if
		}else{
			//1.입력된 생년월일이 8자 초과할때 : auth:false
			$('#birth_check').text('생년월일을 확인해주세요 ');
			$('#birth_check').css('color', 'red');
			birthJ = false;
		}
	}); //End of method /*
	
	
	$('#submit_btn').click(function(){
		
		var inval_Arr = new Array(6).fill(false);
		
		// 아이디 정규식
		if (idJ.test($('#m_id').val())) {
			inval_Arr[0] = true;
		} else {
			inval_Arr[0] = false;
			alert('아이디를 확인하세요.');
			return false;
		}
		
		// 비밀번호가 같은 경우 && 비밀번호 정규식
		if (($('#m_pw').val() == ($('#m_pw2').val()))
		&& pwJ.test($('#m_pw').val())) {
			inval_Arr[1] = true;
		} else {
			inval_Arr[1] = false;
			alert('비밀번호를 확인하세요.');
			return false;
		}
		
		// 이름 정규식
		if (nameJ.test($('#m_name').val())) {
			inval_Arr[2] = true;
		} else {
			inval_Arr[2] = false;
			alert('이름을 확인하세요.');
			return false;
		}
		
		// 생년월일 정규식
		if (birthJ) {
			console.log(birthJ);
			inval_Arr[3] = true;
		} else {
			inval_Arr[3] = false;
			alert('생년월일을 확인하세요.');
			return false;
		}
		
		// 이메일 정규식
		if (mailJ.test($('#m_email').val())){
			console.log(mailJ.test($('#m_email').val()));
			inval_Arr[4] = true;
		} else {
			inval_Arr[4] = false;
			alert('이메일을 확인하세요.');
			return false;
		}
	
		// 휴대폰번호 정규식
		if (phoneJ.test($('#m_phone').val())) {
		console.log(phoneJ.test($('#m_phone').val()));
			inval_Arr[5] = true;
		} else {
			inval_Arr[5] = false;
			alert('휴대폰 번호를 확인하세요.');
		return false;
		}
		
		//전체 유효성 검사
		var validAll = true;
		
		for(var i = 0; i < inval_Arr.length; i++){
			if(inval_Arr[i] == false){
				validAll = false;
			}
		}
		
		if(validAll == true){ // 유효성 모두 통과
			alert('WELCOME TO STARGRAM');
		} else{
			alert('정보를 다시 확인하세요.')
		}
	});

	
		//패스워드 확인
		$('#m_pw').keyup(function() {
			if (pwJ.test($('#m_pw').val())) {
				console.log('true');
				$('#pw_check').text('');
			} else {
				console.log('false');
				$('#pw_check').text('4~15자의 숫자 , 문자로만 사용 가능합니다.');
				$('#pw_check').css('color', 'red');
			}
		});
		
		//1~2 패스워드 일치 확인
		$('#m_pw2').keyup(function() {
			if ($('#m_pw').val() != $(this).val()) {
				$('#pw2_check').text('비밀번호가 일치하지 않습니다.');
				$('#pw2_check').css('color', 'red');
			} else {
				$('#pw2_check').text('');
			}
		});
		
		//이름에 특수문자 들어가지 않도록 설정
		$("#m_name").keyup(function() {
			if (nameJ.test($(this).val())) {
				console.log(nameJ.test($(this).val()));
				$("#name_check").text('');
			} else {
				$('#name_check').text('한글 2~10자 이내로 입력하세요. (특수기호, 공백 사용 불가)');
				$('#name_check').css('color', 'red');
			}
		});
		
		//이메일 
		$("#m_email").keyup(function() {
			if (mailJ.test($(this).val())) {
				console.log(phoneJ.test($(this).val()));
				$("#email_check").text('');
			} else {
				$('#email_check').text('이메일 양식을 확인해주세요.');
				$('#email_check').css('color', 'red');
			}
		});
	
		// 휴대전화
		$('#m_phone').keyup(function(){
			if(phoneJ.test($(this).val())){
				console.log(phoneJ.test($(this).val()));
				$("#phone_check").text('');
			} else {
				$('#phone_check').text('휴대폰번호를 확인해주세요 ');
				$('#phone_check').css('color', 'red');
			}
		});
	
	
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
                
				<form action="signOK" method="post" role="form" id="joinForm" name="member">
				
				<h2 class="fs-hh">친구들의 사진과 동영상을 보려면 가입하세요.</h2>
					
					<div class="form-group">
						<input type="text" class="form-control"
							id="m_id" name="m_id" placeholder="아이디" aria-required="true">
						<div class="eheck_font" id="id_check"></div>
					</div>
	
					<div class="form-group">
						<input type="password"
							class="form-control" id="m_pw" name="m_pw" placeholder="비밀번호(영문,숫자 3-20자리)">
						<div class="eheck_font" id="pw_check"></div>
					</div>
	
					<div class="form-group">
						<input type="password"
							class="form-control" id="m_pw2" name="m_pw2"
							placeholder="비밀번호 확인">
						<div class="eheck_font" id="pw2_check"></div>
					</div>
	
					<div class="form-group">
						<input type="text"
							class="form-control" id="m_name" name="m_name" placeholder="이름">
						<div class="eheck_font" id="name_check"></div>
					</div>
	
					<div class="form-group">
						<input type="tel"
							class="form-control" id="m_birth" name="m_birth"
							placeholder="생년월일(ex.19940712)">
						<div class="eheck_font" id="birth_check"></div>
					</div>
	
					<div class="form-group">
						<input type="email"
							class="form-control" id="m_email" name="m_email"
							placeholder="이메일">
						<div class="eheck_font" id="email_check"></div>
					</div>
	
					<div class="form-group">
						<input
							type="tel" class="form-control" id="m_phone" name="m_phone"
							placeholder="휴대폰('-'없이 번호만 입력해주세요)">
						<div class="eheck_font" id="phone_check"></div>
					</div>
					
					<div class="form-group">
						<input type="submit" id="submit_btn" value="회원가입" class="submit_btn">
					</div>
					
					<p class=" ZGwn1">가입하면 Stargram의 
						<a target="_blank" href="https://help.instagram.com/581066165581870">약관</a>, 
						<a target="_blank" href="https://help.instagram.com/519522125107875">데이터 정책</a> 및 
						<a target="_blank" href="/legal/cookies/">쿠키 정책</a>
						에 동의하게 됩니다.
					</p>
				</form>
				</div> <!-- form div  -->
				
				<div class="gr27e">
	                <div>
	                    <p class="izU2O ">계정이 있으신가요?<a href="/login"> 로그인</a></p>
	                </div>
        	   	</div>
        	   	
			</div>
		</div>
</section>
</body>
</html>