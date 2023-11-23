package kr.or.ddit.activity.controller;

import java.io.IOException;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.activity.service.ActivityServiceImpl;
import kr.or.ddit.activity.service.IActivityImgService;
import kr.or.ddit.activity.vo.ActivityImgVO;
import kr.or.ddit.activity.vo.ActivityVO;
import kr.or.ddit.restaurant.service.IRestaurantImgService;
import kr.or.ddit.restaurant.service.RestaurantServiceImpl;
import kr.or.ddit.restaurant.vo.RestaurantImgVO;
import kr.or.ddit.restaurant.vo.RestaurantVO;

@WebServlet("/ActivityController.do")
public class ActivityController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
	   	  String sortOption = req.getParameter("sortOption") == null ? "" : req.getParameter("sortOption"); 
		  String keyword = req.getParameter("keyword"); // 검색어 가져오기
		  String actImgPath = req.getParameter("actImgPath"); 
		  System.out.println("왔다");
	      IActivityImgService activityService = ActivityServiceImpl.getInstance();
	      
	      ActivityVO activityVO = new ActivityVO();
	      ActivityImgVO activityImgVO = new ActivityImgVO();
	      
	      activityVO.setActName(keyword);
	      activityImgVO.setActImgPath(actImgPath);
	      
	     
	      List<ActivityVO> activityVOList;
	      if (sortOption != null && sortOption.equals("a")) {
	          activityVOList = activityService.arrayActivity(activityVO);
	      } else if (sortOption != null && sortOption.equals("b")){
	    	  activityVOList = activityService.newActivity(activityVO);
	      } else {
	    	  activityVOList = activityService.searchActivity(activityVO);
	      }
	      
	      req.setAttribute("searchResult", activityVOList);
	      req.setAttribute("keyword", keyword);
	      req.setAttribute("actImgPath", actImgPath);
	      
	      RequestDispatcher rd = req.getRequestDispatcher("/views/activity/activitymain.jsp");
	      
	      rd.forward(req, resp);
	      
	   }
	   
	   @Override
	   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	      doGet(req, resp);
	   
	   
	   
	   }
	
 }
