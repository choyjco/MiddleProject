package kr.or.ddit.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.review.service.IReviewService;
import kr.or.ddit.review.service.ReviewService;
import kr.or.ddit.review.vo.ReviewVO;

@WebServlet("/acco/review/delete.do")
public class ReviewDeleteController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("왔니?");

		String revNo = req.getParameter("revNo");
		System.out.println(revNo);
		
		IReviewService reviewService = ReviewService.getInstance();
		
		int cnt = reviewService.deleteReview(revNo);
		
//		String msg = "";
//		
//		if(cnt>0) {
//			//성공
//			msg = "성공";
//		}else {
//			//실패
//			msg = "실패";
//		}
//		
//		HttpSession httpSession = req.getSession();
//		httpSession.setAttribute("msg", msg); 
//		
		
		resp.sendRedirect(req.getContextPath()+"/acco/review/detail.do");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}

