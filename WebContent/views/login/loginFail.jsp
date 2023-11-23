<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
<%
	String errorCode = request.getParameter("errorCode");
	if("01".equals(errorCode)) {
%>
alert('관리자의 승인 대기중입니다....');
<%
	} else if("02".equals(errorCode)) {
%>
alert('비밀번호가 일치하지 않습니다');
<%
	}
%>
document.location.href = '/JejuOlleh/index.do';
</script>
</body>
</html>