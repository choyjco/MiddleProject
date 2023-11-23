<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <!--<title>Registration Form in HTML CSS</title>-->
    <!---Custom CSS File--->
    <link rel="stylesheet" href="/JejuOlleh/css/login/join.css" />
  </head>
  <body>
  
  
    <section class="container">
      <header>호스트 회원가입 🏡</header>
      
      	<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
      <form class="validation-form" id="form" onsubmit="valid()">
      
      <input type="hidden" name="memAth" value="HOST" /> <input
						type="hidden" name="memCf" value="N" />
      
     <div class="row"> 
  <div class="input-boxs" style="display: inline;">
    <label for="id">아이디</label>
    <input type="text" class="form-control" id="id" name="memId" placeholder="" value="" required>
  </div>
  
  <div class="col-md-2 mb-3 item align-self-end" id="btn1" style="display: inline;">
    <button type="button" class="btn btn-outline-primary btn-sm btn-block" id="btn1">중복검사</button>
    <span id="disp"></span>
  </div>
</div>

        <div class="input-box">
          <label>Email Address</label>
          <input type="text" placeholder="Enter email address" required />
        </div>

        <div class="column">
          <div class="input-box">
            <label>Phone Number</label>
            <input type="number" placeholder="Enter phone number" required />
          </div>
          <div class="input-box">
            <label>Birth Date</label>
            <input type="date" placeholder="Enter birth date" required />
          </div>
        </div>
        <div class="input-box address">
          <label>Address</label>
          <input type="text" placeholder="Enter street address" required />
          <input type="text" placeholder="Enter street address line 2" required />
        </div>
        
        <br>
        <br>
        
        <hr class="mb-4">
        <br>
        
        <div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="aggrement"
							required> <label class="custom-control-label"
							for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
					</div>
        
        <div>
        <button>Submit</button>
        <span id="joinspan"></span>
        </div>
        
      </form>
      </div>
        </div>
    </section>
    
    
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
						$('#disp').text(rst.msg).css('color', 'green');

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

						let conf = confirm("가입에 성공했습니다. 로그인 페이지로 이동할까요?")
						if (conf)
							location.href = "/JejuOlleh/views/login/login.jsp"
			
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