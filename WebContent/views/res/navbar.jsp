<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="p-5"></div>

<form action="<%=request.getContextPath()%>/res/resinsert.do"
	method="post" enctype="multipart/form/data">
	<div class="container-fluid">
		<div class="row">
			<div class="col-1 d-md-none d-xxl-block"></div>
			<section class="search col-10 p-2 d-flex align-items-center justify-content-center rounded-pill border border-1 border-dark">
<!-- 				<label for="resno" class="big_search_checkin me-4"> -->
<!-- 					<div class="big_search">예약번호</div> -->
<!-- 					<input id="resno" name="resNo" placeholder="예약번호?" class="checkin border-0"> -->
<!-- 				</label>  -->
<!-- 				<label for="memid" class="big_search_checkin me-4"> -->
<!-- 					<div class="big_search">아이디</div>  -->
<!-- 					<input id="memid" name="memId" placeholder="아이디?" class="checkin border-0"> -->
<!-- 				</label>  -->
				<label for="location" class="big_search_location me-4">
					<div class="big_search">위치</div> 
					<input id="location" name="accoNo" placeholder="어디로 여행가세요?" class="location border-0">
				</label> 
				<label for="checkin" class="big_search_checkin me-4">
					<div class="big_search">체크인</div> 
					<input id="checkin" name="resStart" placeholder="날짜 추가" class="checkin border-0">
				</label> 
				<label for="checkout" class="big_search_checkin me-4">
					<div class="big_search">체크아웃</div> 
					<input id="checkout" name="resEnd" placeholder="날짜 추가" class="checkout border-0">
				</label> 
				<label for="guest" class="guest big_search_checkin me-4">
					<div class="big_search">인원</div> 
					<input id="guest" name="resPeople" placeholder="게스트 추가" class="guest border-0">
				</label>
				<button type="submit" class="search__button"></button>
			</section>
			<div class="col-1 d-md-none d-xxl-block"></div>
		</div>
	</div>
</form>