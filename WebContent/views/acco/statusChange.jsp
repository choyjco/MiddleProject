<%@page import="kr.or.ddit.accommodation.vo.AccommodationVO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	AccommodationVO accoVO = (AccommodationVO) request.getAttribute("accoVO");
%>

<!DOCTYPE html>
<html>

<head>
<title>숙소상태변경</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet"
			href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Logo</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Home</a></li>
					<li><a href="#">About</a></li>
					<li><a href="#">Projects</a></li>
					<li><a href="#">Contact</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><span class="glyphicon glyphicon-log-in"></span>
							Login</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-2 sidenav"></div>
			<br>
			<h1>숙소 상태변경</h1>
			<br> <br>
			<div class="col-sm-8 text-left"
				style="display: flex; justify-content: center">
				<div
					class="container d-flex justify-content-center align-items-center vh-100">

					<form action="<%=request.getContextPath()%>/acco/statusChange.do"
						method="post" style="float: right;">
						<input type="hidden" name="accoNo" value="<%=accoVO.getAccoNo()%>">
						<table id="ff">
							<tr>
								<td>숙소명</td>
								<td><%=accoVO.getAccoName()%></td>
							</tr>
							<tr>
								<td>숙소정보</td>
								<td><%=accoVO.getAccoInfo()%></td>
							</tr>
							<tr>
								<td>숙소유형</td>
								<td><%=accoVO.getAccoCate()%></td>
							</tr>
							<tr>
								<td>객실종류</td>
								<td><%=accoVO.getAccoType()%></td>

							</tr>
							<tr>
								<td>최대인원수</td>
								<td><%=accoVO.getAccoMax()%>명</td>
							</tr>
							<tr>
								<td>주소</td>
								<td><%=accoVO.getAccoLoc()%></td>
							</tr>
							<tr>
								<td>상세주소</td>
								<td><%=accoVO.getAccoLoc2()%></td>
							</tr>
							<tr>
								<td>1박 요금</td>
								<td><%=accoVO.getAccoPri()%>원</td>
							</tr>
							<tr>
								<td>방개수</td>
								<td><%=accoVO.getAccoRoom()%>개</td>
							</tr>
							<tr>
								<td>침대개수</td>
								<td><%=accoVO.getAccoBed()%>개</td>
							</tr>
							<tr>
								<td>욕실개수</td>
								<td><%=accoVO.getAccoBath()%>개</td>
							</tr>
							<tr>
								<td>숙소 옵션</td>
								<td><%=accoVO.getAccoOpt()%></td>
							</tr>
							<tr>
								<td>현재 숙소상태</td>
								<td><%=accoVO.getAccoState()%></td>
							</tr>
							<tr>
								<td>숙소 상태 변경</td>
                      	    	<td>
                      	    	<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="accoState" value="Y" checked="checked">
                                <label style="margin-right: 10px;" class="form-check-label" for="inlineRadio2">Y</label>
							
								<input class="form-check-input" type="radio" name="accoState" value="N">
                                <label style="margin-right: 10px;" class="form-check-label" for="inlineRadio2">N</label>
								</div>
                      	    	</td>
							</tr>
						</table>
						<input type="submit" value="변경" style="float: right;">
						<input type="button" value="뒤로가기" style="float:right;" onclick="location.href='<%=request.getContextPath()%>/acco/Mdetail.do?accoNo=<%=accoVO.getAccoNo()%>';">
					</form>
				</div>
			</div>
		</div>
		<script
			src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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

		<!-- <footer class="container-fluid text-center"> -->
		<!--   <p>Footer Text</p> -->
		<!-- </footer> -->
</body>

</html>
