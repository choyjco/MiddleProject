<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="/JejuOlleh/css/login/findpw.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
  <form id="joinForm" method="post" action="/JejuOlleh/views/login/login3.jsp">
   
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-md-6 text-center mb-5">
            <h2 class="heading-section">👀 비밀번호 찾기 ❗</h2>
          </div>
        </div>
        <div class="row justify-content-center">
          <div class="col-md-6 col-lg-4">
            <div class="login-wrap p-0">
              <div class="form-group">
                <input type="text" placeholder="아이디를 입력하세요" class="form-control" name="username" size="">
              </div>
              <div class="form-group">
                <input type="text" placeholder="이메일을 입력하세요" class="form-control" name="email" size="">
              </div>
            </div>

            <hr class="mb-4" style="color: #fff">

            <div class="col-sm-6" style="text-align: center;">
              <button type="button" id="auth">비밀번호 변경 이메일 받기</button>
            </div>

            <p class="w-100 text-center" style="color: #fff">— Welcome to JejuOlleh ! —</p>
          </div>
        </div>
      </div>

  </form>
  <script>
    $(document).ready(function() {
      $('#auth').on('click', function() {
        let memMail = $('input[name="email"]').val();
        if (memMail === "") return;

        $.ajax({
          url: '/JejuOlleh/Mail',
          data: { memMail: memMail },
          type: 'POST',
          success: function(result) {
            let code = confirm("메일이 전송되었습니다.");
//             if (result !== code) {
//               alert("재인증 필요!!!");
//             } else {
//               alert("인증되었습니다!! 마이페이지에서 비밀번호를 새롭게 변경해주세요!");
//               $('#joinForm').submit();
//             }
          },
          error: function(xhr) {
            alert(xhr.status);
          }
        });
      });
    });
  </script>
</body>
</html>
