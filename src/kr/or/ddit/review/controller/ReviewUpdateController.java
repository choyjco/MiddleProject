package kr.or.ddit.review.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.review.service.IReviewService;
import kr.or.ddit.review.service.ReviewService;
import kr.or.ddit.review.vo.ReviewVO;

@WebServlet("/acco/review/update.do")
public class ReviewUpdateController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		RequestDispatcher rd = req.getRequestDispatcher("/views/review/reviewUpdate.jsp");
//		rd.forward(req, resp);
		
		String revNo= req.getParameter("revNo");
		
		IReviewService reviewService = ReviewService.getInstance(); 
		
		//리뷰 정보 조회
		ReviewVO reviewVO = reviewService.searchReview(revNo);
		System.out.println(reviewVO);
		
		 req.setAttribute("reviewVO", reviewVO);
		req.setAttribute("revNo", revNo);
//		System.out.println("revNo doget" +  revNo);
		req.getRequestDispatcher("/views/review/reviewUpdate.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");

		String revNo = req.getParameter("revNo");
		String resNo = req.getParameter("resNo");
		String revCon = req.getParameter("revCon");
		String [] revStarString = req.getParameterValues("revStar[]");
		
		int revStar = revStarString.length;
		
		System.out.println("dopost revNo"+ revNo);
		
		String revDateString = req.getParameter("revDate");
		
		
		IReviewService reviewService = ReviewService.getInstance(); 

		ReviewVO reviewVO = new ReviewVO(revNo, resNo, revCon, revStar);
		
		reviewVO.setMemId((String)req.getSession().getAttribute("memId"));
		
		int cnt = reviewService.updateReview(reviewVO);
		System.out.println(cnt);
		
		resp.sendRedirect(req.getContextPath()+"/acco/review/detail.do?memId="+reviewVO.getMemId());
		
		
	}
}
