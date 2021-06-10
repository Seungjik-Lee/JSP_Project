<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="JspTeam.CustomerDBM"%>

<jsp:useBean id="user" class="JspTeam.CustomerDB" scope="page" />
<jsp:setProperty name="user" property="id" />
<jsp:setProperty name="user" property="pw" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("id") != null) {
			userID = (String) session.getAttribute("id");
		}
		if (userID != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호 확인 완료')");
			script.println("location.href='withdrawl_complete.jsp'");
			script.println("</script>");
		}
		CustomerDBM cdb = new CustomerDBM();
		
		int result = cdb.login(user.getId(), user.getPw());
		if (result == 1) {
			session.setAttribute("id", user.getId());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('탈퇴 성공')");
			script.println("history.back()");
			script.println("</script>");
		} else if (result == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('탈퇴 실패(비밀번호가 틀립니다)')");
			script.println("history.back()");
			script.println("</script>");
		} else if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('탈퇴 실패(존재하지 않는 아이디입니다)')");
			script.println("history.back()");
			script.println("</script>");
		} else if (result == -2) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류입니다')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>