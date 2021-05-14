<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
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
                <h1 class="mt-4 mb-3">FAQ</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item">
                    <a href="index.jsp">Home</a>
                    </li>
                    <li class="breadcrumb-item">
                    <a href="faq.jsp">FAQ</a>
                    </li>
                </ol>
                <!-- FAQ Accordion 1-->
                <h2>Account &amp; Billing</h2>
                <div class="accordion mb-4" id="accordionExample">
                    <div class="card">
                        <div class="card-header" id="headingOne">
                            <h2 class="mb-0">
                            <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">How do I recover my account password?</button>
                            </h2>
                        </div>
                        <div class="collapse show" id="collapseOne" aria-labelledby="headingOne" data-parent="#accordionExample">
                        <div class="card-body">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Facilis numquam suscipit aliquam, iure quis natus aliquid quia saepe consequuntur aspernatur itaque magni expedita? Eveniet, facilis sunt consequuntur ex optio quidem.</div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header" id="headingTwo">
                            <h2 class="mb-0">
                            <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">How do I add a new user to my account?</button>
                            </h2>
                        </div>
                        <div class="collapse" id="collapseTwo" aria-labelledby="headingTwo" data-parent="#accordionExample">
                        <div class="card-body">Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusantium soluta distinctio numquam accusamus reprehenderit iste quae velit, sit ullam, fugiat quos nihil ut. Doloremque praesentium odit magnam, inventore quaerat fugit?</div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header" id="headingThree">
                            <h2 class="mb-0">
                            <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">Where is my account number located?</button>
                            </h2>
                        </div>
                        <div class="collapse" id="collapseThree" aria-labelledby="headingThree" data-parent="#accordionExample">
                        <div class="card-body">Lorem ipsum dolor sit amet consectetur adipisicing elit. Iusto odio maiores obcaecati rerum odit autem hic amet labore ratione, omnis, id, tenetur exercitationem error expedita! Aspernatur illo pariatur nisi itaque.</div>
                        </div>
                    </div>
                </div>
                <!-- FAQ Accordion 1-->
                <h2>Website Issues</h2>
                <div class="accordion mb-4" id="accordionExample2">
                    <div class="card">
                        <div class="card-header" id="heading2One">
                            <h2 class="mb-0">
                            <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse2One" aria-expanded="true" aria-controls="collapseOne">What do I do if my home screen isn't loading?</button>
                            </h2>
                        </div>
                        <div class="collapse show" id="collapse2One" aria-labelledby="heading2One" data-parent="#accordionExample2">
                        <div class="card-body">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Facilis numquam suscipit aliquam, iure quis natus aliquid quia saepe consequuntur aspernatur itaque magni expedita? Eveniet, facilis sunt consequuntur ex optio quidem.</div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header" id="heading2Two">
                            <h2 class="mb-0">
                            <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapse2Two" aria-expanded="false" aria-controls="collapseTwo">How can I retreive items from my dashboard?</button>
                            </h2>
                        </div>
                        <div class="collapse" id="collapse2Two" aria-labelledby="heading2Two" data-parent="#accordionExample2">
                        <div class="card-body">Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusantium soluta distinctio numquam accusamus reprehenderit iste quae velit, sit ullam, fugiat quos nihil ut. Doloremque praesentium odit magnam, inventore quaerat fugit?</div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header" id="heading2Three">
                            <h2 class="mb-0">
                            <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapse2Three" aria-expanded="false" aria-controls="collapseThree">Where do I go to add security features to my account?</button>
                            </h2>
                        </div>
                        <div class="collapse" id="collapse2Three" aria-labelledby="heading2Three" data-parent="#accordionExample2">
                        <div class="card-body">Lorem ipsum dolor sit amet consectetur adipisicing elit. Iusto odio maiores obcaecati rerum odit autem hic amet labore ratione, omnis, id, tenetur exercitationem error expedita! Aspernatur illo pariatur nisi itaque.</div>
                        </div>
                    </div>
                </div>
                <!-- FAQ Accordion 1-->
                <h2>Website Issues</h2>
                <div class="accordion mb-4" id="accordionExample3">
                    <div class="card">
                        <div class="card-header" id="heading3One">
                            <h2 class="mb-0">
                            <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse3One" aria-expanded="true" aria-controls="collapseOne">What do I do if my home screen isn't loading?</button>
                            </h2>
                        </div>
                        <div class="collapse show" id="collapse3One" aria-labelledby="heading3One" data-parent="#accordionExample3">
                        <div class="card-body">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Facilis numquam suscipit aliquam, iure quis natus aliquid quia saepe consequuntur aspernatur itaque magni expedita? Eveniet, facilis sunt consequuntur ex optio quidem.</div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header" id="heading3Two">
                            <h2 class="mb-0">
                            <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapse3Two" aria-expanded="false" aria-controls="collapseTwo">How can I retreive items from my dashboard?</button>
                            </h2>
                        </div>
                        <div class="collapse" id="collapse3Two" aria-labelledby="heading3Two" data-parent="#accordionExample3">
                        <div class="card-body">Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusantium soluta distinctio numquam accusamus reprehenderit iste quae velit, sit ullam, fugiat quos nihil ut. Doloremque praesentium odit magnam, inventore quaerat fugit?</div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header" id="heading3Three">
                            <h2 class="mb-0">
                            <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapse3Three" aria-expanded="false" aria-controls="collapseThree">Where do I go to add security features to my account?</button>
                            </h2>
                        </div>
                        <div class="collapse" id="collapse3Three" aria-labelledby="heading3Three" data-parent="#accordionExample3">
                        <div class="card-body">Lorem ipsum dolor sit amet consectetur adipisicing elit. Iusto odio maiores obcaecati rerum odit autem hic amet labore ratione, omnis, id, tenetur exercitationem error expedita! Aspernatur illo pariatur nisi itaque.</div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container">
            <p class="m-0 text-center text-white">Copyright &copy; Your Website 2021</p>
            </div>
        </footer>
</body>
</html>