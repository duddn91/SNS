<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<title>Stargram</title>

	<link rel="stylesheet" href="/css/reset.css">
	<link rel="stylesheet" href="/css/common.css">
	<link rel="stylesheet" href="/css/style.css">
	<link rel="stylesheet" href="/css/style2.css">
	<link rel="stylesheet" href="/css/login.css">
    <link rel="stylesheet" href="/css/findpw.css">
	<link rel="shortcut icon" href="/imgs/instagram.png">
</head>
<body>

<section id="container">

<!-- 학원에서 할 거 -->
<!-- https://foodchain.tistory.com/140 -->

    <div id="main_container">

        <div class="form_container">

            <div class="form">
     			<div class="lock_icon">
                	<span class="sprite_lock_icon"></span>
                </div>
                <div class="findpw_col">
                	<h4>로그인에 문제가 있나요?</h4>
                </div>
                <div class="findpw_col">
                	<div class="findpw_help">이메일을 입력하면 다시 계정에 로그인할 수 있는 링크를 보내드립니다.</div>
                </div>
               	<div class="findpw_col">
	                <form action="#" method="post" class="findpw_form">
                	    <input type="text" id="findpw_input" name="findpw_input" placeholder="이메일을 입력하세요." >
	                </form>
                </div>
                <div class="findpw_col">
                	<button type="submit" id="findpw_btn" class="findpw_btn">로그인 링크 보내기</button>
                </div>
	          	<div class="rr">
		            <div class="K-1uj Z7p_S">
		            	<div class="s311c"></div>	
		            	<div class="or">또는</div>
		            	<div class="s311c"></div>
		            </div>
	       		</div>
               <div class="findpw_col">
               		<a href="#" class="to_signup">새 계정 만들기</a>
               </div>
               
            </div> 

            <div class="gr27e">
                <div class="findpw_bottom">
                   <a href="/login" class="back_login">로그인으로 돌아가기</a></p>
       	   		</div>
            </div>

       	</div>
    </div>
</section>


</body>
</html>