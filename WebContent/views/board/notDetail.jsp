<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="kr.or.ddit.board.vo.BoardNotVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	/// ServletExamBoard/boardNot/detail.do?notNo=1
BoardNotVO bnv = (BoardNotVO) request.getAttribute("bnv");
//  bnv : BoardNotVO [notNo=1, memId=A001, notTitle=제주올레 공지사항, notContent=제주올레 공지사항입니다., notDate=2023-07-11]
// 	out.print("bnv : " + bnv);

MemberVO mv = (MemberVO) request.getAttribute("mv");
Object memId1 = session.getAttribute("memId");
Object memPass1 = session.getAttribute("memPass");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세</title>

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
.container-fluid a {
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
#boardTitle {
	background-color: rgba(204, 202, 202, 0.1)
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

	<div class="container-fluid">
		<div class="row">

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
							style="font-size: 2rem; padding-bottom: 20px;">공지사항</p>
					</div>
					<!-- 메인 제목 영역 끝 -->

					<!-- 커뮤니티 탭 영역 시작 -->
					<div class="tabcontainer d-flex justify-content-center">
						<div class="ms-5 me-5">
							<a href="<%=request.getContextPath()%>/boardNot/list.do"
								style="color: #007bff; border-bottom: 2px solid #007bff; padding-bottom: 5px;">공지사항</a>
						</div>
						<div class="ms-5 me-5">
							<a href="<%=request.getContextPath()%>/boardFaq/list.do">자주
								묻는 질문 </a>
						</div>
						<div class="ms-5 me-5">
							<a href="<%=request.getContextPath()%>/boardAsk/list.do">1:1문의</a>
						</div>
					</div>
					<!-- 커뮤니티 탭 영역 끝 -->

					<div class="p-5"></div>

					<!-- 게시글 입력 영역 시작 -->

					<div
						class="col-12 d-flex text-center border-1 border-top border-dark pt-3 pb-3"
						id="boardTitle">
						<div class="col-1">번호</div>
<!-- 						<div class="col-1">작성자</div> -->
						<div class="col-9">제목</div>
						<div class="col-2">작성일</div>
					</div>
					<div class="border-1 border-dark border-top"></div>

					<div
						class="col-12 d-flex text-center border-1 border-top border-lightgray pt-3 pb-3">
						<div class="col-1"><%=bnv.getNotNo()%></div>
<%-- 						<div class="col-1"><%=bnv.getMemId()%></div> --%>
						<div class="col-9">
							<a href="./detail.do?notNo=<%=bnv.getNotNo()%>"><%=bnv.getNotTitle()%></a>
						</div>
						<div class="col-2"><%=bnv.getNotDate()%></div>
					</div>
					<div
						class="col-12 d-flex text-center border-1 border-top border-lightgray pt-3 pb-3"
						style="height: 300px">
						<div class="col-1">내용</div>
						<div class="col-9"><%=bnv.getNotContent()%></div>
						<div class="col-2"></div>
					</div>

					<div class="border-1 border-dark border-top"></div>

					<div class="row">
						<div class="col-12">
							<button type="button" class="btn btn-outline-primary btn-sm"
								id="write">
								<a href="./list.do">목록
							</button>
							<%
								if ("admin".equals(memId1)) {
							%>
							<button type="button" class="btn btn-outline-primary btn-sm me-2"
								id="write">
								<a href="./delete.do?notNo=<%=bnv.getNotNo()%>">게시글 삭제
							</button>
							<button type="button" class="btn btn-outline-primary btn-sm me-2"
								id="write">
								<a href="./update.do?notNo=<%=bnv.getNotNo()%>">게시글 수정
							</button>
							<%
								} else {
							}
							%>
						</div>
					</div>

					<!-- 게시판 영역 끝 -->

				</div>
			</div>
		</div>
	</div>

	<!-- aside2 영역 -->
	<%@include file="/views/home/aside2.jsp"%>

	<hr>

	<!-- footer 영역 -->
	<%@include file="/views/home/footer.jsp"%>

</body>
</html>