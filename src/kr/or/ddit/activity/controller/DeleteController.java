package kr.or.ddit.activity.controller;

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

@WebServlet("/DeleteController")
public class DeleteController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String actNo = req.getParameter("actNo");
		
		IActivityImgService activityService = ActivityServiceImpl.getInstance();
		
		int cnt1 = activityService.deleteActivity(actNo);
		
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
		
		resp.sendRedirect(req.getContextPath() + "/ListController");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
