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

import org.apache.jasper.tagplugins.jstl.core.Out;

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

@WebServlet("/RestDetailController")
public class RestDetailController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		String rstNo =req.getParameter("rstNo");
		System.out.println(rstNo);
		String rstImgPath = req.getParameter("rstImgPath"); 
		
		RestaurantImgVO restaurantImgVO = new RestaurantImgVO();
		restaurantImgVO.setRstImgPath(rstImgPath);
		
		IRestaurantImgService restaurantService = RestaurantServiceImpl.getInstance();
		
		RestaurantVO vo = restaurantService.detailRestaurant(rstNo);
		
		req.setAttribute("vo", vo);
		
		req.getRequestDispatcher("/views/restaurant/restdetail.jsp").forward(req, resp);
		      
        
	   }
	   
	   @Override
	   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 doGet(req, resp);
	   }
	
 }
