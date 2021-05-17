<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />

<!-- Font Awesome icons-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"
	crossorigin="anonymous"></script>
<!-- Bootstrap core JS-->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>

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
			<a class="navbar-brand" href="index.jsp">JSP TeamProject</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
					<li class="nav-item"><a class="nav-link" href="services.jsp">Services</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdownPortfolio"
						href="#" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">Designated Hospital</a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownPortfolio">
							<a class="dropdown-item" href="#">1st Designated Hospital</a> <a
								class="dropdown-item" href="#">2nd Designated Hospital</a> <a
								class="dropdown-item" href="#">3rd Designated Hospital</a> <a
								class="dropdown-item" href="#">4th Designated Hospital</a>
						</div></li>
					<%
						// 로그인 하지 않았을 때 보여지는 화면
						if (userID == null) {
					%>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Sign</a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownBlog">
							<a class="dropdown-item" href="member/signin.jsp">Join</a> <a
								class="dropdown-item" href="member/login.jsp">Login</a>

						</div></li>
					<%
						// 로그인이 되어 있는 상태에서 보여주는 화면
						} else {
					%>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><%=userID%>님</a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownBlog">
							<a class="dropdown-item" href="member/logout.jsp">logout</a> <a
								class="dropdown-item" href="#">Withdrawal</a>
						</div></li>
				</ul>
			</div>
		</div>
		<%
			}
		%>
	</nav>
	<!-- Page header-->
	<header>
		<div class="carousel slide" id="carouselExampleIndicators"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li class="active" data-target="#carouselExampleIndicators"
					data-slide-to="0"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="d-block w-100"
						src="https://via.placeholder.com/1900x600" alt="..." />
					<div class="carousel-caption d-none d-md-block">
						<h3>First Slide</h3>
						<p>This is a description for the first slide.</p>
					</div>
				</div>
				<div class="carousel-item">
					<img class="d-block w-100"
						src="https://via.placeholder.com/1900x600" alt="..." />
					<div class="carousel-caption d-none d-md-block">
						<h3>Second Slide</h3>
						<p>This is a description for the second slide.</p>
					</div>
				</div>
				<div class="carousel-item">
					<img class="d-block w-100"
						src="https://via.placeholder.com/1900x600" alt="..." />
					<div class="carousel-caption d-none d-md-block">
						<h3>Third Slide</h3>
						<p>This is a description for the third slide.</p>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</header>
	<!-- Page Content-->
	<section class="py-5">
		<div class="container">
			<h1 class="mb-4">여기에 그래프를 그릴까요?</h1>
			<!-- Marketing Icons Section-->
			<div class="row">
				<div class="col-lg-4 mb-4 mb-lg-0">
					<div class="card h-100">
						<h4 class="card-header">진료파트별</h4>
						<div class="card-body">
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur
								adipisicing elit. Sapiente esse necessitatibus neque.</p>
						</div>
						<div class="card-footer">
							<a class="btn btn-primary" href="#!">Go To See</a>
						</div>
					</div>
				</div>
				<div class="col-lg-4 mb-4 mb-lg-0">
					<div class="card h-100">
						<h4 class="card-header">지역별</h4>
						<div class="card-body">
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur
								adipisicing elit. Reiciendis ipsam eos, nam perspiciatis natus
								commodi similique totam consectetur praesentium molestiae atque
								exercitationem ut consequuntur, sed eveniet, magni nostrum sint
								fuga.</p>
						</div>
						<div class="card-footer">
							<a class="btn btn-primary" href="#!">Go To See</a>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="card h-100">
						<h4 class="card-header">기수별</h4>
						<div class="card-body">
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur
								adipisicing elit. Sapiente esse necessitatibus neque.</p>
						</div>
						<div class="card-footer">
							<a class="btn btn-primary" href="#!">Go To See</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<hr class="my-0" />
	<!-- Portfolio Section-->
	<section class="py-5 bg-light">
		<div class="container">
			<h2 class="mb-4">기수별 지정병원</h2>
			<div class="row">
				<div class="col-lg-6 col-sm-6 mb-4">
					<div class="card h-100">
						<a href="#!"><img class="card-img-top"
							src="https://via.placeholder.com/700x400" alt="..." /></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#!">1st Designated Hospital</a>
							</h4>
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur
								adipisicing elit. Amet numquam aspernatur eum quasi sapiente
								nesciunt? Voluptatibus sit, repellat sequi itaque deserunt,
								dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-sm-6 mb-4">
					<div class="card h-100">
						<a href="#!"><img class="card-img-top"
							src="https://via.placeholder.com/700x400" alt="..." /></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#!">2nd Designated Hospital</a>
							</h4>
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur
								adipiscing elit. Nam viverra euismod odio, gravida pellentesque
								urna varius vitae.</p>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-sm-6 mb-4">
					<div class="card h-100">
						<a href="#!"><img class="card-img-top"
							src="https://via.placeholder.com/700x400" alt="..." /></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#!">3rd Designated Hospital</a>
							</h4>
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur
								adipisicing elit. Quos quisquam, error quod sed cumque, odio
								distinctio velit nostrum temporibus necessitatibus et facere
								atque iure perspiciatis mollitia recusandae vero vel quam!</p>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-sm-6 mb-4">
					<div class="card h-100">
						<a href="#!"><img class="card-img-top"
							src="https://via.placeholder.com/700x400" alt="..." /></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#!">4th Designated Hospital</a>
							</h4>
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur
								adipiscing elit. Nam viverra euismod odio, gravida pellentesque
								urna varius vitae.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<hr class="my-0" />
	<!-- Features Section-->
	<section class="py-5">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<h2 class="mb-4">Modern Business Features</h2>
					<p>The Modern Business template by Start Bootstrap includes:</p>
					<ul>
						<li><strong>Bootstrap 4.6.0</strong></li>
						<li>jQuery 3.5.1</li>
						<li>Font Awesome 5.15.3</li>
						<li>Working PHP contact form with validation</li>
						<li>Unstyled page elements for easy customization</li>
					</ul>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Corporis, omnis doloremque non cum id reprehenderit, quisquam
						totam aspernatur tempora minima unde aliquid ea culpa sunt.
						Reiciendis quia dolorum ducimus unde.</p>
				</div>
				<div class="col-lg-6">
					<img class="img-fluid rounded"
						src="https://via.placeholder.com/700x450" alt="..." />
				</div>
			</div>
		</div>
	</section>
	<hr class="my-0" />
	<!-- Call to Action-->
	<aside class="py-5 bg-light">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<h3>질문사항은 FAQ로</h3>
				</div>
				<div class="col-md-4">
					<a class="btn btn-lg btn-secondary btn-block" href="faq.jsp">FAQ</a>
				</div>
			</div>
		</div>
	</aside>
	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2021</p>
		</div>
	</footer>
</body>
</html>