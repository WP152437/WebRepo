<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.dimigo.vo.UserVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

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

<title>건강 검진</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark"> <a
		class="navbar-brand" href="${ contextPath }/jsp/home.jsp">Home</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<%@ include file="menu.jsp"%>

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

	<img src="${ contextPath }/img/info.jpg" height="3000" width="1080"
		style="margin-left: auto; margin-right: auto; display: block;" />

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