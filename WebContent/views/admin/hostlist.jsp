<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<MemberVO> memList = (List<MemberVO>)request.getAttribute("memList");


%>    


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 호스트 전체 조회</title>
<link href="/JejuOlleh/css/reset.css" rel="stylesheet">
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

body, #sidemenu, #he3, .main-content {
  font-family: 'GmarketSansMedium';
}

#sidemenu ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  width: 15%;
  background-color: white;
  position: fixed;
  height: 100%;
  overflow: auto;
}

#sidemenu li a {
  display: block;
  color: #000;
  padding: 8px 16px;
  text-decoration: none;
}

#sidemenu li a:hover:not(.active) {
  background-color: #99D0F2;
  color: white;
}

.main-content {
 
  height: 1500px;
  margin-bottom: 20px;
}

table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  text-align: left;
  padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
  background-color: #79C4F2;
}

</style>

</head>

<body>

	<!-- 헤더 코드 위치 -->
	<%@include file="/views/home/header.jsp"%>

	<!-- 메뉴바 코드 위치 -->
	<%@include file="/views/home/menubar.jsp"%>
	

<div class="container" style="margin-top:30px">
  <div class="row">
    <div class="col-sm-4" style="font-size: large">
        <ul id="sidemenu">
            <h2><b>🙋‍♂️𝘼𝘿𝙈𝙄𝙉 𝙋𝘼𝙂𝙀🙋‍♀️‍</b></h2> <br>
            <li><a href="<%=request.getContextPath()%>/admin/updateadmin.do?memId=admin"><b>💙   관리자 정보 변경</b></a></li>
            <li><a href="<%=request.getContextPath()%>/boardNot/list.do"><b>💙   커뮤니티 관리</b></a></li>
            <li><a href="<%=request.getContextPath()%>/admin/list.do"><b>💙   회원 관리</b></a></li>
            <li><a href="<%=request.getContextPath()%>/admin/hostlist.do"><b>💙   호스트 관리</b></a></li>
<%--             <li><a href="<%=request.getContextPath()%>/blacklist/list.do"><b>💙   블랙리스트 관리</b></a></li> --%>
            <li><a href="<%=request.getContextPath()%>/ListController"><b>💙   놀거리 게시물 관리</b></a></li> 
            <li><a href="<%=request.getContextPath()%>/RestListController"><b>💙   맛집 게시물 관리</b></a></li> 
        </ul>
    </div>
    
    <div class="col-sm-8 main-content">
       <h3 id="he3" style="color:black" align="center"><b>🕺호스트 회원 조회💃</b></h3> <br>
	<table border="1" align="center">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>회원구분</th>
			<th>호스트 승인</th>
			
		</tr>

<%
	int boardSize = memList.size();
	if(boardSize == 0) {
%>	

	<tr>
		<td colspan='5'>해당하는 회원이 없습니다.</td>
	</tr>
<%
	}else {
		for(MemberVO mv : memList) {
%>

	<tr>
		<td><a href="<%=request.getContextPath()%>/admin/detailhost.do?memId=<%=mv.getMemId() %>"><%=mv.getMemId() %></a></td>
		<td><%=mv.getMemName() %></td>
		<td><%=mv.getMemMail() %></td>
		<td><%=mv.getMemHp() %></td>
		<td><%=mv.getMemAth() %></td>
		<td><%=mv.getMemCf() %></td>
	</tr>
<%-- 		<td><a href="./postdetail.do?boardNo=<%=bv.getBoardNo() %>"><%=bv.getBoardTitle() %></a></td> --%>
<%
		}
	}

%>
	<!-- <tr align="center">
		<td colspan="7">
		<select id="option">
        <option value="0">선택</option>
        <option value="1">작성자</option>
        <option value="2">제목</option>
    </select>
		<input><input type="submit" value="조회" id="search"></td>
	</tr> -->
	
	</table>
		<br>
		

	<div align="center">
		<span>ID를 누르면 상세페이지로 이동합니다</span>
		<br>
		<hr>
		<select id="option" align="center">
        <option value="0">선택</option>
        <option value="1">ID</option>
        <option value="2">이름</option>
    </select>
    	
		<input><input type="submit" value="조회" id="search">
		<br>
	</div>
	
    </div>
    </div>
</div>

<!-- footer 영역 -->
	<%@include file="/views/home/footer.jsp"%>

</body>
</html>