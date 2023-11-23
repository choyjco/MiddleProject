package kr.or.ddit.accommodation.controller;

import java.io.IOException;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.accommodation.service.AccoImgService;
import kr.or.ddit.accommodation.service.AccommodationService;
import kr.or.ddit.accommodation.service.IAccoImgService;
import kr.or.ddit.accommodation.service.IAccommodationService;
import kr.or.ddit.accommodation.vo.AccoImgVO;
import kr.or.ddit.accommodation.vo.AccommodationVO;
import kr.or.ddit.review.service.IReviewService;
import kr.or.ddit.review.service.ReviewService;
import kr.or.ddit.review.vo.ReviewVO;

@WebServlet("/acco/detail.do")
public class detailAccoController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("detailAccoController->doGet");
		
		//상세보기하려면 키값 > 숙소 id
		String accoNo = req.getParameter("accoNo");
		
		HttpSession session = req.getSession();
		session.setAttribute("accoNo", accoNo);
		
		//서비스 생성
		IAccommodationService accoService = AccommodationService.getInstance();
		IAccoImgService accoImgService = AccoImgService.getInstance();
		IReviewService reviewService = ReviewService.getInstance();

		//숙소 상세 정보 조회
		AccommodationVO accoVO = accoService.detail(accoNo);
		
		//요청객체에 데이터 저장
		req.setAttribute("accoVO", accoVO);
		
		AccoImgVO accoImgVO = new AccoImgVO();
		accoImgVO.setAccoImgNo(accoVO.getAccoImgNo()); // join
		
		ReviewVO reviewVO = new ReviewVO();
		reviewVO.setAccoNo(accoVO.getAccoNo());
		
		System.out.println(">>>>>detail controller accoVO <<<<<<<<<<<<<<" + accoVO);
		List<AccoImgVO> accoImgList = accoImgService.getAccoImgList(accoImgVO);
		List<ReviewVO> reviewList = reviewService.reviewList(accoNo);

		
		System.out.println("detail controller accoImgList" + accoImgList);
		
		req.setAttribute("reviewVO", reviewVO);
		req.setAttribute("accoImgList", accoImgList);
		req.setAttribute("reviewList", reviewList);
		req.getRequestDispatcher("/views/acco/detail.jsp").forward(req, resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("detailAccoController->doPost");

		doGet(req, resp);
	}
}
