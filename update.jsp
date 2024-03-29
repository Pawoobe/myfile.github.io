<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
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
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요합니다')");
			script.println("location.href ='login.jsp'"); // 로그인페이지로 다시 돌려버림
			script.println("</script>");
		}
		int bbsID = 0;
		if (request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if (bbsID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글')");
			script.println("location.href ='bbs.jsp'"); // 로그인페이지로 다시 돌려버림
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		if(!userID.equals(bbs.getUserID())) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다')");
		script.println("location.href ='bbs.jsp'");
		script.println("</script>");
		}
		
	%>
	<nav class="navbar navbar-default">	<!-- 하나의 웹사이트에 전반적인 구성을 보여주는 역할 -->
		<div class="navbar-header">	<!-- header라는것은 홈페이지의 로고를 뜻함 -->
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">Pawoobe</a> <!-- 로고 -->
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li class="active"><a href="bbs.jsp">게시판</a></li>
			</ul>
			<%

			%>		
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#"	 class="dropdown-toggle" 
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="fasle">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>	
					</ul>
				</li>
			</ul>		
		</div>		
	 </nav>	
	 <div class="contaniner">
	 	<div class="row">
	 	<form method="post" action="updateAction.jsp?bbsID=<%= bbsID %>">
	 	<table class="table table-striped" style="text-align; center; border: 1px solid #dddddd">			<!--목록들이 홀수와 짝수들이 번갈아가며 색상이 변경되어가며 나타내는 요소 -->
	 		<thead>
	 			<tr>
	 				<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글 수정 양식</th>
	 			</tr>
	 		</thead>
	 		<tbody>
	 			<tr>
	 				<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50" value="<%= bbs.getBbsTitle() %>"></td>
	 			</tr>
	 			<tr>	
	 				<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px"><%= bbs.getBbsContent() %></textarea></td> <!-- textarea 장문의 글을 작성할때 필요 -->
	 			</tr>
	 		</tbody>
	 		</table>
	 		<input type="submit" class="btn btn-primary pull-right" value="글수정">
	 	</form>
	 	</div>
	 </div>		
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script> <!-- bootstrap 에서 기본적으로 제공하는것을 가져옴 -->
</body>
</html>