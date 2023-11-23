<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<!-- 메인 CSS & JS -->
<link rel="stylesheet" href="/JejuOlleh/css/home/homemain.css">
<link rel="stylesheet" href="/JejuOlleh/css/home/reservation.css">

<!-- 부트스트랩 CSS & JS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>

<!-- SWIPER CSS & JS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<link rel="stylesheet" href="/JejuOlleh/css/home/swiper.css">
<script
	src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>

<!-- 폰트 -->
<link rel="stylesheet" href="/JejuOlleh/css/home/homefont.css">

<!-- 아이콘 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<!-- 위시리스트 CSS -->
<link rel="stylesheet" href="/JejuOlleh/js/wishlist/accowishlist.js">

<!-- 캘린더 CSS -->
<link rel="stylesheet" href="/JejuOlleh/css/calendar/calendarstyle.css">

<link rel="stylesheet" href="/JejuOlleh/css/home/menu.css">

<style>
a {
	text-decoration: none;
	font-size: 20px;
}

@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

* {
	font-family: 'GmarketSansMedium';
}


</style>

</head>

<body>
	<!-- 헤더 영역 -->
	<div class="row mb-5">
					
		<!-- 로고 영역 시작 -->
		<div class="col-2 d-flex align-items-center" id="logo">
		
		</div>
		<!-- 로고 영역 끝 -->

		<!-- 대문 영역 시작 -->
		<div class="header col-8 text-center p-5">
			<a href="/JejuOlleh/index.do"> <span class="maintitle">Jeju Olleh?</span>
			</a>
		</div>
		<!-- 대문 영역 끝 -->

		<!-- 로그인 영역 시작 -->
		<div class="col-2 d-flex justify-content-end align-items-end">
			<a href="/JejuOlleh/views/login/login3.jsp">
				<div class="me-5">

					<%
						Object memId = session.getAttribute("memId");
					//       	Object memPass = session.getAttribute("memPass");
					if (memId != null) {

						String memPass = String.valueOf(session.getAttribute("memPass"));
						String memNm = String.valueOf(session.getAttribute("memNm"));
						String memAth = String.valueOf(session.getAttribute("memAth"));

						if ("ADMIN".equals(memAth)) {
					%>

					<p style="display: inline;">💻</p>
					<a href="/JejuOlleh/views/admin/mypage.jsp"><%=memNm%> 페이지</a></li>

					<%
						} else if ("HOST".equals(memAth)) {
					%>

					<a href="/JejuOlleh/views/host/mypage.jsp">
						<p style="display: inline;">&#127818;</p> <%=memNm%> 호스트님 환영합니다.
					</a>

					<%
						} else {
					%>

					<p style="display: inline;">&#127818;</p>
					<a href="/JejuOlleh/views/member/mypage.jsp"><%=memNm%> 회원님
						환영합니다.</a>
					<%
						}
					%>
					<br>
					<p style="display: inline;">🏝</p>
					<a href="/JejuOlleh/Logout">Logout</a>

					<%
						} else {
					%>
					<p style="display: inline;">🌼</p><span class="logintext" id="logintext"><a
						href="/JejuOlleh/views/login/login3.jsp">로그인</a></span>



					<%
						}
					%>
				</div>
			</a>
		</div>
		<!-- 로그인 영역 끝 -->

	</div>
	<!-- 헤더 영역 끝 -->