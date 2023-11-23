<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	MemberVO mv = (MemberVO) request.getAttribute("mv");
	Object memId1 = session.getAttribute("memId");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>

<style>
.container-fluid a{
	text-decoration: none;
	color: black;
}
@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
*{
  font-family: 'GmarketSansMedium';
}
#write {
	float: right;
	margin-top: 10px;
	border-color: #707070;
	transition: background-color 1s;
}
#write a {
	text-decoration: none;
}
#write:hover {
	background-color: rgba(176, 176, 176, 0.5)
}
.me-5 {
	font-size: 1.3rem;
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

	<!-- 헤더 코드 위치 -->
	<%@include file="/views/home/header.jsp"%>

	<!-- 메뉴바 코드 위치 -->
	<%@include file="/views/home/menubar.jsp"%>

	<!-- aside1 영역 -->
	<%@include file="/views/home/aside1.jsp"%>

	<!-- 메인 커뮤니티 영역 시작 -->
	<div class="col-12 d-inline-flex">

		<!-- 어사이드 영역1 시작 -->
		<div class="col-2"></div>
		<!-- 어사이드 영역1 끝 -->

		<!-- 메인 콘텐츠 영역 시작 -->
		<div class="col-8">

			<!-- 메인 제목 영역 시작 -->
			<div>
				<p class="text-center" 
				style="font-size: 2rem; padding-bottom:20px;">자주 묻는 질문</p>
			</div>
			<!-- 메인 제목 영역 끝 -->
		
			<!-- 커뮤니티 탭 영역 시작 -->
			<div class="tabcontainer d-flex justify-content-center">
				<div class="ms-5 me-5">
					<a href="<%=request.getContextPath()%>/boardNot/list.do">공지사항</a>
				</div>
				<div class="ms-5 me-5" ><a href="<%=request.getContextPath()%>/boardFaq/list.do" 
				style="color:#007bff; border-bottom: 2px solid #007bff; padding-bottom:5px;">자주 묻는 질문 </a></div>
				<div class="ms-5 me-5"><a href="<%=request.getContextPath()%>/boardAsk/list.do" >1:1문의</a></div>
			</div>
			<!-- 커뮤니티 탭 영역 끝 -->
		
			<div class="p-5"></div>
		  				
				<!-- 게시글 입력 영역 시작 -->
				<form action="insert.do" method="post" enctype="multipart/form-data">
					<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
						<tr>
							<td>제목</td>
							<td><input type="text" name="faqTitle" value="" style="width:100%;"></td>
						</tr>
						<input type="hidden" name="memId" value="<%=memId1%>">
						<tr>
							<td>내용</td>
<!-- 							<td><input type="text" name="faqContent" style="width:100%; height:300px;" value=""></td> -->
							<td><textarea id="faqContent" name="faqContent" rows="10" style="width:100%;"></textarea></td>
						</tr>
						
					</table>
					<input type="submit" value="게시글 등록" style="float: right;">
				</form>
				<!-- 게시글 입력 영역 끝 -->	
		</div>
	</div>
	
	<!-- aside2 영역 -->
	<%@include file="/views/home/aside2.jsp"%>

	<hr>

	<!-- footer 영역 -->
	<%@include file="/views/home/footer.jsp"%>
	
</body>
</html>