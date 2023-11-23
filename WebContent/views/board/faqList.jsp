<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="kr.or.ddit.board.vo.BoardFaqVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<BoardFaqVO> boardFaqList = (List<BoardFaqVO>) request.getAttribute("boardFaqList");

	String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
	session.removeAttribute("msg");
	
	MemberVO mv = (MemberVO) request.getAttribute("mv");
	Object memId1 = session.getAttribute("memId");
	Object memPass1 = session.getAttribute("memPass");
%>

<!DOCTYPE html>
<html>
<head>
<title>FAQ 목록</title>
<meta charset="UTF-8">

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
						style="font-size: 2rem; padding-bottom:20px;">자주 묻는 질문</p>
					</div>
					<!-- 메인 제목 영역 끝 -->

					<!-- 커뮤니티 탭 영역 시작 -->
<!-- 					<div class="p-3"></div> -->
					<div class="tabcontainer d-flex justify-content-center">
						<div class="ms-5 me-5">
						<a href="<%=request.getContextPath()%>/boardNot/list.do">공지사항 </a></div>
<!-- 						<div>|</div> -->
						<div class="ms-5 me-5" ><a href="<%=request.getContextPath()%>/boardFaq/list.do" 
						style="color:#007bff; border-bottom: 2px solid #007bff; padding-bottom:5px;">자주 묻는 질문 </a></div>
<!-- 						<div>|</div> -->
						<div class="ms-5 me-5"><a href="<%=request.getContextPath()%>/boardAsk/list.do" >1:1문의</a></div>
<!-- 						<div>|</div> -->
					</div>
					<!-- 커뮤니티 탭 영역 끝 -->

					<div class="p-5"></div>

					<!-- 게시판 영역 시작 -->
					<div
						class="col-12 d-flex text-center border-1 border-top border-dark pt-3 pb-3" id="boardTitle">
						<div class="col-1">번호</div>
<!-- 						<div class="col-1">작성자</div> -->
						<div class="col-9">제목</div>
						<div class="col-2">등록일</div>
					</div>
					<div class="border-1 border-dark border-top"></div>
					
					<%
						int boardSize = boardFaqList.size();
						if (boardSize == 0) {
					%>
					
					<div>
						<p>자주 묻는 질문이 존재하지 않습니다.</p>
					</div>
					
					<%
						} else {
						for (BoardFaqVO bfv : boardFaqList) {
					%>
					
					<div
						class="col-12 d-flex text-center border-1 border-top border-lightgray pt-3 pb-3">
						<div class="col-1"><%=bfv.getFaqNo()%></div>
<%-- 						<div class="col-1"><%=bfv.getMemId()%></div> --%>
						<div class="col-9">
							<a href="./detail.do?faqNo=<%=bfv.getFaqNo()%>"><%=bfv.getFaqTitle()%></a>
						</div>
						<div class="col-2"><%=bfv.getFaqDate()%></div>
					</div>
					
					<%
						}
					}
					%>
					
					<div class="border-1 border-dark border-top"></div>

					<%if("admin".equals(memId1)){
					%>
					<div class="row">
						<div class="col-12">
							<button type="button" class="btn btn-outline-primary btn-sm"
								id="write"><a href="insert.do">게시글쓰기</button>
						</div>
					</div>
					<%
						}else{		
						}
					%>
					
					<%
						if (msg.equals("성공")) {
					%>
					
					<script>
						alert('정상적으로 처리되었습니다.');
					</script>
				
					<%
						}
					%>
					<!-- 게시판 영역 끝 -->

					<!-- 게시판 네비게이션 영역 시작 -->
					<div class="col-12 d-flex justify-content-center pt-4">
						<div class="me-3">1</div>
						<div class="me-3">2</div>
						<div>3</div>
					</div>
					<!-- 게시판 네비게이션 영역 끝 -->

				</div>
				<!-- 메인 콘텐츠 영역 끝 -->

				<!-- 어사이드 영역2 시작 -->
				<div class="col-2"></div>
				<!-- 어사이드 영역2 끝 -->
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