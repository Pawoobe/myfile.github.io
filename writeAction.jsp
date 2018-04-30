<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id = "bbs" class="bbs.Bbs" scope="page" />
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />
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
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요합니다.')");
			script.println("location.href ='login.jsp'"); // 로그인페이지로 다시 돌려버림
			script.println("</script>");
		} else {
			if (bbs.getBbsTitle() == null || bbs.getBbsContent() == null) {
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('값이 입력되지 않았습니다')");
						script.println("history.back()");
				} 
				else {
						BbsDAO bbsDAO = new BbsDAO();
						int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());	//각각의 데이터베이스 (이름, 아이디, 패스워드 등)을 받아서 만들어진 하나의 user라는 인스턴스가 join 함수를 이용하려 매개변수로 들어감
						if (result == -1) {
							PrintWriter script = response.getWriter();
							script.println("<script>");
							script.println("alert('글쓰기에 실패했습니다')");
							script.println("history.back()"); // 이전페이지로 사용자를 돌려보냄				
							script.println("</script>");
				} 
				else {
							PrintWriter script = response.getWriter();
							script.println("<script>");
							script.println("location.href = 'bbs.jsp'");			
							script.println("</script>");
				}
			}
	}	
		%>
</body>
</html>
