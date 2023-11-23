package kr.or.ddit.accommodation.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.accommodation.service.AccommodationService;
import kr.or.ddit.accommodation.service.IAccommodationService;
import kr.or.ddit.accommodation.vo.AccommodationVO;
import kr.or.ddit.activity.service.ActivityServiceImpl;
import kr.or.ddit.activity.service.IActivityImgService;
import kr.or.ddit.activity.vo.ActivityVO;
import kr.or.ddit.restaurant.service.IRestaurantImgService;
import kr.or.ddit.restaurant.service.RestaurantServiceImpl;
import kr.or.ddit.restaurant.vo.RestaurantVO;

@WebServlet("/index.do")
public class mainlistAccoController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		IAccommodationService accoService = AccommodationService.getInstance();
		IRestaurantImgService restaurantService = RestaurantServiceImpl.getInstance();
		IActivityImgService activityService = ActivityServiceImpl.getInstance();

		List<AccommodationVO> accoList = accoService.getAllacco();
		List<RestaurantVO> restaurantList = restaurantService.listRestaurant();
		List<ActivityVO> activityList = activityService.listActivity();

		
		req.setAttribute("accoList", accoList);
		req.setAttribute("restaurantList", restaurantList);
		req.setAttribute("activityList", activityList);

		RequestDispatcher rd = null;
		
		String memAth = (String)req.getSession().getAttribute("memAth");
		
//		if("HOST".equals(memAth)) {
//			rd = req.getRequestDispatcher("/views/acco/hostmain.jsp");
//			
//		}else {
//			rd = req.getRequestDispatcher("/views/acco/commain.jsp");
//			
//		}
		
		rd= req.getRequestDispatcher("/index.jsp");
		rd.forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
