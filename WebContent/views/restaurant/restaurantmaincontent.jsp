<%@page import="kr.or.ddit.restaurant.vo.RestaurantVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.restaurant.dao.RestaurantImgDaoImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	// 	RestaurantImgDaoImpl dao = RestaurantImgDaoImpl.getInstance();
// 	List<RestaurantVO> restaurantVOList = dao.displayAllRestaurant();
String keyword = (String) request.getAttribute("keyword");
String rstImgPath = (String) request.getAttribute("rstImgPath");
List<RestaurantVO> searchResult = (List<RestaurantVO>) request.getAttribute("searchResult");
%>


<div class="col-md-8 col-sm-12" id="carousel1">
	<form action="<%=request.getContextPath()%>/RestaurantController.do"
		method="post">

		<!-- 검색버튼 -->
		<input type="text" name="keyword"
			value="${not empty keyword ? keyword : ''}"> <input
			type="submit" value="&#128269;"
			class="align-items-center border-0 bg-white"></input>

		<!-- 최신순 버튼 -->
		<!-- 		<select name="sortOption" onchange="this.form.submit()"> -->
		<!-- 			<option value="0">--선택--</option> -->
		<%-- 			<option value="a" ${sortOption == 'a' ? 'selected' : ''}>가나다순</option> --%>
		<%-- 			<option value="b" ${sortOption == 'b' ? 'selected' : ''}>최신순</option> --%>
		<!-- 		</select> -->

		<div class="d-flex justify-content-end">
			<button class="border-0 bg-white" name="sortOption" value="a"
				onclick="this.form.submit()" ${sortOption == 'a' ? 'selected' : ''}>•&nbsp가나다순</button>
			<button class="border-0 bg-white ms-5 me-5" name="sortOption"
				value="b" onclick="this.form.submit()"
				${sortOption == 'b' ? 'selected' : ''}>•&nbsp최신순</button>
		</div>

	</form>
	<div class="p-2"></div>
	<section class="col-12 card-wrapper">
		<c:forEach var="restaurantVO" items="${searchResult}">
			<div class="col-md-4 mb-5" id="restaurantcard">
				<a href="/JejuOlleh/views/restaurant/detail2.jsp?rstImgPath=${restaurantVO.getRestaurantImgVO().getRstImgPath()}&rstTel=${restaurantVO.getRstTel()}&rstName=${restaurantVO.getRstName()}&rstMenu=${restaurantVO.getRstMenu()}&rstLoc=${restaurantVO.getRstLoc()}&rstList=${restaurantVO.getRstList()}&rstPrice=${restaurantVO.getRstPrice()}&rstTime=${restaurantVO.getRstTime()}&rstIntro=${restaurantVO.getRstIntro()}">
					<div class="card border-0" style="width: 24rem;">
						<img src="<%=request.getContextPath()%>${restaurantVO.getRestaurantImgVO().getRstImgPath()}" class="card-img-top rounded-4" alt="...">
						<div class="card-body">
							<h4 class="card-title" id="restauranttitle">${restaurantVO.getRstName()}</h4>
							<p class="card-text" id="restauranttext">${fn:substring(restaurantVO.getRstIntro(),0,15)}...</p>
						</div>
					</div>
				</a>
			</div>
		</c:forEach>
	</section>
</div>