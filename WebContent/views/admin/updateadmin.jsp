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
<title>관리자 - 관리자 정보 수정</title>
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
        <form onsubmit="updateOk()" action="<%=request.getContextPath() %>/admin/updateadmin.do?memId=<%=mv.getMemId() %>" method="post">

<%-- 	<form action="<%=request.getContextPath() %>/admin/updateadmin.do" method="post"> <!-- 절대경로 --> --%>
	  <h3 id="he3" style="color:black"><b>🔐관리자 정보 변경🔐</b></h3>
	  <hr>
	  
	    <div>
	      <label for="id" class="control-label col-sm-2">🔑   아이디</label>
	      <input type="hidden" name="memId" value="<%=mv.getMemId()%>" />
	      <%=mv.getMemId()%>
	    </div>
	    
	    <div class="form-group">
	      <label for="pass" class="control-label col-sm-2">🔑   비밀번호</label>
	        <input type="password" class="col-sm-4" id="pass" name="memPass" placeholder="변경할 비밀번호를 입력해주세요.">

	    </div>
	    
	    <div class="form-group">
	      <label for="name" class="control-label col-sm-2">🔑   이름</label>
	      <span class="sp"></span>
	        <%=mv.getMemName()%>
	    </div>
	    
	    <div class="form-group">
	      <label for="mail" class="control-label col-sm-2">🔑   이메일</label>
	      <%=mv.getMemMail()%>
	    </div>
	    
	    
	    <br>
	    <div class="form-group">
	      <div align="center">
                <input type="submit" class="btn btn-light" style="background-color: #79C4F2; border-color: #79C4F2;" value="수정">
                <button type="button" class="btn btn-secondary" id="canBtn" onclick="location='<%=request.getContextPath()%>/admin/mypage.do'">취소</button>
            </div>
	    </div>
  
  </form>
  	</div>
  
    </div>
</div>

<!-- footer 영역 -->
	<%@include file="/views/home/footer.jsp"%>
	
<script>


	function updateOk(){
	    if(confirm('수정하시겠습니까?')){
	       alert("관리자 정보가 수정되었습니다!");
	       return true;
	       
	    }else {
	    	alert("요청이 취소되었습니다.");
	    	event.preventDefault(); // 양식 제출을 취소합니다.
	    	location.reload();
	    	return false;
	    }
	}
	
</script>	
	

</body>
</html>