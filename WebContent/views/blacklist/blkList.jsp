<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.blacklist.vo.BlacklistVO"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<BlacklistVO> blacklistList = (List<BlacklistVO>) request.getAttribute("blacklistList");
	
	String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
	session.removeAttribute("msg");
%>   


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 블랙리스트 관리</title>
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
 
  height: 1000px;
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
            <li><a href="<%=request.getContextPath()%>/blacklist/list.do"><b>💙   블랙리스트 관리</b></a></li>
            <li><a href="<%=request.getContextPath()%>/ListController"><b>💙   놀거리 게시물 관리</b></a></li> 
            <li><a href="<%=request.getContextPath()%>/RestListController"><b>💙   맛집 게시물 관리</b></a></li>
        </ul>
    </div>
    
    <div class="col-sm-8 main-content">
        <h3 align="center" id="he3"><b>🚫블랙리스트 관리🚫</b></h3> <br>
	<table border="1" align="center">
		<tr>
			<th>번호</th>
			<th>신고자</th>
			<th>신고내용</th>
			<th>신고일</th>
			<th>정지일수</th>
			
		</tr>

<%
	int blacklistSize = blacklistList.size();
	if(blacklistSize == 0) {
%>	

	<tr>
		<td colspan='6'>블랙리스트 회원이 없습니다.</td>
	</tr>
<%
	}else {
		for(BlacklistVO bv : blacklistList) {
%>

	<tr>
<%-- 		<td><a href="<%=request.getContextPath()%>/admin/detail.do?memId=<%=mv.getMemId() %>"><%=mv.getMemId() %></a></td> --%>
		<td><%=bv.getBlkNo() %></td>
		<td><%=bv.getMemId() %></td>
		<td><a href="<%=request.getContextPath()%>/blacklist/detail.do?blkNo=<%=bv.getBlkNo() %>"><%=bv.getBlkContent() %></a></td>
		<td><%=bv.getBlkDate() %></td>
		<td><%=bv.getBlkDays() %></td>
	</tr>
<%
		}
	}

%>

	</table>

		
	<br><br>
	<div align="center">
	
		<br>
    	
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