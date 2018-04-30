<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css"> <!-- 같은 폴더내의 bootsrap.css 파일을 참조함 -->
<link rel="stylesheet" href="css/custom.css">
<title>Login Page</title>
<style type="text/css">
	a, a:hover {
		color:#000000;
		text-decoration: none;
	}			
</style>		<!-- 게시물 제목을 눌렀을때 검은색으로 전부 맞추고 밑줄이 나오지않게 막아줌 -->
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber= 1; // 1은 기본페이지를 의미함
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
				if(userID == null) { //로그인 되어있지않다면
			%>	
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#"	 class="dropdown-toggle" 
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="fasle">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>	
						<li><a href="join.jsp">회원가입</a></li>	
					</ul>
				</li>
			</ul>	
			<% 
				}else {
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
			<% 
				}
			%>			
		</div>		
	 </nav>	
	 <div class="contaniner">
	 	<div class="row">
	 		<table class="table table-striped" style="text-align; center; border: 1px solid #dddddd">			<!--목록들이 홀수와 짝수들이 번갈아가며 색상이 변경되어가며 나타내는 요소 -->
	 		<thead>		<!-- 제목 윗부분 -->
	 			<tr>	<!-- 한줄 -->
	 				<th style="background-color: #eeeeee; text-align; center;">번호</th>
	 				<th style="background-color: #eeeeee; text-align; center;">제목</th>
	 				<th style="background-color: #eeeeee; text-align; center;">작성자</th>
	 				<th style="background-color: #eeeeee; text-align; center;">작성일</th>
	 			</tr>
	 		</thead>
	 		<tbody>
	 		<%
	 			BbsDAO bbsDAO = new BbsDAO();
	 			ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
	 			for (int i = 0; i < list.size(); i++) {
	 		%>
	 			<tr>
	 				<td><%= list.get(i).getBbsID() %></td>
	 				<td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle().replaceAll(" ","&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></a></td>
	 				<td><%= list.get(i).getUserID() %></td>
	 				<td><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시" + list.get(i).getBbsDate().substring(14, 16) + "분" %></td>
	 			</tr> <!-- XXS공격기법 방어를 위해 특수문자가 투입이 되었을시, 치환을 이용하여 글 제목, 또는 내용에도 특수문자가 기입되었을경우 그대로 출력하도록 함 -->
	 		<% 		
	 			}
	 		%>
	 		</tbody>
	 	</table>
	 	<%
	 		if(pageNumber != 1) {
	 	%>
	 		<a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-sucess btn-arraw-left">이전</a>
	 	<%		
	 		} if (bbsDAO.nextPage(pageNumber + 1)) {
	 	%>
	 		<a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-sucess btn-arraw-left">다음</a>
	 	<% 
	 		}
	 	%>
	 		<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
	 	</div>
	 </div>		
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script> <!-- bootstrap 에서 기본적으로 제공하는것을 가져옴 -->
</body>
</html>