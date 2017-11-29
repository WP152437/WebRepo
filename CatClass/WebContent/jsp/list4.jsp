<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.dimigo.vo.UserVO"%>
<%@ page import="org.dimigo.vo.CatVO"%>
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
<title>건강검진 안내</title>
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark"> <a
		class="navbar-brand" href="home.jsp">Home</a>
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
	
		<!-- 고양이 정보 불러오기, 건강검진 안내 -->	
		<%
			CatVO cat = (CatVO) session.getAttribute("cat");
		%>
		
		${ cat.name }(이)는  ${ cat.gender }인  ${ cat.year }년 ${ cat.month }개월 고양이입니다.
		<br>
		<c:if test="${ cat.year==0 && cat.month>=1 && cat.month<=2}">면역기능촉진제를 맞으세요<br></c:if>
		<c:if test="${ cat.year==0 && cat.month>=2 && cat.month<=3}">FVRCP+클라미디아(4종 종합백신)접종 주사를 맞으세요-3주 간격 3회 접종<br></c:if>
		<c:if test="${ cat.year==0 && cat.month==3}"> FeLV 접종 주사를 맞으세요-3주간격 2회접종<br></c:if>
		<c:if test="${ cat.year==0 && cat.month>=4 && cat.month<=5}">FIP 접종 주사를 맞으세요<br></c:if>
		<c:if test="${ cat.year==0 && cat.month>=6 && cat.month<=7}">광견병 접종 주사를 맞으세요<br></c:if>
		<c:if test="${ cat.year>=0 && cat.month>=6}">링웜 접종 주사를 맞으세요<br></c:if>
		<c:if test="${ cat.gender=='남성' && cat.year<=1 && cat.month >=6}">
		
		중성화 수술을 고려해보세요.<br>
		<a href="http://blog.naver.com/vetline/220960127003">중성화 관련 정보</a><br>
		
		1) 암컷을 차지하기 위한 싸움에 의한 상처, 그로 인한 질병을 예방한다.<br>
		2) 교배 과정에서 발생되는 상처와 감염을 예방한다.<br>
		3) 각종 암과 피부염, 호르몬 질환, 생식기 질병등을 예방한다.<br> 
		4) 숫컷은 이곳저곳 스프레이를 하지 않는다.<br>
		5) 수명이 연장된다.<br>
		6) 공격적인 성향을 온순하게 만들어 주는데 도움이 된다.<br>
		7) 가출등의 돌발 행동을 방지한다.<br>
		
		<a href=" https://ko.wikihow.com/%EC%A4%91%EC%84%B1%ED%99%94-%EC%88%98%EC%88%A0-%EB%B0%9B%EC%9D%80-%EA%B3%A0%EC%96%91%EC%9D%B4-%EB%8F%8C%EB%B3%B4%EB%8A%94-%EB%B0%A9%EB%B2%95">중성화 이후 간호법</a><br>
		</c:if>
		<c:if test="${ cat.gender=='여성' && cat.year<=1 && cat.month >=8}">
		
		중성화 수술을 고려해보세요.<br>
		<a href="http://blog.naver.com/vetline/220960127003">중성화 관련 정보</a><br>
		
		1) 암컷을 차지하기 위한 싸움에 의한 상처, 그로 인한 질병을 예방한다.<br>
		2) 교배 과정에서 발생되는 상처와 감염을 예방한다.<br>
		3) 각종 암과 피부염, 호르몬 질환, 생식기 질병등을 예방한다. <br>
		4) 암컷은 고통의 콜링을 하지 않는다.<br>
		5) 수명이 연장된다.<br>
		6) 공격적인 성향을 온순하게 만들어 주는데 도움이 된다.<br>
		7) 가출등의 돌발 행동을 방지한다.<br>
		
		<a href=" https://ko.wikihow.com/%EC%A4%91%EC%84%B1%ED%99%94-%EC%88%98%EC%88%A0-%EB%B0%9B%EC%9D%80-%EA%B3%A0%EC%96%91%EC%9D%B4-%EB%8F%8C%EB%B3%B4%EB%8A%94-%EB%B0%A9%EB%B2%95">중성화 이후 간호법</a><br>
		</c:if>
				

	<script type='text/javascript'
		src='http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js'></script>
	<script type='text/javascript'>
	function filter(){
		if($('#txtFilter').val()=="")
			$("#languageTBody tr").css('display','');
			else{
			$("#languageTBody tr").css('display','none');
			$("#languageTBody tr[name*='"+$('#txtFilter').val()+"']").css('display','');
		}
		return false;
	}
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
	
	<!--<script>
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
 });-->
 
 </script>
</body>
</html>