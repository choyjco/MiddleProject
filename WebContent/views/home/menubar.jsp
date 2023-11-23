<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 메뉴바 영역 시작-->
<div class="back color-2">
<div class="bg-white p-4 sticky-top">
	<div class="row">
	<div class="col-2"></div>
	<div class="col-8" id="menubar-nav">
		<div class="col-12 d-flex text-center menu align-center expanded text-center SMN_effect-3">
			<div class="col-3">
				<a class="nav-link text-black" href="<%=request.getContextPath()%>/acco/list.do"><p>숙소&nbsp&#127968;</p></a>
			</div>
			<div class="col-3">
				<a class="nav-link text-black" href="<%=request.getContextPath()%>/RestaurantController.do"><p>맛집&nbsp&#127860;</p></a>
			</div>
			<div class="col-3">
				<a class="nav-link text-black" href="<%=request.getContextPath()%>/ActivityController.do"><p>놀거리&nbsp&#127939;</p></a>
			</div>
			<div class="col-3">
				<a class="nav-link text-black" href="<%=request.getContextPath()%>/boardNot/list.do"><p>커뮤니티&nbsp&#128203;</p></a>
			</div>
		</div>
	</div>
	</div>
	
<!-- 	<ul class="nav col-sm- text-center navbar-collapse border border-1 border-dark"> -->
<%-- 		<li class="nav-item col-3 pt-2 pb-2" id="nav-item1"><a class="nav-link text-black" href="<%=request.getContextPath()%>/acco/list.do">숙소</a></li> --%>
<%-- 		<li class="nav-item col-3 pt-2 pb-2" id="nav-item2"><a class="nav-link text-black" href="<%=request.getContextPath()%>/RestaurantController.do">맛집</a></li> --%>
<%-- 		<li class="nav-item col-3 pt-2 pb-2" id="nav-item3"><a class="nav-link text-black" href="<%=request.getContextPath()%>/SearchActivityController">놀거리</a></li> --%>
<%-- 		<li class="nav-item col-3 pt-2 pb-2" id="nav-item4"><a class="nav-link text-black" href="<%=request.getContextPath()%>/boardNot/list.do">커뮤니티</a></li> --%>
<!-- 	</ul> -->
	<div class="col-2"></div>
	<div class="col-12 border-3 border-bottom border-light"></div>
	</div>
</div>
<!-- 메뉴바 영역 끝 -->