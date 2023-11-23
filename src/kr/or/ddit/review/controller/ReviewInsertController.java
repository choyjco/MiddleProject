package kr.or.ddit.review.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.accommodation.vo.AccommodationVO;
import kr.or.ddit.review.service.IReviewService;
import kr.or.ddit.review.service.ReviewService;
import kr.or.ddit.review.vo.ReviewVO;

@WebServlet("/acco/review/insert.do")
public class ReviewInsertController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		String resNo = req.getParameter("resNo"); // 예약번호
		String accoNo = req.getParameter("accoNo"); // 숙소번호
		String accoName = req.getParameter("accoName");

		//세션에서 값 가져오기
		HttpSession session = req.getSession(); 
		String memId = (String) session.getAttribute("memId"); // "memId"라는 이름으로 저장된 값을 가져온다.

		
		System.out.println("파라미터값 >> "+resNo + accoNo);
		
		RequestDispatcher rd = req.getRequestDispatcher("/views/review/reviewInsert.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		
		String revNo = req.getParameter("revNo"); 
		String resNo = req.getParameter("resNo"); // 예약번호
		String revCon = req.getParameter("revCon");
		String [] revStarString = req.getParameterValues("revStar[]");
		String accoNo = req.getParameter("accoNo"); // 숙소번호
		String accoName = req.getParameter("accoName");
		
		int revStar = revStarString.length;
		
		String revDateString = req.getParameter("revDate");
		
		System.out.println(resNo + " resNo 값 /n" + accoNo + " accoNo 값");
		 System.out.println("resNo: " + resNo);
		    System.out.println("accoNo: " + accoNo);
		    System.out.println("revStar: " + revStar);
		    System.out.println("revCon: " + revCon);
//		int revStar = Integer.parseInt(revStarString);
		
//		SimpleDateFormat sdf = new SimpleDateFormat("YYMMDD");
		
//		Date revDate = null;
//		try {
//			revDate = sdf.parse(revDateString);
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}
		
		IReviewService reviewService = ReviewService.getInstance(); 
		
		ReviewVO reviewVO = new ReviewVO(revNo, resNo, revCon, revStar, accoNo);

		reviewVO.setMemId((String)req.getSession().getAttribute("memId"));
			
		req.setAttribute("reviewVO", reviewVO);
		System.out.println("controller" + reviewVO);
		
		int cnt = reviewService.insertReview(reviewVO);
		System.out.println(cnt);
		
		resp.sendRedirect(req.getContextPath()+"/res/memreslist.do");
		
	}
}
