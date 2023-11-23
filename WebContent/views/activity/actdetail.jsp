<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="kr.or.ddit.activity.vo.ActivityVO"%>
<%@ page import="kr.or.ddit.activity.vo.ActivityImgVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
    String actName = request.getParameter("actName");
    String actLoc = request.getParameter("actLoc");
    String actTel = request.getParameter("actTel");
    String actIntro = request.getParameter("actIntro");
    String actCate = request.getParameter("actCate");
    String actImg = request.getParameter("actImgPath");

    ActivityVO detailedActivity = new ActivityVO();
    detailedActivity.setActName(actName);
    detailedActivity.setActLoc(actLoc);
    detailedActivity.setActTel(actTel);
    detailedActivity.setActIntro(actIntro);
    detailedActivity.setActCate(actCate);

    // activityImgVO 객체 설정
    ActivityImgVO activityImgVO = new ActivityImgVO();
    activityImgVO.setActImgPath(actImg);
    detailedActivity.setActivityImgVO(activityImgVO);
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>놀거리상세조회</title>

<!--     메인 CSS & JS -->
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
<link rel="stylesheet" href="../css/swiper.css">
<script
	src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>

<!-- 폰트 -->
<link rel="stylesheet" href="/JejuOlleh/css/home/homefont.css">

<!-- 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />

<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/accodetailstyles.css" rel="stylesheet" />

<!-- 지도API -->
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=feaf02ec830c6ceb00852423685e33d4&libraries=services,clusterer,drawing"></script>
</head>

<body>

	<!-- 헤더 영역 -->
	<div class="row sticky-top border-bottom  border-5 mb-5 bg-light">

		<!-- 로고 영역 시작 -->
		<div class="col-2 d-flex align-items-center" id="logo">
			<a href="/JejuOlleh/index.jsp">
				<div class="ms-5"></div>
			</a>
		</div>

		<!-- 대문 영역 시작 -->
		<div class="header col-8 text-center p-4">
			<a href="/JejuOlleh/index.do"> <span class="maintitle"
				style="font-size: 4rem;">Jeju Olleh?</span>
			</a>
		</div>
		<!-- 대문 영역 끝 -->
</head>

		<!-- 로그인 영역 시작 -->
		<div class="col-2 d-flex justify-content-end align-items-center">
			<a href="../html/login.html">
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
						<a href="/JejuOlleh/views/member/mypage.jsp"><%=memNm%> 회원님 환영합니다.</a>
						
					<%
						}
					%>
						<br>
						<p style="display: inline;">🏝</p>
						<a href="/JejuOlleh/Logout">Logout</a>
					<%
						} else {
					%>
					
						<p style="display: inline;">🌼</p><span class="logintext" id="logintext"><a href="/JejuOlleh/views/login/login3.jsp">로그인</a></span>

					<%
						}
					%>
				</div>
			</a>
		</div>
		<!-- 로그인 영역 끝 -->

	</div>
	<!-- 헤더 영역 끝 -->
	<!-- 메인 시작 -->
	<!-- <body> -->
<!--     <div class="container"> -->
<!--         <div class="card"> -->
<%--             <img src="<%= request.getContextPath() + detailedActivity.getActivityImgVO().getActImgPath() %>" --%>
<!--                 alt="사진" class="card-image"> -->
<%--             <h2 class="card-title"><%= detailedActivity.getActName() %></h2><br> --%>
<%--             <p class="card-text"><span>위치</span> <%= detailedActivity.getActLoc() %></p> --%>
<%--             <p class="card-text"><span>전화번호</span> <%= detailedActivity.getActTel() %></p> --%>
<%--             <p class="card-text"><span>놀거리 종류</span> <%= detailedActivity.getActCate() %></p> --%>
<%--             <p class="card-text"><span>소개</span> <%= detailedActivity.getActIntro() %></p> --%>
<!-- 		</div> -->
<!--     </div> -->
<!-- </body> -->

<!-- </html> -->

	<div class="container-fluid pt-5" id="activitydetail">
		<div class="row">
			<div class="col-2"></div>
	        <div class="card col-8 border-0">
	            <img src="<%= request.getContextPath() + detailedActivity.getActivityImgVO().getActImgPath() %>" alt="사진" class="card-image">
	            <div class="mt-5 mb-3">            
		            <p class="card-title" id="activitytitle"><%= detailedActivity.getActName() %></p>
	            </div>
	            
	            <hr>
	            
     	        <div id="activitytext">
	            <div class="col-12 d-flex">
		            <div class="col-2">
		            	<p>위치</p>
		            </div>
		            <div class="col-10">
		            	<p><%= detailedActivity.getActLoc() %></p>
		            </div>
	            </div>
	            <div class="col-12 d-flex">
		            <div class="col-2">
		            	<p>전화번호</p>
		            </div>
		            <div class="col-10">
		            	<p><%= detailedActivity.getActTel() %></p>
		            </div>
	            </div>
	            <div class="col-12 d-flex">
		            <div class="col-2">
		            	<p>카테고리</p>
		            </div>
		            <div class="col-10">
		            	<p><%= detailedActivity.getActCate() %></p>
		            </div>
	            </div>
	            <div class="col-12 d-flex">
		            <div class="col-2">
		            	<p>소개</p>
		            </div>
		            <div class="col-10">
		            	<p><%= detailedActivity.getActIntro() %></p>
		            </div>
	            </div>
	            </div>
	            <hr>
	            <div>


	<div id="map" style="width: 100%; height: 500px;"></div>

	<script>
    var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
    var mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 초기 지도 중심 좌표
        level: 4 // 지도의 확대 레벨
    };  

    // 지도를 생성합니다    
    var map = new kakao.maps.Map(mapContainer, mapOption); 

    // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();

    // 주소로 좌표를 검색합니다
    geocoder.addressSearch('<%=detailedActivity.getActLoc()%>',
						function(result, status) {
							// 정상적으로 검색이 완료됐으면 
							if (status === daum.maps.services.Status.OK) {
								var coords = new kakao.maps.LatLng(result[0].y,
										result[0].x);

								// 결과값으로 받은 위치를 마커로 표시합니다
								var marker = new kakao.maps.Marker({
									map : map,
									position : coords
								});

								// 인포윈도우로 장소에 대한 설명을 표시합니다
								var infowindow = new kakao.maps.InfoWindow(
										{
											content : '<div style="width:150px;text-align:center;padding:6px 0;">놀거리 위치</div>' // 수정 필요
										});
								infowindow.open(map, marker);

								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(coords);
							}
						});
	</script>
	            
	        </div>
	        <div class="col-2"></div>
        </div>
    </div>
</body>

</html>
