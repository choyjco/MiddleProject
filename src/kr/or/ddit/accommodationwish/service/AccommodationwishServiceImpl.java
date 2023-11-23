package kr.or.ddit.accommodationwish.service;

import java.util.List;

import kr.or.ddit.accommodationwish.dao.AccommodationwishDaoImpl;
import kr.or.ddit.accommodationwish.dao.IAccommodationwishDao;
import kr.or.ddit.accommodationwish.vo.AccoWishVO;

public class AccommodationwishServiceImpl implements IAccommodationwishService {

	private static IAccommodationwishService iaccoservice;
	
	private IAccommodationwishDao accowishDao;
	
	private AccommodationwishServiceImpl() {
		accowishDao = AccommodationwishDaoImpl.getInstance();
	}
	
	public static IAccommodationwishService getInstance() {
		if(iaccoservice == null) {
			iaccoservice = new AccommodationwishServiceImpl();
		}
		return iaccoservice;
	}
	
//	@Override
//	public int insertwish(String accoWishNo) {
//
//		return accowishDao.insertwish(accoWishNo);
//	}

	@Override
	public int insertwish(AccoWishVO accowv) {

		return accowishDao.insertwish(accowv);
	}

	@Override
	public List<AccoWishVO> getwishlist(String memId) {
		return accowishDao.getwishlist(memId);
	}

}
