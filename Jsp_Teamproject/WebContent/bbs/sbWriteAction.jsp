<%@ page import="java.io.PrintWriter" %>
<%@ page import="JspTeam.SB_DAO" %>
<%@ page import="JspTeam.SB_DB" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="sb" class="JspTeam.SB_DB" scope="page" />
<jsp:setProperty name="sb" property="userID" />
<jsp:setProperty name="sb" property="sbContent" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	// bbsID를 초기화 시키고 'bbsID'라는 데이터가 넘어온 것이 존재한다면 캐스팅을 하여 변수에 담는다.
	int bbsID=0;
	if(request.getParameter("bbsID") != null) {
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
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
		if (sb.getSbContent() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			//정상적으로 입력이 되었을때 글쓰기 수행
			SB_DAO sbDao = new SB_DAO();
			int result = sbDao.write(bbsID, userID, sb.getSbContent());

			//데이터베이스 오류인 경우
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('데이터베이스 오류.')");
				script.println("history.back()");
				script.println("</script>");
				// 글쓰기가 정상적으로 실행되면 알림창을 띄우고 게시판 메인으로 이동
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('댓글쓰기 성공')");
				script.println("location.href='../bbs/view.jsp?bbsID="+bbsID+"'");
				script.println("</script>");
			}
		}
	}
	%>
</body>
</html>