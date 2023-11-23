<%@page import="kr.or.ddit.reservation.vo.ResVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<ResVO> accoList = (List<ResVO>) request.getAttribute("soartaccoList");
%>

<!-- 컨테이너 영역 시작 -->
<div class="col-md-8 col-sm-12 p-0" id="carousel1">

	<!-- 인기 숙소 영역 -->
	<div>

		<!-- 		<div class="text-xxl-start text-center mb-5"> -->
		<!-- 			<span>인기 숙소</span> -->
		<!-- 		</div> -->

		<!-- 인기 숙소 영역 1줄 시작 -->
		<section class="col-12 card-wrapper">
			<div class="row">

				<%
					for (ResVO rv : accoList) {
				%>
				<div class="col-md-4 mb-5">
					<div class="card border-0" style="width: 24rem;">
						<div style="position: relative;">
							<img src="<%=request.getContextPath() + rv.getAccoImgpath()%>" class="card-img-top rounded-4" alt="...">
							<form class="like-form" action="<%=request.getContextPath()%>/acco/wish.do" method="post" enctype="multipart/form/data" style="position: absolute; top: 5px; right: 5px;">
								<input type="hidden" name="accoNo" value="<%=rv.getAccoNo()%>">
								<button type="submit" class="btn btn-outline-primary border-0 like-button" data-acco-no="<%=rv.getAccoNo()%>">

									<!-- 빈 하트 아이콘 -->
									<i class="far fa-heart"></i>

								</button>
							</form>
						</div>
							<a href="<%=request.getContextPath() + "/acco/detail.do?accoNo=" + rv.getAccoNo()%>">
								<div class="card-body">
									<%
									  String accoName = rv.getAccoName();
									  if (accoName.length() > 18) {
										accoName = accoName.substring(0, 18);
									  }
									%>
									<h5 class="card-title" id="accotitle"><%=accoName %></h5>
									<%-- <h5 class="card-title"><%=av.getAccoName()%></h5> --%>
									<%
									  String accoInfo = rv.getAccoInfo();
									  if (accoInfo.length() > 50) {
									    accoInfo = accoInfo.substring(0, 50);
									  }
									%>
									<p class="card-text" id="accotext"><%=accoInfo %></p>
									<%-- <p class="card-text"><%=av.getAccoInfo()%></p> --%>
								</div>
							</a>
					</div>
				</div>
				<%
					}
				%>
			</div>
		</section>
		<!-- 인기 숙소 영역 1줄 끝 -->
		<!-- 게시판 네비게이션 영역 시작 -->
		<div class="col-12 d-flex justify-content-center pt-4">
			<div class="me-3">1</div>
			<div class="me-3">2</div>
			<div>3</div>
		</div>
		<!-- 게시판 네비게이션 영역 끝 -->
	</div>
	<!-- 인기 숙소 영역 끝 -->

</div>
<!-- 컨테이너 영역 끝 -->