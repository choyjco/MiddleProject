<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="kr.or.ddit.restaurant.dao.RestaurantImgDaoImpl"%>
<%@page import="kr.or.ddit.restaurant.vo.RestaurantVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	String keyword = (String) request.getAttribute("keyword");
	String rstImgPath = (String) request.getAttribute("rstImgPath");
	List<RestaurantVO> searchResult = (List<RestaurantVO>) request.getAttribute("searchResult");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/JejuOlleh/css/bootstrap.min.css" />
<title>Document</title>
<style>
.thumbnail {
	width: 250px;
	height: 180px;
	position: relative;
}

.thumbnail:hover::before {
	content: attr(data-intro);
	position: absolute;
	top: 0;
	left: 100%;
	background-color: white;
	padding: 5px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

div.aa {
	float: left;
	width: 110px;
	margin: 10px;
	border: 1px solid black;
	text-align: center;
}

table {
	margin-right: 20px;
	margin-bottom: 20px;
}

td {
	text-align: left;
	vertical-align: middle;
}

.introduction {
	overflow: visible;
	white-space: normal;
	text-overflow: clip;
}

div {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	/* 	/* 가운데 정렬 */
}

.search-container {
	margin-bottom: 30px;
	text-align: center;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	background-color: white;
	padding: 10px 20px;
	z-index: 1;
}

.result-container {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	margin-top: 50px;
}

.image-container {
	width: 100%;
	height: 200px;
	overflow: hidden;
}

.image-container img {
	width: 100%;
	height: auto;
	object-fit: cover;
}

.row-container {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
}

.card {
	width: calc(25% - 40px); /* 요소 간 간격을 고려한 너비 조정 */
	margin-bottom: 20px;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.card-title {
	margin-top: 20px;
}

.card-text {
	flex-grow: 1;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	padding: 10px;
}

.card-text p {
	margin-bottom: 10px;
}

.btn-primary {
	margin-bottom: 20px;
}
</style>
</head>
<body>

	<form action="<%=request.getContextPath()%>/RestaurantController.do"
		method="post">
		<!-- 검색버튼 -->
		<input type="text" name="keyword"
			value="${not empty keyword ? keyword : ''}">
		<button type="submit">검색</button>
		<!-- 최신순 버튼 -->
		<select name="sortOption" id="id_sel" onchange="this.form.submit()">
			<option value="0">--선택--</option>
			<option value="a" ${sortOption == 'a' ? 'selected' : ''}>가나다순</option>
			<option value="b" ${sortOption == 'b' ? 'selected' : ''}>최신순</option>
		</select>
	</form>


	<!-- ///////////////////// 이미지 목록 시작 //////////////////////////// -->

	<div class="result-container">
		<div class="row-container">
			<c:forEach var="restaurantVO" items="${searchResult}">
				<div class="card">
					<div class="image-container">
						<img src="<%=request.getContextPath()%>${restaurantVO.getRestaurantImgVO().getRstImgPath()}" class="card-img-top" alt="...">
					</div>
					<div class="card-body">
						<h4 class="card-title">${restaurantVO.getRstName()}</h4>
						<p class="card-text">${fn:substring(restaurantVO.getRstIntro(),0,15)}...</p>
						<a href="/JejuOlleh/views/restaurant/detail2.jsp?rstImgPath=${restaurantVO.getRestaurantImgVO().getRstImgPath()}&rstTel=${restaurantVO.getRstTel()}&rstName=${restaurantVO.getRstName()}&rstMenu=${restaurantVO.getRstMenu()}&rstLoc=${restaurantVO.getRstLoc()}&rstList=${restaurantVO.getRstList()}&rstPrice=${restaurantVO.getRstPrice()}&rstTime=${restaurantVO.getRstTime()}&rstIntro=${restaurantVO.getRstIntro()}" class="btn btn-primary">상세보기</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
		<!-- ///////////////////// 이미지 목록 끝 //////////////////////////// -->
</body>

</html>