<%@page import="kr.or.ddit.accommodation.vo.AccoImgVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.accommodation.vo.AccommodationVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<AccommodationVO> accoList = (List<AccommodationVO>) request.getAttribute("accoList");
%>
<!-- 컨테이너 영역 시작 -->
<div class="col-md-8 col-sm-12" id="carousel1">

	<!-- 인기 숙소 영역 -->
	<div class="ms-4">

		<div class="text-xxl-end text-end mb-5 me-2">
			<a href="<%=request.getContextPath()%>/acco/insert.do" class="btn btn-primary"> <span> 숙소 등록 </span>
			</a>
		</div>

		<!-- 인기 숙소 영역 1줄 시작 -->
		<section class="col-12 card-wrapper">
			<div class="row">

				<%
					for (AccommodationVO av : accoList) {
				%>
				<div class="col-md-4 mb-4">
					<div class="card border-0" style="width: 24rem;">
						<div style="position: relative;">
							<img src="<%=request.getContextPath() + av.getAccoImgpath()%>" class="card-img-top rounded-4" alt="...">
							<form class="like-form" action="<%=request.getContextPath()%>/acco/wish.do" method="post" style="position: absolute; top: 5px; right: 5px;">
								<input type="hidden" name="accoNo" value="<%=av.getAccoNo()%>">
								<button type="submit" class="btn btn-outline-primary border-0 like-button">

									<!-- 빈 하트 아이콘 -->
									<i class="far fa-heart"></i>

								</button>
							</form>
						</div>
							<a href="<%=request.getContextPath() + "/acco/detail.do?accoNo=" + av.getAccoNo()%>">
								<div class="card-body">
									<%
									  String accoName = av.getAccoName();
									  if (accoName.length() > 18) {
										accoName = accoName.substring(0, 18);
									  }
									%>
									<h5 class="card-title" id="accotitle"><%=accoName %></h5>
									<%-- <h5 class="card-title"><%=av.getAccoName()%></h5> --%>
									<%
									  String accoInfo = av.getAccoInfo();
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

	</div>
	<!-- 인기 숙소 영역 끝 -->

</div>
<!-- 컨테이너 영역 끝 -->