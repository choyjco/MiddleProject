package kr.or.ddit.activity.controller;

import java.io.IOException;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.activity.service.ActivityServiceImpl;
import kr.or.ddit.activity.service.IActivityImgService;
import kr.or.ddit.activity.vo.ActivityImgVO;
import kr.or.ddit.activity.vo.ActivityVO;
import kr.or.ddit.board.service.BoardAskServiceImpl;
import kr.or.ddit.board.service.IBoardAskService;
import kr.or.ddit.board.vo.BoardAskVO;
import kr.or.ddit.restaurant.service.IRestaurantImgService;
import kr.or.ddit.restaurant.service.RestaurantServiceImpl;
import kr.or.ddit.restaurant.vo.RestaurantImgVO;
import kr.or.ddit.restaurant.vo.RestaurantVO;

//http://localhost:8888/JejuOlleh/DetailController?actNo=CNTS_200000000013424
@WebServlet("/DetailController")
public class DetailController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String actNo =req.getParameter("actNo");//CNTS_200000000013424
		String actImgPath = req.getParameter("actImgPath"); //null
		
		ActivityImgVO activityImgVO = new ActivityImgVO();
		//ActivityImgVO [actImgNo=null, actNo=null, actImgPath=null]
		activityImgVO.setActImgPath(actImgPath);
		
		IActivityImgService activityService = ActivityServiceImpl.getInstance();
		//ActivityVO [actNo=CNTS_200000000013424, actName=2022 서귀포 봄맞이 축제, actLoc=제주특별자치도 서귀포시 이중섭로 29
		//, actTel=064-767-9505, actCate=축제, actLat=null
		//, actIntro=서귀포의 각 지역의 각각의 색깔로 노지 문화를 가꿔왔던 대정, 서귀, 정의권 3대 생활문화권으로 나눠 봄과 문화를 알리는 축제
		//, actLong=null, activityImgVO=null]
		ActivityVO vo = activityService.detailActivity(actNo);//CNTS_200000000013424
		
		req.setAttribute("vo", vo);
		
		req.getRequestDispatcher("/views/activity/actdetail3.jsp").forward(req, resp);
		      
        
	   }
	   
	   @Override
	   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 doGet(req, resp);
	   }
	
 }
