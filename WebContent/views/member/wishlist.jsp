<%@page import="kr.or.ddit.accommodationwish.vo.AccoWishVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<AccoWishVO> accowishlist = (List<AccoWishVO>)request.getAttribute("accowishlist");
	String memIdz = (String) request.getAttribute("memId");
	
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 리뷰 내역</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
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
                        <p class="text-center" style="font-size: 3rem;">나의 위시리스트 내역</p>
                    </div>
                    
                    
    <!-- 게시판 영역 시작 -->
                    <div class="col-12 d-flex text-center border-3 border-top border-dark pt-3 pb-3">
                        <div class="col-6">숙소명</div>
                        <div class="col-6">숙소정보</div>
<!--                         <div class="col-1">이용날짜</div> -->
                    </div>
                    
                  <%
   					   int accowishlistSize = accowishlist.size();
    					  if(accowishlistSize == 0){
  						 %>       
                     <div class="col-12 d-flex text-center border-3 border-top border-light pt-3 pb-3">
						<div class="col-12">위시리스트 내역이 존재하지 않습니다😅</div>	
					<% }else{
						  for(AccoWishVO av : accowishlist){ %>
	 
	
	 	
   <div class="col-12 d-flex text-center border-3 border-top border-light pt-3 pb-3">
    	 <div class="col-6"><a href="<%=request.getContextPath()%>/acco/detail.do?accoNo=<%=av.getAccoNo()%>"><%=av.getAccoName() %></a></div>
    	  <div class="col-6"><%=av.getAccoInfo()%></div>
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