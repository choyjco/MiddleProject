<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="/JejuOlleh/css/login/login3.css">


<style>
.btn_login, .btn_sign_up {
	border-radius: 20px;
}

</style>

</head>


<body>

	<div class="container" id="container">

		<div class="overlay-panel overlay-left">
				<h1>호스트</h1>
				<p>🏡</p>
				<a href="/JejuOlleh/views/login/join.jsp">
					<button class="ghost2" id="signUp" style="color: #4169E1; onclick="">회원가입</button>
				</a>	
		</div>
		<div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-left">
					<h1>Welcome Back!</h1>
					<p>제주올레와 함께하세요~</p>
					<a href="/JejuOlleh/views/login/join.jsp">
						<button class="ghost" id="signUp" onclick="">회원가입</button>
					</a>
				</div>
				<div class="overlay-panel overlay-right">
					<h1>일반회원</h1>
					<p>👪</p>
					<a href="/JejuOlleh/views/login/join2.jsp">
						<button class="ghost" id="signUp" onclick="">회원가입</button>
					</a>
				</div>
			</div>
		</div>
	</div>
<!-- 	<script src="/JejuOlleh/js/login/login2.js"></script> -->
</body>
</html>