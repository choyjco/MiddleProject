<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	MemberVO mv = (MemberVO) request.getAttribute("mv");
	Object memId1 = session.getAttribute("memId");
	Object memPass1 = session.getAttribute("memPass");
%>   


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호스트 회원 정보 수정</title>
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
             <h2><b>🛫𝙃𝙊𝙎𝙏 𝙋𝘼𝙂𝙀🏰</b></h2> <br>
            <li><a href="<%=request.getContextPath()%>/host/hostpasscheck.do"><b>💙   호스트 정보 변경</b></a></li>
            <li><a href="<%=request.getContextPath()%>/host/acco/list.do?memId=<%=memId%>"><b>💙   내 숙소 리스트</b></a></li>
 			<li><a href="<%=request.getContextPath()%>/acco/wishlist.do"><b>💙   위시리스트</b></a></li>        
 			</ul>
    </div>
    
    <div class="col-sm-8 main-content">
        <%-- 	<form action="<%=request.getContextPath() %>/admin/update.do" method="post" enctype="multipart/form-data"> <!-- 절대경로 --> --%>
	<form onsubmit="updateOk()" action="<%=request.getContextPath() %>/host/update.do" method="post"> <!-- 절대경로 -->
	  <h3 id="he3" style="color:black"><b>🔐호스트 회원 정보 수정🔐</b></h3>
	  <hr>
	  
	    <div>
	      <label for="id" class="control-label col-sm-3">🔑   아이디</label>
	      <input type="hidden" name="memId" value="<%=mv.getMemId()%>" />
	      <%=mv.getMemId()%>
	    </div>
	    
	    <div class="form-group">
	      <label for="pass" class="control-label col-sm-3">🔑   비밀번호</label>
	        <input type="password" class="col-sm-3" id="pass" name="memPass" placeholder="변경시에만 입력">
	    </div>
	    
	    <div class="form-group">
	      <label for="name" class="control-label col-sm-3">🔑   이름</label>
	      <span class="sp"></span>
	        <%=mv.getMemName()%>
	    </div>
	    
	    <div class="form-group">
	      <label for="bir" class="control-label col-sm-3">🔑   생년월일</label>
	      <%=mv.getMemBir()%>
	    </div>
	    
	    <div class="form-group">
	      <label for="hp" class="control-label col-sm-3">🔑   연락처</label>
	        <input type="text" class="col-sm-3" id="hp" name="memHp" placeholder="<%=mv.getMemHp()%>">
	        <!-- required pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" -->
	    </div>
	    
	    <div class="form-group">
	      <label for="mail" class="control-label col-sm-3">🔑   이메일</label>
	      <%=mv.getMemMail()%>
	    </div>
	    
	    <div class="form-group">
	      <label for="zip" class="control-label col-sm-3">🔑   우편번호</label>
	        <input type="text" class="col-sm-2" id="postAddr" name="memZip" placeholder="<%=mv.getMemZip() %>">
	        <button type="button" id="addrBtn" class="btn btn-light btn-sm" style="background-color: #79C4F2; border-color: #79C4F2;">주소 검색</button>
	    </div>
	    
	    <div class="form-group">
	      <label for="add1" class="control-label col-sm-3">🔑   주소</label>
	        <input type="text" class="col-sm-5" id="addr1" name="memAdd1" placeholder="<%=mv.getMemAdd1()%>">
	    </div>
	    
	    <div class="form-group">
	      <label for="add2" class="control-label col-sm-3">🔑   상세주소</label>
	        <input type="text" class="col-sm-5" id="addr2" name="memAdd2" placeholder="<%=mv.getMemAdd2()%>">
	    </div>
	    
	    <div class="form-group">
	      <label for="cf" class="control-label col-sm-3">🔑   호스트 승인여부</label>
	        <input type="hidden" class="col-sm-5" id="addr2" name="memCf" value="<%=mv.getMemCf()%>">
	        <%=mv.getMemCf() %>
	    </div>
	    
  		<div align="center">
    	회원 탈퇴를 원하시나요?&#128549; <a href="<%=request.getContextPath()%>/host/hostpasscheckw.do">탈퇴하기</a>
    	</div>
    	
    	<br>
    	
	    <div class="form-group">
               <div>
            <div align="center">
                <input type="submit" class="btn btn-light" style="background-color: #79C4F2; border-color: #79C4F2;" value="수정">
<!--                 <button onclick="history.back()">취소</button> -->
                <button type="button" class="btn btn-secondary" onclick="location='<%=request.getContextPath() %>/host/mypage.do'" id="canBtn">취소</button>

            </div>
            </div>
    	
    	
	      </div>
	    </div>
  	</div>
    </form>
</div>
</div>

<!-- footer 영역 -->
	<%@include file="/views/home/footer.jsp"%>
	
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

	document.getElementById('addrBtn').addEventListener('click', sample4_execDaumPostcode);
	
	function sample4_execDaumPostcode() {
	  new daum.Postcode({
	    oncomplete: function(data) {
	      var roadAddr = data.roadAddress; 
	
	      // 자바스크립트에서 요소를 가져와 값을 할당
	      document.getElementById('postAddr').value = data.zonecode;
	      document.getElementById('addr1').value = roadAddr;
	    }
	  }).open();
	}
	

	/* $('#addrBtn').on('click', sample4_execDaumPostcode);

	function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {

            var roadAddr = data.roadAddress; 

            document.getElementById('postAddr').value = data.zonecode;
            document.getElementById("addr1").value = roadAddr;
        	}
    	}).open();
	} */

	function updateOk(){
	    if(confirm('수정하시겠습니까?')){
	       alert("호스트 정보가 수정되었습니다!");
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