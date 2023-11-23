package kr.or.ddit.accommoation.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.accommodation.vo.AccoImgVO;
import kr.or.ddit.util.MyBatisUtil;

public class AccoImgDao implements IAccoImgDao {

	//싱글톤
	private static AccoImgDao accoImgDao;
	
	private  AccoImgDao() {}
	
	public static AccoImgDao getInstance() {
		if(accoImgDao==null) {
			accoImgDao = new AccoImgDao();
		}
		return accoImgDao;
	}
	
	// 숙소등록시 이미지 추가
	@Override
	public int insertAccoImg(AccoImgVO accoImgVO) {
		
		int cnt = 0;
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			System.out.println("이미지추가 dao : " + accoImgVO);
			cnt = session.insert("accoImg.insert",accoImgVO);
			session.commit();
			
		}catch(PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return cnt;
		
	}
	
	//ACCO_IMG테이블의 ACCO_IMG_NO 다음 번호 가져오기
	@Override
	public int getAccoImgNo() {
		int accoImgNo = 0;
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			accoImgNo = session.selectOne("accoImg.getAccoImgNo");
			session.commit();
			
		}catch(PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return accoImgNo;
	}

	
	//숙소 등록시 저장된 이미지 불러오기
	@Override
	public List<AccoImgVO> getAccoImgList(AccoImgVO accoImgVO) {
		
		List<AccoImgVO> accoImgList = new ArrayList<AccoImgVO>(); 
		
		SqlSession session = MyBatisUtil.getInstance(true);	
		
		try {
			accoImgList = session.selectList("accoImg.getImgList",accoImgVO);
//			System.out.println("accoImgList"+ accoImgList);
			
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return accoImgList;
	}

	//수정시 이미지 업데이트
	@Override
	public int UpdateAccoImg(AccoImgVO accoImgVO) {

		int cnt = 0;
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
//			System.out.println("이미지 수정 dao : " + accoImgVO);
			cnt = session.update("accoImg.updateImg",accoImgVO);
			session.commit();
			
		}catch(PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return cnt;
		
	} 
	
	

}
