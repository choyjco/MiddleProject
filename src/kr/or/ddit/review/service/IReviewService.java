package kr.or.ddit.review.service;

import java.util.List;

import kr.or.ddit.review.vo.ReviewVO;

public interface IReviewService {

	//리뷰 등록
	public int insertReview(ReviewVO reviewVO);
	
	//리뷰 수정
	public int updateReview(ReviewVO reviewVO);
	
	//숙소별 리뷰 조회
	public List<ReviewVO> reviewList(String accoNo);

	//숙소번호별 리뷰 조회
	public ReviewVO searchReview(String revNo);
	
	//리뷰 삭제
	public int deleteReview(String revNo);
	
	//회원별 리뷰 조회
	public List<ReviewVO> memRevList(String memId);
}
