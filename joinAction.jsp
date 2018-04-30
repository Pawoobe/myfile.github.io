<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id = "user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="userEmail" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
		<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
				userID = (String) session.getAttribute("userID");
		}
		if (userID != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어 있습니다.')");
			script.println("location.href ='main.jsp'"); // 로그인페이지로 다시 돌려버림
			script.println("</script>");
		}
		if (user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null || 
			user.getUserGender() == null ||  user.getUserEmail() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('값이 입력되지 않았습니다')");
				script.println("history.back()");				
				
		} else {
				UserDAO userDAO = new UserDAO();
				int result = userDAO.join(user);	//각각의 데이터베이스 (이름, 아이디, 패스워드 등)을 받아서 만들어진 하나의 user라는 인스턴스가 join 함수를 이용하려 매개변수로 들어감
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('이미 등록된 정보입니다')");
					script.println("history.back()"); // 이전페이지로 사용자를 돌려보냄				
					script.println("</script>");
		} else {
					//result 가 -1이 아닌경우는 전부다 회원가입이 이루어진경우이기때문에 전부다 해당됨
					session.setAttribute("userID", user.getUserID());
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'main.jsp'");			
					script.println("</script>");
				}
			
			}	
		%>
</body>
</html>
