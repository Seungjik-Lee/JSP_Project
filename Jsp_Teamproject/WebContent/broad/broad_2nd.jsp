<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="JspTeam.BroadDB"%>
<%@ page import="JspTeam.BroadDBM" %>
<%@ page import="java.util.List" %>

<%
	BroadDBM bbdm = new BroadDBM();
	List<BroadDB> list = bbdm.select();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/styles.css" />

</head>
<body>
	<div class="jumbotron">
		<h1>2nd Designated Hospital</h1>
		<p>병원리스트</p>
		<table class="table table-dark table-hover text-center">
			<thead>
				<tr>
					<th>기수</th><th>분류</th><th>이름</th>
					<th>주소</th>
				</tr>
			</thead>
			<tbody>
				<% for (BroadDB bdb : list) { 
					if(bdb.getUnit().equals(" 2기")){
				%>
				<tr>
					<td><%=bdb.getUnit()%></td>
					<td><%=bdb.getGrp()%></td>
					<td><%=bdb.getName()%></td>
					<td><%=bdb.getAddr()%></td>
				</tr>
				<% }
				} %>
			</tbody>
		</table>
	</div>
</body>
</html>