package kr.or.ddit.restaurant.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.restaurant.dao.IRestaurantImgDao;
import kr.or.ddit.restaurant.dao.RestaurantImgDaoImpl;
import kr.or.ddit.restaurant.vo.RestaurantImgVO;
import kr.or.ddit.restaurant.vo.RestaurantVO;

public class RestaurantServiceImpl implements IRestaurantImgService{

	   private IRestaurantImgDao restDao;
	   
	   private static IRestaurantImgService restService;
	   
	   private RestaurantServiceImpl() {
	      
	      restDao = RestaurantImgDaoImpl.getInstance();
	   }

	   public static IRestaurantImgService getInstance() {
	      if(restService == null) {
	    	  restService = new RestaurantServiceImpl();
	      }
	      return restService;
	   }
	   
	@Override
	public List<RestaurantImgVO> getRestaurantImgList(RestaurantImgVO restaurantImgVO) {
		
		return restDao.getRestaurantImgList(restaurantImgVO);
	}

	@Override
	public List<RestaurantVO> getRestaurantList(RestaurantVO restaurantVO) {

		return restDao.getRestaurantImgList(restaurantVO);
	}

	//인트로덕션 목록
	@Override
	public List<RestaurantVO> displayAllRestaurant() {
		return restDao.displayAllRestaurant();
	}

	@Override
	public List<RestaurantVO> searchRestaurant(RestaurantVO restaurantVO) {
		
		return restDao.searchRestaurant(restaurantVO);
	}

	@Override
	public List<RestaurantVO> arrayRestaurant(RestaurantVO restaurantVO) {
		
		return restDao.arrayRestaurant(restaurantVO);
	}

	@Override
	public List<RestaurantVO> newRestaurant(RestaurantVO restaurantVO) {
		
		return restDao.newRestaurant(restaurantVO);
	}

	@Override
	public int insertRestaurant(RestaurantVO restaurantVO) {
	
		return restDao.insertRestaurant(restaurantVO);
	}

	@Override
	public List<RestaurantVO> listRestaurant() {

		return restDao.listRestaurant();
	}

	@Override
	public RestaurantVO detailRestaurant(String rstNo) {
		
		return restDao.datailRestaurant(rstNo);
	}

	@Override
	public int deleteRestaurant(String rstNo) {
	
		return restDao.deleteRestaurant(rstNo);
	}

	@Override
	public int updateRestaurant(RestaurantVO restaurantVO) {
		
		return restDao.updateRestaurant(restaurantVO);
	}

	@Override
	public int updateImgRestaurant(RestaurantVO restaurantVO) {
		
		return restDao.updateRestaurant(restaurantVO);
	}
	
	

}
