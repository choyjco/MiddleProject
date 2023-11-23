<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.or.ddit.reservation.vo.ResVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <% List<ResVO> resAccoList = (List<ResVO>)request.getAttribute("resAccoList"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

<style>

@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

* {
  font-family: 'GmarketSansMedium';
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
                        <p class="text-center" style="font-size: 3rem;">🏡숙소 예약 현황</p>
                    </div>
                    
                    
    <!-- 게시판 영역 시작 -->
                    <div class="col-12 d-flex text-center border-3 border-top border-dark pt-3 pb-3">
                        <div class="col-2">숙소번호</div>
                        <div class="col-2">예약 회원ID</div>
                        <div class="col-2">체크인 날짜</div>
                        <div class="col-2">체크아웃 날짜</div>
                        <div class="col-2">이용인원수</div>
                        <div class="col-2">총 금액</div>
                    </div>
                    
                    <%
						int resAccoListSize = resAccoList.size();
						if (resAccoListSize == 0) {
                    %>          
                     <div class="col-12 d-flex text-center border-3 border-top border-light pt-3 pb-3">
						<div class="col-12">예약 내역이 존재하지 않습니다😅</div>	
    </div>
					<% }else{
	 for (ResVO resVO : resAccoList) {  %>
	 
	 <% SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
	 	String startDate = sdf.format(resVO.getResStart());
	 	String endDate = sdf.format(resVO.getResEnd()); %>
	 	
   <div class="col-12 d-flex text-center border-3 border-top border-light pt-3 pb-3">
                        <div class="col-2"><%=resVO.getAccoNo() %></div>
                        <div class="col-2"><%=resVO.getMemId() %></div>
                        <div class="col-2"><%=startDate %></div>
                        <div class="col-2"><%=endDate %></div>
                        <div class="col-2"><%=resVO.getResPeople() %></div>
                        <div class="col-2"><%=resVO.getTotalPrice() %></div>
                    </div>
  
	<% 
		}
	}
	 %>
    </div>
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