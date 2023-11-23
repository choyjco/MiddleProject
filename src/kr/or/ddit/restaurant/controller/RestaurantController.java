package kr.or.ddit.restaurant.controller;

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

import kr.or.ddit.activity.vo.ActivityVO;
import kr.or.ddit.restaurant.service.IRestaurantImgService;
import kr.or.ddit.restaurant.service.RestaurantServiceImpl;
import kr.or.ddit.restaurant.vo.RestaurantImgVO;
import kr.or.ddit.restaurant.vo.RestaurantVO;

@WebServlet("/RestaurantController.do")
public class RestaurantController extends HttpServlet {
	
	@Override
	   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		  String sortOption = req.getParameter("sortOption") == null ? "" : req.getParameter("sortOption");
		  String keyword = req.getParameter("keyword");
		  String rstImgPath = req.getParameter("rstImgPath");
		  System.out.println("제발 가라!!!!!!!!");
		  
	      IRestaurantImgService restaurantService = RestaurantServiceImpl.getInstance();
	      
	      RestaurantVO restaurantVO = new RestaurantVO();
	      RestaurantImgVO restaurantImgVO = new RestaurantImgVO();
	     
	      restaurantVO.setRstName(keyword);
	      restaurantImgVO.setRstImgPath(rstImgPath);
	      
	      System.out.println("restaurantVO : " + restaurantVO);
	      
	      List<RestaurantVO> restaurantVOList;
	      if (sortOption != null && sortOption.equals("a")) {
	          restaurantVOList = restaurantService.arrayRestaurant(restaurantVO);
	      } else if (sortOption != null && sortOption.equals("b")){
	    	  restaurantVOList = restaurantService.newRestaurant(restaurantVO);
	      } else {
	    	  //기본
	    	  restaurantVOList = restaurantService.searchRestaurant(restaurantVO);
	      }
	      
	      System.out.println("restaurantVOList : " + restaurantVOList);
	      
	      req.setAttribute("searchResult", restaurantVOList);
	      req.setAttribute("keyword", keyword);
	      req.setAttribute("rstImgPath", rstImgPath);
     
	      RequestDispatcher rd = req.getRequestDispatcher("/views/restaurant/restaurantmain.jsp");
	      
	      rd.forward(req, resp);
	      
	   }
	   
	   @Override
	   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	      doGet(req, resp);
	   
	   
	   
	   }
	
 }
