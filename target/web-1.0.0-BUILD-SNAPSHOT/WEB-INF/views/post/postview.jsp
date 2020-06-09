<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <link rel="shortcut icon" href="/imgs/instagram.png">
    
<style type="text/css">
   .comment_container {
    padding: 10px 20px;
	}
	.getReply_btn{
		color: #262626;
		opacity: 0.8;
		font-size: 12px;
	}
	.commentText{
		width: 90%;
	}
	.contents{
		margin-left: 150px;
	}

</style>
    
    
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	/* 댓글 불러오는 AJAX */
    var searchRequest = new XMLHttpRequest();
	var r_pno = 0
	function getReply(p_no, check){
		r_pno = p_no
		var viewreply = document.getElementById("reply"+r_pno);
		if (viewreply.style.display == 'block' && check){
			viewreply.style.display = 'none';
		}else{
			/* 댓글창 보여주기 */
			viewreply.style.display = 'block'
			var url = "./getReply?r_pno=" + r_pno;
			searchRequest.open("post", url, true);
			searchRequest.onreadystatechange = searchProcess;
			searchRequest.send(null);
		}
	}
	
	
	function searchProcess() {
		if(searchRequest.readyState == 4 && searchRequest.status == 200) {	
			var object = eval("(" + searchRequest.responseText + ")");	
			var result = object.result;
			if(result.length == 0){
				alert('댓글이 하나도 없습니다.');
			}else{
				updateReply(result);
			}
		} 
	}
	/* 댓글목록 */
	function updateReply(result){
		var table = document.getElementById("reply"+r_pno);
		var str = "";
		var m_id = "${login.m_id}";
		
		for (var i = 0; i < result.length; i++) { 
			var r_id = result[i][0].value;
			var r_no = result[i][1].value;
			var r_ref = result[i][2].value;
			var r_lev = result[i][3].value;
			var r_seq = result[i][4].value;
			var r_delete = result[i][5].value;
			var r_content = result[i][6].value;
			
			if(r_delete=='0'){
				str += 	"<div class='comment_container'>"
					+		"<div class='comment'>"
					+			"<div class='comment-detail'>"
					+				"<div id='idLevel"+ r_no +"'></div>"
					+				"<div class='nick_name m_text'>" + r_id + "</div>"
					+				"<div id='getContent"+r_no+"'>" + r_content + "</div>"
					+			"</div>"
					+		"</div>"
					+		"<div class='small_heart' style='font-size: 10px'>"
				if(m_id==r_id){
					str +=		"<a id='update_btn"+r_no+"' style='cursor: pointer;' onclick='showUpdateRecomment("+ r_no +","+r_pno+")'>수정</a>&nbsp;"
						+		"<a id='delete_btn"+r_no+"' style='cursor: pointer;' onclick='deleteRecomment("+ r_no +","+r_pno+")'>삭제</a>&nbsp;"
					}
				str +=			"<a id='recomment_btn"+r_no+"' style='cursor: pointer;' onclick='showRecomment("+ r_no +","+r_pno+")'>답글</a>"
					+		"</div>"
					+	"</div>"
					+	"<div id='recomment_field"+r_no+"'></div>";
			}else{
				str += 	"<div class='comment_container'>"
					+		"<div class='comment'>"
					+			"<div class='comment-detail'>"
					+				"<div id='idLevel"+ r_no +"'></div>"
					+				"<div class='nick_name m_text'>" + r_id + "</div>"
					+				"<div id='getContent"+r_no+"'>삭제된 글 입니다.</div>"
					+			"</div>"
					+		"</div>"
					+	"</div>"
			}
		}// for
		
		table.innerHTML = str;
		for (var i = 0; i < result.length; i++){
			// 댓글 개수만큼 반복하며 대댓글의 들여쓰기
			replyLevel(result[i][1].value , result[i][3].value);
		}
	}
	
	/* 댓글 삭제 */
	function deleteRecomment(r_no,p_no){
		var btn1 = document.getElementById("update_btn"+r_no);
		var btn2 = document.getElementById("delete_btn"+r_no);
		var container = document.getElementById("getContent"+r_no);
		var text = "";
		var r_no = r_no;
		var r_pno = p_no;
		if(btn2.innerText == "삭제"){
			if(confirm("정말 삭제하시겠습니까??")==true){
				$.ajax({
					type : 'get',
					url : './deleteRecomment?r_no='+r_no+'&r_pno=' + p_no,
					dataType : 'json',
					success : function(data){
						$("#replycnt"+p_no).html(data);
						getReply(p_no, false);
					}
				});
			}else{
				alert('삭제 취소')
			}
		}else{
			var origin = document.getElementById("updateRecomment"+r_no);
			text = origin.dataset.name;
			container.innerHTML = "<div id='getContent"+r_no+"'>" + text + "</div>"
			btn1.innerHTML = "수정";
			btn2.innerHTML = "삭제";
		}
	}
	
	/* 댓글 수정 */
	function showUpdateRecomment(r_no,r_pno){
		var r_no = r_no;
		var r_pno = r_pno;
		var text = document.getElementById("getContent"+r_no).innerText;
		var container = document.getElementById("getContent"+r_no);
		var btn1 = document.getElementById("update_btn"+r_no);
		var btn2 = document.getElementById("delete_btn"+r_no);
		if(btn1.innerText == "수정"){
			container.innerHTML = "<input id='updateRecomment"+r_no+"' type='text' data-name='"+text+"' placeholder='"+text+"' style='width:400px;border: none;background: aliceblue;'>"
			btn1.innerHTML = "완료";
			btn2.innerHTML = "취소";
		}else{
			var r_content = document.getElementById("updateRecomment"+r_no).value;
			$.ajax({
				type : 'get',
				url : './updateRecomment?r_no='+r_no + '&r_content=' + r_content,
				dataType : 'json',
				success : function(data){
					getReply(r_pno, false);
					btn1.innerHTML = "수정";
					btn2.innerHTML = "삭제";
				}
			});
		}
	}
	
	/* 대댓글 들여쓰기 메소드 */
	function replyLevel(r_no, r_lev){
		console.log(r_lev);
		var id = document.getElementById("idLevel"+r_no);
		var str = "";
		if(r_lev > 0){
			for(var i=0; i < r_lev;i++){
				str += "&nbsp;&nbsp;";
			}
			str += "<img src='/signImages/reply.png'/>&nbsp;&nbsp;";
			id.innerHTML = str;
		}
	}
	/* 대댓글 쓰는 텍스트상자 열기,닫기 */
	function showRecomment(r_no,r_pno){
	
		var r_no = r_no;
		var r_pno = r_pno;
		var text = document.getElementById("recomment_field"+r_no);
		var btn = document.getElementById("recomment_btn"+r_no);
		if(btn.innerText == "답글"){
			var str = ""
				str	+=	"<div class='comment_field' id='comment_field"+r_no+"'>"
					+		"<img class='commentImg' src='/signImages/reply.png'>"
					+		"<input id='recommetText"+r_no+"' type='text' placeholder='답글달기...' style='width: 95%'>"
					+		"<div class='upload_btn m_text' data-name='comment' onclick='insertRecomment("+r_no+","+r_pno+")'>게시</div>"
	    			+	"</div>"
	    	text.innerHTML = str;
	    	btn.innerHTML = "취소";
	    	focus(r_no);
		}else{
			text.innerHTML = "";
			btn.innerHTML = "답글";
		}
	}
+
	/* 대댓글 텍스트상자가 열렸을때 포커스를 맞춰준다. */
	function focus(r_no){
		document.getElementById("recommetText"+r_no).focus();
	}
	/* 댓글입력 */
	function insertReply(p_no){
		var r_pno = p_no;
		var r_id = "${login.m_id}";
		var r_content = document.getElementById("r_content"+r_pno).value;
		//console.log(r_pno,m_id,r_content);
		$.ajax({
			type : 'get',
			url : './insertReply?r_pno='+r_pno+'&r_content=' + r_content +'&r_id=' + r_id,
			dataType : 'json',
			success : function(data){
				document.getElementById("r_content"+r_pno).value = "";
				$("#replycnt"+p_no).html(data);
				getReply(p_no, false);
			}
		});
	}
	/* 대댓글입력 */
	function insertRecomment(r_no, r_pno){
		var r_no = r_no;
		var r_pno = r_pno;
		var r_content = document.getElementById("recommetText"+r_no).value;
		var r_id = "${login.m_id}";
		
		$.ajax({
			type : 'get',
			url : './insertRecomment?r_no='+r_no+'&r_content=' + r_content +'&r_pno=' + r_pno +'&r_id=' + r_id,
			dataType : 'json',
			success : function(data){
				$("#replycnt"+r_pno).html(data);
				getReply(r_pno, false);
			}
		});
	}
	
	/* 댓글입력  게시글번호(p_no==r_pno), 회원아이디(m_id==r_id), 댓글번호(r_no), 댓글내용(r_content)
		r_no가 null일때는 댓글입력, 있을때는 대댓글입력 다른 ajax 호출
	*/
    
	function like(p_no){
		var like = document.getElementById("like"+p_no)
		var mode = ""
		if(like.classList.contains('on')){
			/* 좋아요 취소 */
			like.classList.remove('on');
			mode = "cancel"
		}else{
			/* 좋아요 */
			like.classList.add('on');
			mode = "like"
		}
		$.ajax({
			type : 'get',
			url : './like?p_no='+p_no+'&mode=' + mode,
			dataType : 'json',
			success : function(data){
				$("#likecnt"+p_no).html(data);
			}
		});
	}
	
	/* 무한스크롤 */
	$(window).scroll(function(){
		if($(window).scrollTop() >= $(document).height() - $(window).height()){
			var startNo = $(".contents").last().data("no") || 0;
			var word = $("#search-field").val();
			if(startNo == 1){
				alert('마지막 포스트 입니다.');
			}else if(word != ""){
				searchIdScroll(startNo);
			}else{
				$.ajax({
					type : 'get',
					url : './getpost?no='+startNo,
					dataType : 'json',
					success : function(data){
						if(data != ""){
							addPost(data, "scroll");
							
						}else{
							alert('마지막 포스트 입니다.');
						}
					},error : function(err){
						console.log(err);
						alert(err);
					}
					
				}); // ajax
			}	//	else
		}
	});
	
function addPost(data, mode){
		if(mode == "search"){
			var post = document.getElementById("mainPost");
			post.innerHTML = "<div class='add'></div>";
		}
		var str = "";
		for(var i = 0; i < data.length; i++){
			str	+=	"<article class='contents' id='post"+data[i].p_no+"' data-no='"+data[i].p_no+"'>"
				+	"<header class='top'>"
				+		"<div class='user_container'>"
				+			"<div class='profile_img'>"
                +				"<img src='/profile/"+data[i].p_id+".jpg' alt='프로필이미지'>&nbsp;&nbsp;&nbsp;"
                +			"</div>"
                +			"<div class='user_name'>"
                +				"<div class='nick_name m_text' style='line-height: normal; font-size: 18px'>"+data[i].p_id+"</div>"
                +			"</div>"            
                +		"</div>"
                +	"</header>"    
                +	"<div class='img_section'>"
                +		"<div class='trans_inner'>"
	            +            "<div>"
	            +            	"<img src='/photo/"+data[i].p_photo+"' alt='visual01' style='width: 615px; height:auto;'>"
	            +            "</div>"
	            +       "</div>"
	            +    "</div>"
	            +   "<div class='bottom_icons'>"
	            +       "<div class='left_icons'>"
	            +           "<div class='heart_btn'>"
	            +               "<div class='sprite_heart_icon_outline' id='like"+data[i].p_no+"' data-name='heartbeat' onclick='like("+data[i].p_no+")'></div>"
	            +           "</div>"
	            +           "<div class='likes m_text'>좋아요&nbsp;"
		        +               "<span id='likecnt"+data[i].p_no+"'>"+data[i].p_like+"</span>"
		        +               "<span id='bookmark-count-39'></span>&nbsp;개"
		        +           "</div>"
	            +       "</div>"
	            +   "</div>"
				+	"<div class='comment_container'>"		
	            +   	"<div class='comment' id='comment-list-ajax-post37'>"
	            +   		"<div class='comment-detail'>"        
	            +           	"<div class='nick_name m_text'>"+data[i].p_id+"</div>"
	            +           "</div>"
	            +       "</div>"
	            +   "</div>"
	            +   "<div class='comment' style='margin: 20px; margin-top:10px;word-break: break-all;'>"
	            +    	data[i].p_content
	            +   "</div>" 
				+	"<div class='comment_container'>"
				+		"<div class='comment'>"
				+			"<div class='comment-detail getReply_btn' onclick='getReply("+data[i].p_no+",true)' style='cursor: pointer;'>"
				+				"<div>댓글보기</div>&nbsp;"
				+				"<div id='replycnt"+data[i].p_no+"'>"+data[i].p_replycnt+"</div>개"
				+			"</div>"
				+		"</div>"
				+	"</div>"
				+	"<div id='reply"+data[i].p_no+"'></div>"
		        +    	"<div class='comment_field' id='comment_field"+data[i].p_no+"'>"
		        +            "<input type='text' placeholder='댓글달기...' id='r_content"+data[i].p_no+"'>"
		        +            "<div class='upload_btn m_text' data-name='comment' onclick='insertReply("+data[i].p_no+")'>게시</div>"
		        +       "</div>" 
				+	"</article>";            			
		}//for
		str += "<div class='add'></div>"
		$(".add").last().after(str);
		str = "";
		
	}
	
//id검색기능 ajax
function searchBtn(){
	var word = document.getElementById("search-field").value;
	$.ajax({
		type : 'get',
		url : './searchId?word='+word,
		dataType : 'json',
		success : function(data){
			
			if(data != ""){
				addPost(data, "search")
			}else{
				addPost(data, "search")
			}
			
		}
	});
	
}
// id 검색을 하고 스크롤을 내렸을때 실행해주는 ajax
function searchIdScroll(startNo){
	var word = document.getElementById("search-field").value;
	var startNo = startNo
	$.ajax({
		type : 'get',
		url : './searchIdScroll?word='+word+'&startNo=' + startNo,
		dataType : 'json',
		success : function(data){
			
			if(data != ""){
				addPost(data, "scroll")
			}else{
				addPost(data, "scroll")
			}
			
		}
	});
	
}
	
    </script>


</head>
<body>


<section id="container">
	
	<!-- 헤더 -->
    <!-- 헤더 -->
    <!-- 헤더 -->
    <!-- 헤더 -->

    <header id="header">
        <section class="inner">
            <h1 class="logo">
                <a href="/post/postview">
                    <div class="sprite_insta_icon"></div>
                    <div class="sprite_write_logo"></div>
                </a>
            </h1>
            <div class="search_box">
                <input type="text" placeholder="검색" id="search-field" onkeyup="searchBtn()">

                <div class="fake_field">
                    <span class="sprite_small_search_icon"></span>
                    <span>검색</span>
                </div>
            </div>
            <div class="right_icons">
                <a href="posting"><div class="sprite_camera_icon"></div></a>
                <a href="/member/mypage"><div class="sprite_user_icon_outline"></div></a>
            </div>
        </section>
    </header>
    
    <!-- 헤더 -->
    <!-- 헤더 -->
    <!-- 헤더 -->
    <!-- 헤더 -->
    
  
  

    <section id="main_container">
        <div class="inner">
            <div class="contents_box">
            	
				<div id="mainPost">  
				<c:forEach var="vo" items="${postList}">
	                <article class="contents" id="post${vo.p_no}" data-no="${vo.p_no}">			<!-- 게시물 번호로 id 지정 -->
	                    <header class="top">
	                        <div class="user_container">
	                        	<!-- 게시물 헤더 프로필사진 -->
	                            <div class="profile_img">		
	                                <img src="/profile/${vo.p_id}.jpg" alt="프로필이미지">&nbsp;&nbsp;&nbsp;
	                            </div>
	                            <!-- 유저 아이디 -->
	                            <div class="user_name">			
	                                <div class="nick_name m_text" style="line-height: normal; font-size: 18px">${vo.p_id}</div>
	                            </div>
	                        </div>
	                    </header>
						
						<!-- 사진게시물 -->
	                    <div class="img_section">
	                        <div class="trans_inner">
	                            <div>
	                            	<img src="/photo/${vo.p_photo}" alt="visual01" style="width: 615px; height:auto;">
	                            </div>
	                        </div>
	                    </div>
	
	                    <div class="bottom_icons">
	                        <div class="left_icons">
	                            <div class="heart_btn">
	                                <div class="sprite_heart_icon_outline" id="like${vo.p_no}" data-name="heartbeat" onclick="like(${vo.p_no})"></div>
	                            </div>
	                            <div class="likes m_text">
	                        		좋아요
			                        <span id="likecnt${vo.p_no}">${vo.p_like}</span>
			                        <span id="bookmark-count-39"></span>
			                        		개
			                    </div>
	                        </div>
	                    </div>
	
						<!-- 글쓴이 내용 -->
	                    <div class="comment_container">		
	                        <div class="comment" id="comment-list-ajax-post37">
	                            <div class="comment-detail">
	                                <div class="nick_name m_text">${vo.p_id}</div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="comment" style="margin: 20px; margin-top:10px;word-break: break-all;">
	                    	${vo.p_content}
	                    </div>
	                    <!-- 댓글 -->
						<div class="comment_container">
							<div class="comment">
								<div class="comment-detail getReply_btn" onclick="getReply(${vo.p_no},true)" style="cursor: pointer;">
									<div>댓글보기</div>&nbsp;
									<div id="replycnt${vo.p_no}">${vo.p_replycnt}</div>개
								</div>
							</div>
						</div>
						
						<div id="reply${vo.p_no}"></div>
	                   
	                    <div class="comment_field" id="comment_field${vo.p_no}">
	                        <input type="text" placeholder="댓글달기..." id="r_content${vo.p_no}">
	                        <div class="upload_btn m_text" data-name="comment" onclick="insertReply(${vo.p_no})">게시</div>
	                    </div>
	                    
	                </article>
	                
                </c:forEach>
               
                
                <div class="add"></div>
                </div>
            </div>
            <input type="hidden" id="page" value="1">
        </div>
    </section>
</section>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>