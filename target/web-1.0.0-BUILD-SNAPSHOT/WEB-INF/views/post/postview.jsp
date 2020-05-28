<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>☆★stargram☆★</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>

body { padding-top: 70px; 
		width: 900px;		
		margin: 0 auto;
}

</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

	/* 댓글 불러오기 */
	var searchRequest = new XMLHttpRequest();
	var r_pno = 0
	function getReply(p_no){
		r_pno = p_no
		var table = document.getElementById("reply"+r_pno);
		var trLen = table.children.length;
		if(trLen>0){
			table.innerHTML = "";
		}else{
			var url = "./getReply?r_pno=" + r_pno;
			searchRequest.open("post", url, true);
			searchRequest.onreadystatechange = searchProcess;
			searchRequest.send(null);
		}
	}
	function searchProcess() {
		if(searchRequest.readyState == 4 && searchRequest.status == 200) {	
			var table = document.getElementById("reply"+r_pno);
			var object = eval("(" + searchRequest.responseText + ")");	
//			json 객체에서 result 라는 이름이 지정된 데이터를 얻어온다. => 화면에 출력할 데이터
			var result = object.result;
			if(result.length == 0){
//				댓글이 0개일때
				alert('댓글이 하나도 없습니다.');
			}else{
//				검색되서 넘어온 데이터의 개수 만큼 반복한다.
				for (var i = 0; i < result.length; i++) {
//					tbody에 넣어줄 행을 만든다.
					var row3 = table.insertRow(0);
					var row2 = table.insertRow(0);
					var row1 = table.insertRow(0);
					var cell1 = row1.insertCell(0);
					var cell2 = row2.insertCell(0);
					var cell3 = row3.insertCell(0);
					
					cell1.innerHTML = result[i][0].value +"(";
					cell1.innerHTML += result[i][1].value +")";
					cell2.innerHTML = result[i][2].value;
					cell3.innerHTML = "<td><input type='button' value='수정'><input type='button' value='삭제'></td>"
				}
			}
		} 
	}
	
	/* 무한스크롤 */
	$(window).scroll(function(){
		if($(window).scrollTop() >= $(document).height() - $(window).height()){
			var startNo = $(".table").last().data("no") || 0;
			if(startNo == 1){
				alert('마지막 포스트 입니다.');
			}else{
				$.ajax({
					type : 'get',
					url : './getpost?no='+startNo,
					dataType : 'json',
					success : function(data){
						var str = "";
						if(data != ""){
							
							for(var i = 0; i < data.length; i++){
								var time = new Date(data[i].p_regdate);
								console.log(time);
								str += "<table id='post" + data[i].p_no + "' class='table borderless scrolling' align='center' cellpadding='5px' data-no='" + data[i].p_no + "'>"
									+		"<tr>"
									+			"<td align='center' width='100'>프로필사진</td>"
									+			"<td align='center' width='100'>" + data[i].p_id + "</td>" 
									+			"<td align='center'>"
									+ 				 time.toLocaleDateString()
									+ 			"</td>" 
									+		"</tr>"
									+		"<tr>"
									+			"<td align='center' colspan='3'>"
									+				"<img src='/photo/" + data[i].p_photo + "'/>"
									+			"</td>" 
									+		"</tr>"	
									+ 		"<tr>"
									+		"<td align='center' colspan='3'>" + data[i].p_content + "</td>" 
									+		"</tr>"
									+		"<tr>"
									+			"<td align='center' colspan='3'>"
									+				"<form action='post/replyInsert' method='post'>"
									+					"<input type='hidden' name='r_pno' value='"	+ data[i].p_no + "'/>"
									+					"<input type='hidden' name='r_id' value='${member.m_id}'>"	
									+					"<input type='text' size='100' name='r_content' id='r_content" + data[i].p_no + "' placeholder='댓글입력'/>"
									+					"<input type='submit' value='입력'/>"	
									+				"</form>"
									+			"</td>"
									+		"</tr>"		
									+ 		"<tr>"
									+			"<td colspan='3' id='p_no' data-no='" + data[i].p_no + "'>"
									+				"<label onclick='getReply(" + data[i].p_no + ")'>댓글" + data[i].p_replycnt + "</label>"
									+			"</td>"
									+		"</tr>"
									+		"<tr>"
									+			"<table id='reply"	+ data[i].p_no + "' width='800' align='center' border='1' cellpadding='5px'>"
									+			"</table>"
									+		"</tr>"
									+ 	"</table>"
									+	"<hr style='height: 100px'/>"
								
								
							}//for
							str += "<div class='add'></div>"
							$(".add").last().after(str);
						}
					},error : function(err){
						console.log(err);
						alert(err);
					}
					
				}); // ajax
			}	//	else
		}
	});

</script>



</head>
<body>


<nav class="navbar navbar-fixed-top bg-info">
	<div class="container-fluid">
	    <p class="navbar-text">☆★stargram☆★</p>   
	
		<!-- 친구 버튼? -->
		<div class="navbar-right">
			<button type="button" class="btn btn-default" style="margin-top:4px; margin-right:10px;">
				<span class="glyphicon glyphicon-home" style="font-size:25px"></span>
			</button>
		</div>

		<!-- 포스팅 버튼 -->
		<div class="navbar-right" style="margin-left:4px;">
			<button type="button" class="btn btn-default" style="margin-top:4px; 
				margin-right:10px;" onclick="location.href='posting'">
				<span class="glyphicon glyphicon-plus" style="font-size:25px"></span>
			</button>
		</div>
		
		<!-- 마이페이지 버튼 -->
		<div class="navbar-right">
			<button type="button" id="mypageBtn" class="btn btn-default" style="margin-top:4px; 
			margin-right:10px;" onclick="location.href='/member/mypage'">
				<span class="glyphicon glyphicon-user" style="font-size:25px"></span>
			</button>
		</div>
		
	    <div class="navbar-header navbar-right" style="margin-right:10px;"> 
	      <form align="center" class="navbar-form navbar-right" role="search">
	        <div class="form-group">
	          <input type="text" class="form-control" placeholder="Search">
	        </div>
	        <button type="submit" class="btn btn-default">검색</button>
	      </form>
	    </div>
	      
	</div>
</nav>



<c:forEach var="vo" items="${postList}">
<c:if test="${postList != null}">
	<table id="post${vo.p_no}" class="table borderless scrolling" align="center" cellpadding="5px" data-no="${vo.p_no}">
		<tr>
			<td align="center" width="100">프로필사진</td> 
			<td align="center" width="100">${vo.p_id}</td> 
			<td align="center">
				
				<fmt:formatDate value="${vo.p_regdate}" pattern="yyyy.MM.dd(E)"/>
			</td> 
		</tr>
				
		<tr>
			<td align="center" colspan="3">
				<img class="rounded" alt="Cinque Terre" src="/photo/${vo.p_photo}" />
			</td> 
		</tr>
		
		<tr>
			<td align="center" colspan="3">${vo.p_content}</td> 
		</tr>
		
		
		<tr>
			<form action="replyInsert" method="post">
				<td class="col-xs-11" align="center" colspan="2">
					<input type="hidden" name="r_pno" value="${vo.p_no}"/>
					<input type="hidden" name="r_id" value="${login.m_id}">
					<input class="form-control input-sm" type="text" name="r_content" id="r_content${vo.p_no}" placeholder="댓글입력"/>
				</td>
				<td><input class="btn btn-success btn-sm" type="submit" value="입력"/></td>
			</form>
		</tr>
		
		
		<tr>
			<td colspan="3" id="p_no" data-no="${vo.p_no}">
				<a onclick="getReply(${vo.p_no})" style="cursor: pointer;">댓글보기 <span class="badge">${vo.p_replycnt}</span></a><br>
			</td>
		</tr>
		
		<tr>
		<!-- 댓글 추가 테이블 -->
			<table id="reply${vo.p_no}" width="800" align="center" border="1" cellpadding="5px">
			</table>
		</tr>
	</table>
	<hr style="height: 100px"/>
</c:if>
</c:forEach>

	<div class="add"></div>


</body>
</html>