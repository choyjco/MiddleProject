<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	MemberVO mv = (MemberVO) request.getAttribute("mv");
	String memId1 = (String) session.getAttribute("memId");
	String memPass1 = (String) session.getAttribute("memPass");
%>   


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수정(비밀번호 확인)</title>
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
    
    <div class="col-sm-8 main-content" id="maindiv">
       <div id="maininner">
        <form onsubmit="passCheck();" action="<%=request.getContextPath() %>/member/update.do?memId=<%=memId %>" method="post">
		<div class="control-label col-sm-8">
			<h3 id="he3" style="color:black"><b>🔐비밀번호 확인🔐</b></h3>
			<br><br>
				회원 정보를 수정합니다.
				<br>
				비밀번호를 다시 입력해주세요!
				<br><br>
				<input type="password" name="memPass" placeholder="현재 비밀번호를 입력해주세요!" class="control-label col-sm-7">
				<br><br>
				<input type="submit" class="btn btn-light" style="background-color: #79C4F2; border-color: #79C4F2;" value="확인">
				<button type="button" class="btn btn-secondary" onclick="location='<%=request.getContextPath() %>/member/mypage.do'" id="canBtn">마이페이지로 이동</button>
			</div>
			</div>
        </div>
			</form>
    </div>
</div>
</div>
<!-- footer 영역 -->
	<%@include file="/views/home/footer.jsp"%>
	
<script>

		
	function passCheck() {
	    var memPass = '<%= memPass1 %>'; // 세션에서 회원의 비밀번호 가져오기
	    var inputPass = document.getElementsByName('memPass')[0].value; // 입력된 비밀번호 가져오기
	
	    if (inputPass.trim() === memPass.trim()) { // 비밀번호 비교 (trim() 함수를 사용하여 공백 제거)
	      // 비밀번호 일치
	//       alert('비밀번호 일치');
	    
	    } else {
	      // 비밀번호 불일치
	      alert('비밀번호가 일치하지 않습니다!');
	      event.preventDefault(); // 비밀번호가 일치하지 않을 경우 폼 제출 방지
	      location.reload();
	    }
	  }

</script>

</body>
</html>