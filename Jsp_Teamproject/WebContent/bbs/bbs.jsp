<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="JspTeam.BBS_DAO" %>
<%@ page import="JspTeam.BBS_DB" %>
<%@ page import="java.util.ArrayList" %>
 <jsp:useBean id="dao" class="JspTeam.BBS_DAO" />
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link href="../css/styles.css" rel="stylesheet" />
<!-- Font Awesome icons-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
<!-- Bootstrap core JS-->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="../js/scripts.js"></script>

<script>

function searchCheck(){
    //검색
    var frm = document.getElementById('frm');
    if(frm.keyWord.value ==""){
        alert("검색 단어를 입력하세요.");
        frm.keyWord.focus();
        return;
    }
    frm.submit();      
}

</script>

<title>Insert title here</title>

</head>
<body>
	<%

		// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
		String userID = null;
		if (session.getAttribute("id") != null) {
			userID = (String) session.getAttribute("id");
		}
		int pageNumber = 1; //기본은 1페이지 할당
		// 만약 파라미터로 넘어온 오브젝트 타입 'pageNumber'가 존재한다면 'int' 타입으로 캐스팅을 해주고 그 값을 'pageNumber'변수에 저장
		if(request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		  String keyField = request.getParameter("keyField");
		  String keyWord = request.getParameter("keyWord");
		  ArrayList<BBS_DB> list = dao.getMemberlist(keyField, keyWord);
	%>
	<script type="text/javascript">
	var aa=<%=keyField%>
	var bb =<%=keyWord%>
	</script>
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
		<div class="row mt-4">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<td colspan="7"><br />
							<form id="frm" name="serach" method="get">
								<select name="keyField">
									<option value="0">----선택----</option>
									<option value="userID">작성자</option>
									<option value="bbsTitle">제목</option>
									<option value="bbsContent">내용</option>
								</select>
								<input type="text" name="keyWord" />
								<input type="button" value="검색" onclick="searchCheck(form)" />
							</form>
						</td>
					</tr>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
				<%
					BBS_DAO bbsDao = new BBS_DAO();
					ArrayList<BBS_DB> list1 = bbsDao.getList(pageNumber);
					
					keyField = request.getParameter("keyField");
					keyWord = request.getParameter("keyWord");
					list = dao.getMemberlist(keyField, keyWord);
					
					if (keyField!=null){
						list1 = list;
					}
					  
					  
					for(int i = 0; i < list1.size(); i++) {
				%>
					<tr>
						<td><%= list1.get(i).getBbsID() %></td>
						<td><a href="view.jsp?bbsID=<%= list1.get(i).getBbsID() %>">
							<%= list1.get(i).getBbsTitle() %></a></td>
						<td><%= list1.get(i).getUserID() %></td>
						<td><%= list1.get(i).getBbsDate().substring(0, 11) + list1.get(i).getBbsDate().substring(11, 13) + "시" + list1.get(i).getBbsDate().substring(14, 16) + "분" %></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
			<!-- 페이징 처리 영역 -->
			<%
				if(pageNumber != 1) {
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber - 1 %>" class="btn btn-success btn-arraw-left mb-3 mr-2">이전</a>
			<%
				} if(bbsDao.nextPage(pageNumber +1)) {
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success btn-arraw-left mb-3 mr-2">다음</a>
			<%
				}
			%>
			<!-- 글쓰기 버튼 -->
			<a href="write.jsp" class="btn btn-primary pull-right mb-3">글쓰기</a>
		</div>
	</div>
	
<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your Website 2021</p>
		</div>
	</footer>
</body>
</html>