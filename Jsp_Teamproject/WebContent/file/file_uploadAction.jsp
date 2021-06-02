<%@ page import="JspTeam.File_DAO" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.util.Enumeration" %>
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
		String directory = application.getRealPath("/upload/");
		int maxSize = 1024 * 1024 * 100;
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String FileName = multipartRequest.getOriginalFileName("file");
		String FileRealName = multipartRequest.getFilesystemName("file");

		if(!FileName.endsWith(".doc") && !FileName.endsWith(".hwp") && !FileName.endsWith(".pdf") && !FileName.endsWith(".xls")) {
			File file = new File(directory + FileRealName);
			file.delete();
			out.write("업로드할 수 없는 확장자입니다.");
		} else {
			new File_DAO().upload(FileName, FileRealName);
			out.write("파일명 : " + FileName + "<br>");
			out.write("실제 파일명 : " + FileRealName + "<br>");
		}
	%>
</body>
</html>