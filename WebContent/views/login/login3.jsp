<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="/JejuOlleh/css/login/login4.css">

</head>

<body>
	<div class="container" id="container">
		
		<div class="form-container sign-in-container">
			<form action="/JejuOlleh/Login" class="signin-form" method="post">
				<h1>Log in</h1>
				<hr class="mb-4">
				
					<input type="text" class="form-control" id="memId" name="memId"
						placeholder="Username" required="">
				 <input id="password-field" type="password" class="form-control" 
                               placeholder="Password" id="pass" name="memPass" required="">
                                <a href="/JejuOlleh/views/login/findPw.jsp">비밀번호를 잊어버리셨나요?</a>
				  <button type="submit" class="form-control btn btn-primary submit px-3"
                               id="loginForm" >로그인</button>
			</form>
		</div>
		<div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-left">
					<h1>Welcome Back!</h1>
					<p>제주올레와 함께하세요~</p>
										<a href="/JejuOlleh/views/login/login22.jsp">
					<button class="ghost" id="signUp" style="background-color: white;" onclick="" >회원가입</button>
					</a>
				</div>
				<div class="overlay-panel overlay-right">
					<h1>WELCOME <br> JEJUOLLEH!</h1>
					
					<p>제주 올레와 함께하세요~ 😘</p>
					<a href="/JejuOlleh/views/login/login22.jsp">
					<button class="ghost" id="signUp" onclick="" >회원가입</button>
					</a>
				</div>
			</div>
		</div>
	</div>

	<script src="/JejuOlleh/js/login/login4.js"></script>
</body>
</html>
