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

import kr.or.ddit.restaurant.service.IRestaurantImgService;
import kr.or.ddit.restaurant.service.RestaurantServiceImpl;
import kr.or.ddit.restaurant.vo.RestaurantImgVO;
import kr.or.ddit.restaurant.vo.RestaurantVO;

@WebServlet("/RestaurantImg.do")
public class RestaurantImg extends HttpServlet {
	
	@Override
	   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			System.out.println("왔다");
	      IRestaurantImgService restaurantService = RestaurantServiceImpl.getInstance();
	      

	      List<RestaurantVO> restaurantVOList = restaurantService.displayAllRestaurant();
	      System.out.println("restaurantVOList : " + restaurantVOList);
//		  List<RestaurantImgVO> restList = restService.getRestaurantImgList(new RestaurantImgVO());
//	      System.out.println("restList : " + restList);
//	      List<RestaurantVO> restList2 = restService.getRestaurantList(new RestaurantVO());
//	      System.out.println("restList2 : " + restList2);
//	      
	      req.setAttribute("restaurantList", restaurantVOList);
//	      req.setAttribute("restList2", restList2);
	      
	      RequestDispatcher rd = req.getRequestDispatcher("/WebContent/jeju/detail.jsp");
	      
	      rd.forward(req, resp);
	      
	   }
	   
	   @Override
	   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	      doGet(req, resp);
	   
	   
	   
	   }
	
 }
