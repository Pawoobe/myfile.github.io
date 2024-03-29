<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css"> <!-- 같은 폴더내의 bootsrap.css 파일을 참조함 -->
<link rel="stylesheet" href="css/custom.css">
<title>Login Page</title>
</head>
<body>
	<nav class="navbar navbar-default">	<!-- 하나의 웹사이트에 전반적인 구성을 보여주는 역할 -->
		<div class="navbar-header">	<!-- header라는것은 홈페이지의 로고를 뜻함 -->
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">게시판 웹 사이트</a> <!-- 로고 -->
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">	<!--하나의 어떠한 리스트같은것을 보여줌 -->
				<li><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">		<!-- 현재 가르키고 있는 링크가 없음 -->
					<a href="#"	 class="dropdown-toggle" 
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="fasle">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="active"><a href="login.jsp">로그인</a></li>	
						<li><a href="join.jsp">회원가입</a></li>	
					</ul>
				</li>
			</ul>				
		</div>		
	 </nav>			
	 <div class="container">
	 	<div class="col-lg-4"></div>
	 	<div class="col-lg-4">
	 		<div class="jumbotron" style="padding-top:20px">
	 			<form method="post" action="loginAction.jsp">
	 				<h3 style="text-align: center;">로그인 화면</h3>
	 				<div class="form-group">
	 					<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
	 				</div>
	 				<div class="form-group">
	 					<input type="password" class="form-control" placeholder="패스워드" name="userPassword" maxlength="20">
	 				</div>
	 				<input type="submit" class="btn btn-primary form-control" value="로그인">
	 			</form>
	 		</div>
	 	</div>
	 	<div class="col-lg-4"></div>
	 </div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script> <!-- bootstrap 에서 기본적으로 제공하는것을 가져옴 -->
</body>
</html>