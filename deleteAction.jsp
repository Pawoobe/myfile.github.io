<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
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
		} else {
					BbsDAO bbsDAO = new BbsDAO();
					int result = bbsDAO.delete(bbsID);
					if (result == -1) {
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('글삭제에 실패했습니다')");
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
		%>
</body>
</html>
