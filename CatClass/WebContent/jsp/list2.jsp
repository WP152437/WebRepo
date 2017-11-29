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
<title>질병 대처</title>

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<a class="navbar-brand" href="home.jsp">Home</a>
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

	질병명 및 증상 검색 :
	<input type='text' id='txtFilter' onkeyup='{filter();return false}'
		onkeypress='javascript:if(event.keyCode==13){ filter(); return false;}'>

	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">증상 및 질병명</th>
				<th scope="col">대처방법</th>
				<th scope="col">관련 자료</th>
			</tr>
		</thead>
		<tbody id='languageTBody'>
			<tr name="눈곱,눈병,눈,분홍색,부어오름,부음,깜박임">
				<th scope="row">1</th>
				<td>눈병 / 눈곱</td>
				<td>촉촉한 면이나 솜으로 눈곱을 씻어주는 것이 최선, 빠른 시일 내에 병원 방문해야한다</td>
				<td><a
					href="http://blog.naver.com/PostView.nhn?blogId=vetline&logNo=220649477514">눈병
						정보</a></td>
			</tr>
			<tr name="귀,귓병,가려움,간지러움,긁음">
				<th scope="row">2</th>
				<td>귓병(외이염) / 귀 가려움</td>
				<td>면봉을 절대 사용하지 말고 세정제를 뿌린 손수건으로 귀를 닦아내주고 예방을 위해 건조한 환경 유지와 주
					1회정도 자주 닦아내줘야한다</td>
				<td><a href="https://story.kakao.com/ch/ani888/IPMXTaESF20">외이염
						관련 정보</a></td>
			</tr>
			<tr name="구토">
				<th scope="row">3</th>
				<td>구토</td>
				<td>그루밍 중에 자신의 털을 삼켜 장 속에서 뭉친 헤어볼을 비정기적으로 토해낸다면 정상이지만 이외의 것이
					있다면 이물질을 삼킨 경우, 급하게 먹은 경우, 과식한 경우, 구토와 함께 설사나 발열 증상이 동반된다면 백혈구 감소증,
					토사물에 피가 섞인 경우에는 의궤양/위종양까지 의심할 수 있음. 집사들은 되새김과 구토를 구분하기 어렵기 때문에 토사물에
					대한 정보를 수의사에게 알려 빠른 판단을 해야한다</td>
				<td><a
					href="https://m.blog.naver.com/PostView.nhn?blogId=bon24amc&logNo=220567994913&proxyReferer=https%3A%2F%2Fwww.google.co.kr%2F">구토
						증상이 있는 질병 정보 및 대처법</a></td>
			</tr>
			<tr name="피부병,가려움,진물,간지러움,긁음">
				<th scope="row">4</th>
				<td>피부병</td>
				<td>높은 습도와 더러운 환경에서 비롯되기 때문에 자주 일광욕을 시켜주고, 피부병이 생겼다면 연고와 약욕 샴푸로
					마사지하며 관리해준다</td>
				<td><a
					href="https://m.blog.naver.com/PostView.nhn?blogId=eoulimah&logNo=220761922179&proxyReferer=https%3A%2F%2Fwww.google.co.kr%2F">고양이
						피부병 정보</a>, <a href="http://180pet.tistory.com/30">피부병 약 정보</a></td>
			</tr>
			<tr name="비만,살찜,뚱뚱,뱃살">
				<th scope="row">5</th>
				<td>비만</td>
				<td>중성화 수술 이후로 더욱 살이 찌기 쉽고 이는 건강을 악화시키는 주원인이 된다. 따라서 옆에서 봤을 때
					뱃살이 심하게 늘어져 있거나 위에서 내려다 보았을 때 가슴보다 배가 더 나와있다면 다이어트를 시작해야한다</td>
				<td><a href="http://timecook.tistory.com/621">고양이 다이어트 정보</a></td>
			</tr>
			<tr name="설사,똥,변">
				<th scope="row">6</th>
				<td>설사</td>
				<td>탈수 현상을 방지하기 위해 깨끗하고 신선한 물을 충분히 제공하고 적어도 반나절에서 하루는 먹이를 주지
					말아야한다.(죽은 오히려 설사를 악화시킬 수도 있으므로 자제한다) 하루가 지나도 계속 증상을 보이거나 구토, 혈변,
					기면상태, 열, 식욕감퇴, 배변 시 무리가 보인다면 병원에 가는 것이 좋다. 심한 설사를 할 경우 포도당 15mL, 소금
					5mL를 물 1L에 타서 주는 것이 좋다</td>
				<td><a href="http://dogpet.tistory.com/175">설사 증상이 있는 질병 정보
						및 대처법</a></td>
			</tr>
			<tr name="감염,기생충,벼룩,촌충,벌레,벼룩,진드기">
				<th scope="row">7</th>
				<td>감염(벼룩,촌충)</td>
				<td>관련 자료로 들어가 제거법과 각종 약물 복용 방법을 파악한다.</td>
				<td><a href="https://ko.wikihow.com/%EA%B3%A0%EC%96%91%EC%9D%B4-%EB%AA%B8%EC%9D%98-%EB%B2%BC%EB%A3%A9%EA%B3%BC-%EC%A7%84%EB%93%9C%EA%B8%B0-%EC%A0%9C%EA%B1%B0%ED%95%98%EB%8A%94-%EB%B0%A9%EB%B2%95">벼룩 관련 정보</a>, <a href="https://ko.wikihow.com/%EA%B3%A0%EC%96%91%EC%9D%B4-%EA%B5%AC%EC%B6%A9%EC%95%BD-%EB%A8%B9%EC%9D%B4%EB%8A%94-%EB%B2%95">구충약 복용법</a>, <a href="https://blog.naver.com/PostView.nhn?blogId=soulcat1004&logNo=220391309593&proxyReferer=https%3A%2F%2Fwww.google.co.kr%2F">종류별 약 사용법</a></td>
			</tr>
			<tr name="요로,방광,소변,요도,오줌,혈뇨,배뇨장애,통증뇨,요도 폐쇄,요도폐쇄,다음증,다뇨증">
				<th scope="row">8</th>
				<td>하부요로계질환(FLUTD)</td>
				<td>병이 의심된다면 바로 병원에 가서 진단을 받는 것이 최우선이고, 그 이후로 캔사료 제공과 물 그릇을 늘리는 등 수분 섭취량 증가에 신경쓰고 화장실이 더러워 기피할 수 있기 때문에 화장실 청소를 해주어야한다. 활동량을 늘려 스트레스 해소 및 비만 예방을 해준다.</td>
				<td><a href="https://blog.naver.com/PostView.nhn?blogId=lovely_vet&logNo=220089868546&proxyReferer=https%3A%2F%2Fwww.google.co.kr%2F">하부비뇨계질환 정보</a></td>
			</tr>
			<tr name="독감,감기,재채기,콧물,기침,호흡 곤란,발열,눈곱">
				<th scope="row">9</th>
				<td>독감</td>
				<td>초기 때는 눈이 빨개지면서 퉁퉁 붓지만 시간이 지날수록 눈을 못 뜨고 끈적한 눈물이 흐르는데 방치할 경우 실명과 폐렴으로까지 발전 가능하므로 병원에 가서 치료를 받아야한다. 엘라이신이라는 영양보충제가 치료에 도움이 되고,바이랄리스라는 예방에 도움이 된다.</td>
				<td><a href="http://blog.naver.com/vetline/220765482092">감기 간호 정보</a></td>
			</tr>
			<tr name="백혈병,잇몸 염증,잇몸염증,발작,피부 질환,호흡기 문제,호흡기문제,기침,발열,식욕부진,설사">
				<th scope="row">10</th>
				<td>백혈병 바이러스(FeLV)</td>
				<td>초기에는 감기와 같이 기침, 발열, 식욕부진, 설사 등의 증상이 1~2주정도 지속되고 바이러스가 체내(골수 등)으로 숨어들고 나면 수년간 아무증상이 나타나지 않을 수도 있다. 그러니 상태가 괜찮은 고양이라도 백혈병에 감염된 것일 수 있기에 동물병원에서 백혈병 검사 키트를 사서 검사해보는 것이 좋다.</td>
				<td><a href="https://blog.naver.com/PostView.nhn?blogId=lovely_vet&logNo=220026041604&proxyReferer=https%3A%2F%2Fwww.google.co.kr%2F">고양이 백혈병 정보</a></td>
			</tr>
			<tr name="신부전,혼수,체중 감소,체중감소,배뇨증가,배뇨 증가,다음증,다뇨증,구토,식욕부진,무뇨">
				<th scope="row">11</th>
				<td>신부전</td>
				<td>구토나 식욕부진등의 증상이 있는 환자면 무조건 입원을 통해 수치를 안정화시켜야한다. 심각한 빈혈이 있다면 수혈을, 전해질 불균형이 있다면 수액을 통해 이를 보완하고 고혈압이 있다면 혈답조절약을 먹어야한다. 퇴원 후에도 보통 1달~3달 간격으로 정기적인 검사를 받고, 중간에라도 이상이 생기면 언제든지 내원해야한다. 신부전환자는 단백질을 제한하는 식이를 하게 되는데 이도 중요하지만 단백질의 질이 더 중요하다. 조미료 없는 순수 닭가슴살 등 질 높은 동물성 단백질을 보충을 해주는 것이 좋다. 수분 공급을 위해 습식 사료 제공은 도움이되고, 그 외에도 각종 보조제와 피하수액 요법을 실시한다.</td>
				<td><a href="http://www.petzine.co.kr/news/articleView.html?idxno=988">고양이 급성 신부전</a>, <a href="http://www.petzine.co.kr/news/articleView.html?idxno=985">고양이 만성 신부전</a>, <a href="https://blog.naver.com/PostView.nhn?blogId=documania&logNo=220720427087&proxyReferer=https%3A%2F%2Fwww.google.co.kr%2F">고양이 신부전 관련 정보</a></td>
			</tr>
			<tr name="디스템퍼,구토,설사,고열,우울증,발열,조정 부족,조정부족">
				<th scope="row">12</th>
				<td>홍역,범백혈구감소증(Panleukopenia)</td>
				<td>가장 위험한 증상은 탈수 및 쇼크로 지속적인 수액처치와 집중 간호, 항혈청 치료 등을 실시해야한다. 초기 급성으로 병증이 진행되는 며칠만 잘 유지하면 완전 회복까지 예후는 좋다. 고양이 예방접종으로 예방 가능하다. 열로 인한 통증은 아스피린, 합병증 예방 위해 항생제와 설파제, 구강 간호는 붕산 솜으로 한다. 피부는 매일 청결하게 하며 소양증을 없애기 위해 중조나 황산마그네슘을 물에 타서 씻긴다.</td>
				<td><a href="http://www.petzine.co.kr/news/articleView.html?idxno=216">홍역 관련 정보 및 대처</a>, <a href="http://blog.daum.net/fatimaah/19">홍역 관련 구체적 정보</a></td>
			</tr>
			<tr name="발열,림프절 확대,치과 질환,치과질환,치과병,이아픔,식욕 감퇴,면역력,에이즈,설사,임파선 부종,임파선부종,만성비염,염증,결막염,피부염,만성 구내염,빈혈,림프절 종대,림프절종대,만성구내염,고양이에이즈">
				<th scope="row">13</th>
				<td>면역 결핍 바이러스(FIV)</td>
				<td>고양이가 정상적인 면역 반응을 일으키지 못하게하는 레트로 바이러스로 고양이 에이즈라고도 불린다. 치료법은 현재 없지만, 추가적인 2차 감염 방지를 위해 염증이나 피부염이 발생했다면 항생제와 소염제를 투여 해주고 되도록 청결한 상태의 실내 사육을 해 줌으로써 스트레스가 적은 생활을 할 수 있도록 도와준다. 또한 균형 잡힌 양질의 식사를 제공 해 주는 것도 면역 증강의 많은 도움이 된다.</td>
				<td><a href="http://www.petzine.co.kr/news/articleView.html?idxno=620">관련 정보1</a>, <a href="https://blog.naver.com/PostView.nhn?blogId=lovely_vet&logNo=220026382513&proxyReferer=https%3A%2F%2Fwww.google.co.kr%2F">관련 정보2</a>></td>
			</tr>
			<tr name="림프종,부기,체중 감소,피부 감염">
				<th scope="row">14</th>
				<td>림프종</td>
				<td>몸의 면역을 담당하는 림프구가 정상적인 기능을 하지 못해 발생하는 암의 한 종류이다. 림프종 유형에 따라 종양 제거를 위한 수술 등 외과적인 조치와 항암 치료가 병행될 수도 있다. 명확한 원인이 없어 정기적 신체검사와 건강검진이 필요하다.</td>
				<td><a href="http://www.petzine.co.kr/news/articleView.html?idxno=1184">관련 정보</a>></td>
			</tr>
			<tr name="당뇨병,갈증,식욕 증가,체중 감소,다음증,다뇨증">
				<th scope="row">15</th>
				<td>당뇨병</td>
				<td>한 번 걸린 후 완치가 어렵기 때문에 6살 이후 노령묘들은 특히나 주의하여 합병증으로 사망하지 않도록 유의해야한다. 중성화 수술 후 체중이 늘어나기 때문에 식이 조절이 중요하다. 지방 함량이 낮은 저탄수화물 고단백질 다이어트 사료를 처방해주면 당뇨병 뿐 아니라 방광염이나 고양이 하부 요로 질환 등의 예방에도 도움이된다.</td>
				<td><a href="http://www.petzine.co.kr/news/articleView.html?idxno=102">관련 정보</a></td>
			</tr>
		</tbody>
	</table>

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