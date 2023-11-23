package kr.or.ddit.activity.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.activity.vo.ActivityImgVO;
import kr.or.ddit.activity.vo.ActivityVO;
import kr.or.ddit.restaurant.vo.RestaurantImgVO;
import kr.or.ddit.restaurant.vo.RestaurantVO;

public interface IActivityImgService {
	
	//저장파일리스트 가져오기
	public List<ActivityImgVO> getActivityImgList(ActivityImgVO activityImgVO);
	
	public List<ActivityVO> getActivityList(ActivityVO activityVO);

	//인트로덕션 목록
	public List<ActivityVO> displayAllActivity();
	
	public List<ActivityVO> searchActivity(ActivityVO activityVO);
	
	public List<ActivityVO> arrayActivity(ActivityVO activityVO);
	
	public List<ActivityVO> newActivity(ActivityVO activityVO);

	public int insertActivity(ActivityVO activityVO);
	
	public List<ActivityVO> listActivity();
	
	public ActivityVO detailActivity(String actNo);
	
	public int deleteActivity(String actNo);
	
	public int updateActivity(ActivityVO activityVO);
	
	
}
