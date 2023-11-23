<%@page import="kr.or.ddit.activity.vo.ActivityVO"%>
<%@page import="kr.or.ddit.board.vo.BoardAnswerVO"%>
<%@page import="kr.or.ddit.board.vo.BoardAskVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<ActivityVO> activityList = (List<ActivityVO>) request.getAttribute("activityList");
	
	String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
	session.removeAttribute("msg");
%>

<!DOCTYPE html>
<html>
<head>
<title>놀거리 게시물 목록</title>
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
<!-- <link href="./vendor/datatables/dataTables.bootstrap4.min.css"	rel="stylesheet"> -->
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
			<button type="button" style="border:none;" onclick="location.href='<%=request.getContextPath()%>/InsertController';">
				<h6 class="m-0 font-weight-bold text-primary">게시물 추가</h6>
			</button>
			<button type="button" style="border:none;" onclick="location.href='<%=request.getContextPath()%>/boardFaq/list.do';">
				<h6 class="m-0 font-weight-bold text-primary"></h6>
			</button>
			<button type="button" style="border:none;">
				<h6 class="m-0 font-weight-bold text-primary"></h6>
			</button>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>제목</th>
							<th>위치</th>
							<th>전화번호</th>
							<th>소개</th>
							<th>종류</th>
						</tr>
					</thead>

					<%
						int activitySize = activityList.size();
						if (activitySize == 0) {
					%>

					<tr>
						<td colspan='8'>게시물이 존재하지 않습니다.</td>
					</tr>
					
					<%
						} else {
						for (ActivityVO act : activityList) {
					%>

					<tbody>
						<tr>
							<td><a href="./DetailController?actNo=<%=act.getActNo()%>"><%=act.getActName()%></a></td>
							<td><%=act.getActLoc()%></td>
							<td><%=act.getActTel()%></td>
							<td><%=act.getActIntro()%></td>
							<td><%=act.getActCate()%></td>
							
							
						</tr>

					</tbody>

					<%
						}
					}
					%>
					
					<tr align="center">
					<td colspan="8"><a href="InsertController">[게시글쓰기]</a></td>
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
						<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
							<ul class="pagination">
								<li class="paginate_button page-item previous disabled" id="dataTable_previous">
									<a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">이전</a>
								</li>
								<li class="paginate_button page-item active">
									<a href="#" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">1</a>
								</li>
								<li class="paginate_button page-item ">
									<a href="#" aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page-link">2</a>
								</li>
								<li class="paginate_button page-item ">
									<a href="#" aria-controls="dataTable" data-dt-idx="3" tabindex="0" class="page-link">3</a>
								</li>
								<li class="paginate_button page-item ">
									<a href="#" aria-controls="dataTable" data-dt-idx="4" tabindex="0" class="page-link">4</a>
								</li>
								<li class="paginate_button page-item ">
									<a href="#" aria-controls="dataTable" data-dt-idx="5" tabindex="0" class="page-link">5</a>
								</li>
								<li class="paginate_button page-item next" id="dataTable_next">
									<a href="#" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">다음</a>
								</li>
							</ul>
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