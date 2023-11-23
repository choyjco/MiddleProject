<%@page import="kr.or.ddit.restaurant.vo.RestaurantVO"%>
<%@page import="kr.or.ddit.activity.vo.ActivityVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<RestaurantVO> restaurantList = (List<RestaurantVO>) request.getAttribute("restaurantList");
	
	String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
	session.removeAttribute("msg");
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

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
          
          <!-- 메인 커뮤니티 영역 시작 -->
            <div class="col-15 d-inline-flex">

                <!-- 어사이드 영역1 시작 -->
                <div class="col-2"></div>
                <!-- 어사이드 영역1 끝 -->

                <!-- 메인 콘텐츠 영역 시작 -->
                <div class="col-8">

                    <!-- 메인 제목 영역 시작 -->
                    <div>
                        <p class="text-center" style="font-size: 3rem;">&nbsp&#127860;맛집 리스트</p>
                    </div>
					
					<a href="<%=request.getContextPath() %>/RestInsertController" class="btn btn-primary">
					<span>게시물추가</span>
					</a>
					<a href="<%=request.getContextPath() %>/admin/mypage.do" class="btn btn-light" style="background-color: #79C4F2; border-color: #79C4F2;">
					<span>뒤로가기</span>
					</a>
					<br><br>
                    <!-- 메인 제목 영역 끝 -->

<!--                     커뮤니티 탭 영역 시작 -->
<!--                     <div class="p-3"></div> -->
<!--                     <div class="tabcontainer d-flex justify-content-center"> -->
<!--                         <div class="me-5"> -->
<!--                             공지사항 -->
<!--                         </div> -->
<!--                         <div> -->
<!--                             | -->
<!--                         </div> -->
<!--                         <div class="ms-5 me-5"> -->
<!--                             자주묻는질문 -->
<!--                         </div> -->
<!--                         <div> -->
<!--                             | -->
<!--                         </div> -->
<!--                         <div class="ms-5 me-5"> -->
<!--                             1:1문의 -->
<!--                         </div> -->
<!--                         <div> -->
<!--                             | -->
<!--                         </div> -->
<!--                         <div class="ms-5"> -->
<!--                             멤버쉽 혜택 -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     커뮤니티 탭 영역 끝 -->

<!--                     <div class="p-4"></div> -->

                    <!-- 게시판 영역 시작 -->
                    <div class="col-15 d-flex text-center border-3 border-top border-dark pt-3 pb-3">
                        <div class="col-3">제목</div>
                        <div class="col-5">위치</div>
                        <div class="col-2">종류</div>
                        <div class="col-2">전화번호</div>
                  
                    </div>
                    
                    <%
						int restaurantSize = restaurantList.size();
						if (restaurantSize == 0) {
					%>

					<tr>
						<td colspan='8'>게시물이 존재하지 않습니다.</td>
					</tr>
					
					<%
						} else {
						for (RestaurantVO rest : restaurantList) {
					%>
					
                    <div class="col-12 d-flex text-center border-3 border-top border-light pt-3 pb-3">
                        <div class="col-3"><a href="./RestDetailController?rstNo=<%=rest.getRstNo()%>"><%=rest.getRstName()%></a></div>              
                        <div class="col-5"><%=rest.getRstLoc()%></div>
                        <div class="col-2"><%=rest.getRstList()%></div>
                        <div class="col-2"><%=rest.getRstTel()%></div>
<%--                         <div class="col-1"><%=rest.getRstPrice()%></div> --%>
<%--                         <div class="col-3"><%=rest.getRstIntro().length() > 20 ? rest.getRstIntro().substring(0, 20) + "..." : rest.getRstIntro()%></div> --%>
<%--                         <div class="col-1"><%=rest.getRstCate().length() > 5 ? rest.getRstCate().substring(0, 5) + "..." : rest.getRstCate()%></div> --%>
<%--                         <div class="col-1"><%=rest.getRstTime()%></div> --%>
                                 
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