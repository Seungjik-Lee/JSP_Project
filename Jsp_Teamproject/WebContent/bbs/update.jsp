<%@ page import="java.io.PrintWriter" %>
<%@ page import="JspTeam.BBS_DAO" %>
<%@ page import="JspTeam.BBS_DB" %>
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
	// 세션에 값이 담겨있는지 체크
			String userID = null;
			if(session.getAttribute("id") != null){
				userID = (String)session.getAttribute("id");
			}
			if(userID == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('로그인을 하세요')");
				script.println("location.href='../member/login.jsp'");
				script.println("</script>");
			}
			int bbsID = 0;
			if(request.getParameter("bbsID") != null){
				bbsID = Integer.parseInt(request.getParameter("bbsID"));
			}
			if(bbsID == 0){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('유효하지 않은 글입니다')");
				script.println("location.href='bbs.jsp'");
				script.println("</script>");
			}
			//해당 'bbsID'에 대한 게시글을 가져온 다음 세션을 통하여 작성자 본인이 맞는지 체크한다
			BBS_DB bbs = new BBS_DAO().getBbs(bbsID);
			if(!userID.equals(bbs.getUserID())){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('권한이 없습니다')");
				script.println("location.href='bbs.jsp'");
				script.println("</script>");
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
				</ul>
			</div>
		</div>
	</nav>
	
	<!-- 게시판 글 수정 양식 영역 시작 -->
	<div class="container mt-4">
		<form method="post" action="updateAction.jsp?bbsID=<%=bbsID%>">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글 수정 양식</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
						<input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50" value="<%=bbs.getBbsTitle()%>"></td>
					</tr>
					<tr>
						<td>
						<textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px;"><%=bbs.getBbsContent()%></textarea>
						</td>
					</tr>
				</tbody>
			</table>
			<!-- 글쓰기 버튼 생성 -->
			<input type="submit" class="btn btn-primary pull-right mb-3" value="수정하기 ">
		</form>
	</div>

	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your Website 2021</p>
		</div>
	</footer>
</body>
</html>