<%@page import="JspTeam.BroadDBM"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 	BroadDBM bdbm = new BroadDBM();
	String ret = bdbm.selectGrp();
	String retName = bdbm.selectGrpName();
%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/styles.css" rel="stylesheet" />
<link href="../css/csvar.css" rel="stylesheet" />
<!-- Font Awesome icons-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
<!-- Bootstrap core JS-->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="../js/scripts.js"></script>
<script src="https://d3js.org/d3.v6.min.js"></script>

<title>진료 파트별 지정 병원 현황</title>
</head>
<body>
<div class="jumbotron">
<p>진료 파트별 지정 병원 현황</p>
</div>
	<div class="container one-graph"></div>
	<div class="container">
    <p>지정 분야의 병원 수 별 상위 10개 지정 병원 현황</p>
   	<p>지정분야? <%=retName %><br />
   	총 지정병원 수 : 420개<br />
   	기타 지정병원 수 : 74개
   	</p>
   	</div>
</body>
</html>

<script type="text/javascript">
	doGraGrp(<%=ret%>)
</script>