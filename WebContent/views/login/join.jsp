<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 화면 - Bootstrap</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <link rel="stylesheet" href="/JejuOlleh/css/login/join.css" />
 <link rel="stylesheet" href="/JejuOlleh/css/login/btn.css" />
 
</head>

<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
	
		
				 <header style="font-size: 2rem" class="text-center p-5">호스트 회원가입 🏡</header>
				<hr />
			
				<form class="validation-form" onsubmit="valid()">

					<input type="hidden" name="memAth" value="HOST" /> <input
						type="hidden" name="memCf" value="N" />

					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="id">아이디</label> <input type="text"
								class="form-control" id="id" name="memId" placeholder=""
								value="" required>
							<div class="invalid-feedback">아이디를 입력해주세요.</div>
						</div>
						<div class="col-md-2 mb-3 item align-self-end" id="idbtn">
<!-- 						 <a href="" title="Button border lightblue" class="button btnBorder btnLightBlue">Border</a> -->
							<button type="button"
								title="Button border lightblue" class="button btnBorder btnLightBlue" id="idChk" style="width: 150px; height: 40px;">중복검사</button>
							<span id="disp"></span>
						</div>
					</div>


					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="name">이름</label> <input type="text"
								class="form-control" id="name" name="memNm" placeholder=""
								value="" required>
							<div class="invalid-feedback">이름을 입력해주세요.</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="password">비밀번호</label> <input type="password"
								class="form-control" id="password" name="memPass" placeholder=""
								value="" required>
							<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="hp">전화번호</label> <input type="text"
								class="form-control" id="hp" name="memHp" placeholder=""
								required>
							<div class="invalid-feedback">전화번호를 입력해주세요.</div>
						</div>

						<div class="col-md-6 mb-3">
							<label for="bir">생년월일<span class="text-muted">&nbsp;(yyyy-mm-dd)</span></label>
							<input type="date" class="form-control" id="bir" name="memBir"
								placeholder="" required>
							<div class="invalid-feedback">생년월일을 입력해주세요.</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="mail">이메일</label> <input type="email"
								class="form-control" id="email" name="memMail"
								placeholder="you@example.com" required>
							<div class="invalid-feedback">이메일을 입력해주세요.</div>
						</div>

						<div class="col-md-4 mb-3 ">
							<label for="add1">우편번호</label> <input type="text"
								class="form-control" id="postAddr" name="memZip" required>
							<div class="invalid-feedback"></div>
						</div>
						<div class="col-sm-2 item align-self-center">
							<button type="button" id="addrBtn"
								title="Button border lightblue" class="button btnBorder btnLightBlue" style="width: 100px; height: 40px;">주소검색</button>
						</div>
					</div>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="addr1">주소</label> <input type="text"
								class="form-control" id="addr1" name="memAdd1" placeholder=""
								name="memAdd1" required>
							<div class="invalid-feedback">주소를 입력해주세요.</div>
						</div>


						<div class="col-md-6 mb-3">
							<label for="addr2">상세주소<span class="text-muted">&nbsp;(필수
									아님)</span></label> <input type="text" class="form-control" id="addr2"
								name="memAdd2" placeholder="상세주소를 입력해주세요.">
						</div>
					</div>

					<hr class="mb-4">

					<div class="row">
						<div class="col-md-10 mb-3">
							<label for="file">호스트 인증</label>
							<p style="font-size: 1em; color: red;">**신분 확인이 가능한 신분증명서를
								첨부해주세요</p>
						</div>
					 <input name="reg_file"
							class="col-md-4 mb-3" type="file" value="양식업로드" required>
				
					</div>

					<hr class="mb-4">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="aggrement"
							required> <label class="custom-control-label"
							for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
					</div>

					<hr class="mb-4">

					<div class="mb-3 d-flex justify-content-center">
						<button title="Button border lightblue" class="button btnBorder btnLightBlue" style="width: 200px; height: 40px;" >가입하기</button>
						<span id="joinspan"></span>
					</div>
				</form>
			</div>
		</div>


		<footer class="my-3 text-center text-small">
			<p class="mb-1">&copy; 2023 JejuOlleh</p>
		</footer>
	</div>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- 다음주소록 API CDN -->
	<script>
		$('#idChk').on('click', function() {
		
			let idVal = $('#id').val();

			// 중복검사 버튼 눌렀을 때 AJAX로 ID중복검사 결과 얻기
			$.ajax({
				type : 'post',
				url : 'idChk.jsp',
				data : {
					memId : idVal
				}, 
				success : function(rst) {
					if (rst.rst == "ok") {
						$('#disp').text(rst.msg).css('color', 'blue');

					} else {
						$('#disp').text(rst.msg).css('color', 'red');
					}
				},
				error : function(xhr) {
					alert(xhr.status);
				},
				dataType : 'json' 
			});

		});


		$('#addrBtn').on('click', sample4_execDaumPostcode);

		//다음주소록 API
		function sample4_execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {

					var roadAddr = data.roadAddress; 
					var extraRoadAddr = ''; 

					document.getElementById('postAddr').value = data.zonecode;
					document.getElementById("addr1").value = roadAddr;
	
				}
			}).open();
		}

		// 서버페이지로 보낼 데이터 직렬화를 처리할 함수 valid()

		function valid() {

			event.preventDefault();

			let formData = $('form').serialize();
			console.log(typeof formData);

			$.ajax({
				type : 'post',
				url : '/JejuOlleh/views/login/serialize.jsp', // jsp
				data : formData,
				success : function(result) {
					console.log(result);
					if (result == 1) {

						let conf = confirm("JejuOlleh 회원가입을 축하드립니다! 로그인 화면으로 이동할까요?")
						if (conf)
							location.href = "/JejuOlleh/views/login/login3.jsp"
			
						$('#joinspan').text("가입성공").css('color', 'gold');
						$('form *').val(""); 

					} else {
					
						$('#joinspan').text("가입실패").css('color', 'red');

					}
				},
				error : function(xhr) {
					alert(xhr.status);

				},
				dataType : 'text' 

			});

		}
	</script>
</body>
</html>