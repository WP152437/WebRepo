<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.dimigo.vo.UserVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
	crossorigin="anonymous">
<link rel="stylesheet" href="../css/footer.css">
<script>
     function menu_over(e) {
        e.setAttribute("class", "nav-item active");
     }
     function menu_out(e) {
        e.setAttribute("class", "nav-item");
     }
     
</script>

<style>
div.container {
	padding-top: 30px;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="collapse navbar-collapse" id="navbarSupportedContent">

			<a class="navbar-brand" href="#">Home</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<%@ include file="menu.jsp"%>

			<%-- 세션이 없는 경우 --%>

			<%
				UserVO user = (UserVO) session.getAttribute("user");
			%>
			<c:if test="${ user==null }">
				<a class="text-bold text-white" style="text-decoration: none"
					href="${ contextPath }/jsp/login.jsp">Sign in</a>
				<span class="text-bold text-white">&nbsp; or &nbsp;</span>
				<a class="text-bold text-white" style="text-decoration: none"
					href="${ contextPath }/jsp/signup.jsp">Sign up</a>
			</c:if>
			<c:if test="${ user!=null }">
				<%-- 세션이 있는 경우 --%>
				<ul class="navbar-nav flex-row ml-md-auto d-none d-md-flex">
					<li class="nav-item dropdown"><a
						class="nav-item nav-link dropdown-toggle mr-md-2" href="#"
						id="bd-versions" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> ${ user.name } 님 </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="bd-versions">
							<form action="${ contextPath }/logout.do" method="post">
								<button type="submit" class="dropdown-item">Sign out</button>
								<div class="dropdown-divider"></div>
								<button type="button" class="dropdown-item"><a href="${ contextPath }/jsp/cat_signup.jsp">고양이 정보 등록해보세요</a></button>
							</form>
						</div>
					</li>
				</ul>
			</c:if>
		</div>
	</nav>

	<div id="carouselExampleIndicators" class="carousel slide mb-4"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100"
					src="${ contextPath }/img/carol-hu-15112.jpg " height="500"
					alt="First slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100"
					src="${ contextPath }/img/mikhail-vasilyev-253977.jpg" height="500"
					alt="Second slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100"
					src="${ contextPath }/img/yanko-peyankov-3539.jpg" height="500"
					alt="Third slide">
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

	<iframe
		src="https://www.facebook.com/plugins/video.php?href=https%3A%2F%2Fwww.facebook.com%2FtvNplay%2Fvideos%2F531716410525127%2F&width=500&show_text=false&height=280&appId"
		width="500" height="300" style="border: none; overflow: hidden"
		scrolling="no" frameborder="0" allowTransparency="true"
		allowFullScreen="true"></iframe>

	<iframe
		src="https://www.facebook.com/plugins/video.php?href=https%3A%2F%2Fwww.facebook.com%2FtvNplay%2Fvideos%2F528337654196336%2F&show_text=0&width=560"
		width="500" height="300" style="border: none; overflow: hidden"
		scrolling="no" frameborder="0" allowTransparency="true"
		allowFullScreen="true"></iframe>

	<iframe
		src="https://www.facebook.com/plugins/video.php?href=https%3A%2F%2Fwww.facebook.com%2FtvNplay%2Fvideos%2F524836451213123%2F&width=500&show_text=false&height=280&appId"
		width="500" height="300" style="border: none; overflow: hidden"
		scrolling="no" frameborder="0" allowTransparency="true"
		allowFullScreen="true"></iframe>

	<iframe
		src="https://www.facebook.com/plugins/video.php?href=https%3A%2F%2Fwww.facebook.com%2FtvNplay%2Fvideos%2F521478434882258%2F&show_text=0&width=560"
		width="500" height="300" style="border: none; overflow: hidden"
		scrolling="no" frameborder="0" allowTransparency="true"
		allowFullScreen="true"></iframe>

	<iframe
		src="https://www.facebook.com/plugins/video.php?href=https%3A%2F%2Fwww.facebook.com%2FtvNplay%2Fvideos%2F518109148552520%2F&show_text=0&width=560"
		width="500" height="300" style="border: none; overflow: hidden"
		scrolling="no" frameborder="0" allowTransparency="true"
		allowFullScreen="true"></iframe>

	<%@ include file="modal.jsp"%>
	<%@ include file="footer.jsp"%>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
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
 $(document).ready(function () {
   $('#loginForm').submit(function (event) {
      
      event.preventDefault();
      
      var id = $('#id').val();
      var pwd = $('#pwd').val();
      
      $.post("http://httpbin.org/post",
            { id: id, pwd: pwd },
            function(data) {
               var myModal = $('#myModal');
               myModal.modal();
               myModal.find('.modal-body').text(data.form.id + '로그인 되었습니다.');
               
     		 });
	  	 });
	 });
 </script>
</body>
</html>