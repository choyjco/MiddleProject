<%@page import="kr.or.ddit.review.vo.ReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%-- <% ReviewVO reviewVO = (ReviewVO)request.getAttribute("revNo"); %>	 --%>
<% ReviewVO reviewVO = new ReviewVO();
reviewVO.setRevNo((String)request.getAttribute("revNo"));
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰작성</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

<style>
.revStar .rate_radio + label {
	    position: relative;
	    display: inline-block;
	    margin-left: -4px;
	    z-index: 10;
	    width: 60px;
	    height: 60px;
	    background-image: url('../../images/starrate.png');
	    background-repeat: no-repeat;
	    background-size: 60px 60px;
	    cursor: pointer;
	    background-color: #f0f0f0;
	}
	.revStar .rate_radio:checked + label {
	    background-color: rgb(54, 54, 26);
	} 
	/* 레이아웃 외곽 너비 400px 제한*/
	.wrap{
	    max-width: 480px;
	    margin: 0 auto; /* 화면 가운데로 */
	    background-color: #fff;
	    height: 100%;
	    padding: 20px;
	    box-sizing: border-box;
	
	}
	.reviewform textarea{
	    width: 100%;
	    padding: 10px;
	    box-sizing: border-box;
	}
	.revStar .rate_radio {
	    position: relative;
	    display: inline-block;
	    z-index: 20;
	    opacity: 0.001;
	    width: 60px;
	    height: 60px;
	    background-color: #fff;
	    cursor: pointer;
	    vertical-align: top;
	    display: none;
	}
	.revStar .rate_radio + label {
	    position: relative;
	    display: inline-block;
	    margin-left: -4px;
	    z-index: 10;
	    width: 60px;
	    height: 60px;
	    background-image: url('../../images/starrate.png');
	    background-repeat: no-repeat;
	    background-size: 60px 60px;
	    cursor: pointer;
	    background-color: #f0f0f0;
	}
	.revStar .rate_radio:checked + label {
	    background-color: #ff8;
	}
	
	.warning_msg {
	    display: none;
	    position: relative;
	    text-align: center;
	    background: #ffffff;
	    line-height: 26px;
	    width: 100%;
	    color: red;
	    padding: 10px;
	    box-sizing: border-box;
	    border: 1px solid #e0e0e0;
	}
</style>
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
        
          <!-- 중간 여백 시작 -->
            <!-- 중간 여백 끝 -->

            <!-- 메인 커뮤니티 영역 시작 -->
            <div class="col-12 d-inline-flex">

                <!-- 어사이드 영역1 시작 -->
                <div class="col-2"></div>
                <!-- 어사이드 영역1 끝 -->

                <!-- 메인 콘텐츠 영역 시작 -->
                <div class="col-8">

                    <!-- 메인 제목 영역 시작 -->
                    <div>
                        <p class="text-center" style="font-size: 3rem;">리뷰 수정</p>
                    </div>
                    
 				<!-- 메인 제목 영역 끝 -->

        <form action="<%=request.getContextPath() %>/acco/review/update.do"  class="reviewform" method="post">
             <div class="col-12 d-flex text-center border-3 border-top border-dark pt-3 pb-3">
           <input type="hidden" name="revNo" value="<%=reviewVO.getRevNo()%>">
            <input type="hidden" name="rate" id="rate" value="0"/>
	            <input type="hidden" name="rate" id="rate" value="0"/>
              <div class="col-12">리뷰와 별점을 작성해주세요</div>
            </div>
            
                    <div class="col-12 d-flex text-center border-3 border-top border-light pt-3 pb-3">
                        <div class="col-12">
                        <div class="review_rating">
	                <div class="warning_msg">별점을 선택해 주세요.</div>
	                <div class="revStar">
	                    <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
	                <input type="checkbox" name="revStar[]" id="revStar1" value="1" class="rate_radio" title="1점"> 
	                <label for="revStar1"></label> 
	                <input type="checkbox" name="revStar[]" id="revStar2" value="2"class="rate_radio" title="2점">
					<label for="revStar2"></label> 
					<input type="checkbox" name="revStar[]" id="revStar3" value="3" class="rate_radio" title="3점"> 
					<label for="revStar3"></label>
					<input type="checkbox" name="revStar[]" id="revStar4" value="4" class="rate_radio" title="4점"> 
					<label for="revStar4"></label> 
					<input type="checkbox" name="revStar[]" id="revStar5" value="5" class="rate_radio" title="5점"> 
					<label for="revStar5"></label>
					</div>
	            </div>
	    </div>
	    </div>
                       
                         <div class="col-12">
                        <div class="review_contents">
	                <textarea rows="10" class="review_textarea col-12" name="revCon"></textarea>
	            </div>   
	            <div class="cmd">
	                <input type="submit" value="리뷰 수정" style="float: right;">
	            </div>
	            </div>
	        </form>
                        
                   
                    <div class="border-3 border-light border-top"></div>
                    <!-- 게시판 영역 끝 -->


                </div>
                <!-- 메인 콘텐츠 영역 끝 -->

                <!-- 어사이드 영역2 시작 -->
                <div class="col-2"></div>
                <!-- 어사이드 영역2 끝 -->
            </div>
        </div>
    </div>
    
<script>
	
	//별점 마킹 모듈 프로토타입으로 생성
	function Rating() {
	  this.rate = 0;
	}
	
	Rating.prototype.setRate = function(newrate) {
	  //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
	  this.rate = newrate;
	  let items = document.querySelectorAll('.rate_radio');
	  items.forEach(function(item, idx) {
	    if (idx < newrate) {
	      item.checked = true;
	    } else {
	      item.checked = false;
	    }
	  });
	};

	
	Rating.prototype.showMessage = function(target) {
	  let warningMsg = document.querySelector(`.${target}_msg`);
	  warningMsg.style.display = 'block';
	};
	
	let revStar = new Rating(); //별점 인스턴스 생성
	
	document.addEventListener('DOMContentLoaded', function() {
	  //별점선택 이벤트 리스너
	  document.querySelector('.revStar').addEventListener('click', function(e) {
	    let elem = e.target;
	    if (elem.classList.contains('rate_radio')) {
	      let rate = parseInt(elem.value); // 정수로 변환
	      revStar.setRate(rate);
	    }
	  });
	});
	
	//상품평 작성 글자수 초과 체크 이벤트 리스너
	document.querySelector('.review_textarea').addEventListener('input', function() {
	  //리뷰 400자 초과 안되게 자동 자름
	  let review = document.querySelector('.review_textarea');
	  let lengthCheckEx = /^.{400,}$/;
	  if (lengthCheckEx.test(review.value)) {
	    //400자 초과 컷
	    review.value = review.value.substr(0, 400);
	  }
	});
	
	//저장 전송전 필드 체크 이벤트 리스너
	document.querySelector('.cmd input[type="submit"]').addEventListener('click', function(e) {
	  //별점 선택 안했으면 메시지 표시
	  if (revStar.rate === 0) {
	    revStar.showMessage('warning');
	    return false;
	  }
	  //리뷰 5자 미만이면 메시지 표시
	  if (document.querySelector('.review_textarea').value.length < 5) {
	    revStar.showMessage('warning');
	    return false;
	  }
	  //폼 서밋
	});
	
	
    </script>
</body>

</html>