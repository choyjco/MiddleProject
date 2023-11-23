package kr.or.ddit.review.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.review.vo.ReviewVO;
import kr.or.ddit.util.MyBatisUtil;

public class ReviewDao implements IReviewDao{

	private static ReviewDao reviewDao;
	
	private ReviewDao(){}
	
	public static ReviewDao getInstance() {
		if(reviewDao == null) {
			reviewDao = new ReviewDao();
		}
		return reviewDao;
	}
	
	//리뷰 등록
	@Override
	public int insertReview(ReviewVO reviewVO) {
		
		int cnt = 0;
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			cnt= session.insert("review.insert",reviewVO);
			session.commit();
		}catch(PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return cnt;
	}

	//리뷰 수정
	@Override
	public int updateReview(ReviewVO reviewVO) {
		
		int cnt = 0;
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			cnt= session.update("review.update",reviewVO);
			System.out.println("update reviewVO" + reviewVO);
			session.commit();
		}catch(PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return cnt;
	}

	//숙소별 리뷰 조회
	@Override
	public List<ReviewVO> reviewList (String accoNo) {
		
		List<ReviewVO> revList = new ArrayList<ReviewVO>();
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			revList = session.selectList("review.detail",accoNo);
			
		}catch(PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return revList;
	}

	//리뷰번호별 리뷰조회
	@Override
	public ReviewVO selectRev(String revNo) {
		ReviewVO reviewVO = null;
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			reviewVO = session.selectOne("review.select",revNo);
			
		}catch(PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return reviewVO;
	}

	//리뷰 삭제
	@Override
	public int deleteReview(String revNo) {

		int cnt = 0;
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			cnt = session.delete("review.delete",revNo);
			System.out.println("dao" + revNo);
			session.commit();
			
		}catch(PersistenceException ex) {
			ex.printStackTrace();
			session.rollback();
			
		}finally {
			session.close();
		}
		
		return cnt;
	}

	@Override
	public List<ReviewVO> memReviewList(String memId) {

		List<ReviewVO> memRevList = new ArrayList<ReviewVO>();
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			memRevList = session.selectList("review.memRevList",memId);
			
		}catch(PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return memRevList;
	}
	
}
