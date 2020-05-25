<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

	body { padding-top: 70px; 
				width: 900px;		
				margin: 0 auto;
	}

	 #profilePhoto{
	 	width: 90px;
	 	height: 90px;
	 }
	


</style>

<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">




</script>


</head>






<body>


<div class="container" align="center">
	<table class="table table-borderless" align="center" cellpadding="5px" data-no="${vo.p_no}">
	<thead>
		<tr>
			<img align="center" id="profilePhoto" src="/photo/avatar(2).png" class="img-circle" alt="tempProfile" > 
			<td align="center" width="100">${login.m_id}</td> 
			<td align="center"></td>		
		</tr>
		<tr>
			<td align="center" width="100">게시물</td> 
			<td align="center" width="100">${vo.m_profile}</td> 
			<td align="center" width="100"></td> 
			<td align="center" width="100"></td> 
		</tr>
		<tr>
			<td align="center" width="100">팔로잉</td> 
			<td align="center" width="100">${vo.m_following}</td> 
			<td align="center" width="100">팔로워</td> 
			<td align="center" width="100">${vo.m_follower}</td> 
		</tr>		
	</thead>
	</table>

	<table>
	<thead>



	</thead>
	</table>





</div>
</body>
</html>