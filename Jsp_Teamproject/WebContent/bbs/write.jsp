<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link href="../css/styles.css" rel="stylesheet" />
<!-- Bootstrap core JS-->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="../js/scripts.js"></script>

<title>Insert title here</title>

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
					<li class="nav-item"><a class="nav-link" href="bbs.jsp">Board</a></li>
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
					<a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><%=userID%>님</a>
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

	<div class="container">
		<div class="col-lg-12 mt-4" style="border-radius: 30px;">
			<form method="post" action="writeAction.jsp">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center">게시판 글쓰기 양식</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
							<input type="text" class="form-control"
								placeholder="글 제목" name="bbsTitle" maxlength="50">
							</td>
						</tr>
						<tr>
							<td>
							<form action="file_uploadAction.jsp" method="post" enctype="multipart/form-data">
								파일 : <input type="file" name="file">
							</form>
							</td>
						</tr>
						<tr>
							<td>
							<textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px;"></textarea>
							</td>
						</tr>
					</tbody>
				</table>
				<!-- 글쓰기 버튼 -->
				<input type="submit" class="btn btn-primary pull-right mb-3" value="글쓰기">
			</form>
		</div>
	</div>

	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your Website 2021</p>
		</div>
	</footer>
</body>
</html>