<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<!-- Font Awesome icons-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
<!-- Bootstrap core JS-->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>

<title>Insert title here</title>
</head>
<body>
<%
String userID = (String) session.getAttribute("id");
%>
<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="index.jsp">JSP TeamProject</a>
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
							<a class="dropdown-item" href="member/signin.jsp">Join</a>
							<a class="dropdown-item" href="member/login.jsp">Login</a>
						</div>
					</li>
				<%
					// 로그인이 되어 있는 상태에서 보여주는 화면
					} else {
				%>
					<li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
					<li class="nav-item"><a class="nav-link" href="services.jsp">Services</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
					<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="navbarDropdownPortfolio" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Designated Hospital</a>
						<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
							<a class="dropdown-item" href="broad/broad_1st.jsp">1st Designated Hospital</a> <a class="dropdown-item" href="broad/broad_2nd.jsp">2nd Designated Hospital</a>
								<a class="dropdown-item" href="broad/broad_3rd.jsp">3rd Designated Hospital</a>
								<a class="dropdown-item" href="broad/broad_4th.jsp">4th Designated Hospital</a>
						</div>
					</li>

					<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><%=userID%>님</a>
						<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
							<a class="dropdown-item" href="member/logout.jsp">logout</a>
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
        <!-- Page Content-->
        <section class="py-5">
            <div class="container">
                <!-- Page Heading/Breadcrumbs-->
                <h1>About Our Project</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                    <li class="breadcrumb-item"><a href="about.jsp">About</a></li>
                </ol>
                <!-- Intro Content-->
                <div class="row">
                    <div class="col-lg-6"><img class="img-fluid rounded mb-4" src="https://via.placeholder.com/750x450" alt="..." /></div>
                    <div class="col-lg-6">
                        <h2>About This Project</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed voluptate nihil eum consectetur similique? Consectetur, quod, incidunt, harum nisi dolores delectus reprehenderit voluptatem perferendis dicta dolorem non blanditiis ex fugiat.</p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe, magni, aperiam vitae illum voluptatum aut sequi impedit non velit ab ea pariatur sint quidem corporis eveniet. Odit, temporibus reprehenderit dolorum!</p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et, consequuntur, modi mollitia corporis ipsa voluptate corrupti eum ratione ex ea praesentium quibusdam? Aut, in eum facere corrupti necessitatibus perspiciatis quis?</p>
                    </div>
                </div>
            </div>
        </section>
        <hr class="my-0" />
        <!-- Team Members Section-->
        <section class="py-5 bg-light">
            <div class="container">
                <h2 class="mb-4">Our Team</h2>
                <div class="row">
                    <div class="col-lg-3 mb-4 mb-lg-0">
                        <div class="card h-80 text-center">
                            <div class="card-body">
                                <h4 class="card-title">배지왕</h4>
                                <h6 class="card-subtitle mb-2 text-muted">Position</h6>
                                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus aut mollitia eum ipsum fugiat odio officiis odit.</p>
                            </div>
                            <div class="card-footer"><a href="#!">bjy502@gmail.com</a></div>
                        </div>
                    </div>
                    <div class="col-lg-3 mb-4 mb-lg-0">
                        <div class="card h-80 text-center">
                            <div class="card-body">
                                <h4 class="card-title">이기정</h4>
                                <h6 class="card-subtitle mb-2 text-muted">Position</h6>
                                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus aut mollitia eum ipsum fugiat odio officiis odit.</p>
                            </div>
                            <div class="card-footer"><a href="#!">kijeong08@gmail.com</a></div>
                        </div>
                    </div>
                    <div class="col-lg-3 mb-4 mb-lg-0">
                        <div class="card h-80 text-center">
                            <div class="card-body">
                                <h4 class="card-title">이시형</h4>
                                <h6 class="card-subtitle mb-2 text-muted">Position</h6>
                                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus aut mollitia eum ipsum fugiat odio officiis odit.</p>
                            </div>
                            <div class="card-footer"><a href="#!">mipo8890@gmail.com</a></div>
                        </div>
                    </div>
                    <div class="col-lg-3 mb-4 mb-lg-0">
                        <div class="card h-80 text-center">
                            <div class="card-body">
                                <h4 class="card-title">안재혁</h4>
                                <h6 class="card-subtitle mb-2 text-muted">Position</h6>
                                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus aut mollitia eum ipsum fugiat odio officiis odit.</p>
                            </div>
                            <div class="card-footer"><a href="#!">wogur03157@naver.com</a></div>
                        </div>
                    </div>
                    <div class="col-lg-3 mt-4">
                        <div class="card h-80 text-center">
                            <div class="card-body">
                                <h4 class="card-title">이승직</h4>
                                <h6 class="card-subtitle mb-2 text-muted">Position</h6>
                                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus aut mollitia eum ipsum fugiat odio officiis odit.</p>
                            </div>
                            <div class="card-footer"><a href="#!">dltmdwlr@gmail.com</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <hr class="my-0" />
        <!-- We Used Section = 사용한 언어, IDE 이미지 500*300으로 넣는게 어때요-->
        <section class="py-5">
            <div class="container">
                <h2 class="mb-4">We Used</h2>
                <div class="row">
                    <div class="col-lg-2 col-sm-4 mb-4 mb-lg-0"><img class="img-fluid" src="./img/java.png" alt="..." /></div>
                    <div class="col-lg-2 col-sm-4 mb-4 mb-lg-0"><img class="img-fluid" src="./img/javascript.png" alt="..." /></div>
                    <div class="col-lg-2 col-sm-4 mb-4 mb-lg-0"><img class="img-fluid" src="./img/jquery.png" alt="..." /></div>
                    <div class="col-lg-2 col-sm-4 mb-4 mb-sm-0"><img class="img-fluid" src="./img/jsp.png" alt="..." /></div>
                    <div class="col-lg-2 col-sm-4 mb-4 mb-sm-0"><img class="img-fluid" src="./img/html5css3.png" alt="..." /></div>
                    <div class="col-lg-2 col-sm-4"><img class="img-fluid" src="img/bootstrap.png" alt="..." /></div>
                </div>
            </div>
        </section>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2021</p></div>
        </footer>
</body>
</html>