<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&amp;display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/JejuOlleh/css/login/login.css">
    <script defer="" referrerpolicy="origin"
        src="/cdn-cgi/zaraz/s.js?z=JTdCJTIyZXhlY3V0ZWQlMjIlM0ElNUIlNUQlMkMlMjJ0JTIyJTNBJTIyTG9naW4lMjAxMCUyMiUyQyUyMnglMjIlM0EwLjM3MjcyMjE3NjIyNzAyNzY0JTJDJTIydyUyMiUzQTE5MjAlMkMlMjJoJTIyJTNBMTA4MCUyQyUyMmolMjIlM0E3ODclMkMlMjJlJTIyJTNBMTU5OSUyQyUyMmwlMjIlM0ElMjJodHRwcyUzQSUyRiUyRnByZXZpZXcuY29sb3JsaWIuY29tJTJGdGhlbWUlMkZib290c3RyYXAlMkZsb2dpbi1mb3JtLTIwJTJGJTIyJTJDJTIyciUyMiUzQSUyMmh0dHBzJTNBJTJGJTJGYWRtaW5sdGUuaW8lMkYlMjIlMkMlMjJrJTIyJTNBMjQlMkMlMjJuJTIyJTNBJTIyVVRGLTglMjIlMkMlMjJvJTIyJTNBLTU0MCUyQyUyMnElMjIlM0ElNUIlNUQlN0Q="></script>
</head>

<form method="post" action="/JejuOlleh/Login">
<body class="img js-fullheight vsc-initialized"
    style="background-image: url('/JejuOlleh/images/login/bg.jpg'); height: 700px;">
    <section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6 text-center mb-5">
                    <h2 class="heading-section">Login</h2>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-md-6 col-lg-4">
                    <div class="login-wrap p-0">
                        <h3 class="mb-4 text-center">Have an account?</h3>               
                        <form action="#" class="signin-form">
                            <div class="form-group">
                                <input type="text" class="form-control" id="memId" name="memId" placeholder="Username" required="">
                            </div>
                            <div class="form-group">
                                <input id="password-field" type="password" class="form-control" 
                                placeholder="Password" id="pass" name="memPass" required="">
                                <span toggle="#password-field"
                                    class="fa fa-fw fa-eye field-icon toggle-password"></span>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="form-control btn btn-primary submit px-3"
                                id="loginForm" >Sign In</button>
                            </div>
                            <div class="form-group d-md-flex">
                                <div class="w-50">
                                    <a href="/JejuOlleh/views/login/login2.jsp">Register</a>                            
                                </div>
                                <div class="w-50 text-md-right">
                                    <a href="/JejuOlleh/views/login/findPw.jsp" style="color: #fff">Forgot Password </a>
                                </div>
                            </div>
                            <hr class="mb-5">
                            <hr class="mb-5">
                        </form>
                        <p class="w-100 text-center">— Welcome to JejuOlleh ! —</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
        </form>
    <script src="/JejuOlleh/js/login/loginboot.js"></script>
    <script src="/JejuOlleh/js/login/loginp.js"></script>
    <script src="/JejuOlleh/js/login/loginj.js"></script>
    <script src="/JejuOlleh/js/login/loginm.js"></script>
    <script defer=""
        src="https://static.cloudflareinsights.com/beacon.min.js/v52afc6f149f6479b8c77fa569edb01181681764108816"
        integrity="sha512-jGCTpDpBAYDGNYR5ztKt4BQPGef1P0giN6ZGVUi835kFF88FOmmn8jBQWNgrNd8g/Yu421NdgWhwQoaOPFflDw=="
        data-cf-beacon="{&quot;rayId&quot;:&quot;7e5790a079e2af6a&quot;,&quot;token&quot;:&quot;cd0b4b3a733644fc843ef0b185f98241&quot;,&quot;version&quot;:&quot;2023.4.0&quot;,&quot;si&quot;:100}"
        crossorigin="anonymous"></script>
</body>
</html>
