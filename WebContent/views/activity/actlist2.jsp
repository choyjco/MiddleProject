<%@page import="kr.or.ddit.activity.vo.ActivityVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<ActivityVO> activityList = (List<ActivityVO>) request.getAttribute("activityList");
	
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
                        <p class="text-center" style="font-size: 3rem;">&nbsp&#127939;놀거리 리스트</p>
                    </div>
<%--                     <button type="button" style="border:none;" onclick="location.href='<%=request.getContextPath()%>/InsertController';"> --%>
<!-- 					<h6 class="m-0 font-weight-bold text-primary">게시물 추가</h6> -->
					
					<a href="<%=request.getContextPath() %>/InsertController" class="btn btn-primary">
					<span>게시물추가</span>
					</a>
				    <a href="<%=request.getContextPath() %>/admin/mypage.do" class="btn btn-light" style="background-color: #79C4F2; border-color: #79C4F2;">
					<span>뒤로가기</span>
					</a>
					</button>
					<form action="<%=request.getContextPath()%>/ActivityController.do" method="post">
		
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
                        <div class="col-4">제목</div>
                        <div class="col-6">위치</div>
                        <div class="col-2">전화번호</div>
                    </div>
                    
                    <%
						int activitySize = activityList.size();
						if (activitySize == 0) {
					%>

					<tr>
						<td colspan='8'>게시물이 존재하지 않습니다.</td>
					</tr>
					
					<%
						} else {
						for (ActivityVO act : activityList) {
					%>
					
                    <div class="col-12 d-flex text-center border-3 border-top border-light pt-3 pb-3">
                      <div class="col-4"><a href="./DetailController?actNo=<%=act.getActNo()%>"><%=act.getActName()%></a></div>  	
                        <div class="col-6"><%=act.getActLoc()%></div>
                        <div class="col-2"><%=act.getActTel()%></div>
                      
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