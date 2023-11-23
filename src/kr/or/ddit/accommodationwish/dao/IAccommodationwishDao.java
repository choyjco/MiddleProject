package kr.or.ddit.accommodationwish.dao;

import java.util.List;

import kr.or.ddit.accommodationwish.vo.AccoWishVO;

public interface IAccommodationwishDao {

//	public int insertwish(String accoWishNo);

	public int insertwish(AccoWishVO accowv);

	public List<AccoWishVO> getwishlist(String memId);
	
}
