<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	MemberVO mv = (MemberVO) request.getAttribute("mv");
%>  


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 호스트 정보 상세 보기</title>
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
<%--             <li><a href="<%=request.getContextPath()%>/blacklist/list.do"><b>💙   블랙리스트 관리</b></a></li> --%>
            <li><a href="<%=request.getContextPath()%>/ListController"><b>💙   놀거리 게시물 관리</b></a></li> 
            <li><a href="<%=request.getContextPath()%>/RestListController"><b>💙   맛집 게시물 관리</b></a></li> 
        </ul>
    </div>
    
    <div class="col-sm-8 main-content">
       <h3 align="center" id="he3" style="color:black"id="he3" style="color:black"><b>🕺<%=mv.getMemName() %> 호스트님의 상세정보 조회💃</b></h3>
    	<br>
    	<table border="1">
		<tr>
			<td>🔑   아이디:</td>
			<td><%=mv.getMemId() %></td>
		</tr>
		
		<tr>
			<td>🔑   패스워드:</td>
			<td><%=mv.getMemPass() %></td>
		</tr>
		
		<tr>
			<td>🔑   이름:</td>
			<td><%=mv.getMemName() %></td>
		</tr>
		
		<tr>
			<td>🔑   생일:</td>
			<td><%=mv.getMemBir() %></td>
		</tr>
		
		<tr>
			<td>🔑   이메일:</td>
			<td><%=mv.getMemMail() %></td>
		</tr>
		
		<tr>
			<td>🔑   전화번호:</td>
			<td><%=mv.getMemHp() %></td>
		</tr>
		
		<tr>
			<td>🔑   우편번호:</td>
			<td><%=mv.getMemZip() %></td>
		</tr>
		
		<tr>
			<td>🔑   주소:</td>
			<td><%=mv.getMemAdd1() %></td>
		</tr>
		
		<tr>
			<td>🔑   상세주소:</td>
			<td><%=mv.getMemAdd2() %></td>
		</tr>
		
		<tr>
			<td>🔑   회원구분:</td>
			<td><%=mv.getMemAth() %></td>
		</tr>
		
		<tr>
			<td>🔑   승인여부:</td>
			<td><%=mv.getMemCf() %></td>
		</tr>
		<tr>
			
			
		</tr>		
		
<!-- 		<tr align="center"> -->
<!-- 			<td colspan="2"> -->
<!-- 			<button><a href="./list.do">회원조회로 돌아가기</a></button> -->
<%-- 			<a href="./update.do?memId=<%=mv.getMemId() %>">[회원 수정]</a> --%>
<%-- 			<a href="./delete.do?memId=<%=mv.getMemId() %>">[회원 삭제]</a> --%>
<!-- 			</td> -->
<!-- 		</tr> -->
	</table>


	<br>
	
	<!-- !!!!!!!!!!!!!!!!!!버튼 a태그말고 자바스크립트로 링크 연결하기!!!!!!!!!!!!!! alert창도 띄워주기!!!!!!!!!!!-->
	
	<div align="center">
	<button type="button" class="btn btn-light" style="background-color: #79C4F2; border-color: #79C4F2;" onclick="location='<%=request.getContextPath()%>/admin/hostlist.do'">목록</button>
	<button type="button" class="btn btn-light" style="background-color: #79C4F2; border-color: #79C4F2;" onclick="location='<%=request.getContextPath()%>/admin/updatehost.do?memId=<%=mv.getMemId() %>'">회원 수정</button>
	<button type="button" id="delBtn" class="btn btn-light" style="background-color: #79C4F2; border-color: #79C4F2;" onclick="return delOk2()">회원 삭제</button>
<%-- 	<button type="button" class="btn btn-info" id="delBtn" onclick="location='<%=request.getContextPath()%>/admin/deletehost.do?memId=<%=mv.getMemId() %>'">회원 삭제</button> --%>
	</div>
	
        </div>
    </div>
</div>

<!-- footer 영역 -->
	<%@include file="/views/home/footer.jsp"%>
	
<script>

document.getElementById('delBtn').addEventListener('click', delOk);


	function delOk2() {
	    if (confirm('삭제하시면 복구할 수 없습니다. \n 정말로 삭제하시겠습니까?')) {
	      alert('<%=mv.getMemName() %>회원이 삭제되었습니다!');
	      window.location.href = "<%=request.getContextPath()%>/admin/deletehost.do?memId=<%=mv.getMemId() %>";
	      return true; // Proceed with the navigation
	    } else {
	      alert('삭제 요청이 취소되었습니다!');
	      location.reload();
	      return false; // Cancel the navigation
	    }
	  }



	

</script>

</body>
</html>