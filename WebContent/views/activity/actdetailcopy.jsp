<%@page import="kr.or.ddit.activity.vo.ActivityImgVO"%>
<%@page import="kr.or.ddit.activity.vo.ActivityVO"%>
<%@page import="java.util.List"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	ActivityVO vo = (ActivityVO) request.getAttribute("vo");
    String actImgPath = (String) request.getAttribute("actImgPath");
	
    ActivityImgVO activityImgVO = new ActivityImgVO();
    activityImgVO.setActImgPath(actImgPath);
    
	String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
	session.removeAttribute("msg");

	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시판 상세</title>
<link href="/JejuOlleh/css/reset.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/JejuOlleh/css/boardstyle.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="/JejuOlleh/css/board.bootstrap4.min.css" rel="stylesheet">

</head>
<body>

	<!-- 헤더 코드 위치 -->
	<%@include file="/views/home/header.jsp"%>

	<!-- 메뉴바 코드 위치 -->
	<%@include file="/views/home/menubar.jsp"%>

	<!-- aside1 영역 -->
	<%@include file="/views/home/aside1.jsp"%>

	<div class="card shadow mb-4"
		style="width: 90%;
    			padding-right: 0;
   				padding-left: 0;
   				margin-right: auto;
  				margin-left: auto;" >
  		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary"></h6>
		</div>
  				
  		<div class="card-body">
			<div class="table-responsive">

				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<c:forEach var="activityVO" items="${searchResult}">
					<tr>
						<td>번호</td>
						<td><%=vo.getActNo() %></td>
					</tr>
<!-- 					<tr> -->
<!-- 						<td>사진:</td> -->
<%-- 						<td><img src="<%=request.getContextPath()%>${activityVO.getActivityImgVO().getActImgPath()}" --%>
<!-- 							class="card-img-top" alt="..."></td> -->
<!-- 					</tr> -->
					<tr>
						<td>제목</td>
						<td><%=vo.getActName() %></td>
					</tr>
					<tr>
						<td>위치</td>
						<td><%=vo.getActLoc() %></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><%=vo.getActTel() %></td>
					</tr>
					<tr>
						<td>카테고리</td>
						<td><%=vo.getActCate() %></td>
					</tr>
					<tr style="width:100%; height:300px;">
						<td>소개글</td>
						<td><%=vo.getActIntro() %></td>
					</tr>
					<tr align="right">
						<td colspan="2">
						<a href="./ListController">[목록]</a>
						<a href="./UpdateController?actNo=<%=vo.getActNo() %>">[게시글 수정]</a>
						<a href="./DeleteController?actNo=<%=vo.getActNo() %>">[게시글 삭제]</a>
						</td>
					</tr>
					</c:forEach>
				</table>
				
	

	
	
	<!-- aside2 영역 -->
	<%@include file="/views/home/aside2.jsp"%>

	<hr>

	<!-- footer 영역 -->
	<%@include file="/views/home/footer.jsp"%>

</body>
</html>