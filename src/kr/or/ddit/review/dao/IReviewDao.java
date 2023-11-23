package kr.or.ddit.review.dao;

import java.util.List;

import kr.or.ddit.review.vo.ReviewVO;

public interface IReviewDao {

	//리뷰 등록
	public int insertReview(ReviewVO reviewVO);
	
	//리뷰 수정
	public int updateReview(ReviewVO reviewVO);
	
	//숙소별 리뷰 조회
	public List<ReviewVO> reviewList(String accoNo);
	
	//리뷰번호별 리뷰 조회
	public ReviewVO selectRev(String revNo);
	
	//리뷰 삭제
	public int deleteReview(String revNo);
	
	//회원별 리뷰 조회
	public List<ReviewVO> memReviewList(String memId);
}
