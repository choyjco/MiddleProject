<%@page import="java.util.Calendar"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.ZoneId"%>
<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.reservation.vo.ResVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<ResVO> memreslist = (List<ResVO>) request.getAttribute("memreslist");

	//오늘날짜 구하기
	LocalDate today = LocalDate.now();
 	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yy-MM-dd");
	String todayStr = today.format(formatter);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 예약 내역</title>

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
    
    	<input type="hidden" name="memId" />
    	
        <div class="row">

  <div class="col-12 d-inline-flex">

                <!-- 어사이드 영역1 시작 -->
                <div class="col-2"></div>
                <!-- 어사이드 영역1 끝 -->

                <!-- 메인 콘텐츠 영역 시작 -->
                <div class="col-8">

                    <!-- 메인 제목 영역 시작 -->
                    <div>
                        <p class="text-center" style="font-size: 3rem;">나의 예약 내역</p>
                    </div>
                       <!-- 메인 제목 영역 끝 -->
                        <div class ="row">
                  <div class="col-12 d-flex text-center border-3 border-top border-dark pt-3 pb-3">
                        <div class="col-5">숙소명</div>
                        <div class="col-1">체크인</div>
                        <div class="col-1">체크아웃</div>
                        <div class="col-1">1박 요금</div>
                        <div class="col-1">예약일수</div>
                        <div class="col-1">총 금액</div>
                    </div>
                    
                    <% 
                    	int memreslistSize = memreslist.size();
                    if(memreslistSize == 0){
                    %>	
                    	 <div class="col-12 d-flex text-center border-3 border-top border-light pt-3 pb-3">
						<div class="col-12">예약 내역이 존재하지 않습니다😅</div>	
						</div>
                    <% }else{
				for (ResVO rv : memreslist) { %>
			<% SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
		 	String startDate = sdf.format(rv.getResStart());
		 	String endDate = sdf.format(rv.getResEnd()); 
		 	 LocalDate stDate = rv.getResStart().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
		     LocalDate eDate = rv.getResEnd().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
		     long resDate = ChronoUnit.DAYS.between(stDate, eDate);
		     
		 	%>
           	
           	 <div class="col-12 d-flex text-center border-3 border-top border-light pt-3 pb-3">
			 <div class="col-5"><a href="<%=request.getContextPath()%>/acco/detail.do?accoNo=<%=rv.getAccoNo()%>"><%=rv.getAccoName()%></a></div>
             <div class="col-1"><%=startDate %></div>
             <div class="col-1"><%=endDate %></div>
             <div class="col-1"><%=rv.getAccoPri()%></div>
             <div class="col-1"><%=resDate%></div>
             <div class="col-1"><%=rv.getTotalPrice()%></div>
   
    <%
    //리뷰 작성이 되어있지 않으면 리뷰작성 버튼이 보이고
    if(rv.getRevCnt2()==1 && rv.getRevCnt()==0){%> 
   <div class="col-2">
    <a href="<%=request.getContextPath()%>/acco/review/insert.do?accoNo=<%=rv.getAccoNo()%>&resNo=<%=rv.getResNo()%>" class="btn btn-primary">
	<span>리뷰작성</span></a>
	</div> 

	<% //리뷰가 하나 이상 작성되어 있으면 리뷰확인버튼이 보이고	
	}else if(rv.getRevCnt()>0){
	%>
	<div class="col-2">
    <a href="<%=request.getContextPath()%>/acco/review/detail.do?memId=<%=rv.getMemId()%>" class="btn btn-primary">
	<span>리뷰확인</span></a>
	</div>
	<% 
	}
				%>
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



    </div>
</body>

</html>