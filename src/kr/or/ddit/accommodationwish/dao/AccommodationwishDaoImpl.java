package kr.or.ddit.accommodationwish.dao;

import java.util.ArrayList;
import java.util.List;

import kr.or.ddit.accommodationwish.vo.AccoWishVO;
import kr.or.ddit.comm.dao.MyBatisDao;

public class AccommodationwishDaoImpl extends MyBatisDao implements IAccommodationwishDao {

	public static IAccommodationwishDao accowishDao;
	
	private AccommodationwishDaoImpl() {}
	
	public static IAccommodationwishDao getInstance() {
		if(accowishDao == null) {
			accowishDao = new AccommodationwishDaoImpl();
		}
		return accowishDao;
	}

//	@Override
//	public int insertwish(String accoWishNo) {
//		
//		int cnt = insert("accowishlist.insertwish", accoWishNo);
//		
//		return cnt;
//	}

	@Override
	public int insertwish(AccoWishVO accowv) {

		int cnt = insert("accowishlist.insertwish", accowv);
		
		return cnt;
	}

	@Override
	public List<AccoWishVO> getwishlist(String memId) {
		
		List<AccoWishVO> accowishlist = new ArrayList<AccoWishVO>();
		
		accowishlist = selectList("accowishlist.getwishlist", memId);
		
		return accowishlist;
	}

}
