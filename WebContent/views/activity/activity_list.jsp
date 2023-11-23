<%@page import="kr.or.ddit.activity.vo.ActivityVO"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"%> 
<%@ page import="java.util.List"%> 
<%@ page import="kr.or.ddit.activity.dao.ActivityImgDaoImpl"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html> 
<html lang="en"> 
<% 
 	ActivityImgDaoImpl dao = ActivityImgDaoImpl.getInstance();

 	List<ActivityVO> activityVOList = dao.displayAllActivity();


 %> 
<c:set var="activityVOList" value="<%=activityVOList%>" /> 
 <head> 
<link rel="stylesheet" href="/JejuOlleh/css/bootstrap.min.css" /> 
<meta charset="UTF-8">
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
     width: calc(20% - 20px); /* 요소 간 간격을 고려한 너비 조정 */ 
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

 	<div class="result-container" id="result-container"></div> 

 	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
 	<script>
	


	</script> 


 	<!-- ///////////////////// 이미지 목록 시작 //////////////////////////// --> 
	
<!--  	    <form action="searchActivity.jsp" method="get"> -->
<%-- 			<input type="text" name="keyword" value="${not empty keyword ? keyword : ''}"> --%>
<!-- 			<button type="submit">검색</button>  -->
<!--  		</form> -->
		
 <div class="row-container"> 
   <c:forEach var="activityVO" items="${activityVOList}" varStatus="stat"> 
     <c:set var="activityImgVO" value="${activityVO.activityImgVO}" /> 
    <div class="card"> 
       <div class="image-container"> 
        <img src="${actImgPath}" class="card-img-top" alt="..."> 
       </div> 
       <div class="card-body"> 
         <h4 class="card-title">[${activityVO.actName}]</h4>
        <p class="card-text">${fn:substring(activityVO.actIntro,0,30)}...</p>
        <a href="/JejuOlleh/views/activity/actdetail.jsp?actImgPath=${activityImgVO.getActImgPath()}&actName=${activityVO.getActName()}&actLoc=${activityVO.getActLoc()}&actTel=${activityVO.getActTel()}&actIntro=${activityVO.getActIntro()}&actCate=${activityVO.getActCate()}" class="btn btn-primary">상세보기</a> 
     		
       </div> 
     </div>
   </c:forEach> 
 </div> 
<!-- 	<!-- ///////////////////// 이미지 목록 끝 //////////////////////////// --> 
	
	

 </body> 

 </html> 