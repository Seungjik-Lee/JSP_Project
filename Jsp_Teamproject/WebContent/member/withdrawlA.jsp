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
		/* if (userID != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회원탈퇴 완료')");
			script.println("location.href='../index.jsp'");
			script.println("</script>");
		} */
		CustomerDBM cdb = new CustomerDBM();
		
		int result = cdb.withdrawl(userID, user.getPw());

		if (result == 1) {
			session.setAttribute("id", user.getId());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회원탈퇴 성공..ㅠㅠ')");
			script.println("location.href='logout.jsp'");
			script.println("</script>");
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류입니다')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>