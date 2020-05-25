<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
td {
	border: 1px solid #000000;
	border-collapse: collapse;
}
</style>

<script src="fetch/fetch.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	
	//모든 공백 체크 정규식
	var empJ = /\s/g;
	//아이디 정규식
	var idJ = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
	// 비밀번호 정규식
	var pwJ = /^[A-Za-z0-9]{4,12}$/;
	// 이름 정규식
	var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
	// 이메일 검사 정규식
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// 휴대폰 번호 정규식
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
	/^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/
	var birthJ = false;

$(document).ready(function() {
	alert('페이지 로딩 완료');
	//아이디 중복확인
	$("#m_id").blur(function() {
		if($('#m_id').val()==''){
			$('#id_check').text('아이디를 입력하세요.');
			$('#id_check').css('color', 'red');
		} else if(idJ.test($('#m_id').val())!=true){
			$('#id_check').text('4~12자의 영문, 숫자만 사용 가능합니다.');
			$('#id_check').css('color', 'red');
		} else if($('#m_id').val()!=''){
			
			alert('아작스 실행 직전들어옴');
			const m_id = $('#m_id').val();
			
			const paramData = {"m_id" : m_id};
			
			$.ajax({
				type : 'GET',
				data : paramData,//mem_id라는 이름으로 mem_id라는 데이터를 @WebServlet("/idsearch.do")에 보내겠다
				url : 'checkId',
				success : function(data) {
					console.log(data);
					if(data.cnt > 0){
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
						else{
							$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다.");
							$('#id_check').css('color', 'red');
							$("#usercheck").attr("disabled", true);
						}
					}
				}
			});//ajax///
		}//else if
	});//blur

});
</script>

</head>
<body>

	<article class="container">
		<div class="page-header">
			<div class="col-md-6 col-md-offset-3">
				<h3>회원가입</h3>
			</div>
		</div>
		<div class="col-sm-6 col-md-offset-3">
			<form action="signOK" method="post" role="form" id="joinForm"
				name="member">

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
					<label for="mem_gender">성별 </label> <input type="radio"
						id="m_gender" name="m_gender" value="남" checked="checked">남
					<input type="radio" id="w_gender" name="m_gender" value="여">여
				</div>

				<!-- 주소 -->
				<!-- <div class="form-group">
			<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="mem_oaddress" id="mem_oaddress" type="text" readonly="readonly" >
			<button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>
			</div>
			<div class="form-group">
			<input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="mem_address" id="mem_address" type="text" readonly="readonly" />
			</div>
			<div class="form-group">
			<input class="form-control" placeholder="상세주소" name="mem_detailaddress" id="mem_detailaddress" type="text" />
			</div> -->

				<div class="form-group text-center">
					<button type="submit" class="btn btn-primary" onclick="welcome();">회원가입</button>
				</div>
			</form>
		</div>
	</article>

</body>
</html>