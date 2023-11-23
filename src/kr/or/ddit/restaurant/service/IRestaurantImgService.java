package kr.or.ddit.restaurant.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.activity.vo.ActivityVO;
import kr.or.ddit.restaurant.vo.RestaurantImgVO;
import kr.or.ddit.restaurant.vo.RestaurantVO;

public interface IRestaurantImgService {
	
	//저장파일리스트 가져오기
	public List<RestaurantImgVO> getRestaurantImgList(RestaurantImgVO restaurantImgVO);
	
	public List<RestaurantVO> getRestaurantList(RestaurantVO restaurantVO);

	//인트로덕션 목록
	public List<RestaurantVO> displayAllRestaurant();
	
	public List<RestaurantVO> searchRestaurant(RestaurantVO restaurantVO);

	public List<RestaurantVO> arrayRestaurant(RestaurantVO restaurantVO);
	
	public List<RestaurantVO> newRestaurant(RestaurantVO restaurantVO);
	
	public int insertRestaurant(RestaurantVO restaurantVO);
	
	public List<RestaurantVO> listRestaurant();
	
	public RestaurantVO detailRestaurant(String rstNo);
	
	public int deleteRestaurant(String rstNo);
	
	public int updateRestaurant(RestaurantVO restaurantVO);
	
	public int updateImgRestaurant(RestaurantVO restaurantVO);
}
