<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.or.ddit.review.vo.ReviewVO"%>
<%@page import="kr.or.ddit.accommodation.vo.AccoImgVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.accommodation.vo.AccommodationVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   AccommodationVO accoVO = (AccommodationVO) request.getAttribute("accoVO");
List<AccoImgVO> accoImgList = (List<AccoImgVO>) request.getAttribute("accoImgList");
List<ReviewVO> reviewList = (List<ReviewVO>) request.getAttribute("reviewList");
ReviewVO reviewVO = (ReviewVO) request.getAttribute("reviewVO");
%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>숙소상세조회</title>

<!-- 메인 CSS & JS -->
<link rel="stylesheet" href="/JejuOlleh/css/home/homemain.css">
<link rel="stylesheet" href="/JejuOlleh/css/home/reservation.css">

<!-- 부트스트랩 CSS & JS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<!-- SWIPER CSS & JS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<link rel="stylesheet" href="../css/swiper.css">
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>

<!-- 폰트 -->
<link rel="stylesheet" href="/JejuOlleh/css/home/homefont.css">

<!-- 캘린더 css -->
<link rel="stylesheet"
   href="/JejuOlleh/css/calendarsmall/smallcalendar.css">

<!-- 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />

<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/accodetailstyles.css" rel="stylesheet" />

<!-- 지도API -->
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=feaf02ec830c6ceb00852423685e33d4&libraries=services,clusterer,drawing"></script>

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

     <!-- 로그인 영역 시작 -->
      <div class="col-2 d-flex justify-content-end align-items-center">
         <a href="../html/login.html">
            <div class="me-5">

               <%
                  Object memId = session.getAttribute("memId");
               //          Object memPass = session.getAttribute("memPass");
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

   <!-- 메인 시작 -->

   <!-- 숙소 타이틀-->
   <div class="container-fluid pt-5">
      <div class="row">
         <div class="col-2"></div>
         <div class="col-8">

				<!-- 메인 헤더 영역 시작 -->
				<header class="mb-4">
<!-- 			<div class="card-header py-3" > -->
          <div class="ms-4">
         <div class="text-xxl-end text-end mb-5">
         <a href="<%=request.getContextPath() %>/acco/update.do?accoNo=<%=accoVO.getAccoNo()%>" class="btn btn-primary">
            <span>숙소 수정</span>
         </a>
         <a href="<%=request.getContextPath() %>/acco/statusChange.do?accoNo=<%=accoVO.getAccoNo()%>" class="btn btn-primary">
            <span>숙소 상태변경</span>
         </a>         
      </div>
      </div>
 <!-- 메인 헤더 영역 시작 -->
            <header class="mb-4">
               <h1 class="fw-bolder mb-1"><%=accoVO.getAccoName()%></h1>
               <!-- 리뷰 평균점수 -->
               <%
                  if (reviewList != null && !reviewList.isEmpty()) {
               %>
               <%
                  int totalStars = 0;
               for (ReviewVO revVO : reviewList) {
                  totalStars += revVO.getRevStar();
               }

               double averageScore = (double) totalStars / reviewList.size();
               int reviewCount = reviewList.size();
               %>
               <div class="text-muted fst-italic mb-2">
                  ⭐<%=String.format("%.2f", averageScore)%>/ 리뷰<%=reviewCount%>개
               </div>
               <%
                  } else {
               %>
               <div class="text-muted fst-italic mb-2">⭐ / 작성된 리뷰 없음</div>
               <%
                  }
               %>
            </header>
            <!-- 메인 헤더 영역 끝 -->

            <!--이미지 출력-->
            <%
               if (accoImgList != null) {
               //사진 가져오는데 시간이 걸려서 시간 텀을 줘야한다...
               try {
                  Thread.sleep(4000);
               } catch (InterruptedException e) {
                  e.printStackTrace();
               }

               for (AccoImgVO accoImgVO : accoImgList) {
            %>
            <figure class="mb-4 me-1" style="display: inline-block;">
               <img class="img-fluid rounded"
                  src="<%=request.getContextPath() + accoImgVO.getAccoImgPath()%>"
                  alt="..." style="width: 300px; height: 200px" />
            </figure>
            <%
               }
            }
            %>

            <!-- 컨테이너 영역 시작 -->
            <div class="col-12 pl-0" id="carousel1">

               <div class="col-12 pl-0 d-flex">
                  <div class="col-8 p-0 me-4">

                     <!-- 숙소영역? -->
                     <div class="maincontenttitle pb-2">
                        <p>
                        <h3 class="fw-semibold mb-1"><%=accoVO.getMemId()%>님이 호스팅하는
                           집의 방
                        </h3>
                        </p>
                     </div>

                     <div class="p-2"></div>

                     <hr>

                     <div class="p-2"></div>

                     <section class="ftco-section">
                        <div class="container">
                           <div class="row">
                              <div class="col-md-12">
                                 <div class="calendar-section">
                                    <div class="row no-gutters">
                                       <div class="col-md-6">

                                          <div class="calendar calendar-first" id="calendar_first">
                                             <div class="calendar_header">
                                                <button class="switch-month switch-left">
                                                   <i class="fa fa-chevron-left"></i>
                                                </button>
                                                <h2></h2>
                                                <button class="switch-month switch-right">
                                                   <i class="fa fa-chevron-right"></i>
                                                </button>
                                             </div>
                                             <div class="calendar_weekdays"></div>
                                             <div class="calendar_content"></div>
                                          </div>

                                       </div>
                                       <div class="col-md-6">

                                          <div class="calendar calendar-second" id="calendar_second">
                                             <div class="calendar_header">
                                                <button class="switch-month switch-left">
                                                   <i class="fa fa-chevron-left"></i>
                                                </button>
                                                <h2></h2>
                                                <button class="switch-month switch-right">
                                                   <i class="fa fa-chevron-right"></i>
                                                </button>
                                             </div>
                                             <div class="calendar_weekdays"></div>
                                             <div class="calendar_content"></div>
                                          </div>

                                       </div>

                                    </div>
                                    <!-- End Row -->

                                 </div>
                                 <!-- End Calendar -->
                              </div>
                           </div>
                        </div>
                     </section>

                     <hr>

                     <div class="p-2"></div>

                     <!-- 숙소 유형 -->
                     <div class="accocate">
                        <p>
                        <h5 class="fw-bolder">숙소 유형</h5>
                        <ul class="c14pwv94 mt-3">
                           <%
                              if (accoVO.getAccoCate().contains("아파트")) {
                           %>
                           <li class="c31g148 dir dir-ltr">
                              <div>
                                 <img
                                    src="https://a0.muscache.com/pictures/21cfc7c9-5457-494d-9779-7b0c21d81a25.jpg "
                                    alt=""
                                    class="i6qzk7s atm_vy_1osqo2v atm_e2_1osqo2v dir dir-ltr"
                                    style="height: 24px; width: 24px;">
                              </div>
                              <div>
                                 <div class="c1192i2a dir dir-ltr ">아파트</div>
                              </div>
                           </li>
                           <%
                              }
                           %>
                           <%
                              if (accoVO.getAccoCate().contains("주택")) {
                           %>
                           <li class="c31g148 dir dir-ltr">
                              <div>
                                 <img
                                    src="https://a0.muscache.com/pictures/4d7580e1-4ab2-4d26-a3d6-97f9555ba8f9.jpg"
                                    alt=""
                                    class="i6qzk7s atm_vy_1osqo2v atm_e2_1osqo2v dir dir-ltr"
                                    style="height: 24px; width: 24px;">
                              </div>
                              <div>
                                 <div class="c1192i2a dir dir-ltr">주택</div>
                              </div>
                           </li>
                           <%
                              }
                           %>
                           <%
                              if (accoVO.getAccoType().contains("공간 전체")) {
                           %>
                           <li class="c31g148 dir dir-ltr">
                              <div>
                                 <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                                    aria-hidden="true" role="presentation" focusable="false"
                                    style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                                     <path
                                       d="M26 2a1 1 0 0 1 .92.61l.04.12 2 7a1 1 0 0 1-.85 1.26L28 11h-3v5h6v2h-2v13h-2v-2.54a3.98 3.98 0 0 1-1.73.53L25 29H7a3.98 3.98 0 0 1-2-.54V31H3V18H1v-2h5v-4a1 1 0 0 1 .88-1h.36L6.09 8.4l1.82-.8L9.43 11H12a1 1 0 0 1 1 .88V16h10v-5h-3a1 1 0 0 1-.99-1.16l.03-.11 2-7a1 1 0 0 1 .84-.72L22 2h4zm1 16H5v7a2 2 0 0 0 1.7 1.98l.15.01L7 27h18a2 2 0 0 0 2-1.85V18zm-16-5H8v3h3v-3zm14.24-9h-2.49l-1.43 5h5.35l-1.43-5z"></path>
                                     </svg>
                              </div>
                              <div>
                                 <div class="c1192i2a dir dir-ltr">공간 전체</div>
                              </div>
                           </li>
                           <%
                              }
                           %>
                           <%
                              if (accoVO.getAccoType().contains("공간 일부")) {
                           %>
                           <li class="c31g148 dir dir-ltr">
                              <div>
                                 <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                                    aria-hidden="true" role="presentation" focusable="false"
                                    style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                                           <path
                                       d="M24.33 1.67a2 2 0 0 1 2 1.85v24.81h3v2H2.67v-2h3V3.67a2 2 0 0 1 1.85-2h.15zm-4 2H7.67v24.66h12.66zm4 0h-2v24.66h2zm-7 11a1.33 1.33 0 1 1 0 2.66 1.33 1.33 0 0 1 0-2.66z"></path>
                                     </svg>
                              </div>
                              <div>
                                 <div class="c1192i2a dir dir-ltr">공간 일부</div>
                              </div>
                           </li>
                           <%
                              }
                           %>
                        </ul>
                     </div>

                     <div class="p-2"></div>

                     <hr>

                     <div class="p-2"></div>

                     <!--다음 글 -->
                     <div class="accoinfo">
                        <p>
                        <div>
                           <h5 class="fw-bolder">숙소 정보</h5>

                           <ul class="c14pwv94 dir dir-ltr mt-3">
                              <li class="c31g148 dir dir-ltr">
                                 <div>
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                                       aria-hidden="true" role="presentation" focusable="false"
                                       style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                                    <path
                                          d="M28 2a2 2 0 0 1 2 1.85v9.99l1.85 5.54a3 3 0 0 1 .11.46l.03.24.01.24V30h-2v-2H2v2H0v-9.68a3 3 0 0 1 .09-.71l.06-.23L2 13.84V4a2 2 0 0 1 1.7-1.98L3.85 2H4zm2 20H2v4h28zm-1.39-6H3.4l-1.34 4h27.9zM28 4H4v10h2v-4a2 2 0 0 1 1.85-2H24a2 2 0 0 1 2 1.85V14h2zm-13 6H8v4h7zm9 0h-7v4h7z"></path></svg>
                                 </div>
                                 <div>
                                    <div class="c1192i2a dir dir-ltr ">
                                       침대<%=accoVO.getAccoBed()%>개
                                    </div>
                                 </div>
                              </li>
                              <li class="c31g148 dir dir-ltr">
                                 <div>
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                                       aria-hidden="true" role="presentation" focusable="false"
                                       style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                                    <path
                                          d="M17 6a2 2 0 0 1 2 1.85v8.91l.24.24H24v-3h-3a1 1 0 0 1-.98-1.2l.03-.12 2-6a1 1 0 0 1 .83-.67L23 6h4a1 1 0 0 1 .9.58l.05.1 2 6a1 1 0 0 1-.83 1.31L29 14h-3v3h5a1 1 0 0 1 1 .88V30h-2v-3H20v3h-2v-3H2v3H0V19a3 3 0 0 1 1-2.24V8a2 2 0 0 1 1.85-2H3zm13 13H20v6h10zm-13-1H3a1 1 0 0 0-1 .88V25h16v-6a1 1 0 0 0-.77-.97l-.11-.02zm8 3a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM17 8H3v8h2v-3a2 2 0 0 1 1.85-2H13a2 2 0 0 1 2 1.85V16h2zm-4 5H7v3h6zm13.28-5h-2.56l-1.33 4h5.22z"></path></svg>
                                 </div>
                                 <div>
                                    <div class="c1192i2a dir dir-ltr">
                                       방<%=accoVO.getAccoRoom()%>개
                                    </div>
                                 </div>
                              </li>
                              <li class="c31g148 dir dir-ltr">
                                 <div>
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                                       aria-hidden="true" role="presentation" focusable="false"
                                       style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                                    <path
                                          d="M7 1a3 3 0 0 0-3 2.82V31h2V4a1 1 0 0 1 .88-1H18a1 1 0 0 1 1 .88V5h-5a1 1 0 0 0-1 .88V9h-3v2h19V9h-2V6a1 1 0 0 0-.88-1H21V4a3 3 0 0 0-2.82-3H7zm13 28a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm5 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-10 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm5-4a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm5 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-10 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm5-4a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm5 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-10 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm5-4a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm5 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-10 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm5-4a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-5 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm10 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2zM15 7h10v2H15V7z"></path></svg>
                                 </div>
                                 <div>
                                    <div class="c1192i2a dir dir-ltr">
                                       욕실<%=accoVO.getAccoBath()%>개
                                    </div>
                                 </div>
                              </li>
                           </ul>
                        </div>
                        </p>
                     </div>

                     <div class="p-2"></div>

                     <hr>

                     <div class="p-2"></div>

                     <!--다음 글 -->
                     <div class="accointro">
                        <p>
                        <div class="he87mfr dir dir-ltr">
                           <div class="tq51prx dir dir-ltr">
                              <section class="tokr9ou dir dir-ltr">
                                 <h3 tabindex="-1" class="fw-bolder mb-4 mt-5">숙소 소개</h3>
                                 <p class="fs-6 ms-2"><%=accoVO.getAccoInfo()%></p>
                                 <div class="a9qlo4 dir dir-ltr">
                                    <div class="_e7hn5" style="height: 35px; width: 48px;">
                                       <div class="_1c81x67"
                                          style="height: 48px; width: 48px; border-radius: 50%;">
                                          <div class="dqra4ro bmwtyu7 dir dir-ltr" role="img"
                                             aria-busy="false" aria-label="Amelia"
                                             style="-dls-liteimage-height: 100%; - -dls-liteimage-width: 100%; - -dls-liteimage-background-image: url('data:image/png;base64,null'); - -dls-liteimage-background-size: cover;">
                                             <div class="rsb5yse bmwtyu7 dqqltwe dir dir-ltr"
                                                style="-dls-liteimage-background-size: cover; - -dls-liteimage-background-image: url(https://a0.muscache.com/im/pictures/user/7fb0732b-4fd1-44cf-8600-46deb28ce3cd.jpg?im_w=240);"></div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </section>
                           </div>

                           <!--  옵션선택 -->
                           <div>
                              <h5 class="fw-bolder">숙소 편의시설</h5>
                              <ul class="c14pwv94 dir dir-ltr mt-3">
                                 <%
                                    if (accoVO.getAccoOpt().contains("바다 전망")) {
                                 %>
                                 <li class="c31g148 dir dir-ltr"><div>
                                       <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                                          aria-hidden="true" role="presentation" focusable="false"
                                          style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                                          <path
                                             d="M28 2a2 2 0 0 1 2 2v24a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2zm0 2H4v15.5h.19c.37-.04.72-.17 1-.38l.14-.11A3.98 3.98 0 0 1 8 18c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 18c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.98 3.98 0 0 1 24 18c.99 0 1.94.35 2.67 1 .35.33.83.5 1.33.5v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 20c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 20c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 20c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1v3h.19c.37-.04.72-.17 1-.38l.14-.11A3.98 3.98 0 0 1 8 23c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.97 3.97 0 0 1 16 23c.99 0 1.95.35 2.67 1 .35.33.83.5 1.33.5.5 0 .98-.17 1.33-.5A3.98 3.98 0 0 1 24 23c.99 0 1.94.35 2.67 1 .35.33.83.5 1.33.5v2h-.23a3.96 3.96 0 0 1-2.44-1A1.98 1.98 0 0 0 24 25c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 16 25c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1 3.98 3.98 0 0 1-2.67-1A1.98 1.98 0 0 0 8 25c-.5 0-.98.17-1.33.5a3.98 3.98 0 0 1-2.67 1V28h24zm-6 3a3 3 0 1 1 0 6 3 3 0 0 1 0-6zm0 2a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"></path></svg>
                                    </div>
                                    <div>
                                       <div class="c1192i2a dir dir-ltr">바다 전망</div>
                                    </div></li>
                                 <%
                                    }
                                 %>
                                 <%
                                    if (accoVO.getAccoOpt().contains("도시 스카이라인 전망")) {
                                 %>
                                 <li class="c31g148 dir dir-ltr">
                                    <div>
                                       <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                                          aria-hidden="true" role="presentation" focusable="false"
                                          style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                                          <path
                                             d="M28 2a2 2 0 0 1 2 1.85V28a2 2 0 0 1-1.85 2H4a2 2 0 0 1-2-1.85V4a2 2 0 0 1 1.85-2H4zM15 13H9v8H4v7h24v-7h-3v4H15zm-3 10a1 1 0 1 1 0 2 1 1 0 0 1 0-2zM28 4H4v15h3v-6a2 2 0 0 1 1.85-2H15a2 2 0 0 1 2 1.85V23h6v-2a2 2 0 0 1 1.85-2H28zM12 19a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm0-4a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm10-8a3 3 0 1 1 0 6 3 3 0 0 1 0-6zm0 2a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"></path>
                                       </svg>
                                    </div>
                                    <div>
                                       <div class="c1192i2a dir dir-ltr">도시 스카이라인 전망</div>
                                    </div>
                                 </li>
                                 <%
                                    }
                                 %>
                                 <%
                                    if (accoVO.getAccoOpt().contains("산 전망")) {
                                 %>
                                 <li class="c31g148 dir dir-ltr">
                                    <div>
                                       <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                                          aria-hidden="true" role="presentation" focusable="false"
                                          style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                                          <path
                                             d="M31.7 15.3 29 12.58 18.12 1.7a3.07 3.07 0 0 0-4.24 0L3 12.59l-2.7 2.7 1.4 1.42L3 15.4V28a2 2 0 0 0 2 2h22a2 2 0 0 0 2-2V15.41l1.3 1.3ZM9.09 28A7 7 0 0 1 15 22.08v-2.3a2.5 2.5 0 1 1 2 0v2.3A7 7 0 0 1 22.92 28ZM27 28h-2.08a9.01 9.01 0 0 0-5.67-7.4 4.5 4.5 0 1 0-6.5 0A9.01 9.01 0 0 0 7.08 28H5V13.41L15.3 3.12a1 1 0 0 1 1.4 0L27 13.42Z"></path>
                                       </svg>
                                    </div>
                                    <div>
                                       <div class="c1192i2a dir dir-ltr">산 전망</div>
                                    </div>
                                 </li>
                                 <%
                                    }
                                 %>
                                 <%
                                    if (accoVO.getAccoOpt().contains("애견동반가능")) {
                                 %>
                                 <li class="c31g148 dir dir-ltr"><div>
                                       <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                                          aria-hidden="true" role="presentation" focusable="false"
                                          style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                                          <path
                                             d="M13.7 13.93a4 4 0 0 1 5.28.6l.29.37 4.77 6.75a4 4 0 0 1 .6 3.34 4 4 0 0 1-4.5 2.91l-.4-.08-3.48-.93a1 1 0 0 0-.52 0l-3.47.93a4 4 0 0 1-2.94-.35l-.4-.25a4 4 0 0 1-1.2-5.2l.23-.37 4.77-6.75a4 4 0 0 1 .96-.97zm3.75 1.9a2 2 0 0 0-2.98.08l-.1.14-4.84 6.86a2 2 0 0 0 2.05 3.02l.17-.04 4-1.07a1 1 0 0 1 .5 0l3.97 1.06.15.04a2 2 0 0 0 2.13-2.97l-4.95-7.01zM27 12a4 4 0 1 1 0 8 4 4 0 0 1 0-8zM5 12a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm22 2a2 2 0 1 0 0 4 2 2 0 0 0 0-4zM5 14a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm6-10a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm10 0a4 4 0 1 1 0 8 4 4 0 0 1 0-8zM11 6a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm10 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4z"></path>
                                       </svg>
                                    </div>
                                    <div>
                                       <div class="c1192i2a dir dir-ltr">애견동반가능</div>
                                    </div></li>
                                 <%
                                    }
                                 %>
                                 <%
                                    if (accoVO.getAccoOpt().contains("무선 와이파이")) {
                                 %>
                                 <li class="c31g148 dir dir-ltr">
                                    <div>
                                       <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                                          aria-hidden="true" role="presentation" focusable="false"
                                          style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                                          <path
                                             d="M16 20.33a3.67 3.67 0 1 1 0 7.34 3.67 3.67 0 0 1 0-7.34zm0 2a1.67 1.67 0 1 0 0 3.34 1.67 1.67 0 0 0 0-3.34zM16 15a9 9 0 0 1 8.04 4.96l-1.51 1.51a7 7 0 0 0-13.06 0l-1.51-1.51A9 9 0 0 1 16 15zm0-5.33c4.98 0 9.37 2.54 11.94 6.4l-1.45 1.44a12.33 12.33 0 0 0-20.98 0l-1.45-1.45A14.32 14.32 0 0 1 16 9.66zm0-5.34c6.45 0 12.18 3.1 15.76 7.9l-1.43 1.44a17.64 17.64 0 0 0-28.66 0L.24 12.24c3.58-4.8 9.3-7.9 15.76-7.9z"></path>
                                       </svg>
                                    </div>
                                    <div>
                                       <div class="c1192i2a dir dir-ltr">무선 와이파이</div>
                                    </div>
                                 </li>
                                 <%
                                    }
                                 %>
                                 <%
                                    if (accoVO.getAccoOpt().contains("엘리베이터")) {
                                 %>
                                 <li class="c31g148 dir dir-ltr">
                                    <div>
                                       <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                                          aria-hidden="true" role="presentation" focusable="false"
                                          style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                                          <path
                                             d="M30 1a1 1 0 0 1 1 .88V30a1 1 0 0 1-.88 1H2a1 1 0 0 1-1-.88V2a1 1 0 0 1 .88-1H2zM3 3v26h12V3zm7 9v6.58l1.8-1.79 1.4 1.42-3.5 3.5a1 1 0 0 1-1.31.08l-.1-.08-3.5-3.5 1.42-1.42L8 18.6V12zm12.39-1.5a1 1 0 0 1 1.22 0l.1.09 3.5 3.5-1.42 1.41L24 13.7V20h-2v-6.3l-1.8 1.8-1.4-1.41 3.5-3.5zM17 29h12V3H17z"></path>
                                       </svg>
                                    </div>
                                    <div>
                                       <div class="c1192i2a dir dir-ltr">엘리베이터</div>
                                    </div>
                                 </li>
                                 <%
                                    }
                                 %>

                                 <%
                                    if (accoVO.getAccoOpt().contains("건물 내 무료주차")) {
                                 %>
                                 <li class="c31g148 dir dir-ltr">
                                    <div>
                                       <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                                          aria-hidden="true" role="presentation" focusable="false"
                                          style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                                          <path
                                             d="M26 19a1 1 0 1 1-2 0 1 1 0 0 1 2 0zM7 18a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm20.7-5 .41 1.12A4.97 4.97 0 0 1 30 18v9a2 2 0 0 1-2 2h-2a2 2 0 0 1-2-2v-2H8v2a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2v-9c0-1.57.75-2.96 1.89-3.88L4.3 13H2v-2h3v.15L6.82 6.3A2 2 0 0 1 8.69 5h14.62c.83 0 1.58.52 1.87 1.3L27 11.15V11h3v2h-2.3zM6 25H4v2h2v-2zm22 0h-2v2h2v-2zm0-2v-5a3 3 0 0 0-3-3H7a3 3 0 0 0-3 3v5h24zm-3-10h.56L23.3 7H8.69l-2.25 6H25zm-15 7h12v-2H10v2z"></path>
                                       </svg>
                                    </div>
                                    <div>
                                       <div class="c1192i2a dir dir-ltr">건물 내 무료주차</div>
                                    </div>
                                 </li>
                                 <%
                                    }
                                 %>
                                 <%
                                    if (accoVO.getAccoOpt().contains("전기차 충전시설")) {
                                 %>
                                 <li class="c31g148 dir dir-ltr">
                                    <div>
                                       <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                                          aria-hidden="true" role="presentation" focusable="false"
                                          style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                                          <path
                                             d="M2 4h2v2h2V4h2v5a3 3 0 0 1-2 2.83V17a1 1 0 0 0 .88 1H10V5a3 3 0 0 1 3-3h12a3 3 0 0 1 3 3v23h2v2H2v-2h8v-8H7a3 3 0 0 1-3-2.82v-5.35a3 3 0 0 1-2-2.64V4zm23 0H12.88A1 1 0 0 0 12 5v23h14V5a1 1 0 0 0-1-1zm-4.43 13-1.8 3H21a1 1 0 0 1 .91 1.41l-.05.1-2.1 3.49h-2.33l1.8-3H17a1 1 0 0 1-.91-1.41l.05-.1 2.1-3.49h2.33zM23 6a1 1 0 0 1 1 1v6a1 1 0 0 1-1 1h-8a1 1 0 0 1-1-1V7a1 1 0 0 1 1-1h8zm-1 2h-6v4h6V8zM6 8H4v1a1 1 0 0 0 .77.97l.11.02L5 10a1 1 0 0 0 1-.88V8z"></path>
                                       </svg>
                                    </div>
                                    <div>
                                       <div class="c1192i2a dir dir-ltr">전기차 충전시설</div>
                                    </div>
                                 </li>
                                 <%
                                    }
                                 %>
                                 <%
                                    if (accoVO.getAccoOpt().contains("셀프체크인")) {
                                 %>
                                 <li class="c31g148 dir dir-ltr">
                                    <div>
                                       <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                                          aria-hidden="true" role="presentation" focusable="false"
                                          style="display: block; height: 24px; width: 24px; fill: currentcolor;">
                                          <path
                                             d="M16.84 27.16v-3.4l-.26.09c-.98.32-2.03.51-3.11.55h-.7A11.34 11.34 0 0 1 1.72 13.36v-.59A11.34 11.34 0 0 1 12.77 1.72h.59c6.03.16 10.89 5.02 11.04 11.05V13.45a11.3 11.3 0 0 1-.9 4.04l-.13.3 7.91 7.9v5.6H25.7l-4.13-4.13zM10.31 7.22a3.1 3.1 0 1 1 0 6.19 3.1 3.1 0 0 1 0-6.2zm0 2.06a1.03 1.03 0 1 0 0 2.06 1.03 1.03 0 0 0 0-2.06zM22.43 25.1l4.12 4.13h2.67v-2.67l-8.37-8.37.37-.68.16-.3c.56-1.15.9-2.42.96-3.77v-.64a9.28 9.28 0 0 0-9-9h-.55a9.28 9.28 0 0 0-9 9v.54a9.28 9.28 0 0 0 13.3 8.1l.3-.16 1.52-.8v4.62z"></path>
                                       </svg>
                                    </div>
                                    <div>
                                       <div class="c1192i2a dir dir-ltr">셀프체크인</div>
                                    </div>
                                 </li>
                                 <%
                                    }
                                 %>
                              </ul>
                           </div>
                        </div>
                     </div>

                     <div class="p-2"></div>

                  </div>
                  
                  <!-- 예약 영역 -->
                  <div class="col-4 ms-2 pl-0">
                     <div class="col-12 border shadow bg-white rounded-4">
                     <div class="p-1"></div>
                     <span class="fs-2 fw-semibold">₩<%=accoVO.getAccoPri()%></span>
                        <span class="fs-5 fw-light">/박</span>
                     <hr>
                     <form action="<%=request.getContextPath()%>/res/resinsert.do" method="post" enctype="multipart/form/data">
                        <div class="col-12 d-flex p-0">
                           <div class="col-6 pl-4">
                              <label for="checkin" class="big_search_checkin">
                                 <div class="big_search">체크인</div> <input id="checkin" name="resStart" placeholder="날짜 추가" class="checkin border-0" style="width: 90%">
                              </label> 
                           </div>
                           <div class="col-6 pl-4">
                              <label for="checkout" class="big_search_checkin">
                                 <div class="big_search">체크아웃</div> <input id="checkout" name="resEnd" placeholder="날짜 추가" class="checkout border-0" style="width: 90%">
                              </label>
                           </div>
                        </div>
                        <div class="p-2"></div>
                        
                        <!-- 여백 -->
                        <div class="pl-4">
                        <!-- 여백 -->
                        
                        <label for="guest" class="guest big_search_checkin me-4">
                           <div class="big_search">인원</div> <input id="guest" name="resPeople" placeholder="게스트 추가" class="guest border-0">
                        </label>
                        </div>
                        <hr>
                        <div class="d-grid">
                        <button type="submit" class="btn btn-danger">예약하기</button>
                        </div>
                        <hr>
                     </form>
                     <span id="totalday"></span><span>*<%=accoVO.getAccoPri()%></span>
                     <%-- <span id="totalday"><%=accoVO.getAccoPri()%></span> --%>
                     <hr>
<!--                      <button>호스트와 대화하기</button> -->
                     <div class="p-2"></div>
                     </div>
                     <div></div>
                  </div>
                  <!-- 예약 영역 -->
                  
                  <!-- Side widgets-->

               </div>
            </div>
         </div>
         <!-- 컨테이너 영역 끝 -->
      </div>
      <div class="col-2"></div>
   </div>
   </div>

   <hr>

   <!-- 숙소 위치 코드 -->
   <div>
      <div class="he87mfr dir dir-ltr">
         <section class="tokr9ou dir dir-ltr">
            <h3 tabindex="-1" class="fw-bolder mb-4 mt-5">숙소 위치</h3>
         </section>
      </div>
   </div>



   <div id="map" style="width: 100%; height: 500px;"></div>



   <hr>
   <div>
      <div class="he87mfr dir dir-ltr">
         <div class="tq51prx dir dir-ltr">
            <section class="tokr9ou dir dir-ltr">
               <h3 tabindex="-1" class="fw-bolder mb-4 mt-5">리뷰</h3>
            </section>
         </div>
      </div>

      <!-- 리뷰 평균점수 -->
      <%
         if (reviewList != null && !reviewList.isEmpty()) {
      %>
      <%
         int totalStars = 0;
      for (ReviewVO revVO : reviewList) {
         totalStars += revVO.getRevStar();
      }

      double averageScore = (double) totalStars / reviewList.size();
      int reviewCount = reviewList.size();
      %>
      <div class="text-muted fst-italic mb-2">
         ⭐<%=String.format("%.2f", averageScore)%>
         / 리뷰
         <%=reviewCount%>개
      </div>
      <%
         } else {
      %>
      <div class="text-muted fst-italic mb-2">⭐/ 작성된 리뷰 없음</div>
      <%
         }
      %>
   </div>


   <!-- 리뷰..  -->
   <!-- Comments section-->
   <section class="mb-5">
      <div class="card bg-light">
         <div class="card-body">
            <div class="ms-3">

               <%
                  if (reviewList != null && !reviewList.isEmpty()) {

                  for (ReviewVO revVO : reviewList) {
               %>
				<div>
				</div>
               <div class="fw-bold"><%=revVO.getMemId()%></div>
              
               <%
                  SimpleDateFormat sdf = new SimpleDateFormat("yy년 MM월 dd일");
               String reviewDate = sdf.format(revVO.getRevDate());
               %>
               <div><%=reviewDate%></div>
              
              
              <div>
               <%
                  String star = "";
               if (revVO.getRevStar() == 1) {
                  star = "⭐";
               } else if (revVO.getRevStar() == 2) {
                  star = "⭐⭐";
               } else if (revVO.getRevStar() == 3) {
                  star = "⭐⭐⭐";
               } else if (revVO.getRevStar() == 4) {
                  star = "⭐⭐⭐⭐";
               } else if (revVO.getRevStar() == 5) {
                  star = "⭐⭐⭐⭐⭐";
               }
               %>
               <div><%=star%></div>
               <div><%=revVO.getRevCon()%></div>
               <%-- <a href="<%=request.getContextPath()%>/acco/review/delete.do?revNo=<%=revVO.getRevNo()%>">리뷰삭제</a> --%>
              </div>
               
               
               <%
                  }
               } else {
               %>
               <div>아직 작성된 리뷰가 없습니다😅</div>
               <%
                  }
               %>

            </div>
         </div>
      </div>
   </section>

   
   <div class="p-5"></div>

   <!-- Footer-->
   <footer class="py-5 bg-dark">
      <div class="container">
         <p class="m-0 text-center text-white">Copyright &copy; Your
            Website 2023</p>
      </div>
   </footer>
   <!-- Bootstrap core JS-->
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

   <div class="p-5"></div>
   <!-- 메인 끝 -->


   <hr>

   <!-- 푸터 영역 시작 -->
   <div class="container-fluid text-center">

      <!-- 약관 설명 시작 -->
      <div class="row">
         <div class="footer1 text-start col-8" id="footer1">
            <div class="d-inline-block">© 2023 JejuOlleh, Inc.</div>
            <div class="d-lg-inline-block text-primary">
               <a href="http://www.naver.com">· 개인정보 처리방침</a>
            </div>
            <div class="d-lg-inline-block text-primary">
               <a href="http://www.naver.com">· 이용약관</a>
            </div>
            <div class="d-lg-inline-block text-primary">
               <a href="http://www.naver.com">· 사이트맵</a>
            </div>
            <div class="d-lg-inline-block text-primary">
               <a href="http://www.naver.com">· 한국의 변경된 환불 정책</a>
            </div>
            <div class="d-lg-inline-block text-primary">
               <a href="http://www.naver.com">· 회사</a>
            </div>
            <div class="d-lg-inline-block text-primary">
               <a href="http://www.naver.com">· 세부정보</a>
            </div>
         </div>
         <div class="text-end col-4"></div>
      </div>
      <!-- 약관 설명 끝 -->

      <hr>

      <!-- 제공자 설명 시작 -->
      <div class="footer2 text-start" id="footer2">웹사이트 제공자: JejuOlleh
         Ireland UC, private unlimited company, 8 Hanover Quay Dublin 2, D02
         DP23 Ireland | 이사: Sunju, Meugchul, Juhee, Youbin, Seojun, Jungyeon,
         Yeajin | VAT 번호: IE 230721 | 사업자 등록 번호: IE 230403 | 연락처:
         042-222-8201, 웹사이트, https://www.ddit.or.kr/ | 호스팅 서비스 제공업체: 인재개발원
         웹서비스 | 제주놀이는 통신판매 중개자로 제주놀이 플랫폼을 통하여 게스트와 호스트 사이에 이루어지는 통신판매의 당사자가
         아닙니다. 제주놀이 플랫폼을 통하여 예약된 숙소, 체험, 호스트 서비스에 관한 의무와 책임은 해당 서비스를 제공하는
         호스트에게 있습니다.</div>
      <!-- 제공자 설명 끝 -->

   </div>
   <!--     푸터 영역 끝 -->

   <hr>

   <div style="width: 100%; height: 500px;">
      <iframe src="../html/googlemap.html" frameborder="0"
         style="width: 100%; height: 100%;"></iframe>
   </div>

   <script src="/JejuOlleh/js/calendarsmall/jquery.min.js"></script>
   <script src="/JejuOlleh/js/calendarsmall/popper.js"></script>
   <script src="/JejuOlleh/js/calendarsmall/bootstrap.min.js"></script>
   <script src="/JejuOlleh/js/calendarsmall/smallcalendar.js"></script>
   
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
       geocoder.addressSearch('<%=accoVO.getAccoLoc()%>',
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
                                    content : '<div style="width:150px;text-align:center;padding:6px 0;">숙소위치</div>' // 수정 필요
                                 });
                           infowindow.open(map, marker);

                           // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                           map.setCenter(coords);
                        }
                     });
   </script>
   
   
</body>

</html>