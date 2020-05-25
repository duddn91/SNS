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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	
	//모든 공백 체크 정규식
	var empJ = /\s/g;
	//아이디 정규식
	var idJ = /^[a-z0-9][a-z0-9]{3,11}$/;
	// 비밀번호 정규식
	var pwJ = /^[A-Za-z0-9]{4,12}$/;
	// 이름 정규식
	var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
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
				data : paramData,//mem_id라는 이름으로 mem_id라는 데이터를 @WebServlet("/idsearch.do")에 보내겠다
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
	
	
	$('.signUp').click(function(){
		
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
				$('#pw_check').text('4~12자의 숫자 , 문자로만 사용 가능합니다.');
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

</head>
<body>



</body>
</html>