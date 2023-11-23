package kr.or.ddit.review.service;

import java.util.List;

import kr.or.ddit.review.dao.ReviewDao;
import kr.or.ddit.review.vo.ReviewVO;

public class ReviewService implements IReviewService {

	private ReviewDao reviewDao;
	
	//싱글톤
	private static ReviewService reviewService;
	
	private ReviewService() {
		reviewDao= ReviewDao.getInstance();
	}
	
	public static ReviewService getInstance() {
		if(reviewService == null) {
			reviewService = new ReviewService();
		}
		return reviewService;
	}

	//리뷰 등록
	@Override
	public int insertReview(ReviewVO reviewVO) {
		return reviewDao.insertReview(reviewVO);
	
	}

	//리뷰 수정
	@Override
	public int updateReview(ReviewVO reviewVO) {
		return reviewDao.updateReview(reviewVO);
	}

	//숙소별 리뷰 조회
	@Override
	public List <ReviewVO> reviewList(String accoNo) {
		return reviewDao.reviewList(accoNo);
	}

	//리뷰번호별 리뷰조회
	@Override
	public ReviewVO searchReview(String revNo) {
		return reviewDao.selectRev(revNo);
	}
	
	//리뷰 삭제
	@Override
	public int deleteReview(String revNo) {
		return reviewDao.deleteReview(revNo);
	}

	//회원별 리뷰조회
	@Override
	public List<ReviewVO> memRevList(String memId) {
		return reviewDao.memReviewList(memId);
	}

	
}
