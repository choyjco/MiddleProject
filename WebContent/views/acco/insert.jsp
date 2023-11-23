<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>숙소 등록</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

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
                        <p class="text-center" style="font-size: 3rem;">🏡숙소 등록</p>
                    </div>
                    <div class="col-15 d-flex text-center border-3 border-top border-dark pt-3 pb-3"></div>

      <div class="container">
         <div class="input-form-backgroud row">
            <div class="input-form col-md-12 mx-auto">

               <h4 class="mb-3"></h4>

            <form action="<%=request.getContextPath() %>/acco/insert.do" method="post" enctype="multipart/form-data">

<div class="row">
<h2 id="he2">🍊숙소 기본 정보</h2>
</div>


<div class="row ">
<div class="col-6 mt-2">숙소명</div>
</div>

<div class="row">
<div class="col-6 mt-2">
<input type="text" class="form-control" id="accoName" name="accoName" placeholder="" value="" required>
<div class="invalid-feedback">숙소명을 입력해주세요.</div>
</div>
</div>

<div class="row ">
<div class="col-6 mt-2">숙소정보</div>
</div>
<div class="row">
<div class="col-6 mb-3 mt-2">
<textarea class="form-control" id="txtbox" name="accoInfo" placeholder="150이내로 서술"
		maxlength="150" required style="height: 150px;"></textarea>
</div>
<div class="invalid-feedback">숙소정보를 입력해주세요.</div>
</div>        
 
<hr>           

<div class="row mt-5">
<h2 id="he2">🍊숙소 상세 정보</h2>
</div>
      
<div class="row">
    <div class="col-6 mt-2">숙소 유형</div>
    <div class="col-6 mt-2">객실 유형</div>
</div>
<div class="row">
    <div class="col-6 mb-3 mt-2"> 
        <div class="form-check form-check-inline">
            <input type="radio" class="form-check-input" id="accoCateHouse" name="accoCate" value="주택" checked>
            <label class="form-check-label" for="accoCateHouse">주택</label>
        </div>
        <div class="form-check form-check-inline">
            <input type="radio" class="form-check-input" id="accoCateApartment" name="accoCate" value="아파트">
            <label class="form-check-label" for="accoCateApartment">아파트</label>
        </div>
    </div>
    <div class="col-6 mb-3 mt-2">
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="accoType" value="공간 전체" checked="checked">
            <label class="form-check-label" for="accoType1">공간 전체</label>
        </div>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="accoType" value="공간 일부">
            <label class="form-check-label" for="accoType2">공간 일부</label>
        </div>
    </div>
</div>


<div class="row">
	<div class="col-6">주소</div>
	<div class="col-6">상세주소</div>
</div>
<div class="row">
	<div class="col-6 mb-3 mt-2"><input type="text" id="kmap" class="form-control" name="accoLoc" readonly required ></div>
	<div class="col-6 mb-3 mt-2"><input type="text" id="addr"  class="form-control" name="accoLoc2" required ></div>
	 <div class="invalid-feedback"> 주소를 입력해주세요.</div>
</div>

<div class="row">
	<div class="col-6">1박 요금</div>
</div>
<div class="row">
	<div class="col-6 mb-3 mt-2"><input type="text" class="form-control"name="accoPri" required ></div>
	 <div class="invalid-feedback">요금 정보를 입력해주세요.</div>
</div>

<div class="row">
	<div class="col-4 mb-3">최대인원수
	<select name="accoMax">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
	</select></div>
	<div class="col-4 mb-3">방개수
	<select name="accoRoom">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
								</select></div>
</div>
<div class="row">
	<div class="col-4 mb-3">침대개수
	<select name="accoBed">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
								</select></div>
	<div class="col-4 mb-3"">욕실개수
	<select name="accoBath">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
								</select></div>
	
	</div>
<div class="row">
	<div class="col-6">숙소 옵션</div>
</div>	
<div class="row">
	<div class="col-12 mb-3 mt-2">
                                <input class="form-check-input" type="checkbox" name="accoOpt[]" value="바다 전망">
                                <label style="margin-right: 10px;" class="form-check-label" >바다 전망</label>
                                <input class="form-check-input" type="checkbox"  name="accoOpt[]" value="도시 스카이라인 전망">
                                <label style="margin-right: 10px;" class="form-check-label" >도시 스카이라인 전망 </label>
                                <input class="form-check-input" type="checkbox" name="accoOpt[]" value="산 전망">
                                <label style="margin-right: 10px;" class="form-check-label">산 전망</label>
                                <input class="form-check-input" type="checkbox" name="accoOpt[]" value="애견동반가능">
                                <label style="margin-right: 10px;" class="form-check-label" >애견동반가능</label>
                                <input class="form-check-input" type="checkbox" name="accoOpt[]" value="무선 와이파이">
                                <label style="margin-right: 10px;" class="form-check-label">무선와이파이 </label>
                                <input class="form-check-input" type="checkbox" name="accoOpt[]" value="엘리베이터">
                                <label style="margin-right: 10px;" class="form-check-label">엘리베이터</label>
                                <input class="form-check-input" type="checkbox" name="accoOpt[]" value="건물 내 무료주차">
                                <label style="margin-right: 10px;" class="form-check-label" >건물 내 무료주차</label>
                                <input class="form-check-input" type="checkbox" name="accoOpt[]" value="전기차 충전시설">
                                <label style="margin-right: 10px;" class="form-check-label">전기차 충전시설</label>
                                <input class="form-check-input" type="checkbox" name="accoOpt[]" value="셀프체크인">
                                <label style="margin-right: 10px;" class="form-check-label">셀프체크인</label>
                            </div>    
                            </div>
	
<div class="row">
	<div class="col-6">숙소 사진첨부</div>
</div>		
<div class="row">
	<div class="col-6 mt-2"><input type="file" name="file" multiple class="col-md-4 mb-3" required></div>
</div>	

<div class="row">
    <div class="col-12">숙소 상태</div>
</div>
<div class="row">
    <div class="col-12">
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="accoState" value="Y" checked="checked">
            <label class="form-check-label" for="inlineRadio1">Y</label>
        </div>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="accoState" value="N">
            <label class="form-check-label" for="inlineRadio2">N</label>
        </div>
    </div>
</div>

               <div class="mb-3 text-right">
               <input type="submit" value="숙소 등록" style="float: right;">
				</div>
            </form>
</div>

	</div>
</div>
               </div>
         </div>
      </div>
      </div>

      <div class="col-2"></div>
                <!-- 어사이드 영역2 끝 -->
            </div>



<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
			window.onload = function() {
				document
						.querySelector('#kmap')
						.addEventListener(
								'click',
								function() { //주소입력칸을 클릭하면
									//카카오 지도 발생
									new daum.Postcode(
											{
												oncomplete : function(data) { //선택시 입력값 세팅
													document
															.querySelector('#kmap').value = data.address; // 주소 넣기
													//                 document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
												}
											}).open();
								});
			}
			$('#txtbox').keyup(function() {
				let content = $(this).val();

				// 글자수 세기
				if (content.length == 0 || content == '') {
					$('.textCount').text('0자');
				} else {
					$('.textCount').text(content.length + '자');
				}

				// 글자수 제한
				if (content.length > 150) {
					// 150자 부터는 타이핑 되지 않도록
					$(this).val($(this).val().substring(0, 150));
					// 150자 넘으면 알림창 뜨도록
					alert('글자수는 150자까지 입력 가능합니다.');
				}
				;
			});
			
			
			
			
</script>

<!-- <footer class="my-3 text-center text-small"> -->
<!--          <p class="mb-1">&copy; 2023 JejuOlleh<br><br></p> -->
<!--       </footer> -->

</body>

</html>
