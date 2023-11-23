<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>신고 사유</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<style>
#idbtn {
	display: "flex";
	flexwrap: "wrap";
	align-content: "flex-end";
}

.btn-block {
	display: block;
	width: 20%;
}

body {
	min-height: 100vh;
	background: -webkit-gradient(linear, left bottom, right top, from(#92b5db),
		to(#1d466c));
	background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
}

.input-form {
	max-width: 680px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}

.form-control {
	display: block;
	width: 100%;
	height: calc(8.5em + 0.75rem + 2px);
	padding: 0.375rem 0.75rem;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: 0.25rem;
}

p {
	margin-top: 0;
	margin-bottom: 1;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body class="img js-fullheight vsc-initialized"
	style="background-image: url('/JejuOlleh/images/login/bg.jpg'); height: 700px;">


	<div class="input-form col-md-12 mx-auto">
		<h4 class="mb-3">신고 하기</h4>

		<form
			action="<%=request.getContextPath()%>/InsertBlacklistController"
			method="post" enctype="multipart/form-data">

			<p style="font-size: 1em; color: red;">** 신고대상자의 이용이 제한되므로 정확한
				사유를 기재해주시기 바랍니다.</p>
			<table>
				<tr>
					<td valgn="top"><select name="blk_type">
							<option value="호스트">호스트 문제</option>
							<option value="숙소 위생">숙소 위생 문제</option>
							<option value="결제 관련">결제 문제</option>
							<option value="안전">안전 문제</option>
					</select></td>
				</tr>
			</table>
			<label for="blk"></label> <input type="text" class="form-control"
				id="blk" name="blk_content" placeholder="200자 내외" value="" required>

			<div class="mb-4"></div>

			<div class="mb-3">
				<button class="btn btn-outline-primary btn-sm btn-block">신고하기</button>
				<span id="joinspan"></span>
			</div>

		</form>
	</div>




</body>
</html>