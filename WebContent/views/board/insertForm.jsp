<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
	<!-- <form action="insert.do" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>제목:</td>
				<td><input type="text" name="boardTitle" value=""></td>
			</tr>
			<tr>
				<td>작성자:</td>
				<td><input type="text" name="boardWriter" value=""></td>
			</tr>
			<tr>
				<td>내용:</td>
				<td><input type="text" name="boardContent" value=""></td>
			</tr>
			
		</table>
		<input type="submit" value="게시글 등록">
	</form> -->
	
	<form action="insert.do" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>제목:</td>
				<td><input type="text" name="notTitle" value=""></td>
			</tr>
			<tr>
				<td>작성자:</td>
				<td><input type="text" name="memId" value=""></td>
			</tr>
			<tr>
				<td>내용:</td>
				<td><input type="text" name="notContent" value=""></td>
			</tr>
			
		</table>
		<input type="submit" value="게시글 등록">
	</form>
</body>
</html>