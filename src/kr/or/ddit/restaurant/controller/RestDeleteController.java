package kr.or.ddit.restaurant.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.activity.service.ActivityServiceImpl;
import kr.or.ddit.activity.service.IActivityImgService;
import kr.or.ddit.board.service.BoardAskServiceImpl;
import kr.or.ddit.board.service.IBoardAskService;
import kr.or.ddit.restaurant.service.IRestaurantImgService;
import kr.or.ddit.restaurant.service.RestaurantServiceImpl;

@WebServlet("/RestDeleteController")
public class RestDeleteController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String rstNo = req.getParameter("rstNo");
		
		IRestaurantImgService restaurantService = RestaurantServiceImpl.getInstance();
		
		int cnt1 = restaurantService.deleteRestaurant(rstNo);
		
		String msg1 = "";
		if(cnt1 > 0) {
			//성공
			msg1 = "성공";
		}else {
			//실패
			msg1 = "실패";
		}
		
		HttpSession httpSession = req.getSession();
		httpSession.setAttribute("msg", msg1);
		
		resp.sendRedirect(req.getContextPath() + "/RestListController");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
