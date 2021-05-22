<%@ page import="java.io.PrintWriter" %>
<%@ page import="JspTeam.BBS_DAO" %>
<%@ page import="JspTeam.BBS_DB" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="bbs" class="JspTeam.BBS_DB" scope="page" />
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	//현재 세션 상태를 체크
	String userID = null;
	if(session.getAttribute("id") != null) {
		userID = (String)session.getAttribute("id");
	}
	//로그인 한 사람만 글을 쓸 수 있음
	if(userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요합니다.')");
		script.println("location.href='../member/login.jsp'");
		script.println("</script>");
	} else {
		//입력이 안 된 부분 체크
		if (bbs.getBbsTitle() == null || bbs.getBbsContent() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			//정상적으로 입력이 되었을때 글쓰기 수행
			BBS_DAO bbsDao = new BBS_DAO();
			int result = bbsDao.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());

			//데이터베이스 오류인 경우
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
				// 글쓰기가 정상적으로 실행되면 알림창을 띄우고 게시판 메인으로 이동
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기 성공')");
				script.println("location.href='../bbs/bbs.jsp'");
				script.println("</script>");
			}
		}
	}
	%>
</body>
</html>