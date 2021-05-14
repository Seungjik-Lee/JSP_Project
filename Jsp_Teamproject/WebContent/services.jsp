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
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
                <!-- Bootstrap core JS-->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
<title>Insert title here</title>
</head>
<body>
<!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="index.jsp">JSP TeamProject</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="services.jsp">Services</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
                       <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdownPortfolio" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Designated Hospital</a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
                                <a class="dropdown-item" href="#">1st Designated Hospital</a>
                                <a class="dropdown-item" href="#">2nd Designated Hospital</a>
                                <a class="dropdown-item" href="#">3rd Designated Hospital</a>
                                <a class="dropdown-item" href="#">4th Designated Hospital</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Sign</a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
                                <a class="dropdown-item" href="#">Join</a>
                                <a class="dropdown-item" href="#">Login</a>
                                <a class="dropdown-item" href="#">Withdrawal</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
	<!-- Page Content-->
	<section class="py-5">
		<div class="container">
			<!-- Page Heading/Breadcrumbs-->
			<h1> Services </h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
				<li class="breadcrumb-item"><a href="services.jsp">Services</a></li>
			</ol>
			<!-- Image Header-->
			<img class="img-fluid rounded mb-4"
				src="https://via.placeholder.com/1200x300" alt="..." />
			<!-- Marketing Icons Section-->
			                <div class="row">
                    <div class="col-lg-4 mb-4 mb-lg-0">
                        <div class="card h-100">
                            <h4 class="card-header">진료파트별</h4>
                            <div class="card-body"><p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p></div>
                            <div class="card-footer"><a class="btn btn-primary" href="#!">Go To See</a></div>
                        </div>
                    </div>
                    <div class="col-lg-4 mb-4 mb-lg-0">
                        <div class="card h-100">
                            <h4 class="card-header">지역별</h4>
                            <div class="card-body"><p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis ipsam eos, nam perspiciatis natus commodi similique totam consectetur praesentium molestiae atque exercitationem ut consequuntur, sed eveniet, magni nostrum sint fuga.</p></div>
                            <div class="card-footer"><a class="btn btn-primary" href="#!">Go To See</a></div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="card h-100">
                            <h4 class="card-header">기수별</h4>
                            <div class="card-body"><p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p></div>
                            <div class="card-footer"><a class="btn btn-primary" href="#!">Go To See</a></div>
                        </div>
                    </div>
                </div>
			</div>
	</section>
	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2021</p>
		</div>
	</footer>
</body>
</html>