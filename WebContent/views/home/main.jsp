<%@page import="kr.or.ddit.restaurant.vo.RestaurantVO"%>
<%@page import="kr.or.ddit.accommodation.vo.AccommodationVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<AccommodationVO> accoList = (List<AccommodationVO>) request.getAttribute("accoList");
String keyword = (String) request.getAttribute("keyword");
String rstImgPath = (String) request.getAttribute("rstImgPath");

%>

<!-- 컨테이너 영역 시작 -->
<div class="col-md-8 col-sm-12" id="carousel1">

	<!-- 인기 숙소 영역 -->
	<div class="ms-4">
		<div class="text-xxl-start text-center mb-5" id="top-acco">
			<span>요즘 호캉스부터 촌캉스까지&nbsp🏠</span>
		</div>

		<!-- 인기 숙소 영역 1줄 시작 -->
		<section class="col-12 card-wrapper">
			<div class="row">

				<%
					// Calculate the loop end index, limited to the size of accoList
				int loopEnd = Math.min(3, accoList.size());
				for (int i = 0; i < loopEnd; i++) {
					AccommodationVO av = accoList.get(i);
				%>
				<div class="col-md-4 mb-5">
					<div class="card border-0" style="width: 24rem;">
						<div style="position: relative;">
							<img src="<%=request.getContextPath() + av.getAccoImgpath()%>" class="card-img-top rounded-4" alt="...">
							<form class="like-form" action="<%=request.getContextPath()%>/acco/wish.do" method="post" enctype="multipart/form/data" style="position: absolute; top: 5px; right: 5px;">
								<input type="hidden" name="accoNo" value="<%=av.getAccoNo()%>">
								<button type="submit" class="btn btn-outline-primary border-0 like-button" data-acco-no="<%=av.getAccoNo()%>">
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
								<h5 class="card-title" id="accotitle"><%=accoName%></h5>
								<%
									String accoInfo = av.getAccoInfo();
								if (accoInfo.length() > 45) {
									accoInfo = accoInfo.substring(0, 45) + "...";
								}
								%>
								<p class="card-text" id="accotext"><%=accoInfo%></p>
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

		<!-- 인기 숙소 영역 2줄 시작 -->
		<section class="col-12 card-wrapper">
			<div class="row">
				<%
					// Calculate the loop end index, limited to the size of accoList
			int loopStart = 3;
            int loopEnd2 = Math.min(loopStart + 3, accoList.size());
            for (int i = loopStart; i < loopEnd2; i++) {
                AccommodationVO av = accoList.get(i);
				%>
				<div class="col-md-4 mb-5" id="accocard">
					<div class="card border-0" style="width: 24rem;">
						<div style="position: relative;">
							<img src="<%=request.getContextPath() + av.getAccoImgpath()%>" class="card-img-top rounded-4" alt="...">
							<form class="like-form" action="<%=request.getContextPath()%>/acco/wish.do" method="post" enctype="multipart/form/data" style="position: absolute; top: 5px; right: 5px;">
								<input type="hidden" name="accoNo" value="<%=av.getAccoNo()%>">
								<button type="submit" class="btn btn-outline-primary border-0 like-button" data-acco-no="<%=av.getAccoNo()%>">
									
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
								<h5 class="card-title" id="accotitle"><%=accoName%></h5>
								<%
									String accoInfo = av.getAccoInfo();
								if (accoInfo.length() > 45) {
									accoInfo = accoInfo.substring(0, 45) + "...";
								}
								%>
								<p class="card-text" id="accotext"><%=accoInfo%></p>
							</div>
						</a>
					</div>
				</div>
				<%
					}
				%> 
			</div>
		</section>
		</div>
		<!-- 인기 숙소 영역 2줄 끝 -->
		<!-- 인기 숙소 영역 끝 -->

	<div class="p-5"></div>
	<div class="p-5"></div>

	<!-- 인기 맛집 영역 -->
	<div class="ms-4">
	    <div class="text-xxl-start text-center mb-5" id="top-restaurant">
	        <span>후회 없는 올레의 맛집 소개&nbsp🍜</span>
	    </div>
	    <!-- 인기 맛집 영역 시작 -->
	<section class="col-12 card-wrapper">
	    <div class="row">
	        <c:forEach var="restaurantVO" items="${restaurantList}" varStatus="status" begin="1" end="6">
	            <div class="col-md-4 mb-5">
	                <div class="card border-0" style="width: 24rem;">
	                    <img src="<%=request.getContextPath()%>${restaurantVO.getRestaurantImgVO().getRstImgPath()}" class="card-img-top rounded-4" alt="...">
                        <a href="/JejuOlleh/views/restaurant/detail2.jsp?rstImgPath=${restaurantVO.getRestaurantImgVO().getRstImgPath()}&rstTel=${restaurantVO.getRstTel()}&rstName=${restaurantVO.getRstName()}&rstMenu=${restaurantVO.getRstMenu()}&rstLoc=${restaurantVO.getRstLoc()}&rstList=${restaurantVO.getRstList()}&rstPrice=${restaurantVO.getRstPrice()}&rstTime=${restaurantVO.getRstTime()}&rstIntro=${restaurantVO.getRstIntro()}">
		                    <div class="card-body">
		                        <h4 class="card-title" id="restauranttitle">${restaurantVO.getRstName()}</h4>
		                        <p class="card-text" id="restauranttext">${fn:substring(restaurantVO.getRstIntro(), 0, 15)}...</p>
		                    </div>
                        </a>
	                </div>
	            </div>
	            
<%-- 	            매 3번째 요소마다 줄바꿈 --%>
<%-- 	            <c:if test="${status.index  == 5}"> --%>
<!-- 	             </div> -->
<!-- 	                </section> -->
	           
<%-- 	            </c:if> --%>
	           
<%-- 	            매 3번째 요소마다 줄바꿈 --%>
<%-- 	            <c:if test="${status.index % 3 == 2}"> --%>
<!-- 	                </div> -->
<!-- 	                </section> -->
	                
<!-- 	                <section class="col-12 card-wrapper"> -->
<!-- 	    			<div class="row"> -->
<%-- 	             </c:if> --%>
	             
	             
	        </c:forEach>
	    </div>
	</section>

		<!-- 인기 맛집 영역 끝 -->


	<div class="p-5"></div>
	<div class="p-5"></div>

	<!-- 인기 놀거리 영역 -->
	<div class="ms-4">
		<div class="text-xxl-start text-center mb-5" id="top-activity">
			<span>MZ들이 꼭 보고 체험하는&nbsp&#127939;</span>
		</div>

		<!-- 인기 놀거리 영역 시작 -->
	<section class="col-12 card-wrapper">
    <div class="row">
        <c:forEach var="activityVO" items="${activityList}" varStatus="status" begin="0" end="5">
            <div class="col-md-4 mb-5">
                <div class="card border-0" style="width: 24rem;">
                    <img src="<%=request.getContextPath()%>${activityVO.getActivityImgVO().getActImgPath()}" class="card-img-top rounded-4" alt="...">
                        <a href="/JejuOlleh/views/activity/actdetail.jsp?actImgPath=${activityVO.getActivityImgVO().getActImgPath()}&actName=${activityVO.getActName()}&actLoc=${activityVO.getActLoc()}&actTel=${activityVO.getActTel()}&actIntro=${activityVO.getActIntro()}&actCate=${activityVO.getActCate()}">
                    		<div class="card-body">
                        	<h4 class="card-title" id="activitytitle">${fn:substring(activityVO.getActName(),0, 15)}...</h4>
                        	<p class="card-text" id="activitytext">${fn:substring(activityVO.getActIntro(), 0, 15)}...</p>
                    		</div>
                        </a>
                </div>
            </div>
            
<%--             매 3번째 요소마다 줄바꿈 --%>
<%--             <c:if test="${status.index  == 5}"> --%>
<!--              </div> -->
<!--                 </section> -->
           
<%--             </c:if> --%>
           
<%--             매 3번째 요소마다 줄바꿈 --%>
<%--             <c:if test="${status.index % 3 == 2}"> --%>
<!--                 </div> -->
<!--                 </section> -->
                
<!--                 <section class="col-12 card-wrapper"> -->
<!--     			<div class="row"> -->
<%--              </c:if> --%>
             
             
        </c:forEach>
    </div>
</section>

		<!-- 인기 놀거리 영역 끝 -->
	</div>
	</div>
</div>

<!-- 채팅 봇 -->
<script>
	(function() {
		var w = window;
		if (w.ChannelIO) {
			return w.console.error("ChannelIO script included twice.");
		}
		var ch = function() {
			ch.c(arguments);
		};
		ch.q = [];
		ch.c = function(args) {
			ch.q.push(args);
		};
		w.ChannelIO = ch;
		function l() {
			if (w.ChannelIOInitialized) {
				return;
			}
			w.ChannelIOInitialized = true;
			var s = document.createElement("script");
			s.type = "text/javascript";
			s.async = true;
			s.src = "https://cdn.channel.io/plugin/ch-plugin-web.js";
			var x = document.getElementsByTagName("script")[0];
			if (x.parentNode) {
				x.parentNode.insertBefore(s, x);
			}
		}
		if (document.readyState === "complete") {
			l();
		} else {
			w.addEventListener("DOMContentLoaded", l);
			w.addEventListener("load", l);
		}
	})();

	ChannelIO('boot', {
		"pluginKey" : "c3ed450f-53cb-4738-901a-f38d3f2bd284",
		"memAth" : "ADMIN", // fill user's member id
		"profile" : { // fill user's profile
			"memID" : "MEMID", // fill user's name 
			"memAth" : "USER", // custom property

		}
	});
</script>
<!-- 컨테이너 영역 끝 -->