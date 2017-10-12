<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.dimigo.vo.UserVO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="assets/ico/favicon.ico">

<title>MY BLOG</title>

<!-- Bootstrap core CSS -->
<link href="./css/bootstrap.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="./css/style.css" rel="stylesheet">
<link href="./css/font-awesome.min.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy this line! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

	<!-- Static navbar -->
	<div class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.html">INSTANT</a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li class="active"><a href="index.html">Home</a></li>
					<li><a href="about.html">Respect</a></li>
					<li><a href="work.html">Impress</a></li>
					<%
						UserVO user = (UserVO) session.getAttribute("user");
						if (user == null) {
					%>
					<form class="form-inline my-2 my-lg-0" id="loginForm">
						<li><input class="form-control mr-sm-2" type="text"
							placeholder="ID" id="id" required></li>
						<li><input class="form-control mr-sm-2" type="password"
							placeholder="PWD" id="pwd" required></li>
						<li><button class="btn btn-outline-success my-2 my-sm-0"
								type="submit">Login</button>
							<button class="btn btn-outline-success my-2 my-sm-0"
								type="button" onclick="join();">Join</button></li>
					</form>
					<%
						} else {
					%>
					<div>
					<%=user.getId()%>님
					</div>
					<form action="/WebClass/bloglogout" method="post" id="logoutForm">
						<button type="submit" class="btn btn-outline-success my-2 my-sm-0">로그아웃</button>
					</form>
					<%
						}
					%>
				
			</div>
			</ul>
		</div>
	</div>
	<!--/.nav-collapse -->
	</div>


	<!-- Modal -->
	<div class="modal" id="joinModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<form class="form-inline my-2 my-lg-0" id="signForm">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLongTitle">회원가입</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">

						<div class="modal-body">
							<div class="btn-group" data-toggle="buttons">
								<label class="btn btn-secondary active"> <input
									type="radio" name="options" id="option1" autocomplete="off"
									checked> 1학년
								</label> <label class="btn btn-secondary"> <input type="radio"
									name="options" id="option2" autocomplete="off"> 2학년
								</label> <label class="btn btn-secondary"> <input type="radio"
									name="options" id="option3" autocomplete="off"> 3학년
								</label>
							</div>
						</div>

						<div class="container">
							<select class="btn btn-primary dropdown-toggle" name="list"
								required>
								<option value="">반</option>
								<option value="1">1반</option>
								<option value="2">2반</option>
								<option value="3">3반</option>
								<option value="4">4반</option>
								<option value="5">5반</option>
								<option value="6">6반</option>
							</select> <input class="form-control mr-sm-2" type="number"
								placeholder="번호" aria-label="PWD" id="pwd" required> <input
								class="form-control mr-sm-2" type="text" placeholder="이름"
								aria-label="ID" id="name" required>
						</div>

					</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="submit" class="btn btn-primary">Join</button>
			</div>
			</form>
			<div class="modal fade" id="exampleModalLong" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalLongTitle"
				aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLongTitle">가입 완료</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--모달창 -->

	<div class="modal" id="myModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">로그인 결과</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<div id="headerwrap">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-lg-offset-3">
					<h4>HELLO PEOPLE, MY NAME IS</h4>
					<h1>JO A JIN</h1>
					<h4>KOREA DIGITAL MEDIA HIGH SCHOOL STUDENT</h4>
				</div>
			</div>
			<!--/row -->
		</div>
		<!-- /container -->
	</div>
	<!--/headerwrap -->

	<section id="works"></section>
	<div class="container">
		<div class="row centered mt mb">
			<h1>My Portfolio</h1>

			<div class="col-lg-4 col-md-4 col-sm-4 gallery">
				<a href="work.html"><img src="./img/portfolio/folio01.png"
					class="img-responsive"></a>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-4 gallery">
				<a href="work.html"><img src="./img/portfolio/folio02.jpg"
					class="img-responsive"></a>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-4 gallery">
				<a href="work.html"><img src="./img/portfolio/folio03.png"
					class="img-responsive"></a>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-4 gallery">
				<a href="work.html"><img src="./img/portfolio/folio04.png"
					class="img-responsive"></a>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-4 gallery">
				<a href="work.html"><img src="./img/portfolio/folio05.png"
					class="img-responsive"></a>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-4 gallery">
				<a href="work.html"><img src="./img/portfolio/folio06.png"
					class="img-responsive"></a>
			</div>
		</div>
		<!--/row -->
	</div>
	<!--/container -->


	<div id="footerwrap">
		<div class="container">
			<div class="row centered">
				<div class="col-lg-4">
					<p>
						<b>KOREA DIGITAL MEDIA HIGH SCHOOL STUDENT</b>
					</p>
				</div>

				<div class="col-lg-4">
					<p>Living in the amazing siheung.</p>
				</div>
				<div class="col-lg-4">
					<p>ajini9665@naver.com</p>
				</div>
			</div>
		</div>
	</div>
	<!--/footerwrap -->


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="./myblog/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
		integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
		integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
		crossorigin="anonymous"></script>

	<script>
		function login() {
			var loginModal = $('#loginModal');
			loginModal.modal();

		}
	</script>
	<script>
		$(document).ready(function() {
			$('#loginForm').submit(function(event) {
				event.preventDefault();
				var id = $('#id').val();
				var pwd = $('#pwd').val();
				$.post("/WebClass/bloglogin", {
					id : id,
					pwd:pwd
				}, function(data) {
					if (data.result == true) {
						location.href = "index.jsp";
					} else {
						var myModal = $('#myModal');
						myModal.modal();
						myModal.find('.modal-body').text('로그인에 실패하였습니다.');
					}

				});
			});
			$("#logoutForm").submit(function(event) {
	            event.preventDefault();
	            $.post("/WebClass/bloglogout", {}, function(data) {
	               location.href = "index.jsp";
	            });
	         });
		});
	</script>


	<script>
		function join() {
			var joinModal = $('#joinModal');
			joinModal.modal();

		}
	</script>
	<script>
		$(document).ready(
				function() {
					$('#signForm').submit(
							function(event) {

								event.preventDefault();
								var id = $('#name').val();

								$.post("http://httpbin.org/post", {
									id : id
								}, function(data) {
									var thisModal = $('#joinModal');
									thisModal.modal('hide');
									var myModal = $('#myModal');
									myModal.modal();
									myModal.find('.modal-body').text(
											data.form.id + '님 회원가입 되었습니다.');

								});
							});
				});
	</script>

	<script>

</body>
</html>

</body>
</html>