<%@page import="kr.or.ddit.accommodation.vo.AccommodationVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% List<AccommodationVO> memAccoList = (List<AccommodationVO>) request.getAttribute("memAccoList"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 숙소 관리</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
     
<!--         <link -->
<!-- 	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" -->
<!-- 	rel="stylesheet"> -->
<!-- 	<link href="/JejuOlleh/css/boardstyle.min.css" rel="stylesheet"> -->


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
                        <p class="text-center" style="font-size: 3rem;">🏡숙소 리스트</p>
                    </div>
                    <!-- 메인 제목 영역 끝 -->
<div class="d-flex mb-3 justify-content-end" >
<a href="<%=request.getContextPath() %>/acco/insert.do" class="btn btn-primary">
				<span>숙소 추가</span>				
			</a>
</div>
                    <!-- 게시판 영역 시작 -->
                    <div class="col-12 d-flex text-center border-3 border-top border-dark pt-3 pb-3">
                        <div class="col-4">숙소명</div>
                        <div class="col-4">위치</div>
                        <div class="col-1">가격</div>
                        <div class="col-1">숙소타입</div>
                        <div class="col-1">숙소유형</div>
<!--                         <div class="col-1">숙소상태</div> -->
                    </div>
                    
					<%
						int AccoListSize = memAccoList.size();
						if (AccoListSize == 0) {
					%>
                    <div class="col-12 d-flex text-center border-3 border-top border-light pt-3 pb-3">
						<div class="col-12">숙소 내역이 존재하지 않습니다😅</div>	
					<%
						} else {
						for (AccommodationVO accoVO : memAccoList) {
					%>					
                    <div class="col-12 d-flex text-center border-3 border-top border-light pt-3 pb-3">
                        <div class="col-4"><a href="<%=request.getContextPath()%>/acco/Mdetail.do?accoNo=<%=accoVO.getAccoNo()%>"><%=accoVO.getAccoName()%></a></div>
                        <div class="col-4"><%=accoVO.getAccoLoc() %></div>
                        <div class="col-1"><%=accoVO.getAccoPri()%></div>
                        <div class="col-1"><%=accoVO.getAccoCate()%></div>
                        <div class="col-1"><%=accoVO.getAccoType()%></div>
<%--                         <div class="col-1"><%=accoVO.getAccoState()%></div> --%>
						
						<div class="col-1">
						<a href="<%=request.getContextPath() %>/host/acco/reslist.do?accoNo=<%=accoVO.getAccoNo()%>" class="btn btn-primary">
            			<span>예약현황</span></a></div>
                    </div>
                    	<%
						}
					}
						%>
                    <div class="border-3 border-light border-top"></div>
                    <!-- 게시판 영역 끝 -->

                    <!-- 게시판 네비게이션 영역 시작 -->
                    <div class="col-12 d-flex justify-content-center pt-4">
                        <div class="me-3">1</div>
                        <div class="me-3">2</div>
                        <div>3</div>
                    </div>
                    <!-- 게시판 네비게이션 영역 끝 -->

                </div>
                <!-- 메인 콘텐츠 영역 끝 -->

                <!-- 어사이드 영역2 시작 -->
                <div class="col-2"></div>
                <!-- 어사이드 영역2 끝 -->
            </div>
        </div>



    </div>
</body>

</html>