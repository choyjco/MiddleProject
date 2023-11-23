<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="kr.or.ddit.activity.dao.ActivityImgDaoImpl"%>
<%@ page import="kr.or.ddit.activity.vo.ActivityVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	// 검색 결과를 request 속성에 저장
	String keyword = (String) request.getAttribute("keyword");
	String actImgPath = (String) request.getAttribute("actImgPath");

	List<ActivityVO> searchResult = (List<ActivityVO>) request.getAttribute("searchResult");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/JejuOlleh/css/bootstrap.min.css" />
<title>Search Activity</title>
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
	<form action="<%=request.getContextPath()%>/ActivityController.do" method="post">
		<!--검색 버튼 -->
		<input type="text" name="keyword" value="${not empty keyword ? keyword : ''}">
		<button type="submit">검색</button>
		<!--가나다순 버튼 -->
		<select name="sortOption" id="id_sel" onchange="this.form.submit()">
			<option value="0">--선택--</option>
			<option value="a" ${sortOption == 'a' ? 'selected' : ''}>가나다순</option>
			<option value="b" ${sortOption == 'b' ? 'selected' : ''}>최신순</option>
		</select>
	</form>
	

	<!-- 검색 결과 출력 -->
	<div class="result-container">
		<div class="row-container">
		 
		  <!-- 검색 -->
			<c:forEach var="activityVO" items="${searchResult}">
				<div class="card">
					<div class="image-container">
						<img src="<%=request.getContextPath()%>${activityVO.getActivityImgVO().getActImgPath()}"
							class="card-img-top" alt="...">
					</div>
					<div class="card-body">
						<h4 class="card-title">${activityVO.getActName()}</h4>
						<p class="card-text">${fn:substring(activityVO.getActIntro(), 0, 15)}...</p>
						<a
							href="/JejuOlleh/views/activity/actdetail.jsp?actImgPath=${activityVO.getActivityImgVO().getActImgPath()}&actName=${activityVO.getActName()}&actLoc=${activityVO.getActLoc()}&actTel=${activityVO.getActTel()}&actIntro=${activityVO.getActIntro()}&actCate=${activityVO.getActCate()}"
							class="btn btn-primary">상세보기</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>
