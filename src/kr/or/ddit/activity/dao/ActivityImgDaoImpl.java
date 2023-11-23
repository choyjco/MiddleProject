package kr.or.ddit.activity.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.activity.vo.ActivityImgVO;
import kr.or.ddit.activity.vo.ActivityVO;
import kr.or.ddit.comm.dao.MyBatisDao;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.restaurant.vo.RestaurantImgVO;
import kr.or.ddit.restaurant.vo.RestaurantVO;
import kr.or.ddit.util.MyBatisUtil;

public class ActivityImgDaoImpl extends MyBatisDao implements IActivityImgDao {
	
	private static ActivityImgDaoImpl instance = new ActivityImgDaoImpl();
	private        ActivityImgDaoImpl() {}
	public  static ActivityImgDaoImpl getInstance() {
		return instance;
	}
	
    //인트로덕션 목록

	
	@Override
	public List<ActivityImgVO> getActivtyImgList(ActivityImgVO activityImgVO) {
		
		List<ActivityImgVO> activityImgList = new ArrayList<ActivityImgVO>(); 
		
		activityImgList = selectOne("activityImg.getImgList",activityImgVO);
			
		return activityImgList;
	}
	
	@Override
	public List<ActivityVO> getActivityImgList(ActivityVO activityVO) {
		
		List<ActivityVO> activityImgList2 = new ArrayList<ActivityVO>(); 
		
		activityImgList2 = selectOne("activityImg.getImgList",activityVO);

		return activityImgList2;
	}
	
	@Override
	public List<ActivityVO> searchActivity(ActivityVO activityVO) {
		
		List<ActivityVO> restList = Collections.EMPTY_LIST;

		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("actName", activityVO.getActName());
		paramMap.put("actCate", activityVO.getActCate());
		paramMap.put("actIntro", activityVO.getActIntro());
		paramMap.put("actTel", activityVO.getActTel());
	
		restList = selectList("searchActivity", paramMap);

		return restList;
	}
	@Override
	public List<ActivityVO> displayAllActivity() {
		
		List<ActivityVO> activityImgList = new ArrayList<ActivityVO>(); 
		
		activityImgList = selectList("activity.displayAllActivity");
			
		return activityImgList;
	}
	
	@Override
	public List<ActivityVO> arrayActivity(ActivityVO activityVO) {
		
		List<ActivityVO> restList = Collections.EMPTY_LIST;

		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("actName", activityVO.getActName());
		paramMap.put("actCate", activityVO.getActCate());
		paramMap.put("actIntro", activityVO.getActIntro());
		paramMap.put("actTel", activityVO.getActTel());
	
		restList = selectList("arrayActivity", paramMap);

		return restList;
	}
	@Override
	public List<ActivityVO> newActivity(ActivityVO activityVO) {

		List<ActivityVO> restList = Collections.EMPTY_LIST;

		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("actName", activityVO.getActName());
		paramMap.put("actCate", activityVO.getActCate());
		paramMap.put("actIntro", activityVO.getActIntro());
		paramMap.put("actTel", activityVO.getActTel());
	
		restList = selectList("newActivity", paramMap);

		return restList;
	}
	@Override
	public int insertActivity(ActivityVO activityVO) {
		
		int cnt = 0;
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			cnt = session.insert("insertActivity", activityVO);
			
			session.commit();
		
		}catch (PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return cnt;
	}
	
	@Override
	public List<ActivityVO> listActivity() {
		
		List<ActivityVO> activityList = new ArrayList<ActivityVO>();
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			activityList = session.selectList("listActivity");
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		} return activityList;
	}
	
	@Override
	public ActivityVO datailActivity(String actNo) {
		
		ActivityVO activityVo = new ActivityVO();
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			
			activityVo = session.selectOne("detailActivity",actNo);
			
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return activityVo;
	}
	@Override
	public int deleteActivity(String actNo) {
		
		int cnt1 = 0;
		
		SqlSession session = MyBatisUtil.getInstance();

		try {
			cnt1 = session.delete("deleteActivity", actNo);
			
			session.commit();

		} catch (PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		} finally {
			session.close();
		}

		return cnt1;
	}
	@Override
	public int updateActivity(ActivityVO activityVO) {

		int cnt = 0;
		
		SqlSession session = MyBatisUtil.getInstance();

		try {
			cnt = session.update("updateActivity", activityVO);
			
			session.commit();

		} catch (PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		} finally {
			session.close();
		}

		return cnt;
	}
	@Override
	public int updateImgActivity(ActivityVO activityVO) {

		int cnt = 0;
		
		SqlSession session = MyBatisUtil.getInstance();

		try {
			cnt = session.update("updateImgActivity", activityVO);
			
			session.commit();

		} catch (PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		} finally {
			session.close();
		}

		return cnt;
	}
	
	

}
	
