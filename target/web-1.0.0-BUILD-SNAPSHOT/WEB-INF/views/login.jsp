<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form method="post" id="authForm" action="member/login">
	  <div>
	    <label for="loginId">아이디</label>
	    <input type="text" id="m_id" name="m_id" placeholder="ID" >
	    <label for="loginPw">비밀번호</label>
	    <input type="password" id="m_pw" name="m_pw" placeholder="Password" >
	  </div>
	  <button type="submit" id="loginBtn">로그인</button>
	  <button type="button" onclick="location.href='member/signUp'">회원가입</button>
	</form>
	dasasddsadsada

</body>
</html>