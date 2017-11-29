<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="org.dimigo.vo.UserVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>LogIn</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
	crossorigin="anonymous">
<link rel="stylesheet" href="CatClass/css/signin.css">
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

			<a class="navbar-brand" href="home.jsp">Home</a>
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
							<form action="${ contextPath }/jsp/logout.do" method="post">
								<button type="submit" class="dropdown-item">Sign out</button>
								<div class="dropdown-divider"></div>
								<button type="button" class="dropdown-item"><a href="${ contextPath }/jsp/cat_signup.jsp">고양이 정보 등록해보세요</a></button>
							</form>
						</div></li>
				</ul>
			</c:if>
		</div>
	</nav>
	<div class="container">

		<form class="form-signin" action="${ contextPath }/jsp/login.do"
			method="post">
			<h2 class="form-signin-heading">Please sign in</h2>

			<label for="inputEmail" class="sr-only">Email address</label> <input
				type="email" name="id" id="inputEmail" class="form-control"
				placeholder="Email address" required autofocus> <label
				for="inputPassword" class="sr-only">Password</label> <input
				type="password" name="pwd" id="inputPassword" class="form-control"
				placeholder="Password" required>

			<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
		</form>

	</div>

	<%@ include file="modal.jsp"%>

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
<%-- 로그인이 실패한 경우 처리 추가 --%>
<c:if test="${ error != null }">
		var myModal = $('#myModal');
		myModal.find('.modal-title').text('Login Error');
		myModal.find('.modal-body').text('${ error }');
		myModal.modal();
</c:if>
</script>
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
</body>
</html>