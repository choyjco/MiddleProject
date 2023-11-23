<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.activity.vo.ActivityVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

 ActivityVO activityVO = (ActivityVO) request.getAttribute("activityVO");

%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

<style>


</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
	<!-- 헤더 코드 위치 -->
	<%@include file="/views/home/header.jsp"%>

	<!-- 메뉴바 코드 위치 -->
	<%@include file="/views/home/menubar.jsp"%>

	<!-- aside1 영역 -->
	<%@include file="/views/home/aside1.jsp"%>
	
	
    <div class="container-fluid">
        <div class="row">
          
          <!-- 메인 커뮤니티 영역 시작 -->
            <div class="col-15 d-inline-flex">

                <!-- 어사이드 영역1 시작 -->
                <div class="col-2"></div>
                <!-- 어사이드 영역1 끝 -->

                <!-- 메인 콘텐츠 영역 시작 -->
                <div class="col-8">

                    <!-- 메인 제목 영역 시작 -->
                    <div>
                        <p class="text-center" style="font-size: 3rem;">놀거리 게시물 수정</p>
                    </div>
                    <div class="col-15 d-flex text-center border-3 border-top border-dark pt-3 pb-3"></div>

		<div class="container">
			<div class="input-form-backgroud row">
				<div class="input-form col-md-12 mx-auto">

					<h4 class="mb-3"></h4>


				<form action="<%=request.getContextPath() %>/UpdateController" method="post" enctype="multipart/form-data">
					<input type="hidden" name="memAth" value="HOST" />
					<input type="hidden" name="memCf" value="N" />
					<input type="hidden" name="actNo" value="<%=activityVO.getActNo() %>" />

				<div class="row">
						<div class="col-md-6 mb-3">
							<label for="actName">제목</label> <input type="text"
								class="form-control" id="actName" name="actName" placeholder=""
								value="" required>
							<div class="invalid-feedback">제목을 입력해주세요.</div>
						</div>
			
                  		<div class="col-md-6 mb-3">  
                        	<label for="actLoc">위치</label>
                        	<input type="text" id="kmap" class="form-control" name="actLoc" readonly required >                   
               			</div>
					</div>
	
				
<!--  						<div class="col-md-6 mb-3">  -->
<!-- 							<label for="actTel">전화번호</label> <input type="text" -->
<!-- 								class="form-control" id="actTel" name="actTel" placeholder="" -->
<!-- 								required> -->
<!-- 							<div class="invalid-feedback">전화번호를 입력해주세요.</div> -->
<!--  						</div> -->
 										
<!-- 					</div> -->
					
					

					<div class="row">
<!-- 						<div class="col-md-6 mb-3"> -->
<!-- 							<label for="actTel">전화번호</label> <input type="text" -->
<!-- 								class="form-control" id="actTel" name="actTel" placeholder="" -->
<!-- 								required> -->
<!-- 							<div class="invalid-feedback">전화번호를 입력해주세요.</div> -->
<!-- 						</div> -->
						
<!-- 						<div class="col-md-6 mb-3"> -->
<!-- 							<label for="actIntro">소개글</label> <input type="text" -->
<!-- 								class="form-control" id="actIntro" name="actIntro" placeholder="" -->
<!-- 								required> -->
<!-- 							<div class="invalid-feedback">소개글을 입력해주세요.</div> -->
<!-- 						</div> -->

						
					</div>

					 <div class="row">
						<div class="col-md-6 mb-3 ">
							<label for="actCate">카테고리</label> <input type="text"
								class="form-control" id="actCate" name="actCate" required>
							<div class="invalid-feedback">카테고리를 입력해주세요.</div>
						<div class="invalid-feedback">
						</div>
							
						</div>
							<div class="col-md-6 mb-3"> 
							<label for="actTel">전화번호</label> <input type="text"
								class="form-control" id="actTel" name="actTel" placeholder=""
								required>
							<div class="invalid-feedback">전화번호를 입력해주세요.</div>
 						</div>
					</div>

					<div class="row">
						<div class="col-md-12 mb-15">
							<label for="actIntro">소개글</label> <input type="text"
								class="form-control" id="actIntro" name="actIntro" placeholder=""
								 required style="height: 150px;">
							<div class="invalid-feedback">소개글을 입력해주세요.</div>
					</div>

<!-- 						<div class="col-md-6 mb-3"> -->
<!-- 							<label for="actCate">카테고리</label> <input type="text" -->
<!-- 								class="form-control" id="actCate" name="actCate" placeholder="" -->
<!-- 								name="actCate" required> -->
<!-- 							<div class="invalid-feedback"></div> -->
<!-- 						</div> -->
					</div>

					<hr class="mb-4">

					<div class="row">
						<div class="col-md-10 mb-3">
							<label for="actImgPath">놀거리 사진</label>
							<p style="font-size: 1em; color: red;">**관련된 사진을 첨부해주세요</p>
							<!-- 							<input type="text" -->
							<!-- 								class="form-control" id="file" name="" -->
							<!-- 								placeholder="아래에 있는 버튼을 클릭해서 양식을 다운받아주세요"> -->
						</div>
						
							<input type="file" name="actImgPath"
							class="col-md-4 mb-3" value="양식업로드" required>
						<!-- 						<input class="col-sm-3" type="file" value="업로드"> -->
						<!-- 						<div class="invalid-feedback">파일을 등록해주세요.</div> -->
						<!-- 						<input -->
						<!-- 							class="col-sm-3" type="image" value="양식파일"> -->
						<!-- 						<div class="invalid-feedback">파일을 등록해주세요.</div> -->
					</div>


					<hr class="mb-4">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="aggrement"
							required> <label class="custom-control-label"
							for="aggrement">사실과 다름 없음</label><br>
					</div>


					<!-- 											<div class="mb-4"></div> -->
					<!-- 											<button class="btn btn-primary btn-lg btn-block" type="submit">가입 -->
					<!-- 												완료</button> -->
					<hr class="mb-4">

					<div class="mb-3">
							<button 
								class="btn btn-outline-primary btn-sm btn-block">수정하기</button>
							<span id="joinspan"></span>
					</div>
				</form>
			</div>
		</div>


		<footer class="my-3 text-center text-small">
			<p class="mb-1">&copy; 2023 JejuOlleh<br><br></p>
		</footer>

	</div>
	
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
   window.onload = function() {
      document.querySelector('#kmap').addEventListener('click',
                  function() { //주소입력칸을 클릭하면
                     //카카오 지도 발생
                     new daum.Postcode(
                           {
                              oncomplete : function(data) { //선택시 입력값 세팅
                                 document.querySelector('#kmap').value = data.address; // 주소 넣기
                                 //                 document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
                              }
                           }).open();
                  });
   }
</script>

</body>
</html>