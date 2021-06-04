<%@page import="JspTeam.GraphDB"%>
<%@page import="java.util.ArrayList"%>
<%@page import="JspTeam.GraphDBM"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	GraphDBM bdbm = new GraphDBM();
	String ret = bdbm.selectGrp();
	String retName = bdbm.selectGrpName();
	ArrayList<GraphDB> list = bdbm.selectGrp2();
%>

<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/styles.css" rel="stylesheet" />
<link href="../css/csvar.css" rel="stylesheet" />
<!-- Font Awesome icons-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"
	crossorigin="anonymous"></script>
<!-- Bootstrap core JS-->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="../js/scripts.js"></script>
<script src="https://d3js.org/d3.v6.min.js"></script>

<title>진료 파트별 지정 병원 현황</title>
</head>
<body>
	<%
		// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
		String userID = null;
		if (session.getAttribute("id") != null) {
			userID = (String) session.getAttribute("id");
		}
	%>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="../index.jsp">JSP TeamProject</a>
			<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<%
						// 로그인 하지 않았을 때 보여지는 화면
						if (userID == null) {
					%>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Sign</a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownBlog">
							<a class="dropdown-item" href="../member/signin.jsp">Join</a> <a
								class="dropdown-item" href="../member/login.jsp">Login</a>
						</div></li>
					<%
						// 로그인이 되어 있는 상태에서 보여주는 화면
						} else {
					%>
					<li class="nav-item"><a class="nav-link" href="../about.jsp">About</a></li>
					<li class="nav-item"><a class="nav-link" href="../bbs/bbs.jsp">board</a></li>
					<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="navbarDropdownPortfolio" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Designated Hospital</a>
						<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
							<a class="dropdown-item" href="../broad/broad_1st.jsp">1st Designated Hospital</a>
							<a class="dropdown-item" href="../broad/broad_2nd.jsp">2nd Designated Hospital</a>
							<a class="dropdown-item" href="../broad/broad_3rd.jsp">3rd Designated Hospital</a>
							<a class="dropdown-item" href="../broad/broad_4th.jsp">4th Designated Hospital</a>
						</div>
					</li>
					<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">반갑습니다. <%=userID%>님</a>
						<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
							<a class="dropdown-item" href="../member/logout.jsp">logout</a>
							<a class="dropdown-item" href="#">Withdrawal</a>
						</div>
					</li>
					<%
						}
					%>
				</ul>
			</div>
		</div>
	</nav>
	<%
		// 로그인 하지 않았을 때 보여지는 화면
		if (userID == null) {
	%>
	<script>
		alert('로그인해야합니다.');
		location.href = '../index.jsp';
	</script>
	<%
		}
	%>
	<div class="jumbotron">
		<p>진료 파트별 지정 병원 현황</p>
		<div class="container text-center">
			<p>
				<진료 파트별 병원 수의 상위 10개 지정 병원 현황>
			</p>
		</div>
		<div class="container one-graph text-center"></div>

		<table class="table table-hover">
			<thead>
				<tr>
					<th>진료파트</th>
					<th>지정병원 수</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (int i = 0; i < list.size(); i++) {
				%>
				<tr>
					<td><%=list.get(i).getGrpName()%></td>
					<td><%=list.get(i).getGrpNum()%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<p>
			총 지정병원 수 : 420개
		</p>
	</div>
	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2021</p>
		</div>
	</footer>

</body>
</html>

<script type="text/javascript">
	doGraGrp(
<%=ret%>
	)
</script>