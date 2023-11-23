package kr.or.ddit.activity.dao;

import java.util.List;

import kr.or.ddit.activity.vo.ActivityImgVO;
import kr.or.ddit.activity.vo.ActivityVO;
import kr.or.ddit.board.vo.BoardAskVO;
import kr.or.ddit.restaurant.vo.RestaurantImgVO;
import kr.or.ddit.restaurant.vo.RestaurantVO;


public interface IActivityImgDao {

	
	//저장파일리스트 가져오기
	public List<ActivityImgVO> getActivtyImgList(ActivityImgVO activityImgVO);
	
	public List<ActivityVO> getActivityImgList(ActivityVO activityVO);
	//인트로덕션 목록
	public List<ActivityVO> displayAllActivity();
	
	public List<ActivityVO> searchActivity(ActivityVO activityVO);
	
	public List<ActivityVO> arrayActivity(ActivityVO activityVO);
	
	public List<ActivityVO> newActivity(ActivityVO activityVO);
	
	public int insertActivity(ActivityVO activityVO);
	
	public List<ActivityVO> listActivity();
	
	public ActivityVO datailActivity(String actNo);
	
	public int deleteActivity(String actNo);
	
	public int updateActivity(ActivityVO activityVO);
	
	public int updateImgActivity(ActivityVO activityVO);

}
