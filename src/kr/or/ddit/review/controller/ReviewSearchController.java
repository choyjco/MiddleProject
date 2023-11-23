package kr.or.ddit.review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.accommodation.service.AccommodationService;
import kr.or.ddit.accommodation.service.IAccommodationService;
import kr.or.ddit.accommodation.vo.AccommodationVO;
import kr.or.ddit.review.service.IReviewService;
import kr.or.ddit.review.service.ReviewService;
import kr.or.ddit.review.vo.ReviewVO;

//회원별 리뷰 조회 
@WebServlet("/acco/review/detail.do")
public class ReviewSearchController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String memId = req.getParameter("memId"); // 파라미터로 요값을 넣어주면 (쿼리문에 넣는거 ) // 쿼리문에 보내는거
		
		IReviewService reviewService = ReviewService.getInstance();
		
		List<ReviewVO> memRevList = reviewService.memRevList(memId);
		
		req.setAttribute("memRevList", memRevList);
		
		req.getRequestDispatcher("/views/member/revList.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
