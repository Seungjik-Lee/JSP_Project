<%@page import="java.util.List"%>
<%@page import="JspTeam.GraphDB"%>
<%@page import="java.util.ArrayList"%>
<%@page import="JspTeam.GraphDBM"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	GraphDBM bdbm = new GraphDBM();
	String ret = bdbm.selectAddr();
	ArrayList<GraphDB> list = bdbm.selectAddr2();
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
<style type="text/css">/*세로 막대 그래프 색깔 지정*/
.blue {
	background: #5abae6;
}

.red {
	background: #d34e4e;
}

.green {
	background: #9dbb19;
}

.yellow {
	background: #f7b358;
}

span { /*span으로 absolute 지정 외*/
	position: absolute;
	display: inline-block;
	width: 60px;
	bottom: 0;
	font-size: 15px;
	line-height: 1.8em;
	color: #FFF;
	text-align: center;
	border-radius: 15px;
}

.grdiv {
	position: relative;
	height: 450px;
}
</style>
<title>지역별 지정 병원 현황</title>
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
							<a class="dropdown-item" href="broad_1st.jsp">1st Designated Hospital</a>
							<a class="dropdown-item" href="broad_2nd.jsp">2nd Designated Hospital</a>
							<a class="dropdown-item" href="broad_3rd.jsp">3rd Designated Hospital</a>
							<a class="dropdown-item" href="broad_4th.jsp">4th Designated Hospital</a>
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
	<%
		int count = 0;
		int sum = 0;
		String color[] = { "blue", "red", "green", "yellow" };//데이터 별 색깔을 다르게 지정하기 위한 소스
		ArrayList<String> color1 = new ArrayList<String>();
		for (int i = 0; i < list.size(); i++) {
			color1.add(i, color[count]);//리스트에 color 추가
			count++;

			if (count > 3) {//데이터는 많지만 4가지 색깔을 돌아가면서 넣게 하기 위한 처리
				count = 0;
			}
			//System.out.println(count);
			//System.out.println(color1);
		}
	%>
	<div class="jumbotron">
		<p>전국 시,도 지역별 지정 병원 현황</p>
		<div class="grdiv container text-center">
			<%
				for (int i = 0; i < 10; i++) {//전국 시,도 지역별 지정 병원 수 상위 10개 데이터 출력
					GraphDB ct = list.get(i);
			%>
			<span class="<%out.println(color1.get(i));%>"><%=ct.getCityName()%><br />
				<%=ct.getCityNum()%> </span>
			<%
				}
			%>
			<p><전국 시,도 지역별 지정 병원 수 상위 10개 그래프></p>
		</div>
		<p></p>
		<div class="container">
			<table class="table table-hover table-dark table-striped"> <!-- 표 출력을 위한 소스-->
				<thead>
					<tr>
						<th>지역이름</th>
						<th>지정병원 수</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><%=list.get(i).getCityName()%></td>
						<td><%=list.get(i).getCityNum()%></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<p>총 지정병원 수 : 420개</p>
		</div>
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
	doGraAddr(<%=ret%>)//함수 호출
</script>