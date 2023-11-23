package kr.or.ddit.restaurant.controller;

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

@WebServlet("/RestListController")
public class RestListController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		IRestaurantImgService restaurantService = RestaurantServiceImpl.getInstance();
		
		List<RestaurantVO> restaurantList = restaurantService.listRestaurant();
		
		req.setAttribute("restaurantList", restaurantList);
		
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		RequestDispatcher rd = req.getRequestDispatcher("/views/restaurant/restlist.jsp");
		rd.forward(req, resp);
	   }
	   
	   @Override
	   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		   req.setCharacterEncoding("UTF-8");
		   resp.setCharacterEncoding("UTF-8");
		   doGet(req, resp);
	   }
	
 }
