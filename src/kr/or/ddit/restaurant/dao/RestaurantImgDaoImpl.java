package kr.or.ddit.restaurant.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.activity.vo.ActivityVO;
import kr.or.ddit.comm.dao.MyBatisDao;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.restaurant.vo.RestaurantImgVO;
import kr.or.ddit.restaurant.vo.RestaurantVO;
import kr.or.ddit.util.MyBatisUtil;

public class RestaurantImgDaoImpl extends MyBatisDao implements IRestaurantImgDao {
	
	private static RestaurantImgDaoImpl instance = new RestaurantImgDaoImpl();
	private        RestaurantImgDaoImpl() {}
	public  static RestaurantImgDaoImpl getInstance() {
		return instance;
	}
	
    //인트로덕션 목록
	@Override
	public List<RestaurantVO> displayAllRestaurant() {
		
		List<RestaurantVO> restaurantImgList = new ArrayList<RestaurantVO>(); 
		
		restaurantImgList = selectList("restaurant.displayAllRestaurant");
			
		return restaurantImgList;
	}
	
	@Override
	public List<RestaurantImgVO> getRestaurantImgList(RestaurantImgVO restaurantImgVO) {
		
		List<RestaurantImgVO> restaurantImgList = new ArrayList<RestaurantImgVO>(); 
		
		restaurantImgList = selectOne("restaurantImg.getImgList",restaurantImgVO);
			
		return restaurantImgList;
	}

	@Override
	public List<RestaurantVO> getRestaurantImgList(RestaurantVO restaurantVO) {
		
		List<RestaurantVO> restaurantImgList2 = new ArrayList<RestaurantVO>(); 
		
		restaurantImgList2 = selectOne("restaurantImg.getImgList",restaurantVO);

		return restaurantImgList2;
	}
	
	@Override
	public List<RestaurantVO> searchRestaurant(RestaurantVO restaurantVO) {
		
		List<RestaurantVO> restList = Collections.EMPTY_LIST;

		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("rstName", restaurantVO.getRstName());
		paramMap.put("rstMenu", restaurantVO.getRstMenu());
		paramMap.put("rstCate", restaurantVO.getRstCate());
		paramMap.put("rstIntro", restaurantVO.getRstIntro());
		paramMap.put("rstList", restaurantVO.getRstList());
	
		System.out.println("paramMap : " + paramMap);
		
		restList = selectList("searchRestaurant", paramMap);


		return restList;
	}
	@Override
	public List<RestaurantVO> arrayRestaurant(RestaurantVO restaurantVO) {

		List<RestaurantVO> restList = Collections.EMPTY_LIST;

		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("rstName", restaurantVO.getRstName());
		paramMap.put("rstMenu", restaurantVO.getRstMenu());
		paramMap.put("rstCate", restaurantVO.getRstCate());
		paramMap.put("rstIntro", restaurantVO.getRstIntro());
		paramMap.put("rstList", restaurantVO.getRstList());
	
		restList = selectList("arrayRestaurant", paramMap);


		return restList;
	}
	@Override
	public List<RestaurantVO> newRestaurant(RestaurantVO restaurantVO) {

		List<RestaurantVO> restList = Collections.EMPTY_LIST;

		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("rstName", restaurantVO.getRstName());
		paramMap.put("rstMenu", restaurantVO.getRstMenu());
		paramMap.put("rstCate", restaurantVO.getRstCate());
		paramMap.put("rstIntro", restaurantVO.getRstIntro());
		paramMap.put("rstList", restaurantVO.getRstList());
	
		restList = selectList("newRestaurant", paramMap);


		return restList;
	}
	@Override
	public int insertRestaurant(RestaurantVO restaurantVO) {
		
		int cnt = 0;
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			cnt = session.insert("insertRestaurant", restaurantVO);
			
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
	public List<RestaurantVO> listRestaurant() {
		
		List<RestaurantVO> restaurantList = new ArrayList<RestaurantVO>();
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			restaurantList = session.selectList("listRestaurant");
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		} return restaurantList;
	}
	
	@Override
	public RestaurantVO datailRestaurant(String rstNo) {
		
		RestaurantVO restaurantVo = new RestaurantVO();
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			
			restaurantVo = session.selectOne("detailRestaurant",rstNo);
			
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return restaurantVo;
	}
	
	@Override
	public int deleteRestaurant(String rstNo) {
		int cnt1 = 0;
		
		SqlSession session = MyBatisUtil.getInstance();

		try {
			cnt1 = session.delete("deleteRestaurant", rstNo);
			
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
	public int updateRestaurant(RestaurantVO restaurantVO) {
		
		int cnt = 0;
		
		SqlSession session = MyBatisUtil.getInstance();

		try {
			cnt = session.update("updateRestaurant", restaurantVO);
			
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
	public int updateImgRestaurant(RestaurantVO restaurantVO) {
	
		int cnt = 0;
		
		SqlSession session = MyBatisUtil.getInstance();

		try {
			cnt = session.update("updateImgRestaurant", restaurantVO);
			
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
	
