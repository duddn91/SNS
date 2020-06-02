# SNS project

springFrame를 활용하여 sns개발

<hr/>

* 데이터베이스 테이블
  * member
  * reply
  * post


<hr/>

* 회원가입 창
   * 정규식을 사용하여 아이디, 비밀번호, 이메일, 휴대폰번호 검사
   * 생년월일 유효성 검사를 통해 생년월일이 거짓인지 검사
   * ajax를 사용하여 아이디 textfield에 값이 입력될 때 마다 아이디 중복확인
<hr/>    

* 비밀번호 찾기
   * 이메일인증을 통해 아이디와 이메일이 같으면 임시비밀번호를 메일로 보내고 데이터 베이스에 저장
  
* * *

* 로그인
  * 데이터베이스 정보와 비교해 로그인시에 회원정보를 session에 저장
   

* * *

* 포스트 입력 
   * 이미지파일 업로드 기능
   * 이미지 입력시에 아이디+현재시간으로 이미지파일 이름이 생성되고 이미지 파일 이름을 데이터베이스에 저장
   * javascript를 사용해 content부분에 글이 입력시에만 저장가능
   
* * *

* 포스트 뷰
   * 글이 저장된 index 번호의 오름차순으로 게시물을 보여준다.
   * 윈도우 스크롤 이벤트로 무한스크롤 기능 구현(ajax 사용)
   * 댓글목록 보기 버튼을 만들어 댓글 목록을 열고 닫을 수 있다.
   * 댓글 수정, 삭제, 입력시에 ajax를 사용
   * 댓글의 댓글 처리를 위해 ref, lev, seq를 만들고 lev에 따라 들여쓰기 기능
   * 대댓글입력하기위해 댓글 바로 밑에 텍스트 상자를 열고 닫는 기능
   * 빈 하트 -> 누르면 like 1증가 색이 채워짐 -> 다시한번 누르면 like 1감소 빈하트 (ajax를 사용하여 바로 데이터베이스에 저장 & 좋아요 숫자에 바로 반영)
   * 검색창을 이용하여 아이디 검색기능 구현(키보드에 이벤트를 주어 입력될때마다 바로 게시물이 reset)
   


<hr/>
<div align="center"><h3>프로그래밍 도구</h3></div>
<div align="center">
  <img src="https://user-images.githubusercontent.com/60992456/83469665-4a438500-a4bb-11ea-96e2-6848bf6a42e8.png" width="100" style="margin:5px"/>
  <img src="https://user-images.githubusercontent.com/60992456/83471065-ad82e680-a4be-11ea-8354-9d8b943136e3.png" width="100" style="margin:5px"/>
  <img src="https://user-images.githubusercontent.com/60992456/83470858-29306380-a4be-11ea-864a-b6e28bca1e51.png" width="100" style="margin:5px"/>
  <img src="https://user-images.githubusercontent.com/60992456/83470859-29c8fa00-a4be-11ea-8cad-f5b9aaf73ac8.jpg" width="100" style="margin:5px"/>
  <img src="https://user-images.githubusercontent.com/60992456/83471145-e3c06600-a4be-11ea-86f6-473d55a798e4.png" width="100" style="margin:5px"/>
  <img src="https://user-images.githubusercontent.com/60992456/83471772-86c5af80-a4c0-11ea-8602-de9167dc1c96.png" width="100" style="margin:5px"/>
  <img src="https://user-images.githubusercontent.com/60992456/83471793-9218db00-a4c0-11ea-8c1b-0747f08e5c9c.png" width="100" style="margin:5px"/>
  
</di1v>

