<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Imagetoolbar" content="no" />
<meta name="author" content="" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/styles.css" rel="stylesheet" />

<script type="text/javascript"  src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.4.1.js"></script> -->
<!-- Font Awesome icons-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"
	crossorigin="anonymous"></script>
<!-- Bootstrap core JS-->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="../js/scripts.js"></script>
<script type="text/javascript">
	var rand;
	//캡차 이미지 요청 (캐쉬문제로 인해 이미지가 변경되지 않을수있으므로 요청시마다 랜덤숫자를 생성하여 요청)
	function changeCaptcha() {
		rand = Math.random();
		$('#catpcha').html('<img src="CaptChaImg.jsp?rand=' + rand + '"/>');
	}

	$(document).ready(function() {

		changeCaptcha(); //캡차 이미지 요청

		$('#reLoad').click(function() {
			changeCaptcha();
		}); //새로고침버튼에 클릭이벤트 등록

		//확인 버튼 클릭시
		$('#frmSubmit').click(function(){
            if ( !$('#answer').val() ) {
                   alert('이미지에 보이는 숫자 또는 스피커를 통해 들리는 숫자를 입력해 주세요.');
            } else {
                   $.ajax({
                          url: 'captchaSubmit.jsp',
                          type: 'POST',
                          dataType: 'text',
                          data: 'answer=' + $('#answer').val(),
                          async: false,      
                          success: function(resp) {
                                alert(resp);
                                $('#OK').removeAttr( 'disabled' );
                                $('#reLoad').attr('disabled',true);
                                $('#frmSubmit').attr('disabled',true);
                          },
                          error: function(){
                              alert("실패?");
                          }
                   });
            }
      });
	});
	
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
							<a class="dropdown-item" href="./signup.jsp">Join</a> <a
								class="dropdown-item" href="./login.jsp">Login</a>
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
	<div class="container col-lg-4">
		<div>
			<div class="jumbotron" style="padding-top: 20px; margin-top: 32px;">
				<form action="joinA.jsp">
					<h3 style="text-align: center;">회원가입 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디"
							name="id" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호"
							name="pw" id="pw" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호 확인"
							name="pw" id="pw1" maxlength="20">
						<div id="check" class="text-danger"></div>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이름"
							name="name" maxlength="20">
					</div>
					<div class="form-group" style="text-align: center;">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-primary active"> <input
								type="radio" name="gender" autocomplete="off" value="남자" checked>남자
							</label> <label class="btn btn-primary active"> <input
								type="radio" name="gender" autocomplete="off" value="여자" checked>여자
							</label>
						</div>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="번호"
							name="phone" maxlength="20">
					</div>
					<div id="catpcha"></div>
					<div id="audiocatpch" style="display: block;margin-top:10px;"></div>
					<input id="reLoad" type="button" value="새로고침" />
					 <input type="text" id="answer" name="answer" value="" /> 
					 <input type="button" id="frmSubmit" value="확인" />
					 <br>
					<input type="submit" class="btn btn-primary form-control "
						value="회원가입" id="OK"  disabled style="margin-top:20px;">
				</form>
			</div>
		</div>
	</div>

	<!-- Call to Action-->
<!-- 	<aside class="py-5 bg-light">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<h3>질문사항은 FAQ로</h3>
				</div>
				<div class="col-md-4">
					<a class="btn btn-lg btn-secondary btn-block" href="../faq.jsp">FAQ</a>
				</div>
			</div>
		</div>
	</aside> -->
	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2021</p>
		</div>
	</footer>
</body>
<script type="text/javascript">
	$('#pw1').keyup(function() {
		if ($('#pw').val() == $('#pw1').val()){
			$('#check').text("비밀번호가 일치합니다.")
			$('#check').attr("class","text-success")
		}

		else{
			$('#check').text("비밀번호가 다릅니다.")
			$('#check').attr("class","text-danger")
		}
		if ($('#pw1').val() == "")
			$('#check').text("")
	})

		$('#pw').keyup(function() {
		if ($('#pw').val() == $('#pw1').val()){
			$('#check').text("비밀번호가 일치합니다.")
			$('#check').attr("class","text-success")
		}

		else{
			$('#check').text("비밀번호가 다릅니다.")
			$('#check').attr("class","text-danger")
		}
		if ($('#pw').val() == "")
			$('#check').text("")
	})
	$('#OK').click(function() {
		if ($('#pw').val() != $('#pw1').val()) {
			alert("비밀번호가 다릅니다.")
			return false
		}
	})
</script>
</html>
