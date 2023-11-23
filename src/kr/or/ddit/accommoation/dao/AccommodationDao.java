package kr.or.ddit.accommoation.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.accommodation.vo.AccommodationVO;
import kr.or.ddit.util.MyBatisUtil;

public class AccommodationDao implements IAccommodationDao {
	
	//싱글톤패턴
	private static AccommodationDao accoDao;
	
	private AccommodationDao(){} 
	
	public static AccommodationDao getInstance() {
		
		if(accoDao == null) {
			accoDao = new AccommodationDao();
		}
		return accoDao;
	}
	
	// 숙소등록
	@Override
	public int insertAcco(AccommodationVO accoVO) {
		
		int cnt = 0;
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
//			System.out.println("숙소등록: " + accoVO);
			cnt = session.insert("accommodation.insert",accoVO);
			session.commit();
			
		}catch(PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return cnt;
	}

	//숙소 조회 (accoNo로 조회)
	@Override
	public AccommodationVO getDetail(String accoNo) {

		AccommodationVO accoVO = null;
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			accoVO = session.selectOne("accommodation.detail",accoNo);
//			System.out.println("숙소조회 accoNO"+ accoNo);
		}catch(PersistenceException ex) {
			
			session.rollback();
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return accoVO;
	}

	//숙소 정보 수정
	@Override
	public int updateAcco(AccommodationVO accoVO) {
		
		int cnt = 0;
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			cnt = session.update("accommodation.update",accoVO);
//			System.out.println("숙소수정 accoNO"+ accoVO);

			session.commit();
			
		}catch(PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return cnt; 
	}

	//숙소 상태변경
	@Override
	public int statusChange(AccommodationVO accoVO) {

		int cnt = 0;
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			cnt = session.update("accommodation.statusChange",accoVO);
			session.commit();
		}catch(PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return cnt;
	}
	

	//상태값 포함 조회
	@Override
	public AccommodationVO getOneDetail(String accoNo) {
		
		AccommodationVO accoVO = null;
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			accoVO = session.selectOne("accommodation.detailOne",accoNo);
//			System.out.println("숙소조회 accoNO"+ accoNo);
		}catch(PersistenceException ex) {
			
			session.rollback();
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return accoVO;
	
}

	public List<AccommodationVO> getAllacco() {

		List<AccommodationVO> accolist = new ArrayList<AccommodationVO>();
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			accolist = session.selectList("accommodation.getAllacco");
		}catch(PersistenceException ex) {
			
			session.rollback();
			ex.printStackTrace();
		}finally {
			session.close();
		}
		
		return accolist;
	}

	//호스트회원별 숙소조회
	@Override
	public List <AccommodationVO> memAccoSelect(String memId) {
		
		List<AccommodationVO> accoMemList = new ArrayList<AccommodationVO>();
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			accoMemList = session.selectList("accommodation.memAccoList",memId);
//			System.out.println(accoMemList);
		}catch(PersistenceException ex){
			ex.printStackTrace();
			session.rollback();
		}finally {
			session.close();
		}
		return accoMemList;
	}
	
	
}
