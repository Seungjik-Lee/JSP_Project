<%@ page import="java.io.File" %>
<%@ page import="JspTeam.File_DTO" %>
<%@ page import="JspTeam.File_DAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	ArrayList<File_DTO> filelist = new File_DAO().getList();
	
	for(File_DTO file : filelist) {
		out.write("<a href=\"" + request.getContextPath() + "/downloadAction?file=" + java.net.URLEncoder.encode(file.getFileRealName(), "UTF-8") + "\">" + 
		file.getFileName() + "(다운로드 횟수: " + file.getDownloadCount() + ")</a><br>");
	}
%>
</body>
</html>