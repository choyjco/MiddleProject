<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="kr.or.ddit.activity.dao.ActivityImgDaoImpl"%>
<%@ page import="kr.or.ddit.activity.vo.ActivityVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	// 검색 결과를 request 속성에 저장
String keyword = (String) request.getAttribute("keyword");
String actImgPath = (String) request.getAttribute("actImgPath");

List<ActivityVO> searchResult = (List<ActivityVO>) request.getAttribute("searchResult");
%>

<div class="col-md-8 col-sm-12" id="carousel1">
	<form action="<%=request.getContextPath()%>/ActivityController.do" method="post">
		<!--검색 버튼 -->
		<input type="text" name="keyword" value="${not empty keyword ? keyword : ''}"> 
		<input type="submit" value="&#128269;" class="align-items-center border-0 bg-white"></input>
		<!--가나다순 버튼 -->
		<!-- 		<select name="sortOption" id="id_sel" onchange="this.form.submit()"> -->
		<!-- 			<option value="0">--선택--</option> -->
		<%-- 			<option value="a" ${sortOption == 'a' ? 'selected' : ''}>가나다순</option> --%>
		<%-- 			<option value="b" ${sortOption == 'b' ? 'selected' : ''}>최신순</option> --%>
		<!-- 		</select> -->
		<div class="d-flex justify-content-end">
			<button class="border-0 bg-white" name="sortOption" value="a" onclick="this.form.submit()" ${sortOption == 'a' ? 'selected' : ''}>•&nbsp가나다순</button>
			<button class="border-0 bg-white ms-5 me-5" name="sortOption" value="b" onclick="this.form.submit()" ${sortOption == 'b' ? 'selected' : ''}>•&nbsp최신순</button>
		</div>
	</form>
	<div class="p-2"></div>

	<!-- 검색 결과 출력 -->
	<section class="col-12 card-wrapper">
		<c:forEach var="activityVO" items="${searchResult}">
			<div class="col-md-4 mb-5" id="activitycard">
				<a href="/JejuOlleh/views/activity/actdetail.jsp?actImgPath=${activityVO.getActivityImgVO().getActImgPath()}&actName=${activityVO.getActName()}&actLoc=${activityVO.getActLoc()}&actTel=${activityVO.getActTel()}&actIntro=${activityVO.getActIntro()}&actCate=${activityVO.getActCate()}">
					<div class="card border-0" style="width: 24rem;">
						<img src="<%=request.getContextPath()%>${activityVO.getActivityImgVO().getActImgPath()}" class="card-img-top rounded-4" alt="...">
						<div class="card-body">
							<h4 class="card-title" id="activitytitle">${fn:substring(activityVO.getActName(),0,15)}...</h4>
							<p class="card-text" id="activitytext">${fn:substring(activityVO.getActIntro(), 0, 15)}...</p>
						</div>
					</div>
				</a>
			</div>
		</c:forEach>
	</section>
</div>