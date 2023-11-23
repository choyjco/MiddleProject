<%@page import="kr.or.ddit.accommodation.vo.AccoImgVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.accommodation.vo.AccommodationVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<AccommodationVO> accoList = (List<AccommodationVO>)request.getAttribute("accoList");
%>

<!-- 컨테이너 영역 시작 -->
<div class="col-md-8 col-sm-12" id="carousel1">

	<!-- 인기 숙소 영역 -->
	<div class="ms-4">
		<div class="text-xxl-start text-center mb-5">
			<span>인기 숙소</span>
		</div>
			<!-- 인기 숙소 영역 1줄 시작 -->
		<section class="card-wrapper">
							
		<%
			for(AccommodationVO av : accoList){
		%>
			<div class="card me-3 border-0" style="width: 24rem;">
				<img src="<%=request.getContextPath() + av.getAccoImgpath() %>" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title"><%=av.getAccoName()%></h5>
					<p class="card-text"><%=av.getAccoInfo() %></p>
					<a href="<%=request.getContextPath()+ "/acco/detail.do?accoNo="+av.getAccoNo()%>" class="btn btn-primary">Go somewhere</a>
				</div>
			</div>
		<%			
			}
		%>
		
		</section>
		<!-- 인기 숙소 영역 1줄 끝 -->
		
	</div>
	<!-- 인기 숙소 영역 끝 -->

</div>
<!-- 컨테이너 영역 끝 -->