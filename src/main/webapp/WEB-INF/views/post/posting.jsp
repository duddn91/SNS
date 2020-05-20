<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- css 필터 적용 링크-->
<link rel="stylesheet" href="https://cssgram-cssgram.netdna-ssl.com/cssgram.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/cssgram/0.1.10/cssgram.min.css">

<title>Posting Page</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script type="text/javascript">

//	이미지 업로드 미리보기
	$(function() {
          $("#imageFile").on('change', function(){
              readURL(this);
          });
      }); 

      function readURL(input) {
          if (input.files && input.files[0]) {		// 선택된 파일이 있다면,
          var reader = new FileReader();			// 파일을 읽어서,
          
          reader.onload = function (e) {			// #preview 이미지 태그에 들어있는 사진과 바꾸기
                  $('#preview').attr('src', e.target.result);
              }
            reader.readAsDataURL(input.files[0]);
          }
      }

//	리셋 버튼 누르면 미리보기 창 비워주기      
      function formDelete() {
          $('#preview').attr('src', "uploadpath/temp.png"); 			// 임시 이미지
	  	document.getElementById("figure").className = "noneClass";	// 필터 취소
		document.getElementById("filterValue").value = "0";	
      }
            
//	폼 입력 검사
    function formCheck() {	
	
	    var fileNm = $("#imageFile").val();
    	var ext = fileNm.slice(fileNm.lastIndexOf(".") + 1).toLowerCase();	// 확장자 가져오기

    	if ($("#content").val() == "") {
			alert("내용을 반드시 적어주세요.")
			fr.p_content.focus();
			return false;
		} else if ($("#imageFile").val() == "") {
			alert("이미지 파일을 반드시 업로드해주세요.")
			return false;		 	
		} else if (!(ext == "jpg" || ext == "png" || ext == "jpeg")) {			
			alert("이미지 파일(jpg, png ...) 확장자만 가능합니다.")
			return false;		 				
		} else {
			document.fr.submit();
		}	
	}
	
//	원본 사진
	function filter0() {
		document.getElementById("figure").className = "noneClass";
		document.getElementById("filterValue").value = "0";	
	}

//	aden 필터
	function filter1() {
		document.getElementById("figure").className = "aden";
		document.getElementById("filterValue").value = "1";
		
	}
	
//	brooklyn 필터	
	function filter2() {
		document.getElementById("figure").className = "brooklyn";
		document.getElementById("filterValue").value = "2";
	}

//	lofi 필터
	function filter3() {
		document.getElementById("figure").className = "lofi";
		document.getElementById("filterValue").value = "3";
	}
	
//	maven 필터	
	function filter4() {
		document.getElementById("figure").className = "maven";
		document.getElementById("filterValue").value = "4";
	}

//	lark 필터	
	function filter5() {
		document.getElementById("figure").className = "lark";
		document.getElementById("filterValue").value = "5";
	}

//	perpetua 필터	
	function filter6() {
		document.getElementById("figure").className = "perpetua";
		document.getElementById("filterValue").value = "6";
	}

//	willow 필터	
	function filter7() {
		document.getElementById("figure").className = "willow";
		document.getElementById("filterValue").value = "7";
	}

    </script>

	<style>
	
	/*
	인스타그램 픽셀 사이즈
	프로필 사진 : 110*110
	마이페이지 : 161*161
	피드/업로드 : 510*510	
	*/
	
		#preview {
			width: 510px; 
			height: 510px;		
		}
		
		/* 이미지 크기랑 똑같이 맞춰주기 */	
		figure {
			width: 510px; 
			height: 510px;		
		}	
			
	</style>

</head>
<body>

<form action="postingOK" name="fr" method="post" enctype="multipart/form-data" >
<table width="500" align="center" border="1" cellpadding="5" cellspacing="0">

	<tr><th colspan="2">새 게시물</th></tr>
	<tr>
		<td width="100">아이디</td>
		<td width="400">
			<lable name="p_id">${login.m_id}</lable>
			<input type="hidden" name="p_id" value="${login.m_id}">
		</td>	<!-- 나중에 프로필사진 + 이름 값 받아오기 -->
	</tr>
	<tr>
		<td>사진 선택</td>
		<td>
		<input type="file" name="file" id="imageFile" accept="img/*"/> 	<!-- "imageFile" accept="img/*" -->
 		<figure id="figure" class="noneClass">
 		<img id= "preview" src="/photo/temp.png" alt="your image" >
 		</figure>		
		</td>	
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="button" value="원본"  onclick="filter0()"/>
			<input type="button" value="Aden"  onclick="filter1()"/>
			<input type="button" value="Brooklyn"  onclick="filter2()"/>
			<input type="button" value="Lofi"  onclick="filter3()"/>
			<input type="button" value="Maven"  onclick="filter4()"/>
			<input type="button" value="Lark"  onclick="filter5()"/>
			<input type="button" value="Perpetua"  onclick="filter6()"/>
			<input type="button" value="Willow"  onclick="filter7()"/>
		</td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea rows="10" cols="50" name="p_content" id="content" style="resize: none;"></textarea></td>
	</tr>	
	<tr>
		<td colspan="2" align="center">
			<input type="button" value="upload" onclick="formCheck()"/>
			<input type="reset" value="rewrite" onclick="formDelete()"/>
			<input type="hidden" id="filterValue" value="0" name="p_filter"> <!-- 0이면 원본, 1~7 필터 지정값 -->
		</td>
	</tr>
</table>
</form>

</body>
</html>



