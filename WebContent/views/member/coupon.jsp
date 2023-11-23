<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	MemberVO mv = (MemberVO) request.getAttribute("mv");
// 	String memId = (String) session.getAttribute("memId");
%>   


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 회원 - 쿠폰함</title>
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
            <h2><b>🛫𝙈𝙔 𝙋𝘼𝙂𝙀🤸</b></h2> <br>
            <li><a href="<%=request.getContextPath()%>/member/mempasscheck.do"><b>💙   회원 정보 변경</b></a></li>
            <li><a href="<%=request.getContextPath()%>/res/memreslist.do"><b>💙   나의 예약 내역</b></a></li>
            <li><a href="<%=request.getContextPath()%>/acco/review/detail.do?memId=<%=memId%>"><b>💙   나의 리뷰 작성내역</b></a></li>
            <li><a href="<%=request.getContextPath()%>/views/member/coupon.jsp"><b>💙   내 쿠폰함</b></a></li>
            <li><a href="<%=request.getContextPath()%>/acco/wishlist.do"><b>💙   위시리스트</b></a></li>
       
        </ul>
    </div>
    
    <div class="col-sm-8 main-content">
       <h3 id="he3" style="color:black"><b>🍊내 쿠폰함🍊</b></h3> <br><br>
				<img src="/JejuOlleh/images/coupon/coupon1.jpg" class="card-img-top" alt=" ">
			</div>
		</div>

<!-- footer 영역 -->
	<%@include file="/views/home/footer.jsp"%>

</body>
</html>