<%@page import="kr.or.ddit.board.vo.BoardNotVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<BoardNotVO> boardNotList = (List<BoardNotVO>) request.getAttribute("boardNotList");

String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
session.removeAttribute("msg");
%>

<!DOCTYPE html>
<html>
<head>
<title>공지사항 검색결과</title>
<meta charset="UTF-8">
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content=""> -->

<!-- Custom fonts for this template -->
<!-- <link href="/JejuOlleh/css/board.min.css" rel="stylesheet" type="text/css"> -->
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/JejuOlleh/css/boardstyle.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="/JejuOlleh/css/board.bootstrap4.min.css" rel="stylesheet">

<style>
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

	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<button type="button">
				<h6 class="m-0 font-weight-bold text-primary">공지사항</h6>
			</button>
			<button type="button"
				onclick="location.href='<%=request.getContextPath()%>/boardFaq/list.do';">
				<h6 class="m-0 font-weight-bold text-primary">FAQ</h6>
			</button>
			<button type="button"
				onclick="location.href='<%=request.getContextPath()%>/boardAsk/list.do';">
				<h6 class="m-0 font-weight-bold text-primary">문의게시판</h6>
			</button>
		</div>

		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>번호</th>
							<th>작성자</th>
							<th>제목</th>
							<!-- <th>내용</th> -->
							<th>작성일</th>
						</tr>
					</thead>

					<%
						int boardSize = boardNotList.size();
					if (boardSize == 0) {
					%>

					<tr>
						<td colspan='4'>공지사항이 존재하지 않습니다.</td>
					</tr>

					<%
						} else {
					for (BoardNotVO bnv : boardNotList) {
					%>

					<tbody>
						<tr>
							<td><%=bnv.getNotNo()%></td>
							<td><%=bnv.getMemId()%></td>
							<td><a href="./detail.do?notNo=<%=bnv.getNotNo()%>"><%=bnv.getNotTitle()%></a></td>
							<%-- <td><%=bnv.getNotContent()%></td> --%>
							<td><%=bnv.getNotDate()%></td>
						</tr>
					</tbody>

					<%
						}
					}
					%>

					<tr align="center">
						<td colspan="5"><a href="insert.do">[게시글쓰기]</a></td>
					</tr>
				</table>

				<%
					if (msg.equals("성공")) {
				%>

				<script>
					alert('정상적으로 처리되었습니다.');
				</script>

				<%
					}
				%>

			</div>

			<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
				<div class="row">

					<div class="col-sm-12 col-md-7">
						<div class="dataTables_paginate paging_simple_numbers"
							id="dataTable_paginate">
							<ul class="pagination">
								<li class="paginate_button page-item previous disabled"
									id="dataTable_previous"><a href="#"
									aria-controls="dataTable" data-dt-idx="0" tabindex="0"
									class="page-link">이전</a></li>
								<li class="paginate_button page-item active"><a href="#"
									aria-controls="dataTable" data-dt-idx="1" tabindex="0"
									class="page-link">1</a></li>
								<li class="paginate_button page-item "><a href="#"
									aria-controls="dataTable" data-dt-idx="2" tabindex="0"
									class="page-link">2</a></li>
								<li class="paginate_button page-item "><a href="#"
									aria-controls="dataTable" data-dt-idx="3" tabindex="0"
									class="page-link">3</a></li>
								<li class="paginate_button page-item "><a href="#"
									aria-controls="dataTable" data-dt-idx="4" tabindex="0"
									class="page-link">4</a></li>
								<li class="paginate_button page-item "><a href="#"
									aria-controls="dataTable" data-dt-idx="5" tabindex="0"
									class="page-link">5</a></li>
								<li class="paginate_button page-item next" id="dataTable_next">
									<a href="#" aria-controls="dataTable" data-dt-idx="7"
									tabindex="0" class="page-link">다음</a>
								</li>
							</ul>
						</div>
					</div>

					<!-- <div class="col-sm-12 col-md-6">
						<div id="dataTable_filter" class="dataTables_filter">
							<label> <input type="search"
								class="form-control form-control-sm" placeholder=""
								aria-controls="dataTable">
								<button type="button">검색</button>
							</label>
						</div>
					</div> -->

					<div class="search_wrap">
						<div class="search_area">
							<input type="text" name="notContent" value="${notContent}">
							<button>Search</button>
						</div>
					</div>

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