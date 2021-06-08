<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="JspTeam.BroadDB"%>
<%@ page import="JspTeam.BroadDBM" %>
<%@ page import="java.util.List" %>

<%
	BroadDBM bdbm = new BroadDBM();
	String addr = request.getParameter("addr");
	List<BroadDB> list = null;
	
	if(addr == null) {
		list = bdbm.select();
		addr="";
	} else {
		list = bdbm.select2(addr);
	}
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

<script type="text/javascript">
      window.onload = function () {
         document.getElementById('search').onclick = function () {
            var addr = document.getElementById('addr');
            location.href = 'broad_2nd.jsp?addr=' + hosp_addr.value;
         }
      }
</script>

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
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Sign</a>
						<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
							<a class="dropdown-item" href="../member/signin.jsp">Join</a>
							<a class="dropdown-item" href="../member/login.jsp">Login</a>
						</div>
					</li>
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
	<div class="jumbotron">
		<div class="container">
			<h1>2nd Designated Hospital</h1>
			<p>병원리스트</p>
			<div class="form-inline mb-4">
				<input type="text" class="form-control col-md-10 mb-2 my-4 mr-4" placeholder="주소를 입력하세요" id="hosp_addr" value="<%=addr%>" />
				<input type="button" value="검색" id="search" class="btn btn-primary" />
			</div>
			<table class="table table-dark table-hover text-center">
				<thead>
					<tr>
						<th>기수</th>
						<th>분류</th>
						<th>이름</th>
						<th>주소</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (BroadDB bdb : list) {
							if (bdb.getUnit().equals("2기")) {
					%>
					<tr>
						<td><%=bdb.getUnit()%></td>
						<td><%=bdb.getGrp()%></td>
						<td><%=bdb.getName()%></td>
						<td><%=bdb.getAddr()%></td>
					</tr>
					<% 
							}
						} 
					%>
				</tbody>
			</table>
		</div>
	</div>
	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your Website 2021</p>
		</div>
	</footer>
</body>
</html>