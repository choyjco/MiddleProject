package kr.or.ddit.activity.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.activity.dao.ActivityImgDaoImpl;
import kr.or.ddit.activity.dao.IActivityImgDao;
import kr.or.ddit.activity.vo.ActivityImgVO;
import kr.or.ddit.activity.vo.ActivityVO;
import kr.or.ddit.restaurant.dao.IRestaurantImgDao;
import kr.or.ddit.restaurant.dao.RestaurantImgDaoImpl;
import kr.or.ddit.restaurant.vo.RestaurantImgVO;
import kr.or.ddit.restaurant.vo.RestaurantVO;

public class ActivityServiceImpl implements IActivityImgService{

	   private IActivityImgDao restDao;
	   
	   private static IActivityImgService restService;
	   
	   private ActivityServiceImpl() {
	      
	      restDao = ActivityImgDaoImpl.getInstance();
	   }

	   public static IActivityImgService getInstance() {
	      if(restService == null) {
	    	  restService = new ActivityServiceImpl();
	      }
	      return restService;
	   }

	@Override
	public List<ActivityImgVO> getActivityImgList(ActivityImgVO activityImgVO) {
		
		return restDao.getActivtyImgList(activityImgVO);
	}

	@Override
	public List<ActivityVO> getActivityList(ActivityVO activityVO) {
		
		return restDao.getActivityImgList(activityVO);
	}

	@Override
	public List<ActivityVO> displayAllActivity() {
		
		return restDao.displayAllActivity();
	}

	@Override
	public List<ActivityVO> searchActivity(ActivityVO activityVO) {
	
		return restDao.searchActivity(activityVO);
	}

	@Override
	public List<ActivityVO> arrayActivity(ActivityVO activityVO) {
		
		return restDao.arrayActivity(activityVO);
	}

	@Override
	public List<ActivityVO> newActivity(ActivityVO activityVO) {
		
		return restDao.newActivity(activityVO);
	}

	@Override
	public int insertActivity(ActivityVO activityVO) {
		
		return restDao.insertActivity(activityVO);
	}

	@Override
	public List<ActivityVO> listActivity() {
		
		return restDao.listActivity();
	}

	@Override
	public ActivityVO detailActivity(String actNo) {
		
		return restDao.datailActivity(actNo);
	}

	@Override
	public int deleteActivity(String actNo) {
		
		return restDao.deleteActivity(actNo);
	}

	@Override
	public int updateActivity(ActivityVO activityVO) {

		return restDao.updateActivity(activityVO);
	}


	   

	

}
